<?php
session_start();
date_default_timezone_set('America/Bogota');

include('db.php'); // Archivo para conexión a la base de datos

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

// Obtiene los usuarios en línea
$sql = "SELECT u.name, TIMESTAMPDIFF(SECOND, s.login_time, NOW()) AS time_online
        FROM users u
        JOIN user_sessions s ON u.id = s.user_id
        WHERE s.logout_time IS NULL";
$stmt = $pdo->query($sql);
$users = $stmt->fetchAll();
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
</head>
<body>
    <h1>Bienvenido, <?php echo htmlspecialchars($_SESSION['name']); ?> (<?php echo htmlspecialchars($_SESSION['role']); ?>)</h1>
    <h2>Usuarios Conectados</h2>
    <table border="1">
        <tr>
            <th>Nombre</th>
            <th>Tiempo en Línea</th>
        </tr>
        <?php foreach ($users as $user): ?>
            <tr>
                <td><?php echo htmlspecialchars($user['name']); ?></td>
                <td><?php 
                    $timeOnline = $user['time_online'];
                    echo gmdate('H:i:s', $timeOnline); 
                ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
    <a href="logout.php">Cerrar Sesión</a>
</body>
</html>
