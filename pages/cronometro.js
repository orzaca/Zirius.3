document.addEventListener('DOMContentLoaded', () => {
  const totalDuration = 59 * 60; // 59 minutos en segundos
  let remainingTime = totalDuration;
  const timerText = document.getElementById('timer-text');
  const progressRing = document.querySelector('.progress-ring');
  const circumference = 2 * Math.PI * 45; // Circunferencia del círculo
  
  progressRing.style.strokeDasharray = circumference;

  const updateTimer = () => {
    const minutes = Math.floor(remainingTime / 60);
    const seconds = remainingTime % 60;
    timerText.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;

    const progress = remainingTime / totalDuration;
    progressRing.style.strokeDashoffset = circumference * (1 - progress);

    if (remainingTime > 0) {
      remainingTime--;
    } else {
      clearInterval(timerInterval);
    }
  };

  updateTimer();
  const timerInterval = setInterval(updateTimer, 1000);
});
