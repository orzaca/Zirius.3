function checkMensajes() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'obtener_mensajes.php', true);
    xhr.onload = function() {
        if (xhr.status === 200) {
            var mensajes = JSON.parse(xhr.responseText);
            if (mensajes.length > 0) {
                // Mostrar el modal con el mensaje
                mostrarModal(mensajes[0].mensaje);
            }
        }
    };
    xhr.send();
}

// Verificar cada 5 segundos
setInterval(checkMensajes, 5000);

// Mostrar el modal con el mensaje recibido
function mostrarModal(mensaje) {
    var modal = document.getElementById('modalMensaje');
    modal.querySelector('.modal-body').textContent = mensaje;
    modal.style.display = 'block';
}

// Función para cerrar el modal
function cerrarModal() {
    document.getElementById('modalMensaje').style.display = 'none';
}
