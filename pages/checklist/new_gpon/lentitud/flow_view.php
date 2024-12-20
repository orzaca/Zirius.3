<?php
include(__DIR__ . '/db.php');

// Obtener el ID del paso actual desde la URL, por defecto es 1
$current_step_id = isset($_GET['id']) ? $_GET['id'] : 1;

// Depuración: Verificar el ID que estamos buscando
echo "<p><br></p>";

while ($current_step_id) {
    // Consultar el paso actual
    $sql = "SELECT * FROM steps1 WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':id', $current_step_id);
    $stmt->execute();
    $step = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$step) {
        // Si el paso no existe, mostrar mensaje y salir del loop
        echo "<p><strong>El paso con ID " . htmlspecialchars($current_step_id) . " no existe o ha sido eliminado.</strong></p>";
        break;
    }

    // Mostrar el título y la descripción del paso con formato
    echo "<div class='step-container'>";

    echo "<h2 class='step-title'>" . htmlspecialchars($step['title']) . "</h2>";

    // Aquí no usamos htmlspecialchars, porque queremos que el HTML guardado se muestre tal cual
    // Usamos nl2br() para mantener los saltos de línea
    echo "<div class='step-description'>" . nl2br($step['description']) . "</div>";

    // Verificar y mostrar las opciones de decisión (Sí y No)
    if ($step['option_yes_id']) {
        // Consultar si la opción "Sí" tiene un paso válido
        $sql_yes = "SELECT * FROM steps1 WHERE id = :id";
        $stmt_yes = $pdo->prepare($sql_yes);
        $stmt_yes->bindParam(':id', $step['option_yes_id']);
        $stmt_yes->execute();
        $yes_step = $stmt_yes->fetch(PDO::FETCH_ASSOC);

        if ($yes_step) {
            // Si el paso de la opción "Sí" existe
            echo "<a class='option-button' href='flow_view.php?id=" . $step['option_yes_id'] . "'>Sí</a> ";
        } else {
            // Si el paso de la opción "Sí" no existe
            echo "<span class='option-button disabled'>Opción Sí no disponible</span> ";
        }
    }

    if ($step['option_no_id']) {
        // Consultar si la opción "No" tiene un paso válido
        $sql_no = "SELECT * FROM steps1 WHERE id = :id";
        $stmt_no = $pdo->prepare($sql_no);
        $stmt_no->bindParam(':id', $step['option_no_id']);
        $stmt_no->execute();
        $no_step = $stmt_no->fetch(PDO::FETCH_ASSOC);

        if ($no_step) {
            // Si el paso de la opción "No" existe
            echo "<a class='option-button' href='flow_view.php?id=" . $step['option_no_id'] . "'>No</a>";
        } else {
            // Si el paso de la opción "No" no existe
            echo "<span class='option-button disabled'>Opción No no disponible</span>";
        }
    }
     echo "</br>";
    echo "<button class='back-button' onclick='window.history.back();'>Regresar</button>";
    // Botón de regreso dentro del contenedor del paso
    echo "</div>";  // Cierra el contenedor del paso



    // Salir del loop después de mostrar un paso
    break;
}
?>

<!-- Menú superior -->
<div class="navbar">
    <div class="menu-icon" onclick="toggleMenu()">&#9776;</div>
    <ul class="navbar-list">
        <li><a href="/pages/checklist/checklist.html">Inicio</a></li>
        <li><a href="/pages/checklist/new_gpon/no_navega/flow_view.php">No Navega</a></li>
        <li><a href="/pages/checklist/new_gpon/lentitud/flow_view.php">Lentitud</a></li>
        <li><a href="/pages/checklist/new_gpon/inestabilidad/flow_view.php">Inestabilidad</a></li>
        <li><a href="/pages/checklist/new_gpon/pon_apagado/flow_view.php">PON Apagado</a></li>
        <li><a href="/pages/checklist/new_gpon/sin_tono/flow_view.php">Sin tono</a></li>
        <li><a href="/pages/checklist/new_gpon/ont_danado/flow_view.php">Posible ONT Dañado</a></li>
        <li><a href="/pages/checklist/new_gpon/migracion/flow_view.php">Migracion</a></li>
    </ul>
</div>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zirius</title>
    <link rel="stylesheet" href="/assets/css/check.css">
</head>
<body>
    <!-- Contenido del archivo -->
</body>

<script>
    function toggleMenu() {
        const menu = document.querySelector('.navbar-list');
        menu.classList.toggle('show');
    }
</script>

</html>
