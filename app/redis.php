<?php


require_once '../vendor/autoload.php';

// $client = new Predis\Client();
// Parameters passed using a named array:
$client = new Predis\Client([
    'scheme' => 'tcp',
    // 'host'   => '0.0.0.0',
    // 'host'   => '172.17.0.1',
    // 'host'   => '192.168.1.51',
    // 'host'   => '172.20.0.1',
    // 'host'   => '172.20.0.3',
    // 'host'   => '192.168.1.51',
    'host'   => 'redis',
    'port'   => 6379,
]);

// Same set of parameters, passed using an URI string:
// $client = new Predis\Client('tcp://10.0.0.1:6379');

$client->set('foo', 'bar');
$client->set('hello', 'bar');
print $value = $client->get('foo');