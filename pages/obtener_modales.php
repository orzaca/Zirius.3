// obtener_modales.php
<?php
include 'DB.php';

$query = "SELECT * FROM modales ORDER BY fecha_creacion DESC";
$result = $db->query($query);
$modales = [];

while ($row = $result->fetch_assoc()) {
    $modales[] = $row;
}

echo json_encode($modales);
?>
