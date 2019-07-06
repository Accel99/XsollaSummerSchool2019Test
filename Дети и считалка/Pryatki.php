<?php

$entityBody = file_get_contents('php://input');
$obj = json_decode($entityBody);
$children = $obj->children;
$count = $obj->count;

function calc(array $children, int $count) {
    $position = 0;
    for ($i = 0; $i < count($children); $i++) {
        $position = ($position + $count) % ($i + 1);
    }
    return json_encode(array("name"=>$children[$position]));
}

echo calc($children, $count);