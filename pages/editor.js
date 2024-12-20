function previewModal() {
    const title = document.getElementById('title').value;
    const content = document.getElementById('content').value;
    const imageInput = document.getElementById('image');
    const background = document.getElementById('background').value;
    const textColor = document.getElementById('textColor').value;

    const modal = document.getElementById('previewModal');
    document.getElementById('previewTitle').innerText = title;
    document.getElementById('previewText').innerText = content;

    // Previsualizar imagen si se seleccionó una
    if (imageInput.files && imageInput.files[0]) {
        const reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('previewImage').src = e.target.result;
        };
        reader.readAsDataURL(imageInput.files[0]);
    }

    // Aplicar los colores al modal de previsualización
    modal.style.backgroundColor = background;
    modal.style.color = textColor;

    // Mostrar el contenedor de previsualización
    document.getElementById('previewContainer').style.display = 'flex';
}

document.getElementById('modalForm').addEventListener('submit', function (e) {
    e.preventDefault();

    const formData = new FormData(this);

    fetch('save_modal.php', {
        method: 'POST',
        body: formData
    }).then(response => response.text())
      .then(data => alert(data))
      .catch(err => console.error(err));
});

// Función para cerrar la previsualización y volver al editor
document.getElementById('closePreviewModal')?.addEventListener('click', function () {
    document.getElementById('previewContainer').style.display = 'none';
});
