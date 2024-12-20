<?php
session_start();
include(__DIR__ . '/../includes/db.php');

// Verifica si el usuario está logueado y tiene el rol de admin
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: login.php");
    exit;
}

$message = '';

// Verifica si el formulario fue enviado
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    $role = trim($_POST['role']);

    // Validar si se ingresaron los datos
    if (empty($name) || empty($email) || empty($password) || empty($role)) {
        $message = 'Por favor, completa todos los campos.';
    } else {
        // Validar formato de correo
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $message = 'Por favor, ingresa un correo electrónico válido.';
        } else {
            // Validación de contraseña: debe tener al menos una mayúscula, un número y mínimo 8 caracteres
            if (!preg_match('/^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$/', $password)) {
                $message = 'La contraseña debe tener al menos 8 caracteres, una letra mayúscula y un número.';
            } else {
                // Verificar si el correo ya está registrado
                $sql = "SELECT COUNT(*) FROM users WHERE email = ?";
                $stmt = $pdo->prepare($sql);
                $stmt->execute([$email]);
                $emailExists = $stmt->fetchColumn();

                if ($emailExists) {
                    $message = 'El correo electrónico ya está registrado.';
                } else {
                    // Cifra la contraseña
                    $hashed_password = password_hash($password, PASSWORD_BCRYPT);

                    // Inserta el nuevo usuario en la base de datos
                    $sql = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";
                    $stmt = $pdo->prepare($sql);

                    try {
                        $stmt->execute([$name, $email, $hashed_password, $role]);
                        $user_id = $pdo->lastInsertId(); // Obtener el ID del nuevo usuario

                        // Agregar un párrafo por defecto para el nuevo usuario
                        $defaultParagraph = "Este es un párrafo por defecto."; // Puedes ajustar este contenido
                        $sql = "INSERT INTO paragraphs (content, user_id) VALUES (?, ?)";
                        $stmt = $pdo->prepare($sql);
                        $stmt->execute([$defaultParagraph, $user_id]);

                        // Redirige después del registro
                        header("Location: register.php"); // Cambia a la página que prefieras
                        exit;

                    } catch (PDOException $e) {
                        $message = 'Error al registrar el usuario: ' . $e->getMessage();
                    }
                }
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
    <title>Registrar</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .register-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-form {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .register-form h1 {
            font-size: 24px;
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .message {
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-size: 14px;
            margin-bottom: 8px;
            display: block;
            color: #555;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin: 10px 0 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
            box-sizing: border-box;
            background-color: #f9f9f9;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #cb4335;
            background-color: #fff;
        }

        button {
            background-color: #cb4335;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #f1948a;
        }

        p {
            text-align: center;
            font-size: 14px;
            color: #555;
        }

        p a {
            color: #cb4335;
            text-decoration: none;
        }

        p a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-form">
            <h1>Regístrate</h1>
            <?php if (!empty($message)) : ?>
                <p class="message"><?php echo htmlspecialchars($message); ?></p>
            <?php endif; ?>
            <form action="register.php" method="post">
                <label for="name">Nombre Completo:</label>
                <input type="text" id="name" name="name" required>
                <label for="email">Correo electrónico:</label>
                <input type="email" id="email" name="email" required>
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>
                <label for="role">Rol:</label>
                <select id="role" name="role" required>
                    <option value="redes">Redes</option>
                    <option value="telefonico">Telefónico</option>
                    <option value="admin">Admin</option>
                </select>
                <button type="submit">Regístrate</button>
            </form>
           
        </div>
    </div>
</body>
</html>
