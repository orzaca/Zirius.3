document.addEventListener("DOMContentLoaded", () => {
    const copyButton = document.getElementById("copy-button");
    const clearStorageButton = document.getElementById("clear-storage-button");

    // Copiar contenido del formulario al portapapeles
    copyButton.addEventListener("click", () => {
        const formElements = document.querySelectorAll("#tipification-form input, #tipification-form textarea");
        let clipboardText = "";

        // Recopilar valores del formulario
        formElements.forEach(el => {
            clipboardText += `${el.placeholder}: ${el.value}\n`;
        });

        // Verificar compatibilidad con el portapapeles
        if (navigator.clipboard) {
            navigator.clipboard.writeText(clipboardText)
                .then(() => {
                    alert("Contenido copiado al portapapeles.");
                })
                .catch(err => {
                    console.error("Error al copiar:", err);
                    alert("No se pudo copiar el contenido.");
                });
        } else {
            // Alternativa para navegadores más antiguos
            const textarea = document.createElement("textarea");
            textarea.value = clipboardText;
            document.body.appendChild(textarea);
            textarea.select();
            try {
                document.execCommand("copy");
                alert("Contenido copiado al portapapeles.");
            } catch (err) {
                console.error("Error al copiar:", err);
                alert("No se pudo copiar el contenido.");
            }
            document.body.removeChild(textarea);
        }
    });

    // Limpiar campos del formulario
    clearStorageButton.addEventListener("click", () => {
        const formElements = document.querySelectorAll("#tipification-form input, #tipification-form textarea");
        formElements.forEach(el => el.value = "");
    });
});

        // Función para cambiar entre pestañas
        function switchTab(event, tabId) {
            // Desactivar todas las pestañas y su contenido
            document.querySelectorAll('.tab-button').forEach(button => button.classList.remove('active'));
            document.querySelectorAll('.tab-content').forEach(content => content.classList.remove('active'));

            // Activar la pestaña seleccionada
            event.target.classList.add('active');
            document.getElementById(tabId).classList.add('active');
        }

document.querySelectorAll('.tab').forEach(tab => {
    tab.addEventListener('click', function () {
        // Desactivar todas las pestañas
        document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
        document.querySelectorAll('.tab-content').forEach(content => content.classList.remove('active'));

        // Activar la pestaña actual
        const tabId = this.getAttribute('data-tab');
        this.classList.add('active');
        document.getElementById(tabId).classList.add('active');
    });
});
