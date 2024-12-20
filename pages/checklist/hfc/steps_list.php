<?php
include(__DIR__ . '/../includes/db.php');

$sql = "SELECT * FROM steps3";
$stmt = $pdo->prepare($sql);
$stmt->execute();
$steps = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<h2>Lista de Pasos</h2>
<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>Título</th>
            <th>Descripción</th>
            <th>Opciones</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($steps as $step): ?>
            <tr>
                <td><?php echo $step['id']; ?></td>
                <td><?php echo htmlspecialchars($step['title']); ?></td>
                <td><?php echo htmlspecialchars($step['description']); ?></td>
                <td>
                    <strong>Sí:</strong> <?php echo $step['option_yes_id'] ? "<a href='create_step.php?id={$step['option_yes_id']}'>" . htmlspecialchars($step['option_yes_id']) . "</a>" : 'Ninguno'; ?><br>
                    <strong>No:</strong> <?php echo $step['option_no_id'] ? "<a href='create_step.php?id={$step['option_no_id']}'>" . htmlspecialchars($step['option_no_id']) . "</a>" : 'Ninguno'; ?>
                </td>
                <td>
                    <a href="create_step.php?id=<?php echo $step['id']; ?>">Editar</a> |
                    
                </td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>
