<?php
include(__DIR__ . '/db.php');

// Obtener el ID del paso (si se está editando)
$step_id = isset($_GET['id']) ? $_GET['id'] : null;

// Inicializar variables del formulario
$title = '';
$description = '';
$option_yes_id = null;
$option_no_id = null;
$flow_id = null;

// Si se está editando un paso, cargar sus datos
if ($step_id) {
    $sql = "SELECT * FROM steps WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':id', $step_id);
    $stmt->execute();
    $step = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($step) {
        $title = $step['title'];
        $description = $step['description'];
        $option_yes_id = $step['option_yes_id'];
        $option_no_id = $step['option_no_id'];
        $flow_id = $step['flow_id']; // Cargar el ID del flujo asociado
    }
}

// Obtener todos los flujos para el campo de selección
$sql_flows = "SELECT id, name FROM flows";
$stmt_flows = $pdo->prepare($sql_flows);
$stmt_flows->execute();
$flows = $stmt_flows->fetchAll(PDO::FETCH_ASSOC);

// Procesar el formulario al enviarlo
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $_POST['title'];
    $description = $_POST['description'];
    $option_yes_id = $_POST['option_yes_id'] ?: null;
    $option_no_id = $_POST['option_no_id'] ?: null;
    $flow_id = $_POST['flow_id'];

    if ($step_id) {
        // Actualizar un paso existente
        $sql = "UPDATE steps SET title = :title, description = :description, option_yes_id = :option_yes_id, 
                option_no_id = :option_no_id, flow_id = :flow_id WHERE id = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':id', $step_id);
    } else {
        // Crear un nuevo paso
        $sql = "INSERT INTO steps (title, description, option_yes_id, option_no_id, flow_id) 
                VALUES (:title, :description, :option_yes_id, :option_no_id, :flow_id)";
        $stmt = $pdo->prepare($sql);
    }

    // Vincular parámetros y ejecutar
    $stmt->bindParam(':title', $title);
    $stmt->bindParam(':description', $description);
    $stmt->bindParam(':option_yes_id', $option_yes_id);
    $stmt->bindParam(':option_no_id', $option_no_id);
    $stmt->bindParam(':flow_id', $flow_id);
    $stmt->execute();

    // Redirigir al índice
    header('Location: index.php');
    exit;
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $step_id ? 'Editar' : 'Crear'; ?> Paso</title>
    <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script> <!-- Incluir CKEditor desde CDN -->
    <link rel="stylesheet" href="style.css"> <!-- Enlace al archivo de estilo CSS -->
</head>
<body>
    <div class="container">
        <h1><?php echo $step_id ? 'Editar Paso' : 'Crear Nuevo Paso'; ?></h1>
        <form method="POST">
            <label for="title">Título</label>
            <input type="text" id="title" name="title" value="<?php echo htmlspecialchars($title); ?>" required>

            <label for="description">Descripción</label>
            <textarea id="description" name="description" rows="5" required><?php echo htmlspecialchars($description); ?></textarea>

            <label for="option_yes_id">ID de la Opción Sí</label>
            <input type="number" id="option_yes_id" name="option_yes_id" value="<?php echo htmlspecialchars($option_yes_id); ?>">

            <label for="option_no_id">ID de la Opción No</label>
            <input type="number" id="option_no_id" name="option_no_id" value="<?php echo htmlspecialchars($option_no_id); ?>">

            <label for="flow_id">Flujo</label>
            <select id="flow_id" name="flow_id" required>
                <option value="">Seleccionar flujo</option>
                <?php foreach ($flows as $flow): ?>
                    <option value="<?php echo $flow['id']; ?>" <?php echo $flow_id == $flow['id'] ? 'selected' : ''; ?>>
                        <?php echo htmlspecialchars($flow['name']); ?>
                    </option>
                <?php endforeach; ?>
            </select>

            <button type="submit">Guardar</button>
        </form>
    </div>
    <script>
        ClassicEditor
            .create(document.querySelector('#description'))
            .catch(error => {
                console.error(error);
            });
    </script>
</body>
</html>
