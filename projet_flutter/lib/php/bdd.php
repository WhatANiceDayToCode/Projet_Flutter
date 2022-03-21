<?php
header("Access-Control-Allow-Origin: *");
    try
    {
        $objPdo = new PDO ('mysql:host=devbdd.iutmetz.univ-lorraine.fr;port=3306;dbname=gall17u_bdd_flutter' , 'gall17u_appli', '32010033' );
        $objPdo->exec("set names utf8"); // accents
    }
    catch( Exception $exception )
    {
        die($exception->getMessage());
    }
?>
