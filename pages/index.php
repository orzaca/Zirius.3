<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Principal</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Estilos básicos para el modal */
        .modal {
            display: flex;
            justify-content: center;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }

        .modal-content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
        }

        .modal-content h2 {
            margin-bottom: 10px;
        }

        .modal-content img {
            max-width: 100%;
            height: auto;
            margin: 10px 0;
        }

        .modal-content button {
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-content button:hover {
            background-color: #0056b3;
        }

        /* Estilo del modal */
#previewModal {
    position: relative; /* Necesario para posicionar el botón en la parte inferior */
    width: 50%;
    max-width: 500px;
    background-color: #fff;
    color: #000;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    padding: 20px;
    margin: 50px auto;
}

/* Contenedor del modal de previsualización */
#previewContainer {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: rgba(0, 0, 0, 0.5);
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 9999;
}

#previewModal {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    position: relative;
    width: 80%;
    max-width: 600px;
    text-align: center;
}

/* Estilo para el título y texto dentro del modal */
#previewTitle, #previewText {
    margin-bottom: 20px;
}

#previewImage {
    width: 100%;
    height: auto;
    margin-bottom: 20px;
}

/* Botón de cerrar centrado y hacia abajo */
#closePreviewModal {
    background-color: red;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 30px; /* Esto mueve el botón hacia abajo */
    width: 150px; /* Establece un tamaño fijo para el botón */
    margin-left: auto; /* Centra el botón horizontalmente */
    margin-right: auto; /* Centra el botón horizontalmente */
    display: block; /* Asegura que el botón se comporta como un bloque */
}

/* Efecto de hover para el botón */
#closePreviewModal:hover {
    background-color: darkred;
}

    </style>
</head>
<body>
    <h1>Bienvenido a la Página Principal</h1>
    <p>Este es el contenido principal de la página.</p>

    <?php
    // Mostrar el modal
    include 'show_modal.php';
    ?>

    <script>
        // Cerrar el modal cuando se haga clic en el botón
        document.addEventListener('DOMContentLoaded', () => {
            const closeButton = document.getElementById('closeModal');
            if (closeButton) {
                closeButton.addEventListener('click', () => {
                    const modal = document.querySelector('.modal');
                    modal.style.display = 'none';
                });
            }
        });
    </script>
</body>
</html>
