<?php
//require $_SERVER['DOCUMENT_ROOT'] . '/includes/db.php';

require $_SERVER['DOCUMENT_ROOT'] . '/includes/db.php';



// Verifica si se ha enviado un ID
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Recupera el contenido de la base de datos
    $sql = "SELECT content FROM texts WHERE id = ?";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$id]);
    $text = $stmt->fetch(PDO::FETCH_ASSOC);

    // Devuelve el contenido como JSON
    header('Content-Type: application/json');
    echo json_encode($text);
} else {
    echo "ID no proporcionado";
}
?>
