document.addEventListener("DOMContentLoaded", function() {
    loadNews();
    requestNotificationPermission();

    // Verificar cada 30 segundos si hay noticias nuevas
    setInterval(checkForNews, 30000);
});

function loadNews() {
    // Código para cargar noticias
}

function requestNotificationPermission() {
    // Código para solicitar permiso para notificaciones
}

function showNotification(title, body) {
    // Código para mostrar notificaciones
}

let lastNewsId = 0; // Almacena el ID de la última noticia

function checkForNews() {
    fetch('/check_news.php')
        .then(response => response.json())
        .then(data => {
            if (data && data.id > lastNewsId) {
                // Si hay una nueva noticia, mostrarla en el formato de chat
                displayChatMessage(data);
                lastNewsId = data.id; // Actualiza el ID de la última noticia
            }
        })
        .catch(error => console.error('Error al verificar noticias:', error));
}

// Función para mostrar el mensaje como un chat
function displayChatMessage(news) {
    const chatContainer = document.querySelector(".chat-container"); // Asegúrate de que este elemento exista en tu HTML

    const chatMessage = document.createElement("div");
    chatMessage.classList.add("chat-message"); // Clase CSS para estilo del mensaje

    const title = document.createElement("strong");
    title.textContent = news.title;
    chatMessage.appendChild(title);

    const content = document.createElement("p");
    content.textContent = news.content;
    chatMessage.appendChild(content);

    const date = document.createElement("span");
    date.textContent = new Date(news.created_at).toLocaleDateString();
    chatMessage.appendChild(date);

    chatContainer.appendChild(chatMessage);
    chatContainer.scrollTop = chatContainer.scrollHeight; // Desplaza hacia abajo para mostrar el nuevo mensaje
}
