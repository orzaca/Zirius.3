// guardar_modal.php
<?php
include 'DB.php';  // Conexión a la base de datos

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $titulo = $_POST['titulo'];
    $contenido = $_POST['contenido'];
    $usuario_id = $_POST['usuario_id'];  // El ID del usuario actual

    $query = "INSERT INTO modales (titulo, contenido, creado_por) VALUES (?, ?, ?)";
    $stmt = $db->prepare($query);
    $stmt->bind_param("ssi", $titulo, $contenido, $usuario_id);
    $stmt->execute();

    echo json_encode(["status" => "success", "message" => "Modal guardado correctamente"]);
}
?>
