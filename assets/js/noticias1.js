
// Variable para almacenar la fecha de la última noticia mostrada
let lastNewsDate = null;

function fetchLatestNews() {
    fetch('get_latest_news.php')
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                const newsDate = new Date(data.data.created_at);
                
                // Verifica si la noticia es nueva
                if (!lastNewsDate || newsDate > lastNewsDate) {
                    lastNewsDate = newsDate;
                    showNewsModal(data.data.title, data.data.content);
                }
            }
        })
        .catch(error => console.error('Error fetching news:', error));
}

// Función para mostrar el modal con la noticia
function showNewsModal(title, content) {
    const modal = document.createElement('div');
    modal.classList.add('news-modal');
    
    modal.innerHTML = `
        <div class="modal-content">
            <h2>${title}</h2>
            <p>${content}</p>
            <button onclick="closeModal()">Cerrar</button>
        </div>
    `;
    
    document.body.appendChild(modal);
}

// Función para cerrar el modal
function closeModal() {
    const modal = document.querySelector('.news-modal');
    if (modal) {
        modal.remove();
    }
}

// Llama a fetchLatestNews cada 30 segundos
setInterval(fetchLatestNews, 3000);

