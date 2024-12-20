<?php
//require '../includes/db.php'; // Asegúrate de que este archivo tiene la conexión a tu base de datos.
include(__DIR__ . '/../includes/db.php');

header('Content-Type: application/json');

// Consulta para obtener la última noticia
$sql = "SELECT title, content, created_at FROM noticias ORDER BY created_at DESC LIMIT 1";
$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    $news = $result->fetch_assoc();
    echo json_encode(['status' => 'success', 'data' => $news]);
} else {
    echo json_encode(['status' => 'error', 'message' => 'No hay noticias nuevas.']);
}

$conn->close();
?>
