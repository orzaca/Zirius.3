<?php
session_start(); // Iniciar sesión para acceder a la información del usuario
//require $_SERVER['DOCUMENT_ROOT'] . '/includes/db.php';
header('Content-Type: text/html; charset=UTF-8');
require $_SERVER['DOCUMENT_ROOT'] . '/includes/db.php';



// Verificar que el usuario esté autenticado
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php"); // Redirigir a inicio de sesión si no está autenticado
    exit();
}

// Suponiendo que ya tienes la sesión iniciada y $userId es el ID del usuario logueado
$userId = $_SESSION['user_id'];

// Obtener los párrafos específicos del usuario de la base de datos
$sql = "SELECT p.id, COALESCE(up.content, p.content) AS content FROM pagina1 p 
        LEFT JOIN user_pagina1 up ON p.id = up.pagina1_id AND up.user_id = :userId";
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
    <title>Guiones</title>
</head>
<body>

    <div class="content-wrapper">
    <?php
    // Mostrar cada párrafo en la interfaz
    foreach ($paragraphs as $para) {
        echo '<div class="paragraph-box" id="para' . $para['id'] . '">';
        echo '<p>' . htmlspecialchars($para['content']) . '</p>';
        echo '<div class="button-group">'; // Nuevo contenedor para los botones
        echo '<button class="copy-btn" onclick="copyText(\'para' . $para['id'] . '\')">Copiar</button>';
        echo '<button class="edit-btn" onclick="openEditModal(' . $para['id'] . ')">Modificar</button>';
        echo '</div>'; // Cierre del contenedor de botones
        echo '</div>';
    }
    ?>
</div>


    <!-- Modal para editar párrafos -->
    <div id="editModal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeEditModal()">&times;</span>
            <h2>Editar Guiones</h2>
            <textarea id="editText" rows="13" maxlength="500"  style="width: 100%;"></textarea>
	         <p id="charCount">Solo puedes escribir hasta 500 caracteres</p>
            <button id="saveChanges" onclick="saveParagraph()">Guardar</button>
        </div>
    </div>

    
<script src="pagina1.js"></script>

</body>
</html>