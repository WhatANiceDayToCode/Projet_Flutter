<?php
header("Access-Control-Allow-Origin: *");
    try
    {
        $objPdo = new PDO ('mysql:host=devbdd.iutmetz.univ-lorraine.fr;port=3306;dbname=loginu_rez_tei' , 'loginu_appli', '' );
    }
    catch( Exception $exception )
    {
        die($exception->getMessage());
    }
?>
