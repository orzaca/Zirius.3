document.addEventListener('DOMContentLoaded', function() {
    const userLink = document.getElementById('crear-user');
    const userSection = document.getElementById('user-section');
    const userIframe = document.getElementById('user-iframe');
    const plantillasSection = document.querySelector('.plantillas-section');
    const manualSection = document.querySelector('.manual-section');
    const checklistSection = document.querySelector('.user-section');
    const mensajeSection = document.querySelector('.mensaje-section');


    userLink.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el enlace recargue la página
         plantillasSection.style.display = 'none';
        manualSection.style.display = 'none';
        checklistSection.style.display = 'none';
        mensajeSection.style.display = 'none'
        // Oculta los módulos del dashboard
        userSection.style.display = 'block';
        userIframe.src = '/pages/register.php'; // Carga el archivo en el iframe
    });
});

document.addEventListener('DOMContentLoaded', function() {
    const userLink = document.getElementById('passw-user');
    const userSection = document.getElementById('user-section');
    const userIframe = document.getElementById('user-iframe');
    const plantillasSection = document.querySelector('.plantillas-section');
    const manualSection = document.querySelector('.manual-section');
    const checklistSection = document.querySelector('.user-section');
    const mensajeSection = document.querySelector('.mensaje-section');


    userLink.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el enlace recargue la página
         plantillasSection.style.display = 'none';
         manualSection.style.display = 'none';
        checklistSection.style.display = 'none';
        mensajeSection.style.display = 'none'
        // Oculta los módulos del dashboard
        userSection.style.display = 'block';
        userIframe.src = '/pages/change_password.php'; // Carga el archivo en el iframe
    });
});

document.addEventListener('DOMContentLoaded', function() {
    const userLink = document.getElementById('delete-user');
    const userSection = document.getElementById('user-section');
    const userIframe = document.getElementById('user-iframe');
    const plantillasSection = document.querySelector('.plantillas-section');
    const manualSection = document.querySelector('.manual-section');
    const checklistSection = document.querySelector('.user-section');
    const mensajeSection = document.querySelector('.mensaje-section');

    userLink.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el enlace recargue la página
        plantillasSection.style.display = 'none';
         manualSection.style.display = 'none';
        checklistSection.style.display = 'none';
        mensajeSection.style.display = 'none'
        // Oculta los módulos del dashboard
        userSection.style.display = 'block';
        userIframe.src = '/pages/modify_user.php'; // Carga el archivo en el iframe
    });
});






