<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $uploadDir = 'manuales/'; // Carpeta donde se guardarán los manuales

    // Verificar si la carpeta existe; si no, crearla
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true); // Crear la carpeta con permisos de escritura
    }

    $manualName = basename($_FILES['manual']['name']);
    $manualPath = $uploadDir . $manualName;

    // Definir el tamaño máximo permitido (5 MB)
    $maxFileSize = 5 * 1024 * 1024; // 5 MB en bytes

    // Verificar el tamaño del archivo
    if ($_FILES['manual']['size'] > $maxFileSize) {
        echo "<script>alert('El archivo es demasiado grande. El tamaño máximo permitido es 5 MB.'); window.location.href = 'upload_manual.html';</script>";
        exit; // Detener el script si el archivo es demasiado grande
    }

    // Verificar si el archivo ya existe y generar un nombre único si es necesario
    if (file_exists($manualPath)) {
        $fileInfo = pathinfo($manualName);
        $manualName = $fileInfo['filename'] . '_' . uniqid() . '.' . $fileInfo['extension'];
        $manualPath = $uploadDir . $manualName;
    }

    // Mover el archivo subido al directorio deseado
    if (move_uploaded_file($_FILES['manual']['tmp_name'], $manualPath)) {
        echo "<script>alert('El manual se subió correctamente: $manualPath'); window.location.href = 'upload_manual.html';</script>";
    } else {
        echo "<script>alert('El archivo es demasiado grande. El tamaño máximo permitido es 5 MB.'); window.location.href = 'upload_manual.html';</script>";
    }
}
?>
