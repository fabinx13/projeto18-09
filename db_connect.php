<?php
// admin/db_connect.php

$servername = "localhost";
$username = "root"; // seu usuário
$password = ""; // sua senha
$dbname = "nova_loja_virtual"; // nome do banco de dados

// Criar a conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar a conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}
?>