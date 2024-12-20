<?php
//require '../includes/db.php'; // Ajusta la ruta si es necesario
include(__DIR__ . '/../includes/db.php');

try {
    $sql = "SELECT 1";
    $stmt = $pdo->query($sql);
    echo "Conexión exitosa a la base de datos.";
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
