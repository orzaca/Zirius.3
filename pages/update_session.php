<?php
session_start();
include(__DIR__ . '/../includes/db.php');

if (!isset($_SESSION['user_id'])) {
    exit('No session active');
}

$user_id = $_SESSION['user_id'];
$current_time = date('Y-m-d H:i:s');

// Actualizar último acceso
$sql = "UPDATE user_sessions SET last_access = ? WHERE user_id = ? AND logout_time IS NULL";
$stmt = $pdo->prepare($sql);
$stmt->execute([$current_time, $user_id]);
?>
