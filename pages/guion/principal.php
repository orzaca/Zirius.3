<?php
session_start();
//require(__DIR__ . '/home/ziriuson/public_html/includes/db.php');
//include(__DIR__ . '/includes/db.php');
require $_SERVER['DOCUMENT_ROOT'] . '/includes/db.php';

// Verifica si el usuario está logueado
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'redes') {
    header("Location: /pages/login.php");
    exit;
}

// Recupera la información del usuario
$user_id = $_SESSION['user_id'];
$sql = "SELECT email FROM users WHERE id = ?";
$stmt = $pdo->prepare($sql);
$stmt->execute([$user_id]);
$user = $stmt->fetch();
$email = htmlspecialchars($user['email']);

// Obtener los nombres de las pestañas desde la base de datos usando PDO
$sqlPestanas = "SELECT nombre FROM nombres_pestanas";
$stmtPestanas = $pdo->prepare($sqlPestanas);
$stmtPestanas->execute();
$nombres = $stmtPestanas->fetchAll(PDO::FETCH_COLUMN); 
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guiones</title>
    <link rel="preload" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"></noscript>
    <link rel="preload" href="principal_guion.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <link rel="stylesheet" href="/assets/css/guion/paginas.css">

   
</head>

<body>
    <!-- Mensaje flotante de copiado -->
    <div id="copy-message" class="message">¡Texto copiado al portapapeles!</div>

    <!-- Menú de pestañas -->
    <div class="tab-container">
        <?php 
        $urls = [
            '/pages/guion/pagina1.php', 
            '/pages/guion/pagina2.php', 
            'pagina3.php', 
            'pagina4.php', 
            'pagina5.php', 
            'pagina6.php', 
            'pagina7.php', 
            'pagina8.php', 
            'pagina9.php'
        ];

        for ($i = 1; $i <= 9; $i++): ?>
            <div class="tab<?php echo $i === 1 ? ' active' : ''; ?>" onclick="loadContent('<?php echo $urls[$i-1]; ?>', this)">
                <?php echo isset($nombres[$i-1]) ? htmlspecialchars($nombres[$i-1]) : "Pestaña $i"; ?>
            </div>
        <?php endfor; ?>
    </div>

    <!-- Contenedor para el contenido dinámico -->
    <div id="dynamic-content" class="content">
        <p>Selecciona una pestaña para Ver tus Scripts..</p>
    </div>

    <script>
        function loadContent(url, tabElement) {
            const contentDiv = document.getElementById("dynamic-content");
            const tabs = document.querySelectorAll(".tab");
            tabs.forEach(tab => tab.classList.remove("active"));
            tabElement.classList.add("active");

            fetch(url)
                .then(response => response.text())
                .then(html => {
                    contentDiv.innerHTML = html;
                })
                .catch(error => {
                    contentDiv.innerHTML = "<p>Error al cargar el contenido.</p>";
                });
        }

    


    </script>



    <script src="principal.js"></script>
    <script src="copiar.js"></script>
    <script src="pagina1.js"></script>
    <script src="pagina2.js"></script>
    <script src="pagina3.js"></script>
    <script src="pagina4.js"></script>
    <script src="pagina5.js"></script>
    <script src="pagina6.js"></script>
    <script src="pagina7.js"></script>
    <script src="pagina8.js"></script>
    <script src="pagina9.js"></script> 




</body>
</html>
