<?php

if (!array_key_exists('token', $_GET)) {
  echo('wrong!');
  return;
}

$ver = "";

if (array_key_exists('ver', $_GET)) {
  $_GET['ver'] = str_replace("\"", "", $_GET['ver']);
  $ver = $_GET['ver'];
}

if ($ver == "") {
  $versionUrl = "http://10.8.0.2/coredownload/version.txt";
  $content = file_get_contents($versionUrl);
  preg_match('/(\d+.\d+.\d+)\s/', $content, $matches);

  $ver = $matches[1];
}

// if ($ver == "") {
//   $fh = file_get_contents('http://10.8.0.2/coredownload/version.txt');

//   $p = xml_parser_create();
//   xml_parse_into_struct($p, $fh, $vals, $index);
//   xml_parser_free($p);

//   $ver = str_replace(array("\r\n", "\r", "\n", " "), "", $vals[0]['value']);
// }

$resign = "";

if (array_key_exists('resign', $_GET)) {
  $resign = $_GET['resign'];
}

$flavor = "tatfook";

if (array_key_exists('flavor', $_GET)) {
  $flavor = str_replace("\"", "", $_GET['flavor']);;
}

$dev = 'false';

if (array_key_exists('dev1', $_GET)) {
  $_GET['dev1'] = str_replace("\"", "", $_GET['dev1']);

  if ($_GET['dev1'] == 'true') {
    $dev = 'true';
  }
}

$serverToken = '205987c9-bd74-ffed-02a9-4e42db46fe99';
$tokenParams = $_GET['token'];

if ($tokenParams != $serverToken) {
  echo('wrong!');
  return;
}

function lock() {
  $fp = fopen('lock', 'w');
  global $flavor;
  global $dev;
  global $ver;

  $content = '';

  if ($flavor != '') {
    $content = $content . ucfirst($flavor);
  }

  if ($dev != '') {
    if ($content != '') {
      $content = $content . ':';
    }

    $content = $content . $dev;
  }

  if ($ver != '') {
    if ($content != '') {
      $content = $content . ':';
    }

    $content = $content . $ver;
  }

  fwrite($fp, $content);
  fclose($fp);
}

function unlock() {
  unlink('lock');
}

function islock() {
  return file_exists('lock');
}

function printlog($logName, $out) {
  $fp = fopen($logName, 'w');

  for ($i = 0;$i < count($out);$i++) {
    fwrite($fp, $out[$i] . "\r\n");
  }

  fclose($fp);
}

if (islock()) {
  echo('构建执行中...');
  
  return;
} else {
  lock();
}

echo('构建APK指令已发送！');
