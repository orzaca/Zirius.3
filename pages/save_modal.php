<?php
include 'db.php'; // Conexión a la base de datos

// Verificar si se ha subido un archivo
if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
    // Definir el directorio de destino
    $uploadDir = 'uploads/';
    $fileName = basename($_FILES['image']['name']);
    $uploadFile = $uploadDir . $fileName;

    // Verificar si el archivo es una imagen
    $fileType = pathinfo($uploadFile, PATHINFO_EXTENSION);
    if (in_array($fileType, ['jpg', 'jpeg', 'png', 'gif'])) {
        // Mover la imagen al directorio de destino
        if (move_uploaded_file($_FILES['image']['tmp_name'], $uploadFile)) {
            // Recuperar datos del formulario
            $title = $_POST['title'];
            $content = $_POST['content'];
            $background = $_POST['background'];
            $textColor = $_POST['textColor'];

            // Insertar datos en la base de datos
            $sql = "INSERT INTO modal_config (title, content, image_url, background_color, text_color) 
                    VALUES ('$title', '$content', '$uploadFile', '$background', '$textColor')";

            if ($conn->query($sql) === TRUE) {
                echo "Modal guardado exitosamente!";
            } else {
                echo "Error al guardar el modal: " . $conn->error;
            }
        } else {
            echo "Error al mover la imagen.";
        }
    } else {
        echo "El archivo no es una imagen válida.";
    }
} else {
    echo "No se subió ninguna imagen o hubo un error en la carga.";
}
?>
