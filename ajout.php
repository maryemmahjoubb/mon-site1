<?php
header('Content-Type: text/html; charset=utf-8');

// Connexion
$conx = mysqli_connect("db", "user", "password", "bd2023");

if(!$conx){
    die("Connexion impossible");
}

$code = $_POST['codehab'];
$c    = $_POST['c'];  // codecat
$d    = $_POST['d'];  // descripton
$r    = $_POST['r'];  // taille
$p    = $_POST['p'];  // prix

// Requête sécurisée
$req = "INSERT INTO habit(codehab, descripton, taille, prix, disponible, codecat)
        VALUES (?, ?, ?, ?, 'D', ?)";

$stmt = mysqli_prepare($conx, $req);

mysqli_stmt_bind_param($stmt, "issii", $code, $d, $r, $p, $c);

if(mysqli_stmt_execute($stmt)){
    echo "Enregistrement réussi";
} else {
    echo "Erreur : insertion échouée<br>";
    echo "Détails : " . mysqli_error($conx);
}

mysqli_stmt_close($stmt);
mysqli_close($conx);
?>
