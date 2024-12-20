let timerInterval;
let seconds = 59;
let minutes = 0;

document.getElementById('show-timer-btn').addEventListener('click', function() {
    const timerElement = document.getElementById('floating-timer');
    timerElement.style.display = timerElement.style.display === 'none' ? 'block' : 'none';
});

document.getElementById('start-btn').addEventListener('click', function() {
    clearInterval(timerInterval);
    timerInterval = setInterval(function() {
        if (seconds <= 0 && minutes <= 0) {
            clearInterval(timerInterval);
            playSound(); // Llama a la función para reproducir el sonido
            return;
        }

        // Flash effect cuando queden 6 segundos
        if (minutes === 0 && seconds <= 6 && seconds > 0) {
            flashTimer();
        }

        if (seconds === 0) {
            minutes--;
            seconds = 59;
        } else {
            seconds--;
        }

        document.getElementById('minutes').textContent = String(minutes).padStart(2, '0');
        document.getElementById('seconds').textContent = String(seconds).padStart(2, '0');
    }, 1000);
});

document.getElementById('stop-btn').addEventListener('click', function() {
    clearInterval(timerInterval);
});

document.getElementById('reset-btn').addEventListener('click', function() {
    clearInterval(timerInterval);
    minutes = 0;
    seconds = 59;
    document.getElementById('minutes').textContent = String(minutes).padStart(2, '0');
    document.getElementById('seconds').textContent = String(seconds).padStart(2, '0');
});

// Función para el efecto de titilación
function flashTimer() {
    const timerDisplay = document.getElementById('timer');
    timerDisplay.classList.add('flash'); // Agrega la clase flash

    // Eliminar la clase flash después de que el cronómetro llegue a 0
    setTimeout(function() {
        if (minutes === 0 && seconds === 0) {
            timerDisplay.classList.remove('flash');
        }
    }, 1000);
}

// Función para reproducir el sonido
function playSound() {
    const sound = document.getElementById('timer-sound');
    sound.currentTime = 0; // Reinicia el sonido para que se reproduzca desde el inicio
    sound.play();
}
