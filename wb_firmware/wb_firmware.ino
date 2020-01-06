#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266HTTPClient.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <SPI.h>
#include <Wire.h>

//OLED definition
#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 32 // OLED display height, in pixels
#define OLED_RESET     D5 // Reset pin # (or -1 if sharing Arduino reset pin)
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

//TCP-SERVER definition
#define SERVER_PORT 9999
IPAddress server_ip = {192, 168, 137, 176}; //IP of TCP server
WiFiServer server(SERVER_PORT);

//WiFi definition
const char *ssid = "VIPAD";
const char *password = "cegame12";

//Service definition
const String service_ip = "192.168.1.20";
const String service_del_order = "http://" + service_ip + "/wb-app-03/ajax/service/deleteOrder.php";
const String service_move_prog_2_done = "http://" + service_ip + "/wb-app-03/ajax/service/moveProg2Done.php";
const String service_request_order = "http://" + service_ip + "/wb-app-03/ajax/service/requestOrder.php";
const String service_stat_2_done = "http://" + service_ip + "/wb-app-03/ajax/service/stat2Done.php";
const String service_stat_2_prog = "http://" + service_ip + "/wb-app-03/ajax/service/stat2Prog.php";
const String service_stat_2_rec = "http://" + service_ip + "/wb-app-03/ajax/service/stat2Rec.php";
String service_tmp;//use for modifying parameter of service
int httpCode;//code of service executing
String payload;//string response from service

//struct definition
struct Bev {
  String number;
  String details;
  String unit;
  String stat;
};

//init station values
Bev result[1]; //collect current order
char loading[4] = {'|', '/', '-', '\\'};//for loading animation
char statSymbol[3] = {'R', 'P', 'D'};

//button definition
#define button_up D7
#define button_down D8


void setup() {
  //oled setup
  pinMode(button_up, INPUT);
  pinMode(button_down, INPUT);
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  display.clearDisplay();
  display.setCursor(0, 0);
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.display();

  Serial.begin(115200);

  WiFi.mode(WIFI_OFF);        //Prevents reconnection issue (taking too long to connect)
  delay(1000);
  WiFi.mode(WIFI_STA);        //This line hides the viewing of ESP as wifi hotspot

  WiFi.begin(ssid, password);     //Connect to your WiFi router
  Serial.println("");

  //start wifi connection
  Serial.print("Connecting");
  display.print("Connecting...");
  // Wait for connection
  int i = 0;
  while (WiFi.status() != WL_CONNECTED) {
    display.setCursor(120, 0);
    display.setTextColor(WHITE);
    display.print(loading[i % 4]);
    display.display();
    delay(500);
    display.setCursor(120, 0);
    display.setTextColor(BLACK);
    display.print(loading[i % 4]);
    i++;
  }
  //display connection details
  display.clearDisplay();
  display.setTextColor(WHITE);
  display.setCursor(0, 0);
  display.println("Connected");
  display.println(ssid);
  display.println(WiFi.localIP());
  //start TCP server
  server.begin();
  display.println("TCP-SERVER-START");
  Serial.println("TCP server start");
  display.display();
}

void loop() {
START:
  //request order
  HTTPClient http;
  service_tmp = service_request_order;
  http.begin(service_tmp);
  Serial.println("requesting to : ");
  Serial.println(service_tmp);
  httpCode = http.GET();//send request
  payload = http.getString();
  Serial.println("response : ");
  Serial.println(payload);
  Serial.println();

  if (payload == "0") {
    //display empty text
    displayCenter("empty task");
    //loop for signal
    /*while (1) {
      WiFiClient client = server.available();
      while (client) {
        Serial.print("client conected : ");
        Serial.println(count_client);
        while (client.available()) {
          uint8_t data = client.read();
          Serial.write(data);
        }
      }
      }*/
  } else {
    //display order
    str2arr(payload, 1);
    displayLayout();
    //loop for button press
    while (1) {
      delay(100);
      /*Serial.print(digitalRead(button_up));
        Serial.println(digitalRead(button_down));*/
      int U_state = digitalRead(button_up);
      int D_state = digitalRead(button_down);
      //=======================================
      if (U_state == 1) {
        switch (result[0].stat.toInt()) {
          case 0://Received stat
            service_tmp = service_stat_2_prog + "?id=" + result[0].number;
            http.begin(service_tmp);
            httpCode = http.GET();
            Serial.println(httpCode);
            goto START;
            break;
          case 1://Progress stat
            displayCenter("Done?(Y/N)");
            delay(500);
            while (1) {
              delay(100);
              U_state = digitalRead(button_up);
              D_state = digitalRead(button_down);
              Serial.print(digitalRead(button_up));
              Serial.println(digitalRead(button_down));
              if (U_state == 1) {//sure
                service_tmp = service_stat_2_done + "?id=" + result[0].number;
                http.begin(service_tmp);
                httpCode = http.GET();
                Serial.println(httpCode);
                goto START;
              }
              if (D_state == 1) {//not sure
                goto START;
              }
            }
            break;
          default:;
        }
      }

      if (D_state == 1) {
        switch (result[0].stat.toInt()) {
          case 0:
          displayCenter("Reseting..");
          delay(1000);
            goto START;
            break;
          case 1:
            service_tmp = service_stat_2_rec + "?id=" + result[0].number;
            http.begin(service_tmp);
            httpCode = http.GET();
            Serial.println(httpCode);
            goto START;
            break;
          default:;
        }
      }
    }
    //=======================================
  }
  delay(2000);
  /*WiFiClient client = server.available();
    while (client) {
    Serial.print("client conected : ");
    Serial.println(count_client);
    while (client.available()) {
      uint8_t data = client.read();
      Serial.write(data);
    }
    }*/

}

void str2arr(String payload, int num) {
  String subItem;
  int subItemCur = 0;
  String subInfo;
  int subInfoCur = 0;

  char delMain = ';';
  char delSub = ',';

  int i = 0, j = 0;
  for (i = 0; i < num; i++) {
    subItem = payload.substring(subItemCur, payload.indexOf(delMain, subItemCur));
    for (j = 0; j < 4; j++) {
      subInfo = subItem.substring(subInfoCur, subItem.indexOf(delSub, subInfoCur));
      subInfoCur = subItem.indexOf(delSub, subInfoCur) + 1;
      //adding info to array
      subInfo.trim();
      switch (j) {
        case 0:
          result[i].number = subInfo;
          break;
        case 1:
          result[i].details = subInfo;
          break;
        case 2:
          result[i].unit = subInfo;
          break;
        case 3:
          result[i].stat = subInfo;
          break;
        default:;
      }
    }
    subItemCur = payload.indexOf(delMain, subItemCur) + 1;
  }
}

void displayLayout() {
  display.clearDisplay();
  display.setCursor(0, 0);
  int len = result[0].details.length();
  int cur = 0;
  int mods = 0;
  String tmp;
  //display main-name
  display.println(result[0].details.substring(0, result[0].details.indexOf('/')));

  //display mod
  while (result[0].details.indexOf('/', cur) != -1) {
    mods ++;
    cur = result[0].details.indexOf('/', cur) + 1;
  }
  //display mod.
  cur = result[0].details.indexOf('/') + 1;
  for (int i = 0; i < mods; i++) {
    tmp = result[0].details.substring(cur, result[0].details.indexOf('/', cur));
    tmp.trim();
    display.print("+ ");
    display.println(tmp);
    cur = result[0].details.indexOf('/', cur) + 1;
  }

  display.setCursor(120, 0);
  display.print(result[0].unit);
  display.setCursor(120, 8);
  display.print(statSymbol[result[0].stat.toInt()]);
  display.display();
}

void displayCenter(String text) {
  display.clearDisplay();
  display.setCursor((128 / 2) - ((text.length() * 8) / 2), 8);
  display.print(text);
  display.display();
}
