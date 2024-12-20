<?php
session_start();
include(__DIR__ . '/../includes/db.php');

// Verificar si el usuario es administrador
if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'admin') {
    echo "Acceso no autorizado.";
    exit();
}

// Verificar si se ha recibido el ID del mensaje
if (isset($_POST['id'])) {
    $messageId = intval($_POST['id']);  // Asegurarse de que el ID sea un número entero

    // Preparar la consulta para eliminar el mensaje
    $query = "DELETE FROM mensajes_chat WHERE id = ?";
    $stmt = $pdo->prepare($query);
    
    if ($stmt->execute([$messageId])) {
        echo "Mensaje eliminado correctamente.";
    } else {
        echo "Error al eliminar el mensaje.";
    }
} else {
    echo "No se ha especificado un ID de mensaje.";
}

?>
