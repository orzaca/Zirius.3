<?php
session_start();
include(__DIR__ . '/../includes/db.php');

// Verifica si el usuario está logueado como admin
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: login.php");
    exit;
}

$message = '';
$success_message = ''; // Variable para el mensaje de éxito

// Verifica si el formulario fue enviado
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = trim($_POST['email']);
    $new_password = trim($_POST['new_password']);
    $confirm_password = trim($_POST['confirm_password']);

    // Validar si se ingresaron los datos
    if (empty($email) || empty($new_password) || empty($confirm_password)) {
        $message = 'Por favor, completa todos los campos.';
    } elseif ($new_password !== $confirm_password) {
        $message = 'Las contraseñas no coinciden.';
    } else {
        // Verificar si el correo existe
        $sql = "SELECT id FROM users WHERE email = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$email]);
        $user = $stmt->fetch();

        if (!$user) {
            $message = 'No se encontró un usuario con ese correo electrónico.';
        } else {
            // Cifra la nueva contraseña
            $hashed_password = password_hash($new_password, PASSWORD_BCRYPT);

            // Actualizar la contraseña del usuario
            $sql = "UPDATE users SET password = ? WHERE email = ?";
            $stmt = $pdo->prepare($sql);

            try {
                $stmt->execute([$hashed_password, $email]);
                $success_message = 'Contraseña actualizada exitosamente.';
            } catch (PDOException $e) {
                $message = 'Error al actualizar la contraseña: ' . $e->getMessage();
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambiar Contraseña</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
    background-color: #f4f7fc;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.register-container {
    background-color: #fff;
    border-radius: 12px;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
    padding: 40px;
    width: 100%;
    max-width: 450px;
    overflow: hidden;
}

h1 {
    text-align: center;
    font-size: 26px;
    color: #333;
    margin-bottom: 20px;
    font-weight: 600;
}

label {
    font-size: 14px;
    font-weight: 500;
    color: #555;
    margin-bottom: 8px;
    display: block;
}

/* Estilo de los campos de entrada */
input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 14px;
    margin-bottom: 20px;
    border-radius: 8px;
    border: 1px solid #e0e0e0;
    font-size: 16px;
    color: #333;
    background-color: #f9f9f9;
    transition: all 0.3s ease-in-out;
}

input[type="email"]:focus,
input[type="password"]:focus {
    border-color: #007bff;
    background-color: #fff;
    outline: none;
}

input[type="email"]:invalid,
input[type="password"]:invalid {
    border-color: #dc3545;
}

input[type="email"]:valid,
input[type="password"]:valid {
    border-color: #28a745;
}

/* Botón de acción */
button {
    width: 100%;
    padding: 16px;
    background-color: #cb4335;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 500;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #f1948a;
}

button:focus {
    outline: none;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.4);
}

/* Mensajes de error y éxito */
.message,
.success-message {
    text-align: center;
    padding: 12px;
    border-radius: 8px;
    margin-bottom: 20px;
    font-size: 16px;
    font-weight: 500;
    display: block;
}

.message {
    background-color: #f8d7da;
    color: #721c24;
    border: 1px solid #f5c6cb;
}

.success-message {
    background-color: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
}

/* Estilo de enlaces */
a {
    text-align: center;
    display: inline-block;
    color: #007bff;
    font-size: 14px;
    font-weight: 500;
    text-decoration: none;
    margin-top: 20px;
}

a:hover {
    text-decoration: underline;
}

/* Mejora de la accesibilidad */
.input-group {
    margin-bottom: 20px;
}

input:focus {
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.4);
}

/* Fondo gradiente */
body {
    background: linear-gradient(135deg, #e2e8f0, #edf2f7);
}

/* Estilos adicionales para mejorar la UI */
input[type="email"]:disabled,
input[type="password"]:disabled {
    background-color: #f0f0f0;
    cursor: not-allowed;
}

input[type="email"]:not(:valid),
input[type="password"]:not(:valid) {
    border-color: #dc3545;
}

@media (max-width: 480px) {
    .register-container {
        padding: 20px;
        max-width: 100%;
    }

    h1 {
        font-size: 22px;
    }
}

    </style>
</head>
<body>
    <div class="register-container">
        <h1>Cambiar Contraseña de Usuario</h1>

        <!-- Mensajes de error o éxito -->
        <?php if (!empty($success_message)) : ?>
            <p class="success-message"><?php echo htmlspecialchars($success_message); ?></p>
        <?php endif; ?>
        <?php if (!empty($message)) : ?>
            <p class="message"><?php echo htmlspecialchars($message); ?></p>
        <?php endif; ?>

        <form action="change_password.php" method="post">
            <div class="input-group">
                <label for="email">Correo electrónico del usuario:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="input-group">
                <label for="new_password">Nueva contraseña:</label>
                <input type="password" id="new_password" name="new_password" required pattern=".{6,}" title="La contraseña debe tener al menos 6 caracteres">
            </div>

            <div class="input-group">
                <label for="confirm_password">Confirmar nueva contraseña:</label>
                <input type="password" id="confirm_password" name="confirm_password" required>
            </div>

            <button type="submit">Actualizar Contraseña</button>
        </form>

    
    </div>
</body>
</html>
