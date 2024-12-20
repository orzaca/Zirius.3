

<?php
include(__DIR__ . '/../includes/db.php');

// Contar usuarios conectados
$sql = "SELECT COUNT(*) as online_users FROM user_sessions WHERE logout_time IS NULL AND TIMESTAMPDIFF(MINUTE, last_access, NOW()) <= 10"; // Ajusta el tiempo según lo requerido
$result = $pdo->query($sql);
$row = $result->fetch();

echo json_encode(['online_users' => $row['online_users']]);
?>
