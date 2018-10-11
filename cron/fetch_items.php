<?php

$dirname = dirname(dirname(__FILE__));
$config = include($dirname . '/config.php');
$base_url = "https://api.guildwars2.com/v2/";
$price_url = "commerce/prices";
$items_url = "items/";

// Database connection
$link = mysqli_connect($config['host'], $config['user'], $config['password'], $config['db_name']);

if (mysqli_connect_errno()) {
    printf("Échec de la connexion : %s\n", mysqli_connect_error());
    exit;
}
mysqli_set_charset($link, "utf8");

// Get items to fetch
$query = "SELECT itw_game_id FROM `items_to_watch`;";
$result = mysqli_query($link, $query);
$items_to_watch = [];
while($row = mysqli_fetch_array($result, MYSQLI_NUM))
{
    $items_to_watch[] = $row[0];
}

if(!empty($items_to_watch))
{
    // Execute api request
    if(count($items_to_watch) > 1)
    {
        $url_called = $base_url . $price_url . "?ids=" . implode(',', $items_to_watch);
    }else
    {
        $url_called = $base_url . $price_url . '/' . $items_to_watch[0];
    }

    $curl = curl_init($url_called);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
    $json_return = curl_exec($curl);
    curl_close($curl);

    $arr_return = json_decode($json_return, TRUE);

    foreach($arr_return as $key => $value)
    {
        $id = $value['id'];
        $sell = $value["sells"]["unit_price"];
        $buy = $value["buys"]["unit_price"];

        $query = "INSERT INTO `items_history`(`ih_itw_id`, `ih_buy_price`, `ih_sell_price`) VALUES ($id, $buy, $sell);";
        mysqli_query($link, $query);
    }
}
mysqli_close($link);
