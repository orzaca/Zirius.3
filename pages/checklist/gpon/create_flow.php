<?php
include(__DIR__ . '/db.php'); // Conexión a la base de datos

// Inicializar variables
$name = '';
$description = '';
$error = '';

// Verificar si el formulario fue enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'] ?? '';
    $description = $_POST['description'] ?? '';

    // Validar que el nombre no esté vacío
    if (empty($name)) {
        $error = "El nombre del flujo es obligatorio.";
    } else {
        // Insertar el flujo en la base de datos
        $sql = "INSERT INTO flows (name, description) VALUES (:name, :description)";
        $stmt = $pdo->prepare($sql);

        if ($stmt->execute([':name' => $name, ':description' => $description])) {
            header('Location: index.php'); // Redirigir al index después de guardar
            exit;
        } else {
            $error = "Error al guardar el flujo.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Nuevo Flujo</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Crear Nuevo Flujo</h1>

        <!-- Mostrar errores -->
        <?php if ($error): ?>
            <div class="error">
                <?php echo htmlspecialchars($error); ?>
            </div>
        <?php endif; ?>

        <!-- Formulario para crear flujo -->
        <form method="POST" action="create_flow.php">
            <label for="name">Nombre del Flujo:</label>
            <input type="text" id="name" name="name" value="<?php echo htmlspecialchars($name); ?>" required>

            <label for="description">Descripción (opcional):</label>
            <textarea id="description" name="description"><?php echo htmlspecialchars($description); ?></textarea>

            <button type="submit">Guardar Flujo</button>
            <a href="index.php" class="button">Cancelar</a>
        </form>
    </div>
</body>
</html>
