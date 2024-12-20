<?php
include(__DIR__ . '/../includes/db.php');

// Obtener todos los pasos de la base de datos
$sql = "SELECT * FROM steps3";
$stmt = $pdo->prepare($sql);
$stmt->execute();
$steps = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Función para obtener el título de un paso por su ID
function getStepTitle($pdo, $id) {
    $sql = "SELECT title FROM steps3 WHERE id = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    $step = $stmt->fetch(PDO::FETCH_ASSOC);
    return $step ? $step['title'] : 'No disponible';
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Pasos</title>
    <link rel="stylesheet" href="style.css"> <!-- Estilo CSS para la página -->
</head>
<body>
    <div class="container">
        <h1>Listado de Pasos</h1>

        <?php if (empty($steps)): ?>
            <p>No hay pasos registrados. <a href="create_step.php">Crear un nuevo paso</a>.</p>
        <?php else: ?>
            <table>
                <thead>
                    <tr>
                        <th>Título</th>
                        <th>Descripción</th>
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($steps as $step): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($step['title']); ?></td>
                            <td><?php echo htmlspecialchars($step['description']); ?></td>
                            <td>
                                <a href="view_step.php?id=<?php echo $step['id']; ?>" class="btn-view">Ver</a>
                                <a href="create_step.php?id=<?php echo $step['id']; ?>" class="btn-edit">Editar</a>
                                <a href="delete_step.php?id=<?php echo $step['id']; ?>" class="btn-delete" onclick="return confirm('¿Estás seguro de que deseas eliminar este paso?')">Eliminar</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>

            <div class="action-buttons">
                <a href="create_step.php" class="btn-add">Crear nuevo paso</a>
            </div>
        <?php endif; ?>
    </div>
</body>
</html>
