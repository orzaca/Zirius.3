
    currentParaId = null;

        // Función para copiar texto al portapapeles
function copyText(paraId) {
    const paragraph = document.getElementById(paraId)?.getElementsByTagName('p')[0];

    if (paragraph) {
        const textContent = paragraph.innerText;

        navigator.clipboard.writeText(textContent)
            .then(() => {
                showMessage("Script Copiado");
            })
            .catch(err => {
                console.error('Error al copiar el texto: ', err);
                showMessage("Error al copiar el texto. Inténtalo de nuevo.");
            });
    } else {
        console.error('Párrafo no encontrado.');
        showMessage("Párrafo no encontrado.");
    }
}

function showMessage(message) {
    const messageBox = document.createElement('div');
    messageBox.innerText = message;
    messageBox.style.position = 'fixed';
    messageBox.style.top= '60px';
    messageBox.style.left = '500px';
    messageBox.style.backgroundColor = '#f1948a';
    messageBox.style.color = 'white';
    messageBox.style.padding = '10px';
    messageBox.style.borderRadius = '5px';
    messageBox.style.boxShadow = '0 2px 10px rgba(0, 0, 0, 0.3)';
    messageBox.style.zIndex = '1000';
    
    document.body.appendChild(messageBox);
    
    setTimeout(() => {
        messageBox.remove();
    }, 3000); // El mensaje desaparece después de 3 segundos
}