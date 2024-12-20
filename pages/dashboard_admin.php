<?php
session_start();
//require '../includes/db.php';
include(__DIR__ . '/../includes/db.php');
date_default_timezone_set('America/Bogota');

// Verifica si el usuario está logueado
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: login.php");
    exit;
}

// Recupera la información del usuario
$user_id = $_SESSION['user_id'];
$sql = "SELECT name, email FROM users WHERE id = ?";
$stmt = $pdo->prepare($sql);
$stmt->execute([$user_id]);
$user = $stmt->fetch();

// Asegúrate de que el usuario exista en la base de datos
if ($user) {
    $name = $user['name']; // Obtiene el nombre del usuario
    $email = $user['email']; // Puedes seguir usando el correo si es necesario
} else {
    // Manejo de error si no se encuentra al usuario
    header("Location: logout.php"); // O maneja el error como desees
    exit;
}

// Recupera las noticias del sistema
$news_sql = "SELECT title, content, created_at FROM system_news ORDER BY created_at ASC";
$news_stmt = $pdo->prepare($news_sql);
$news_stmt->execute();
$news_list = $news_stmt->fetchAll();
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrador</title>
    <link rel="icon" href="/assets/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/assets/css/dashboard_admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


</head>
<body>
    <!-- Barra superior -->
    <header class="header">
        <nav class="navbar">
            <!-- Skill y Campaña -->
           <div class="navbar-left">
                <h3>ADMINISTRADOR DEL SISTEMA</h3>
            </div>
            <div class="navbar-right">
                <span>Hola, <?php echo htmlspecialchars($name); ?></span>
                <a href="logout.php" class="logout-link">Cerrar sesión</a>
            </div>
        </nav>
    </header>
    
    <aside class="sidebar">
            <div class="titulo-sidebar">
                <p>Zirius<P>
            </div>
            <ul class="menu">
                <li><a href="/pages/dashboard_admin.php"><i class="fas fa-home"></i> Principal</a></li>  

             <li>
                <a href="#" class="menu-item" onclick="toggleSubmenu(event, 'plantillas-submenu')">
                <i class="fas fa-wrench"></i> Plantillas
                </a>
                <ul id="plantillas-submenu" class="submenu">
                <li><a href="#" id="plantillas" title="plantillas"><i class="fas fa-file-code"></i><span> Modificar</span></a>
                </ul>
            </li>



                <li><a href="#" class="menu-item" onclick="toggleSubmenu(event, 'checklist-submenu')">
                    <i class="fas fa-check-circle"></i> Checklist</a>
                    <ul id="checklist-submenu" class="submenu">

                    <li><a href="#" id="crear-checklist" title="Checklist"><i class="fas fa-plus"></i><span>Crear Checklist</span></a>
                    <li><a href="#" id="modificar-checklist" title="Checklist"><i class="fas fa-edit"></i><span>Modificar Checklist</span></a>
                    <li><a href="#" id="ver-checklist" title="Checklist"><i class="fas fa-eye"></i><span>Ver Checklist</span></a>
                    
                    </ul>   
                </li>

                <li>
        <a href="#" class="menu-item" onclick="toggleSubmenu(event, 'usuarios-submenu')">
            <i class="fas fa-user"></i> Gestion Usuarios
        </a>
        <ul id="usuarios-submenu" class="submenu">
            <li><a href="#" id="crear-user" title="user"><i class="fas fa-user-plus"></i><span>Registro</span></a>
            <li><a href="#" id="passw-user" title="user"><i class="fas fa-key"></i><span>Cambio Contraseña</span></a>
            <li><a href="#" id="delete-user" title="user"><i class="fas fa-user-edit"></i><span> Modificar Datos </span></a>
            
        </ul>
    </li>

    <li>
        <a href="#" class="menu-item" onclick="toggleSubmenu(event, 'notificaciones-submenu')">
            <i class="fas fa-bell"></i> Enviar Mensaje
        </a>
        <ul id="notificaciones-submenu" class="submenu">
         <li><a href="#" id="mensaje" title="mensaje"><i class="fas fa-bullhorn"></i><span> Enviar Mensaje Masivo</span></a>
         <li><a href="#" id="modal" title="modal"><i class="fas fa-broadcast-tower"></i><span> Enviar Modal Bienvenida</span></a>
         
         </ul>
    </li>

    <li>
        <a href="#" class="menu-item" onclick="toggleSubmenu(event, 'modulos-submenu')">
            <i class="fas fa-cubes"></i> Manuales
        </a>
        <ul id="modulos-submenu" class="submenu">
            <li><a href="#" id="cargar-manual" title="manuales"><i class="fas fa-pen"></i><span> Cargar Manuales</span></a>
            <li><a href="#" id="eliminar-manual" title="manuales"><i class="fas fa-folder-plus"></i><span> Eliminar Manuales</span></a>
                  </ul>
    </li>
</ul>


        
        <footer class="footer"> <!-- creditos del desarrollador: Orlando Zambrano -->
            <p>&copy; 2024 Orlando Zambrano.</p>
        </footer>

    </aside>




<main class="main-content">

        <div class="module-1">
           <div>
                <p id="total-connected-count">Total conectados: 0</p>
                    <ul id="connected-users-list">
                    </ul>
            </div>
        </div>
            <!--<div class="module-2">
            </div> 
            <div class="module-3"></div>
            <div class="module-4"></div>-->


        <section class="checklist-section" id="checklist-section" style="display: none;">
            <iframe id="checklist-iframe" src="" width="100%" height="600px" style="border:none; position: absolute; left: 10%; top: 12%;"></iframe>
        </section>


        <section class="user-section" id="user-section" style="display: none;">
            <iframe id="user-iframe" src="" width="100%" height="600px" style="border:none; position: absolute; left: 10%; top: 12%;"></iframe>
        </section>


        <section class="mensaje-section" id="mensaje-section" style="display: none;">
            <iframe id="mensaje-iframe" src="" width="100%" height="600px" style="border:none; position: absolute; left: 10%; top: 12%;"></iframe>
        </section>


        <section class="manual-section" id="manual-section" style="display: none;">
            <iframe id="manual-iframe" src="" width="100%" height="600px" style="border:none; position: absolute; left: 5%; top: 11%;"></iframe>
        </section>


        <section class="plantillas-section" id="plantillas-section" style="display: none;">
            <iframe id="plantillas-iframe" src="" width="100%" height="600px" style="border:none; position: absolute; left: 5%; top: 11%;"></iframe>
        </section>

        

</main>




<script src="/assets/js/checklist_admin.js"></script> <!-- controla checklist -->
<script src="/assets/js/usuarios_admin.js"></script> <!-- controla usuarios -->
<script src="/assets/js/mensaje_admin.js"></script> <!-- controla mensajes masivos -->
<script src="/assets/js/manua_admin.js"></script> <!-- controla mensajes masivos -->
<script src="/assets/js/plantillas_admin.js"></script> <!-- controla plantillas masivos -->

<script>
function toggleSubmenu(event, submenuId) {
    event.preventDefault(); 
    const submenu = document.getElementById(submenuId);

    // Alternar visibilidad del submenu seleccionado
    submenu.classList.toggle('visible');

    // Obtener todos los submenus
    const submenus = document.querySelectorAll('.submenu');
    
    // Contraer otros submenús
    submenus.forEach(function(sub) {
        if (sub.id !== submenuId) {
            sub.classList.remove('visible');
        }
    });
}



</script>

<script>
function formatTime(seconds) {
    const hours = Math.floor(seconds / 3600);
    const minutes = Math.floor((seconds % 3600) / 60);
    const secs = seconds % 60;
    return `${hours}h ${minutes}m ${secs}s`;
}

function updateConnectedUsers() {
    fetch('connected_users.php')
        .then(response => response.json())
        .then(data => {
            const userList = document.getElementById('connected-users-list');
            const totalCount = document.getElementById('total-connected-count');
            totalCount.textContent = `Total conectados: ${data.total_connected}`;
            userList.innerHTML = '';
            data.connected_users.forEach(user => {
                const listItem = document.createElement('li');
                listItem.textContent = `${user.name} = ${formatTime(user.time_online)}`;
                userList.appendChild(listItem);
            });
        })
        .catch(error => console.error('Error:', error));
}

setInterval(updateConnectedUsers, 1000);
updateConnectedUsers();


</script>

</body>
</html>