<?php
include 'db.php'; // Conexión a la base de datos

// Obtener el ID del modal a desactivar
$data = json_decode(file_get_contents('php://input'), true);
$id = $data['id'];

// Actualizar el estado del modal a desactivado (active = 0)
$sql = "UPDATE modal_config SET active = 0 WHERE id = $id";

if ($conn->query($sql) === TRUE) {
    echo "Modal desactivado exitosamente!";
} else {
    echo "Error al desactivar el modal: " . $conn->error;
}
?>
