<?php
session_start();
include 'DB.php';

if (!isset($_SESSION['user_id'])) {
    exit('No session active');
}

$user_id = $_SESSION['user_id'];
$current_time = date('Y-m-d H:i:s');

// Actualizar último acceso
$sql = "UPDATE user_sessions SET last_access = ? WHERE user_id = ? AND logout_time IS NULL";
$stmt = $conn->prepare($sql);
$stmt->bind_param('si', $current_time, $user_id);
$stmt->execute();

// Contar usuarios conectados
$sql = "SELECT COUNT(*) as online_users FROM user_sessions WHERE logout_time IS NULL";
$result = $conn->query($sql);
$row = $result->fetch_assoc();

echo json_encode(['online_users' => $row['online_users']]);
?>
