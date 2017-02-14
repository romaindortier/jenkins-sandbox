<?php

require_once '../vendor/autoload.php';
use KeenIO\Client\KeenIOClient;

$client = KeenIOClient::factory([
  'projectId' => '588601378db53dfda8a84412',
  'writeKey' => 'B0B2C6F1365F8A5D3E84E60C4AAB3565E91727580813A8C8ED561E851F26EA80253BD4F6C3311788238054B5F446460D9BFD26D766E97F509FA3CED30063D46AE4EC698FF70F04C26FC84CF506D65B4AD16784562FDDDA2B5A8DFC72D34423FA'
]);

$event = ['Italie' => ['2010' => 10]];
$client->addEvent('test_serie', $event);

$event = ['Italie' => ['2011' => 15]];
$client->addEvent('test_serie', $event);

$event = ['France' => ['2010' => 24]];
$client->addEvent('test_serie', $event);

$event = ['France' => ['2011' => 12]];
$client->addEvent('test_serie', $event);