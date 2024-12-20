<?php
// Conexión a la base de datos
$host = "localhost";
$user = "ziriuson_orzaca";
$password = "Orzaca2024*";
$dbname = "ziriuson_zirius";

$conn = new mysqli($host, $user, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Error en la conexión: " . $conn->connect_error);
}

// Procesar el formulario
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Obtener y asegurar los datos del formulario
    $opcion = isset($_POST['quejas_option']) ? $conn->real_escape_string($_POST['quejas_option']) : '';
    $nota = isset($_POST['quejas_note']) ? $conn->real_escape_string($_POST['quejas_note']) : '';

    if (!empty($opcion) && !empty($nota)) {
        // Verificar si ya existe una nota para la opción
        $sql = "SELECT id FROM quejas WHERE opcion='$opcion'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            // Si existe, actualizar la nota
            $update_sql = "UPDATE quejas SET nota='$nota' WHERE opcion='$opcion'";
            if ($conn->query($update_sql) === TRUE) {
                header("Location: index.html?success=1");
                exit();
            } else {
                echo "Error al actualizar la nota: " . $conn->error;
            }
        } else {
            // Si no existe, insertar una nueva nota
            $insert_sql = "INSERT INTO quejas (opcion, nota, fecha) VALUES ('$opcion', '$nota', NOW())";
            if ($conn->query($insert_sql) === TRUE) {
                header("Location: index.html?success=1");
                exit();
            } else {
                echo "Error al guardar la nota: " . $conn->error;
            }
        }
    } else {
        // Redirigir con mensaje de error
        header("Location: index.html?error=1");
        exit();
    }
}

// Cerrar conexión
$conn->close();
?>
