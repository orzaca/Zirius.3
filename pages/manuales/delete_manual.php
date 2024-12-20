<?php
if (isset($_POST['file'])) {
    $fileName = $_POST['file'];
    $dir = 'manuales/';
    $filePath = $dir . $fileName;

    // Verificar si el archivo existe
    if (file_exists($filePath)) {
        // Intentar eliminar el archivo
        if (unlink($filePath)) {
            echo "El archivo '$fileName' ha sido eliminado correctamente.";
        } else {
            echo "Hubo un problema al intentar eliminar el archivo.";
        }
    } else {
        echo "El archivo no existe.";
    }
} else {
    echo "No se ha recibido el nombre del archivo.";
}
?>
