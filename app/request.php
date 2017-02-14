<?php

$max_age=60*60;
header("Cache-Control: max-age=".$max_age);

print date('Y-m-d H:i:s');

print '<pre>';
print_r($_SERVER);