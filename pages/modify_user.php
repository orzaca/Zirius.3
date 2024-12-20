<?php
session_start();
include(__DIR__ . '/../includes/db.php');


// Verifica si el usuario está logueado y tiene el rol de admin
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: login.php");
    exit;
}

$message = '';
$name = $email = $role = ''; // Inicializar las variables para evitar el error

// Verifica si se envió el formulario de búsqueda
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['search_email'])) {
    $search_email = trim($_POST['search_email']);

    if (empty($search_email)) {
        $message = 'Por favor, ingresa un correo electrónico para buscar.';
    } else {
        // Buscar usuario por correo electrónico
        $sql = "SELECT * FROM users WHERE email = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$search_email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            $name = $user['name'];
            $email = $user['email'];
            $role = $user['role'];
        } else {
            $message = 'No se encontró un usuario con ese correo electrónico.';
        }
    }
}

// Verifica si se envió el formulario de actualización
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_user'])) {
    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    $role = trim($_POST['role']);

    // Validar si se ingresaron los datos
    if (empty($name) || empty($email) || empty($role)) {
        $message = 'Por favor, completa todos los campos.';
    } else {
        // Si se ingresa una nueva contraseña, se cifra
        if (!empty($password)) {
            $hashed_password = password_hash($password, PASSWORD_BCRYPT);
            $sql = "UPDATE users SET name = ?, email = ?, password = ?, role = ? WHERE email = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$name, $email, $hashed_password, $role, $email]);
        } else {
            $sql = "UPDATE users SET name = ?, email = ?, role = ? WHERE email = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$name, $email, $role, $email]);
        }

        $message = 'Usuario actualizado exitosamente.';
    }
}

// Verifica si se envió el formulario de eliminación
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['delete_user'])) {
    $email = trim($_POST['email']);

    // Eliminar usuario de la base de datos
    if (!empty($email)) {
        $sql = "DELETE FROM users WHERE email = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$email]);

        $message = 'Usuario eliminado exitosamente.';
        $name = $email = $role = ''; // Limpiar los campos después de eliminar
    } else {
        $message = 'No se pudo eliminar el usuario. No se proporcionó un correo electrónico válido.';
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Usuario</title>
    <link rel="stylesheet" href="modify_user.css"> <!-- Enlace al archivo CSS -->
</head>
<body>
    <div class="register-container">
        <div class="register-form">
            <h1>Modificar Usuario</h1>
            <?php if (!empty($message)) : ?>
                <p class="message<?php echo $message === 'Usuario actualizado exitosamente.' || $message === 'Usuario eliminado exitosamente.' ? ' success' : ''; ?>"><?php echo htmlspecialchars($message); ?></p>
            <?php endif; ?>
            
            <!-- Formulario para buscar usuario -->
            <form action="modify_user.php" method="post" class="search-form">
                <label for="search_email">Buscar por correo electrónico:</label>
                <input type="email" id="search_email" name="search_email" required>
                <button type="submit">Buscar</button>
            </form>
            
            <?php if (isset($user)) : ?>
                <!-- Formulario para modificar los datos del usuario -->
                <form action="modify_user.php" method="post">
                    <label for="name">Nombre:</label>
                    <input type="text" id="name" name="name" value="<?php echo htmlspecialchars($name); ?>" required>
                    
                    <label for="email">Correo electrónico:</label>
                    <input type="email" id="email" name="email" value="<?php echo htmlspecialchars($email); ?>" required>
                    
                    <label for="password">Contraseña (dejar en blanco para no cambiar):</label>
                    <input type="password" id="password" name="password">
                    
                    <label for="role">Rol:</label>
                    <select id="role" name="role" required>
                        <option value="redes" <?php echo ($role == 'redes') ? 'selected' : ''; ?>>Redes</option>
                        <option value="telefonico" <?php echo ($role == 'telefonico') ? 'selected' : ''; ?>>Telefónico</option>
                        <option value="admin" <?php echo ($role == 'admin') ? 'selected' : ''; ?>>Admin</option>
                    </select>
                    
                    <button type="submit" name="update_user">Actualizar Usuario</button>
                </form>
                
                <!-- Formulario para eliminar usuario -->
             
            <?php endif; ?>
            
          
        </div>
    </div>
</body>
</html>

<style>
/*#f1948a rojo claro  -- cb4335 Rojo Osc*/

 @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Contenedor principal */
.register-container {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 500px;
}

/* Estilo del título */
h1 {
    font-size: 24px;
    text-align: center;
    margin-bottom: 20px;
    color: #333;
}

/* Estilo de los mensajes de error o éxito */
.message {
    color: #d9534f;
    font-size: 14px;
    text-align: center;
    margin-bottom: 20px;
}

.message.success {
    color: #5bc0de;
}

/* Estilo del formulario */
form {
    display: flex;
    flex-direction: column;
}

/* Estilo de los campos de entrada */
input, select {
    padding: 10px;
    margin-bottom: 15px;
    border-radius: 4px;
    border: 1px solid #ddd;
    font-size: 16px;
}

/* Estilo para los campos de entrada cuando se enfocan */
input:focus, select:focus {
    border-color: #cb4335;
    outline: none;
}

/* Estilo del botón de enviar */
button {
    padding: 12px;
    background-color: #cb4335;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #f1948a;
}

/* Estilo de los enlaces */
a {
    color: #5bc0de;
    text-decoration: none;
    text-align: center;
    display: block;
    margin-top: 20px;
}

a:hover {
    text-decoration: underline;
}

/* Estilo para el formulario de búsqueda */
.search-form {
    margin-bottom: 20px;
}

/* Estilo para el formulario de eliminación */
.delete-form {
    margin-top: 20px;
}

/* Responsividad */
@media (max-width: 600px) {
    .register-container {
        width: 90%;
    }
}
</style>
