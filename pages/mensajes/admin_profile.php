<?php
session_start();
include(__DIR__ . '/../includes/db.php');

if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'admin') {
    header('Location: login.php');
    exit();
}

$receptor = 'telefonico'; 
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil Admin</title>
    <style>
        /* Estilos del chat */
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
            max-width: 600px;
        }

        .messages {
            max-height: 400px;
            overflow-y: scroll;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .message {
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
        }

        .message.admin {
            background-color: #f1948a;
            color: black;
            border-radius: 10px;
            padding: 10px;
        }

        .message.telefonico {
            background-color: #f1948a;
            color: black;
            border-radius: 10px;
            padding: 10px;
        }

        .delete-button {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 5px;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="text"] {
            width: calc(100% - 90px);
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .send-button {
            padding: 10px;
            background-color: #cb4335;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .send-button:hover {
            background-color: #f1948a;
        }
    </style>
</head>
<body>
    <div class="chat-container">
        <h1>Hola Admin, bienvenido al chat</h1>
        <div class="messages" id="messages">
            <!-- Los mensajes se cargarán aquí -->
        </div>
        <input type="text" id="mensaje" placeholder="Escribe un mensaje...">
        
        <button class="send-button" id="sendMessage">Enviar</button>
    </div>

    <script>
        // Función para cargar mensajes
        function loadMessages() {
            const messagesDiv = document.getElementById('messages');
            const xhr = new XMLHttpRequest();
            xhr.open('GET', 'get_messages.php', true);
            xhr.onload = function() {
                if (xhr.status === 200) {
                    messagesDiv.innerHTML = xhr.responseText;
                    messagesDiv.scrollTop = messagesDiv.scrollHeight; // Desplazar hacia abajo
                    addDeleteListeners(); // Agregar evento de eliminación después de cargar los mensajes
                }
            };
            xhr.send();
        }

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

        // Función para eliminar mensajes
        function addDeleteListeners() {
            const deleteButtons = document.querySelectorAll('.delete-button');
            deleteButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const messageId = this.getAttribute('data-id');
                    
                    const xhr = new XMLHttpRequest();
                    xhr.open('POST', 'delete_message.php', true);
                    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    xhr.onload = function() {
                        if (xhr.status === 200) {
                            // Eliminar el mensaje del DOM de manera instantánea
                            const messageDiv = document.querySelector(`.message[data-id='${messageId}']`);
                            messageDiv.remove();
                            alert("Mensaje eliminado.");
                        }
                    };
                    xhr.send('id=' + messageId);
                });
            });
        }

        // Cargar mensajes cada 2 segundos
        setInterval(loadMessages, 2000);
        loadMessages(); // Cargar mensajes al inicio

        document.getElementById('emojiBtn').addEventListener('click', function() {
            document.getElementById('mensaje').value += '😊'; // Agregar un emoji al input
        });
    </script>
</body>
</html>
