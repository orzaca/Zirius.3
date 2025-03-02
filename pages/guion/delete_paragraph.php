<?php
session_start(); // Iniciar sesión para acceder a la información del usuario
//require $_SERVER['DOCUMENT_ROOT'] . '/includes/db.php';

require $_SERVER['DOCUMENT_ROOT'] . '/includes/db.php';



// Obtener el ID del usuario logueado
$userId = $_SESSION['user_id'];

// Obtener el ID del párrafo a eliminar
$paragraphId = $_POST['id'];

// Eliminar el párrafo del usuario en la base de datos
$sql = "DELETE FROM user_paragraphs WHERE user_id = :userId AND paragraph_id = :paragraphId";
$stmt = $pdo->prepare($sql);
$stmt->execute(['userId' => $userId, 'paragraphId' => $paragraphId]);

echo "Párrafo eliminado correctamente"; // Mensaje de éxito
?>
