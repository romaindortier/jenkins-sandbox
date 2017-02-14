<?php
// phpinfo();
/*
$envVars = [
  "DB_PORT_3306_TCP_PORT",
  "DB_PORT_3306_TCP_ADDR",
  "DB_ENV_MYSQL_USER",
  "DB_ENV_MYSQL_DATABASE",
  "DB_ENV_MYSQL_PASSWORD",
  "DB_ENV_MYSQL_ROOT_PASSWORD",
];


foreach ($envVars as $envVar) {
  $envValue = getenv($envVar);
  echo nl2br("<b>{$envVar}</b>: {$envValue}\n");
}
*/
require_once '../vendor/autoload.php';

use PhpAmqpLib\Connection\AMQPStreamConnection;
use PhpAmqpLib\Message\AMQPMessage;

$connection = new AMQPStreamConnection('192.168.1.25', 5672, 'guest', 'guest');
$channel = $connection->channel();

$channel->queue_declare('hello', false, false, false, false);

$msg = new AMQPMessage('Hello World!');
$channel->basic_publish($msg, '', 'hello');

echo " [x] Sent 'Hello World!'".rand()."\n";

$channel->close();
$connection->close();
/*

use KeenIO\Client\KeenIOClient;

$client = KeenIOClient::factory([
  'projectId' => '588601378db53dfda8a84412',
  'writeKey' => 'B0B2C6F1365F8A5D3E84E60C4AAB3565E91727580813A8C8ED561E851F26EA80253BD4F6C3311788238054B5F446460D9BFD26D766E97F509FA3CED30063D46AE4EC698FF70F04C26FC84CF506D65B4AD16784562FDDDA2B5A8DFC72D34423FA'
]);

$event = ['purchase' => ['item' => 'Golden Elephant']];
$client->addEvent('purchases', $event);

$event = ['purchase' => ['item' => 'Popopo']];
$client->addEvent('purchases', $event);
*/
