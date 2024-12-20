<?php
$id = $_GET['id'] ?? null;
$filePath = $id ? "notes/$id.txt" : 'notepad.txt';

if (file_exists($filePath)) {
    $content = file_get_contents($filePath);
    echo json_encode(['content' => $content]);
} else {
    echo json_encode(['content' => '']);
}
?>
