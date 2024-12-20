<?php
session_start();
include(__DIR__ . '/../includes/db.php');

$emisor = $_SESSION['role'];
$receptor = ($_SESSION['role'] == 'telefonico') ? 'admin' : 'telefonico';

$query = "SELECT * FROM mensajes_chat WHERE (emisor = ? AND receptor = ?) OR (emisor = ? AND receptor = ?) ORDER BY fecha ASC";
$stmt = $pdo->prepare($query);
$stmt->execute([$emisor, $receptor, $receptor, $emisor]);

$mensajes = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Variables para detectar si hay nuevos mensajes
$newMessages = false;

foreach ($mensajes as $mensaje) {
    echo "<div class='message {$mensaje['emisor']}' id='message_{$mensaje['id']}'>
            <strong>{$mensaje['emisor']}</strong>: {$mensaje['mensaje']}";

    // Si el mensaje es del administrador, mostrar el botón de eliminación
    if ($_SESSION['role'] === 'admin') {
        echo "<button class='delete-button' data-id='{$mensaje['id']}'>Eliminar</button>";
    }

    echo "</div>";

    // Si el mensaje es nuevo, activamos la bandera de nuevos mensajes
    if ($mensaje['emisor'] != $_SESSION['role']) {
        $newMessages = true;
    }
}

if ($newMessages) {
    echo "<script>document.title = '¡Nuevo mensaje!';</script>";  // Cambiar el título de la página
}
?>
