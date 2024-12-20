// Verifica si el recordatorio ha sido leído
function checkReminderStatus() {
    const reminderStatus = localStorage.getItem('reminderRead');
    if (reminderStatus === 'true') {
        // Si ya fue leído, oculta el recordatorio
        const reminder = document.getElementById('floatingReminder');
        if (reminder) {
            reminder.style.display = 'none';
        }
    }
}

// Marca el recordatorio como leído y ocúltalo
function markAsRead() {
    localStorage.setItem('reminderRead', 'true'); // Guarda el estado
    closeReminder(); // Llama a la función para cerrar el recordatorio
}

// Cierra el recordatorio
function closeReminder() {
    const reminder = document.getElementById('floatingReminder');
    if (reminder) {
        reminder.style.display = 'none'; // Oculta el recordatorio
    }
}

// Llama a la función al cargar la página
window.onload = checkReminderStatus;
