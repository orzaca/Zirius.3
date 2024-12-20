document.getElementById('formEnvioMensaje').addEventListener('submit', function(e) {
    e.preventDefault(); // Prevenir el comportamiento por defecto del formulario

    var mensaje = document.getElementById('mensaje').value;

    // Usamos AJAX para enviar el mensaje al servidor
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'enviar_mensaje.php', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onload = function() {
        if (xhr.status === 200) {
            // Mensaje enviado con éxito
            alert('Mensaje enviado al usuario');
        }
    };
    xhr.send('mensaje=' + encodeURIComponent(mensaje));
});


