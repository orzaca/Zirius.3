<?php
session_start();
include(__DIR__ . '/../includes/db.php');

if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'telefonico') {
    header('Location: login.php');
    exit();
}

$receptor = 'admin'; // El receptor en este caso siempre será admin para el telefonico
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil Telefónico</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .chat-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            height: 90% ;
        }

        .messages {
            max-height: 450px;
            overflow-y: scroll;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .message {
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
        }

           .message.admin {
            background-color: #f5b7b1;
            color: black;
            border-radius: 10px;
            padding: 10px;
        }


            .message.telefonico {
            background-color: #f5b7b1;
            color: black;
            border-radius: 10px;
            padding: 10px;
        }

        input[type="text"] {
            width: calc(100% - 90px);
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .send-button {
            padding: 10px;
            color: black;
          
            border: none;
            border-radius: 5px;
            }

  
    </style>
</head>
<body>
    <div class="chat-container">
        <h5>Mensaje de Supervisor</h5>
        <div class="messages" id="messages">
            <!-- Los mensajes se cargarán aquí -->
        </div>
             <!-- <input type="text" id="mensaje" placeholder="Escribe un mensaje...">-->
        <button class="send-button" id="sendMessage">Recuerda estar siempre atenta a los mensajes que llegan por parte de Operación.</button>
    </div>

    <script>

    let originalTitle = document.title; // Guardar el título original
    let notificationInterval; // Intervalo para alternar el título
    let isTabActive = true; // Indica si el usuario está en la pestaña activa

    // Detectar si el usuario está en la pestaña activa o no
    window.onfocus = () => {
        isTabActive = true;
        clearInterval(notificationInterval); // Detener el titileo si regresa
        document.title = originalTitle; // Restaurar el título original
    };

    window.onblur = () => {
        isTabActive = false;
    };

    // Función para hacer titilar la pestaña
    function startNotification() {
        if (!isTabActive && !notificationInterval) {
            notificationInterval = setInterval(() => {
                document.title = document.title === "¡Nuevo mensaje!" ? originalTitle : "¡Nuevo mensaje!";
            }, 1000); // Alternar el título cada segundo
        }
    }

    // Función para cargar mensajes
    function loadMessages() {
        const messagesDiv = document.getElementById('messages');
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'get_messages.php', true);
        xhr.onload = function () {
            if (xhr.status === 200) {
                const newContent = xhr.responseText;

                // Comprobar si hay mensajes nuevos
                if (messagesDiv.innerHTML !== newContent) {
                    messagesDiv.innerHTML = newContent;
                    messagesDiv.scrollTop = messagesDiv.scrollHeight; // Desplazar hacia abajo

                    // Activar la notificación solo si la pestaña no está activa
                    if (!isTabActive) {
                        startNotification();
                    }
                }
            }
        };
        xhr.send();
    }

    // Enviar un mensaje
    document.getElementById('sendMessage').addEventListener('click', function () {
        const mensaje = document.getElementById('mensaje').value.trim();
        if (mensaje === '') {
            alert('Por favor, escribe un mensaje antes de enviarlo.');
            return;
        }

        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'send_message.php', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            if (xhr.status === 200) {
                document.getElementById('mensaje').value = ''; // Limpiar el input
                loadMessages(); // Recargar los mensajes
            } else {
                alert('Hubo un error al enviar el mensaje.');
            }
        };
        xhr.send('mensaje=' + encodeURIComponent(mensaje) + '&receptor=<?php echo $receptor; ?>');
    });

    // Cargar mensajes cada 2 segundos
    setInterval(loadMessages, 2000);
    loadMessages();



        // Enviar un mensaje
        document.getElementById('sendMessage').addEventListener('click', function() {
            const mensaje = document.getElementById('mensaje').value;
            if (mensaje) {
                const xhr = new XMLHttpRequest();
                xhr.open('POST', 'send_message.php', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onload = function() {
                    if (xhr.status === 200) {
                        document.getElementById('mensaje').value = ''; // Limpiar el input
                        loadMessages(); // Recargar los mensajes
                    }
                };
                xhr.send('mensaje=' + encodeURIComponent(mensaje) + '&receptor=<?php echo $receptor; ?>');
            }
        });

        // Cargar mensajes cada 2 segundos
        setInterval(loadMessages, 2000);
        loadMessages(); // Cargar mensajes al inicio

        document.getElementById('sendMessage').addEventListener('click', function() {
    const mensaje = document.getElementById('mensaje').value;
    if (mensaje.trim() === '') {
        alert('Por favor, escribe un mensaje antes de enviarlo.');
    } else {
        // Continuar con el envío del mensaje
    }
});
    </script>
</body>
</html>
