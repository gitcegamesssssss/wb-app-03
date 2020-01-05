<?php
error_reporting(0);
$fp = fsockopen("tcp://192.168.1.19", 9999, $errno, $errstr, 1);
if (!$fp) {
    echo "connection error";
    sleep(.25);
    //echo "$errstr ($errno)<br />\n";
} else {
    $out = "f";
    fwrite($fp, $out);
    fclose($fp);
    sleep(.25);
}
?>