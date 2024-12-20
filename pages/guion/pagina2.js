


        // Abre el modal para editar el párrafo
    function openEditModal2(paraId) {
        currentParaId = paraId;
            const textElement = document.getElementById('para2' + paraId).getElementsByTagName('p')[0]; // Cambiado a para2
            document.getElementById('editText2').value = textElement.innerText; // Rellena el textarea
            document.getElementById('editModal2').style.display = "block"; // Muestra el modal
        }

        // Cierra el modal
        function closeEditModal2() {
            document.getElementById('editModal2').style.display = "none"; // Oculta el modal
        }

        // Guarda el texto editado
        function saveParagraph2() {
            const updatedText = document.getElementById('editText2').value; // Cambiado a editText2
            const textElement = document.getElementById('para2' + currentParaId).getElementsByTagName('p')[0]; // Cambiado a para2
            textElement.innerText = updatedText; // Actualiza el párrafo en la interfaz

            // Envía la nueva información al servidor
            fetch('update_pagina2.php', { // Cambiado a update_pagina2.php
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

            closeEditModal2(); // Cierra el modal
        }
