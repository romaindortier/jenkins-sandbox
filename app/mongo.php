<?php

require_once '../vendor/autoload.php';

/*
$mongo = new MongoClient("mongodb://192.168.1.25");
$db = $mongo->my_data;
$coll = $db->things;

$data = array();
$var_name = 'BIM';
$data['name'] = $var_name;
$data = array_merge($data, $var_value);
$coll->save($data);

print $coll->findOne(array("name" => $var_name));
*/


$max_age=60*60;
header("Cache-Control: max-age=".$max_age);

print date('Y-m-d H:i:s');


$mng = new MongoDB\Driver\Manager("mongodb://mongo");

$bulk = new MongoDB\Driver\BulkWrite;
    
$doc = ['_id' => new MongoDB\BSON\ObjectID, 'name' => 'Toyota', 'price' => 26700];
$bulk->insert($doc);
$doc = ['_id' => new MongoDB\BSON\ObjectID, 'name' => 'Audi', 'price' => 26708];
$bulk->insert($doc);
$bulk->update(['name' => 'Audi'], ['$set' => ['price' => 52000]]);
$bulk->delete(['name' => 'Hummer']);

$mng->executeBulkWrite('testdb.cars', $bulk);

$stats = new MongoDB\Driver\Command(["dbstats" => 1]);
$res = $mng->executeCommand("testdb", $stats);

$stats = current($res->toArray());

print_r($stats);

$query = new MongoDB\Driver\Query([], ['sort' => [ 'name' => 1], 'limit' => 100]);     

$rows = $mng->executeQuery("testdb.cars", $query);

foreach ($rows as $row) {

    echo "$row->name : $row->price\n";
}