<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editor de Modal</title>
   
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 90vh;
        }

        .form-container {
            background-color: #ffffff;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 10px;
            width: 80%;
            max-width: 400px;
            margin: 5px;
        }

        h1 {
            text-align: center;
            font-size: 10px;
            margin-bottom: 15px;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 9px;
        }

        form label {
    font-size: 12px;
    font-weight: bold;
    color: #333;
    margin-bottom: 1px;  /* Espacio mínimo entre el label y el input */
}

form input, form textarea {
    padding: 8px;
    border-radius: 6px;
    border: 1px solid #ddd;
    font-size: 14px;
    width: 90%;
    margin-top: 0;  /* Eliminar espacio superior */
    margin-bottom: 10px;  /* Si prefieres un poco de espacio entre los inputs, ajusta este valor */
    transition: border 0.3s ease, box-shadow 0.3s ease;
}

form input:focus, form textarea:focus {
    border-color: #4CAF50;
    box-shadow: 0 0 4px rgba(76, 175, 80, 0.3);
}

        form textarea {
            resize: vertical;
            min-height: 80px;
        }

        form button {
            background-color: #cb4335;
            color: white;
            padding: 10px;
            font-size: 14px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        form button:hover {
            background-color: #cb4335;
        }

        form button[type="submit"] {
            background-color: #cb4335;
            margin-top: 8px;
        }

        form button[type="submit"]:hover {
            background-color: #f1948a;
        }

        .preview-btn {
            background-color: #cb4335;
            color: white;
            padding: 10px;
            font-size: 14px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-align: center;
            width: 100%;
        }

        .preview-btn:hover {
            background-color: #f1948a;
        }

        .modal {
            display: flex;
            justify-content: center;
            align-items: center;
            position: fixed;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #ffffff;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            max-width: 400px;
            width: 80%;
        }

        #previewContainer {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 9999;
        }

        #closePreviewModal {
            background-color: red;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 15px;
        }

        #closePreviewModal:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Editor de Modal de Bienvenida</h1>
        <form id="modalForm" enctype="multipart/form-data">
            <label for="title">Título:</label>
            <input type="text" id="title" name="title" placeholder="Bienvenido...">

            <label for="content">Contenido:</label>
            <textarea id="content" name="content" placeholder="Contenido del modal"></textarea>

            <label for="image">Subir Imagen:</label>
            <input type="file" id="image" name="image">

            <label for="background">Color de Fondo:</label>
            <input type="color" id="background" name="background">

            <label for="textColor">Color del Texto:</label>
            <input type="color" id="textColor" name="textColor">

        
            <button type="submit">Guardar</button>
        </form>
    </div>

    <!-- Previsualización -->


    <script src="editor.js"></script>
</body>
</html>
