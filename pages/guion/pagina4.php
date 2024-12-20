<?php
session_start(); // Iniciar sesión para acceder a la información del usuario

require $_SERVER['DOCUMENT_ROOT'] . '/includes/db.php';
 // Conexión a la base de datos

// Verificar que el usuario esté autenticado
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php"); // Redirigir a inicio de sesión si no está autenticado
    exit();
}

// Suponiendo que ya tienes la sesión iniciada y $userId es el ID del usuario logueado
$userId = $_SESSION['user_id'];

// Obtener los párrafos específicos del usuario de la base de datos
$sql = "SELECT p.id, COALESCE(up.content, p.content) AS content FROM pagina4 p 
        LEFT JOIN user_pagina4 up ON p.id = up.pagina4_id AND up.user_id = :userId";
$stmt = $pdo->prepare($sql);
$stmt->execute(['userId' => $userId]);
$paragraphs = $stmt->fetchAll(); // Obtener todos los párrafos
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/assets/css/guion/paginas.css">
    <title>Gestión de Párrafos de Página 2</title>
    
</head>
<body>

    <div class="content-wrapper">
        <?php
        // Mostrar cada párrafo en la interfaz
        foreach ($paragraphs as $para) {
            echo '<div class="paragraph-box" id="para4' . $para['id'] . '">'; // Cambiado a para2
            echo '<p>' . htmlspecialchars($para['content']) . '</p>';
            echo '<div class="button-group">'; // Nuevo contenedor para los botones
            echo '<button class="copy-btn"  onclick="copyText(\'para4' . $para['id'] . '\')">Copiar</button>';// Cambiado a para2
            echo '<button  class="edit-btn" onclick="openEditModal4(' . $para['id'] . ')">Modificar</button>';
            echo '</div>';
            echo '</div>';
        }
        ?>
    </div>

    <!-- Modal para editar párrafos -->
    <div id="editModal4"> <!-- Cambiado a editModal3 -->
        <div class="modal-content">
            <span class="close-btn" onclick="closeEditModal4()">&times;</span>
            <h2>Editar Párrafo</h2>
            <textarea id="editText4" rows="13" maxlength="500"  style="width: 100%;"></textarea>
	         <p id="charCount">Solo puedes escribir hasta 500 caracteres</p>
            <button id="saveChanges4" onclick="saveParagraph4()">Guardar</button> <!-- Cambiado a saveChanges3  -->
        </div>
    </div>

    
</body>
</html>