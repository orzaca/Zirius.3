<?php
include(__DIR__ . '/db.php'); // Conexión a la base de datos

// Inicializar variables
$name = '';
$description = '';
$error = '';

// Verificar si el formulario fue enviado para agregar
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_flow'])) {
    $name = $_POST['name'] ?? '';
    $description = $_POST['description'] ?? '';

    // Validar que el nombre no esté vacío
    if (empty($name)) {
        $error = "El nombre del flujo es obligatorio.";
    } else {
        // Insertar el flujo en la base de datos
        $sql = "INSERT INTO flows1 (name, description) VALUES (:name, :description)";
        $stmt = $pdo->prepare($sql);

        if ($stmt->execute([':name' => $name, ':description' => $description])) {
            header('Location: create_adsl.php'); // Redirigir a la misma página después de guardar
            exit;
        } else {
            $error = "Error al guardar el flujo.";
        }
    }
}

// Verificar si el formulario fue enviado para editar
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['edit_flow'])) {
    $id = $_POST['flow_id'] ?? '';
    $name = $_POST['edit_name'] ?? '';

    if (empty($id) || empty($name)) {
        $error = "Todos los campos son obligatorios.";
    } else {
        // Actualizar el flujo en la base de datos
        $sql = "UPDATE flows1 SET name = :name WHERE id = :id";
        $stmt = $pdo->prepare($sql);

        if ($stmt->execute([':name' => $name, ':id' => $id])) {
            header('Location: create_adsl.php'); // Redirigir después de actualizar
            exit;
        } else {
            $error = "Error al actualizar el flujo.";
        }
    }
}

// Obtener la lista de flujos existentes
$sql = "SELECT id, name, description FROM flows1 ORDER BY id ASC";
$stmt = $pdo->query($sql);
$flows = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear y Editar Flujos</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        /* Estilos generales */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            color: #333;
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
            color: #555;
        }

        input, textarea {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        button {
            padding: 12px 20px;
            font-size: 16px;
            background-color: #cb4335;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #641e16;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            width: 90%;
            max-width: 400px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Crear Checklist ADSL</h1>

        <!-- Mostrar errores -->
        <?php if ($error): ?>
            <div class="error">
                <?php echo htmlspecialchars($error); ?>
            </div>
        <?php endif; ?>

        <!-- Formulario para crear flujo -->
        <form method="POST" action="create_adsl.php">
            <input type="hidden" name="add_flow">
            <label for="name">Nombre del Flujo:</label>
            <input type="text" id="name" name="name" required>

            <label for="description">Descripción (opcional):</label>
            <textarea id="description" name="description"></textarea>

            <button type="submit">Guardar Flujo</button>
        </form>

        <!-- Listado de flujos existentes -->
        <h2>Listado de Flujos</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($flows as $flow): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($flow['id']); ?></td>
                        <td><?php echo htmlspecialchars($flow['name']); ?></td>
                        <td>
                            <button onclick="openEditModal(<?php echo htmlspecialchars($flow['id']); ?>, '<?php echo htmlspecialchars($flow['name']); ?>')">Editar</button>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <!-- Modal para editar -->
    <div class="modal" id="editModal">
        <div class="modal-content">
            <h2>Editar Flujo</h2>
            <form method="POST" action="create_adsl.php">
                <input type="hidden" name="edit_flow">
                <input type="hidden" name="flow_id" id="editFlowId">
                <label for="edit_name">Nuevo Nombre:</label>
                <input type="text" id="editName" name="edit_name" required>
                <button type="submit">Guardar Cambios</button>
                <button type="button" onclick="closeEditModal()">Cancelar</button>
            </form>
        </div>
    </div>

    <script>
        function openEditModal(id, name) {
            document.getElementById('editFlowId').value = id;
            document.getElementById('editName').value = name;
            document.getElementById('editModal').style.display = 'flex';
        }

        function closeEditModal() {
            document.getElementById('editModal').style.display = 'none';
        }
    </script>
</body>
</html>
