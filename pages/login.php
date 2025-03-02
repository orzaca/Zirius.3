<?php
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include(__DIR__ . '/../includes/db.php');
date_default_timezone_set('America/Bogota');

$message = '';

// Verifica si el formulario fue enviado
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    // Validar si se ingresaron los datos
    if (empty($email) || empty($password)) {
        $message = 'Por favor, ingresa tu correo electrónico y contraseña.';
    } else {
        // Verifica las credenciales del usuario
        $sql = "SELECT id, password, role FROM users WHERE email = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$email]);
        $user = $stmt->fetch();

        if ($user && password_verify($password, $user['password'])) {
            // Las credenciales son válidas, inicia la sesión
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['role'] = $user['role']; // Guarda el rol del usuario en la sesión

            // Registrar inicio de sesión en user_sessions
            $login_time = date('Y-m-d H:i:s');
            $sql = "INSERT INTO user_sessions (user_id, login_time, last_access) VALUES (?, ?, ?)";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$user['id'], $login_time, $login_time]);

            // Redirige al dashboard según el rol
            if ($user['role'] == 'redes') {
                header("Location: dashboard_redes.php");
            } elseif ($user['role'] == 'telefonico') {
                header("Location: dashboard_telefonico.php");
            } elseif ($user['role'] == 'admin') {
                header("Location: dashboard_admin.php");
            } else {
                // Redirige a una página de error si el rol no es reconocido
                header("Location: error.php");
            }
            exit;
        } else {
            $message = 'Correo electrónico o contraseña incorrectos.';
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zirius - Login</title>
    <link rel="stylesheet" href="/assets/css/login.css"> <!-- Estilos externos -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script> <!-- Para íconos -->
    <link rel="icon" href="/assets/img/favicon.ico" type="image/x-icon">
</head>
<body>
    <div class="auth-container">
        <div class="auth-form">
            <div class="form-icon">
                <img src="/assets/img/Zirius.png" alt="User Icon" />
            </div>
            <form action="login.php" method="post">
                <div class="input-group">
                    <label for="email"><i class="fas fa-user"></i></label>
                    <input type="email" id="email" name="email" placeholder="Correo electrónico" required>
                </div>
                <div class="input-group">
                    <label for="password"><i class="fas fa-lock"></i></label>
                    <input type="password" id="password" name="password" placeholder="Contraseña" required>
                </div>
            
                <button type="submit">INGRESAR</button>
            </form>
            <?php if (!empty($message)): ?>
                <p class="message"><?php echo htmlspecialchars($message); ?></p>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>
