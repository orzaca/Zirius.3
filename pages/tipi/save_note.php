<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    if (isset($data['content']) && isset($data['id'])) {
        $noteId = $data['id'];
        $filePath = "notes/$noteId.txt";

        // Asegurar que la carpeta exista y tenga permisos de escritura
        if (!file_exists('notes')) {
            mkdir('notes', 0777, true);
        }

        if (file_put_contents($filePath, $data['content']) !== false) {
            http_response_code(200);
            echo json_encode(['message' => 'Texto guardado correctamente', 'id' => $noteId]);
        } else {
            http_response_code(500);
            echo json_encode(['message' => 'Error al guardar el texto']);
        }
    } else {
        http_response_code(400);
        echo json_encode(['message' => 'Datos incompletos']);
    }
}
?>
