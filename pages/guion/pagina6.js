

        // Abre el modal para editar el párrafo
        function openEditModal6(paraId) {
            currentParaId = paraId;
            const textElement = document.getElementById('para6' + paraId).getElementsByTagName('p')[0]; // Cambiado a para2
            document.getElementById('editText6').value = textElement.innerText; // Rellena el textarea
            document.getElementById('editModal6').style.display = "block"; // Muestra el modal
        }

        // Cierra el modal
        function closeEditModal6() {
            document.getElementById('editModal6').style.display = "none"; // Oculta el modal
        }

        // Guarda el texto editado
        function saveParagraph6() {
            const updatedText = document.getElementById('editText6').value; // Cambiado a editText2
            const textElement = document.getElementById('para6' + currentParaId).getElementsByTagName('p')[0]; // Cambiado a para2
            textElement.innerText = updatedText; // Actualiza el párrafo en la interfaz

            // Envía la nueva información al servidor
            fetch('update_pagina6.php', { // Cambiado a update_pagina2.php
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

            closeEditModal6(); // Cierra el modal
        }
