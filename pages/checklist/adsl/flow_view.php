<?php
include(__DIR__ . '/db.php');

// Obtener el ID del flujo desde la URL, si no está presente, asumir flujo 1
$current_flow_id = isset($_GET['flow_id']) ? $_GET['flow_id'] : 1;
$current_step_id = isset($_GET['id']) ? $_GET['id'] : null;

// Consultar los flujos disponibles
$sql_flows = "SELECT id, name FROM flows1";  
$stmt_flows = $pdo->prepare($sql_flows);
$stmt_flows->execute();
$flows = $stmt_flows->fetchAll(PDO::FETCH_ASSOC);

// Consultar los pasos para el flujo seleccionado
$sql_steps = "SELECT * FROM steps1 WHERE flow_id = :flow_id ORDER BY id";  
$stmt_steps = $pdo->prepare($sql_steps);
$stmt_steps->bindParam(':flow_id', $current_flow_id);
$stmt_steps->execute();
$steps = $stmt_steps->fetchAll(PDO::FETCH_ASSOC);

// Si no hay pasos, mostrar mensaje de error
if (empty($steps)) {
    echo "<p><strong>No hay pasos disponibles para el flujo seleccionado.</strong></p>";
    exit;
}

// Si no se especifica un paso, tomamos el primer paso
if ($current_step_id === null) {
    $current_step = $steps[0]; 
} else {
    // Buscar el paso por ID
    $current_step = null;
    foreach ($steps as $step) {
        if ($step['id'] == $current_step_id) {
            $current_step = $step;
            break;
        }
    }
}

// Si el paso no existe, mostrar mensaje de error
if (!$current_step) {
    echo "<p><strong>El paso seleccionado no existe o ha sido eliminado.</strong></p>";
    exit;
}

// Mostrar el paso actual
echo "<div class='step-container'>";
echo "<h2 class='step-title'>" . htmlspecialchars($current_step['title']) . "</h2>";
echo "<div class='step-description'>" . nl2br($current_step['description']) . "</div>";

// Mostrar las opciones de decisión (Sí y No) si existen
if ($current_step['option_yes_id']) {
    $next_step_yes = get_step_by_id($pdo, $current_step['option_yes_id'], $current_flow_id);
    if ($next_step_yes) {
        echo "<a class='option-button' href='flow_view.php?flow_id=" . $current_flow_id . "&id=" . $next_step_yes['id'] . "'>Sí</a> ";
    } else {
        echo "<span class='option-button disabled'>Opción Sí no disponible</span> ";
    }
}

if ($current_step['option_no_id']) {
    $next_step_no = get_step_by_id($pdo, $current_step['option_no_id'], $current_flow_id);
    if ($next_step_no) {
        echo "<a class='option-button' href='flow_view.php?flow_id=" . $current_flow_id . "&id=" . $next_step_no['id'] . "'>No</a>";
    } else {
        echo "<span class='option-button disabled'>Opción No no disponible</span>";
    }
}

echo "<br>";
echo "<button class='back-button' onclick='window.history.back();'>Regresar</button>";
echo "</div>";  

function get_step_by_id($pdo, $step_id, $flow_id) {
    $sql = "SELECT * FROM steps1 WHERE id = :id AND flow_id = :flow_id";  // **Cambio: 'steps' a 'steps1'**
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':id', $step_id);
    $stmt->bindParam(':flow_id', $flow_id);
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
}
?>

<div class="flow-selector">
    <form method="GET" action="flow_view.php">
        <label for="flow_select">Seleccionar Flujo:</label>
        <select id="flow_select" name="flow_id" onchange="this.form.submit()">
            <?php foreach ($flows as $flow): ?>
                <option value="<?php echo $flow['id']; ?>" <?php echo ($current_flow_id == $flow['id']) ? 'selected' : ''; ?>>
                    <?php echo htmlspecialchars($flow['name']); ?>
                </option>
            <?php endforeach; ?>
        </select>
    </form>
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

</body>

<script>
    function toggleMenu() {
        const menu = document.querySelector('.navbar-list');
        menu.classList.toggle('show');
    }
</script>

</html>
