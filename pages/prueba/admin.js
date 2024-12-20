// admin.js
document.getElementById('messageForm').addEventListener('submit', function (e) {
    e.preventDefault();
    const formData = new FormData(this);

    fetch('admin.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        console.log(data);
        document.querySelector('textarea[name="mensaje"]').value = ''; // Limpiar textarea
    })
    .catch(error => console.error('Error:', error));
});
