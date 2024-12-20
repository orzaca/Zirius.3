

        // Abre el modal para editar el párrafo
    function openEditModal(paraId) {
        currentParaId = paraId;
        const textElement = document.getElementById('para' + paraId).getElementsByTagName('p')[0];
            document.getElementById('editText').value = textElement.innerText; // Rellena el textarea
      

            document.getElementById('editModal').style.display = "block"; // Muestra el modal


        }

        // Cierra el modal
        function closeEditModal() {
            document.getElementById('editModal').style.display = "none"; // Oculta el modal
        }

        // Guarda el texto editado
        function saveParagraph() {
            const updatedText = document.getElementById('editText').value;
            const textElement = document.getElementById('para' + currentParaId).getElementsByTagName('p')[0];
            textElement.innerText = updatedText; // Actualiza el párrafo en la interfaz

            // Envía la nueva información al servidor
            fetch('update_pagina1.php', {
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

            closeEditModal(); // Cierra el modal
        }

        
        