<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Visualización de Manuales</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f7f7f7;
    }

    header {
      background-color: rgb(203, 67, 53);
      color: white;
      padding: 20px;
      text-align: center;
    }

        #search-bar {
      width: 50%;
      padding: 10px;
      margin-top: 10px;
      font-size: 16px;
    }

    #manual-list {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      margin: 20px 0;
    }

    .manual-card {
      background-color: white;
      padding: 20px;
      margin: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      text-align: center;
      width: 200px;
      transition: transform 0.3s ease;
    }

    .manual-card:hover {
      transform: translateY(-10px);
    }

    .manual-card img {
      width: 50px;
      margin-bottom: 10px;
    }

    .manual-card h3 {
      font-size: 18px;
      color: #333;
      margin: 10px 0;
    }

    .manual-card button {
      padding: 10px 20px;
      margin-top: 10px;
      background-color: rgb(203, 67, 53);
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 14px;
      cursor: pointer;
    }

    .manual-card button:hover {
      background-color: #a83e32;
    }

    #manual-viewer {
      display: none;
      width: 100%;
      height: 100vh;
      background-color: #fff;
    }

    #manual-viewer iframe {
      width: 100%;
      height: 100%;
      border: none;
    }

    .back-button {
      position: absolute;
      top: 20px;
      left: 20px;
      padding: 10px 20px;
      background-color: rgb(203, 67, 53);
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      z-index: 1000;
    }

    .back-button:hover {
      background-color: #a83e32;
    }
  </style>
</head>
<body>
  <header>
    <h1>Manuales Claro Guatemala</h1>
    <input type="text" placeholder="Buscar manual..." id="search-bar">
  </header>

  <section id="manual-list">
    <?php
    $dir = 'manuales/'; // Directorio de los manuales
    $allowedExtensions = ['pdf']; // Extensiones permitidas

    if (is_dir($dir)) {
        $files = scandir($dir); // Obtener archivos del directorio
        foreach ($files as $file) {
            $filePath = $dir . $file;
            $fileExt = strtolower(pathinfo($file, PATHINFO_EXTENSION));

            // Mostrar solo archivos permitidos
            if ($file !== '.' && $file !== '..' && in_array($fileExt, $allowedExtensions)) {
                echo "<div class='manual-card'>
                        <img src='pdf.png' alt='Ícono PDF'>
                        <h3>" . htmlspecialchars($file) . "</h3>
                        <button onclick=\"viewManual('$filePath')\">Ver Manual</button>
                      </div>";
            }
        }
    } else {
        echo "<p>No se encontró el directorio de manuales.</p>";
    }
    ?>
  </section>

  <section id="manual-viewer">
    <button class="back-button" onclick="goBack()">Volver</button>
    <iframe id="manualIframe" src="" title="Visor de Manuales"></iframe>
  </section>

  <script>
    const manualList = document.getElementById('manual-list');
    const manualViewer = document.getElementById('manual-viewer');
    const manualIframe = document.getElementById('manualIframe');

    function viewManual(filePath) {
      // Ocultar lista y mostrar visor
      manualList.style.display = 'none';
      manualViewer.style.display = 'block';
      manualIframe.src = filePath;
    }

    function goBack() {
      // Mostrar lista y ocultar visor
      manualViewer.style.display = 'none';
      manualList.style.display = 'flex';
      manualIframe.src = '';
    }
  </script>

    <script>
    document.getElementById('search-bar').addEventListener('input', function() {
      let filter = this.value.toLowerCase();
      let cards = document.querySelectorAll('.manual-card');
      
      cards.forEach(function(card) {
        let title = card.querySelector('h3').textContent.toLowerCase();
        if (title.includes(filter)) {
          card.style.display = '';
        } else {
          card.style.display = 'none';
        }
      });
    });
  </script>
</body>
</html>
