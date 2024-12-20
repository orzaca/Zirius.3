<?php
session_start();
//require '../includes/db.php';
include(__DIR__ . '/../includes/db.php');

// Verifica si el usuario está logueado
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'telefonico') {
    http_response_code(403);
    echo json_encode(['error' => 'Acceso denegado']);
    exit;
}

// Consulta para obtener la última noticia
$sql = "SELECT id, title, content FROM system_news ORDER BY created_at DESC LIMIT 1";
$stmt = $pdo->prepare($sql);
$stmt->execute();
$latest_news = $stmt->fetch(PDO::FETCH_ASSOC);

// Verifica si hay noticias
if ($latest_news) {
    echo json_encode($latest_news);
} else {
    echo json_encode(['id' => 0, 'title' => '', 'content' => '']);
}
?>
