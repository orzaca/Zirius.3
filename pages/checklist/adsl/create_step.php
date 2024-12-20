<?php
include(__DIR__ . '/db.php');

$id = null;
$title = $description = $option_yes_id = $option_no_id = $flow_id = '';

// Obtener los pasos existentes para poder enlazarlos
$sql_steps = "SELECT * FROM steps1";  // **Cambio aquí: "steps" a "steps1"**
$stmt_steps = $pdo->prepare($sql_steps);
$stmt_steps->execute();
$steps = $stmt_steps->fetchAll(PDO::FETCH_ASSOC);

// Obtener los flujos existentes
$sql_flows = "SELECT * FROM flows1";  // **Cambio aquí: "flows" a "flows1"**
$stmt_flows = $pdo->prepare($sql_flows);
$stmt_flows->execute();
$flows = $stmt_flows->fetchAll(PDO::FETCH_ASSOC);

if (isset($_GET['id'])) {
    // Editar paso existente
    $id = $_GET['id'];
    $sql = "SELECT * FROM steps1 WHERE id = :id";  // **Cambio aquí: "steps" a "steps1"**
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    $step = $stmt->fetch(PDO::FETCH_ASSOC);
    
    $title = $step['title'];
    $description = $step['description'];
    $option_yes_id = $step['option_yes_id'];
    $option_no_id = $step['option_no_id'];
    $flow_id = $step['flow_id'];
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = $_POST['title'];
    // Obtener el contenido sin etiquetas HTML para otros usos, si es necesario
    $description = $_POST['description'];  // No limpiamos el HTML, lo mantenemos tal cual
    $option_yes_id = $_POST['option_yes_id'];
    $option_no_id = $_POST['option_no_id'];
    $flow_id = $_POST['flow_id'];

    if ($id) {
        // Actualizar paso existente
        $sql = "UPDATE steps1 SET title = :title, description = :description, option_yes_id = :option_yes_id, option_no_id = :option_no_id, flow_id = :flow_id WHERE id = :id";  // **Cambio aquí: "steps" a "steps1"**
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':id', $id);
    } else {
        // Crear nuevo paso
        $sql = "INSERT INTO steps1 (title, description, option_yes_id, option_no_id, flow_id) VALUES (:title, :description, :option_yes_id, :option_no_id, :flow_id)";  // **Cambio aquí: "steps" a "steps1"**
        $stmt = $pdo->prepare($sql);
    }

    $stmt->bindParam(':title', $title);
    $stmt->bindParam(':description', $description);
    $stmt->bindParam(':option_yes_id', $option_yes_id);
    $stmt->bindParam(':option_no_id', $option_no_id);
    $stmt->bindParam(':flow_id', $flow_id);

    if ($stmt->execute()) {
        header('Location: index.php'); // Redirige a la página principal después de guardar
        exit;
    } else {
        echo "Error al guardar el paso.";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $id ? 'Editar' : 'Crear'; ?> Paso</title>
    <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script> <!-- Incluir CKEditor desde CDN -->
    <link rel="stylesheet" href="style.css"> <!-- Enlace al archivo de estilo CSS -->
</head>
<body>
    <div class="container">
        <h2><?php echo $id ? 'Editar' : 'Crear'; ?> Paso</h2>
        <form method="POST" action="create_step.php<?php echo $id ? '?id=' . $id : ''; ?>" id="stepForm">
            <div class="form-group">
                <label for="title">Título:</label>
                <input type="text" id="title" name="title" value="<?php echo htmlspecialchars($title); ?>" required>
            </div>

            <div class="form-group">
                <label for="description">Descripción:</label>
                <!-- Aquí no agregamos el atributo 'required' en el textarea -->
                <textarea id="description" name="description"><?php echo htmlspecialchars($description); ?></textarea>
            </div>

            <div class="form-group">
                <label for="flow_id">Seleccionar Flujo:</label>
                <select id="flow_id" name="flow_id" required>
                    <option value="">Seleccionar flujo</option>
                    <?php foreach ($flows as $flow): ?>
                        <option value="<?php echo $flow['id']; ?>" <?php echo $flow_id == $flow['id'] ? 'selected' : ''; ?>>
                            <?php echo htmlspecialchars($flow['name']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="form-group">
                <label for="option_yes_id">ID del siguiente paso (Sí):</label>
                <select id="option_yes_id" name="option_yes_id">
                    <option value="">Seleccionar siguiente paso (Sí)</option>
                    <?php foreach ($steps as $step): ?>
                        <?php if ($step['flow_id'] == $flow_id): ?>
                            <option value="<?php echo $step['id']; ?>" <?php echo $option_yes_id == $step['id'] ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($step['title']); ?>
                            </option>
                        <?php endif; ?>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="form-group">
                <label for="option_no_id">ID del siguiente paso (No):</label>
                <select id="option_no_id" name="option_no_id">
                    <option value="">Seleccionar siguiente paso (No)</option>
                    <?php foreach ($steps as $step): ?>
                        <?php if ($step['flow_id'] == $flow_id): ?>
                            <option value="<?php echo $step['id']; ?>" <?php echo $option_no_id == $step['id'] ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($step['title']); ?>
                            </option>
                        <?php endif; ?>
                    <?php endforeach; ?>
                </select>
            </div>

            <button type="submit"><?php echo $id ? 'Actualizar' : 'Crear'; ?> Paso</button>
        </form>
    </div>

    <!-- Incluir el script para inicializar CKEditor -->
    <script>
    ClassicEditor
        .create(document.querySelector('#description'), {
            toolbar: [
                'heading', '|', 'bold', 'italic', 'bulletedList', 'numberedList', 
                'blockQuote', 'undo', 'redo', 'link', 'imageUpload'
            ],
            removePlugins: ['SourceEditing'], // Desactiva el botón para ver código fuente
        })
        .then(editor => {
            // Validación cuando el formulario se envía
            document.querySelector('#stepForm').addEventListener('submit', function(e) {
                // Verificar si el editor tiene contenido
                if (editor.getData().trim() === '') {
                    e.preventDefault(); // Evitar que el formulario se envíe
                    alert('El campo descripción es obligatorio.');
                }
            });
        })
        .catch(error => {
            console.error('Error inicializando CKEditor:', error);
        });
    </script>
</body>
</html>
