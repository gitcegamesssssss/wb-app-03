<?php
$fp = fsockopen("tcp://192.168.1.34", 9999, $errno, $errstr, 1);
if (!$fp) {
    echo "$errstr ($errno)<br />\n";
} else {
    $out = "f";
    fwrite($fp, $out);
    fclose($fp);
}
?>