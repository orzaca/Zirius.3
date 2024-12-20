<?php
// Incluir el archivo de conexión
include(__DIR__ . '/db.php');

// Recuperar el último modal guardado desde la base de datos
$result = $conn->query("SELECT * FROM modal_config ORDER BY created_at DESC LIMIT 1");

if ($result && $row = $result->fetch_assoc()) {
    // Mostrar el modal con los datos obtenidos de la base de datos
    echo "<div class='modal'>
            <div class='modal-content' style='background-color: {$row['background_color']}; color: {$row['text_color']}'>
                <h2>{$row['title']}</h2>
                <p>{$row['content']}</p>";

    // Verificar si hay una imagen y mostrarla
    if (!empty($row['image_url'])) {
        echo "<img src='{$row['image_url']}' alt='Imagen del modal'>";
    }

    echo "  <button id='closeModal'>Cerrar</button>
            </div>
          </div>";
} else {
    // En caso de error o si no hay modal en la base de datos
    echo "No se encontró un modal para mostrar.";
}
?>
