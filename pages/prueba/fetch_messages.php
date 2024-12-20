<?php
// fetch_messages.php
session_start();
//require '../includes/db.php';
include(__DIR__ . '/../includes/db.php');

$sql = "SELECT * FROM mensajes WHERE receiver_role = 'redes' ORDER BY timestamp DESC";
$result = $conn->query($sql);

$messages = [];
while ($row = $result->fetch_assoc()) {
    $messages[] = $row;
}

echo json_encode($messages);
?>
