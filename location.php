<?php
$conx=mysqli_connect("db","user","password","bd2023");
if(!$conx){
    echo("echec de connexion");
}
$co=$_POST['co'];
$cin=$_POST['cin'];
$d=$_POST['d'];
$req="select * from habit where '$co'=codehab";
$res=mysqli_query($conx,$req);
if(mysqli_num_rows($res)==0){
    echo("erreur:habit inexistant")
}
else{
    $req1="select * from habit where '$co'=codehab and disponible='N' ";
    $re1=mysqli_query($conx,$req1);
    if(mysqli_num_rows($res1)==1){
       echo("erreur:habit deja loué")
    }
    else{
    $req2="select * from client where '$cin'=cin ";
    $res2=mysqli_query($conx,$req2);
    if(mysqli_num_rows($res2)==0){
       echo("erreur:client inexistant");
    }
    else{
    $req3="insert into location (dateloc,codehab,cin,duree) values('now()',$co','$cin';'$d')";
    $res3=mysqli_query($conx,$req3);
    $req4="update habit disponible='N' where codehab='$co'";
    $res4=mysqli_query($conx,$res4);
    if(mysqli_affected_rows($conx)==Null){
        echo("erreur de location";)
    }
    else{
        echo("insertion effectuée avec succés")
    }
    }  
    }
}
mysqli_close($conx);
?>