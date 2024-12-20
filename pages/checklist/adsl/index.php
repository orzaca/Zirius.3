<?php
include(__DIR__ . '/db.php');

// Obtener los flujos disponibles (con nombres) desde la tabla 'flows1'  <!-- Cambio realizado aquí -->
$sql_flows = "SELECT * FROM flows1"; // Cambié 'flows' a 'flows1'
$stmt_flows = $pdo->prepare($sql_flows);
$stmt_flows->execute();
$flows = $stmt_flows->fetchAll(PDO::FETCH_ASSOC);

// Obtener los pasos desde la base de datos (con o sin filtrado por flujo)
$flow_filter = isset($_GET['flow_id']) ? $_GET['flow_id'] : null;
$sql = "SELECT * FROM steps1" . ($flow_filter ? " WHERE flow_id = :flow_id" : "");  
$stmt = $pdo->prepare($sql);

if ($flow_filter) {
    $stmt->bindParam(':flow_id', $flow_filter, PDO::PARAM_INT);
}

$stmt->execute();
$steps = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Pasos Checklist</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            padding: 10px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #641e16;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        table th {
            background-color: #cb4335;
            color: white;
        }
        button, a {
            padding: 10px 15px;
            background-color: #cb4335;
            color: white;
            text-decoration: none;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        button:hover, a:hover {
            background-color: #641e16;
        }
        .button-container {
            margin-top: 20px;
            text-align: right;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Gestión de Adsl / Msan</h1>

        <!-- Selector de flujo (opcional) -->
        <form method="GET" action="">
            <label for="flow_id">Selecciona un flujo:</label>
            <select name="flow_id" id="flow_id" onchange="this.form.submit()">
                <option value="">-- Todos los flujos --</option>
                <?php foreach ($flows as $flow): ?>
                    <option value="<?php echo $flow['id']; ?>" <?php echo ($flow['id'] == $flow_filter) ? 'selected' : ''; ?>>
                        <?php echo htmlspecialchars($flow['name']); ?> <!-- Mostrar el nombre del flujo -->
                    </option>
                <?php endforeach; ?>
            </select>
        </form>

        <!-- Botón para crear un nuevo paso -->
        <div class="button-container">
            <a href="create_step.php">Crear Nuevo Paso</a>
        </div>

        <!-- Tabla con los pasos actuales -->
        <h2>Lista de Pasos</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Flujo</th>
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
                        <td>
                            <?php
                            // Mostrar el nombre del flujo, no el ID
                            $flow_name = '';
                            foreach ($flows as $flow) {
                                if ($flow['id'] == $step['flow_id']) {
                                    $flow_name = $flow['name'];
                                    break;
                                }
                            }
                            echo htmlspecialchars($flow_name);
                            ?>
                        </td>
                        <td><?php echo htmlspecialchars($step['title']); ?></td>
                        <td><?php echo htmlspecialchars($step['description']); ?></td>
                        <td>
                            <strong>Sí:</strong> <?php echo $step['option_yes_id'] ? $step['option_yes_id'] : 'Ninguno'; ?><br>
                            <strong>No:</strong> <?php echo $step['option_no_id'] ? $step['option_no_id'] : 'Ninguno'; ?>
                        </td>
                        <td>
                            <a href="create_step.php?id=<?php echo $step['id']; ?>&flow_id=<?php echo $step['flow_id']; ?>">Editar</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

</body>
</html>
