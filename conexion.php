<?php
$host = "localhost";
$user = "root"; // Usuario por defecto en XAMPP
$pass = "";     // Contraseña por defecto vacía
$db   = "INTERVOZ";

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}
?>