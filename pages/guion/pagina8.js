

        // Abre el modal para editar el párrafo
        function openEditModal8(paraId) {
            currentParaId = paraId;
            const textElement = document.getElementById('para8' + paraId).getElementsByTagName('p')[0]; // Cambiado a para2
            document.getElementById('editText8').value = textElement.innerText; // Rellena el textarea
            document.getElementById('editModal8').style.display = "block"; // Muestra el modal
        }

        // Cierra el modal
        function closeEditModal8() {
            document.getElementById('editModal8').style.display = "none"; // Oculta el modal
        }

        // Guarda el texto editado
        function saveParagraph8() {
            const updatedText = document.getElementById('editText8').value; // Cambiado a editText2
            const textElement = document.getElementById('para8' + currentParaId).getElementsByTagName('p')[0]; // Cambiado a para2
            textElement.innerText = updatedText; // Actualiza el párrafo en la interfaz

            // Envía la nueva información al servidor
            fetch('update_pagina8.php', { // Cambiado a update_pagina2.php
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'id=' + currentParaId + '&content=' + encodeURIComponent(updatedText)
            })
            .then(response => response.text())
            .then(data => {
                console.log(data); // Para depuración
            })
            .catch(error => console.error('Error:', error));

            closeEditModal8(); // Cierra el modal
        }

        // Función para confirmar la eliminación del párrafo
        function confirmRemoval(paraId) {
            if (confirm("¿Estás seguro de que deseas eliminar este párrafo?")) {
                deleteParagraph(paraId);
            }
        }

        