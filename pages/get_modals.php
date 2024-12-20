<?php
include 'db.php'; // Conexión a la base de datos

$sql = "SELECT * FROM modal_config";
$result = $conn->query($sql);

$modals = [];
while ($row = $result->fetch_assoc()) {
    $modals[] = $row;
}

echo json_encode($modals);
?>
