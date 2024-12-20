<?php
include(__DIR__ . '/../includes/db.php');
date_default_timezone_set('America/Bogota');

// Consulta para obtener los nombres de los usuarios conectados y su tiempo en línea
$sql = "
    SELECT 
        u.name, 
        ABS(TIMESTAMPDIFF(SECOND, s.login_time, NOW())) AS time_online
    FROM users u 
    INNER JOIN user_sessions s ON u.id = s.user_id 
    WHERE s.logout_time IS NULL AND DATE(s.login_time) = CURDATE()";

$stmt = $pdo->query($sql);
$connectedUsers = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Contar el número total de usuarios conectados
$totalConnected = count($connectedUsers);

// Retornar la lista de nombres y el tiempo en línea en formato JSON
echo json_encode([
    'connected_users' => $connectedUsers,
    'total_connected' => $totalConnected
]);
?>
