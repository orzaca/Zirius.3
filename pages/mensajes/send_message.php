<?php
session_start();
include(__DIR__ . '/../includes/db.php');

if (isset($_POST['mensaje'], $_POST['receptor'])) {
    $emisor = $_SESSION['role']; // Usamos el rol de la sesión para determinar quién está enviando el mensaje
    $mensaje = $_POST['mensaje'];
    $receptor = $_POST['receptor'];

    $query = "INSERT INTO mensajes_chat (emisor, receptor, mensaje) VALUES (?, ?, ?)";
    $stmt = $pdo->prepare($query);
    $stmt->execute([$emisor, $receptor, $mensaje]);
    echo "Mensaje enviado.";
}
?>
