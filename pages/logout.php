<?php
session_start();
include(__DIR__ . '/../includes/db.php');
date_default_timezone_set('America/Bogota');

if (isset($_SESSION['user_id'])) {
    $userId = $_SESSION['user_id'];

    // Obtener el tiempo de login más reciente de hoy
    $sql = "SELECT login_time FROM user_sessions WHERE user_id = ? AND logout_time IS NULL ORDER BY login_time DESC LIMIT 1";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$userId]);
    $session = $stmt->fetch();

    if ($session) {
        $loginTime = new DateTime($session['login_time']);
        $logoutTime = new DateTime();

        // Calcular el tiempo de la sesión actual
        $interval = $loginTime->diff($logoutTime);
        $sessionTime = $interval->format('%H:%I:%S');

        // Actualizar logout_time y acumular tiempo del día
        $sql = "UPDATE user_sessions 
                SET logout_time = ?, 
                    daily_time_online = SEC_TO_TIME(TIME_TO_SEC(IFNULL(daily_time_online, '00:00:00')) + TIME_TO_SEC(?))
                WHERE user_id = ? AND DATE(login_time) = CURDATE() AND logout_time IS NULL";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$logoutTime->format('Y-m-d H:i:s'), $sessionTime, $userId]);
    }

    // Destruir sesión de usuario
    $sql = "UPDATE users SET is_connected = 0 WHERE id = ?";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$userId]);

    session_unset();
    session_destroy();
}

// Redirigir al login
header("Location: login.php");
exit;
?>
