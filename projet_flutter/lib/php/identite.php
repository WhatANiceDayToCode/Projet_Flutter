<?php
include('bdd.php');
try
{
  $result = $objPdo->query('select * from identite');
  $tab = $result->fetchAll(PDO::FETCH_ASSOC);
  echo ( json_encode($tab)  );
}
catch( Exception $exception )
{
    die($exception->getMessage());
}
?>
