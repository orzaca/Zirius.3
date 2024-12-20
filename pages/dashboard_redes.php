<?php
session_start();
include(__DIR__ . '/../includes/db.php');

// Verifica si el usuario está logueado
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'redes') {
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
    $name = $user['name'];
    $email = $user['email'];
} else {
    header("Location: logout.php");
    exit;
}

// Recupera las noticias del sistema
$news_sql = "SELECT title, content, created_at FROM system_news ORDER BY created_at DESC";
$news_stmt = $pdo->prepare($news_sql);
$news_stmt->execute();
$news_list = $news_stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zirius</title>
    <link rel="icon" href="/assets/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/assets/css/dashboard_telefonico.css">
     <link rel="stylesheet" href="styles.css">
     
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
       @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
        .modal {
            display: flex;
            justify-content: center;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }

        .modal-content {
            background-color: #FFD700;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
        }

        .modal-content h2 {
            margin-bottom: 10px;
        }

        .modal-content img {
            max-width: 100%;
            height: auto;
            margin: 10px 0;
        }

        .modal-content button {
            margin-top: 15px;
            padding: 8px 16px; /* Tamaño más pequeño */
            background-color: #e57373; /* Rojo intenso */
            color: white;
            font-family: 'Poppins', sans-serif; /* Tipografía elegante y legible */
            font-size: 14px; /* Tamaño de fuente moderado */
            font-weight: bold; /* Negrita para destacar el texto */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); /* Sombra suave para darle profundidad */
            transition: all 0.3s ease; /* Transición suave para hover y otros efectos */
        }

.modal-content button:hover {
    background-color: #641e16; /* Color más oscuro en hover */
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.3); /* Aumenta la sombra en hover */
    transform: translateY(-2px); /* Efecto de elevación al pasar el cursor */
}

.modal-content button:active {
    transform: translateY(1px); /* Botón presionado */
    box-shadow: 0 3px 5px rgba(0, 0, 0, 0.2); /* Reduce la sombra */
}
        /* Estilo del modal */
#previewModal {
    position: relative; /* Necesario para posicionar el botón en la parte inferior */
    width: 50%;
    max-width: 500px;
    background-color: #fff;
    color: #000;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    padding: 20px;
    margin: 50px auto;
}

/* Contenedor del modal de previsualización */
#previewContainer {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: rgba(0, 0, 0, 0.5);
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 9999;
}

#previewModal {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    position: relative;
    width: 80%;
    max-width: 600px;
    text-align: center;
}

/* Estilo para el título y texto dentro del modal */
#previewTitle, #previewText {
    margin-bottom: 20px;
}

#previewImage {
    width: 100%;
    height: auto;
    margin-bottom: 20px;
}

/* Botón de cerrar centrado y hacia abajo */
#closePreviewModal {
    background-color: red;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 30px; /* Esto mueve el botón hacia abajo */
    width: 150px; /* Establece un tamaño fijo para el botón */
    margin-left: auto; /* Centra el botón horizontalmente */
    margin-right: auto; /* Centra el botón horizontalmente */
    display: block; /* Asegura que el botón se comporta como un bloque */
}

/* Efecto de hover para el botón */
#closePreviewModal:hover {
    background-color: darkred;
}

    </style>

</head>
<body>
    <!-- Barra superior -->
    <header class="header">
        <nav class="navbar">
            <div class="navbar-left">
                <h3>Soporte Telefonico</h3>
            </div>
            <div class="navbar-right">
                <span>Hola, <?php echo htmlspecialchars($name); ?></span>
                <a href="logout.php" class="logout-link">Cerrar Sesion</a>
            </div>
        </nav>
    </header>

    <!-- Menu Lateral -->
    <aside class="sidebar">
        <ul class="menu">
            <li><a href="#" id="load-guion" title="guion" onclick="loadSection('guion')"><i class="fas fa-comments"></i><span>Guiones</span></a></li>
            <li><a href="#" id="load-tipi" title="tipi" onclick="loadSection('tipi')"><i class="fas fa-clipboard"></i><span>Plantillas</span></a></li>
            <li><a href="#" id="load-checklist" title="Checklist"><i class="fas fa-check-circle"></i><span>Checklist</span></a></li>
            <li><a href="#" id="load-manual" title="Manuales"><i class="fas fa-book"></i><span>Manuales</span></a></li>
            <li><a href="#" id="load-grilla" title="Grillas TV"><i class="fas fa-tv"></i><span>Grillas TV</span></a></li>
            <li><a href="#" id="load-zona" title="Zonas operativas"><i class="fas fa-map-marked-alt"></i><span>Zonas operativas</span></a></li>
        </ul>
    </aside>

    <main class="main-content">
                <div class="module-1"></div>
                
              
                <iframe id="centro" src="/pages/tipi/index.html" title="centro"></iframe> 
                
                <div class="module-2">      <?php  
                    include 'show_modal.php';
                ?>
                   
               </div>
                <div class="module-3"></div>
                <div class="noticias"></div>
 
   

        <section class="guion-section" id="guion-section" style="display: none;">
            <iframe id="guion-iframe" src="" width="90%" height="100%" style="border:none; position: absolute; left: 5%; top: 11%;"></iframe>
        </section>

        <section class="manual-section" id="manual-section" style="display: none;">
            <iframe id="manual-iframe" src="" width="100%" height="100%" style="border:none; position: absolute; left: 5%; top: 11%;"></iframe>
        </section>

        <section class="checklist-section" id="checklist-section" style="display: none;">
            <iframe id="checklist-iframe" src="" width="100%" height="100%" style="border:none; position: absolute; left: 5%; top: 11%;"></iframe>
        </section>

        <section class="quejas-section" id="quejas-section" style="display: none;">
            <iframe id="quejas-iframe" src="" width="100%" height="100%" style="border:none; position: absolute; left: 5%; top: 11%;"></iframe>
        </section>

        <section class="wf-section" id="wf-section" style="display: none;">
            <iframe id="wf-iframe" src="" width="100%" height="100%" style="border:none; position: absolute; left: 5%; top: 11%;"></iframe>
        </section>

        <section class="zona-section" id="zona-section" style="display: none;">
            <iframe id="zona-iframe" src="" width="100%" height="100%" style="border:none; position: absolute;left: 5%; top: 11%;"></iframe>
        </section>

        <section class="grilla-section" id="grilla-section" style="display: none;">
            <iframe id="grilla-iframe" src="" width="100%" height="100%" style="border:none; position: absolute; left: 5%; top: 11%;"></iframe>
        </section>


    </main>


    <script src="/assets/js/iframe_guion.js"></script>
    <script src="/assets/js/iframe_checklist.js"></script>
    <script src="/assets/js/iframe_manual.js"></script>
    <script src="/assets/js/iframe_zona.js"></script>
    <script src="/assets/js/iframe_grilla.js"></script>
    <script src="/assets/js/iframe_tipi.js"></script>
    <script src="/assets/js/pestanas.js"></script>
   
    <script>
        // Cerrar el modal cuando se haga clic en el botón
        document.addEventListener('DOMContentLoaded', () => {
            const closeButton = document.getElementById('closeModal');
            if (closeButton) {
                closeButton.addEventListener('click', () => {
                    const modal = document.querySelector('.modal');
                    modal.style.display = 'none';
                });
            }
        });
    </script>

    


</body>
</html>
