// redes.js
function fetchMessages() {
    fetch('fetch_messages.php') // PHP script para obtener mensajes
        .then(response => response.json())
        .then(messages => {
            const messagesContainer = document.getElementById('messages');
            messagesContainer.innerHTML = ''; // Limpiar contenedor

            messages.forEach(message => {
                const div = document.createElement('div');
                div.textContent = `${message.mensaje} (Enviado: ${message.timestamp})`;
                messagesContainer.prepend(div); // Añadir nuevo mensaje al principio
            });
        })
        .catch(error => console.error('Error:', error));
}

// Llamar a la función cada 3 segundos para actualizar mensajes
setInterval(fetchMessages, 3000);
