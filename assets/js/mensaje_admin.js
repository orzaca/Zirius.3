document.addEventListener('DOMContentLoaded', function() {
    const mensajeLink = document.getElementById('mensaje');
    const mensajeSection = document.getElementById('mensaje-section');
    const mensajeIframe = document.getElementById('mensaje-iframe');
    const plantillasSection = document.querySelector('.plantillas-section');
    const checklistSection = document.querySelector('.checklist-section');
    const userSection = document.querySelector('.user-section');
    const manualSection = document.querySelector('.manual-section');
    
    mensajeLink.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el enlace recargue la página
        plantillasSection.style.display = 'none';
        manualSection.style.display = 'none';
        checklistSection.style.display = 'none';
        userSection.style.display = 'none'
        // Oculta los módulos del dashboard
        mensajeSection.style.display = 'block';
        mensajeIframe.src = '/pages/mensajes/admin_profile.php'; // Carga el archivo en el iframe
    });
});

document.addEventListener('DOMContentLoaded', function() {
    const mensajeLink = document.getElementById('modal');
    const mensajeSection = document.getElementById('mensaje-section');
    const mensajeIframe = document.getElementById('mensaje-iframe');
    const plantillasSection = document.querySelector('.plantillas-section');
    const checklistSection = document.querySelector('.checklist-section');
    const userSection = document.querySelector('.user-section');
    const manualSection = document.querySelector('.manual-section');
    
    mensajeLink.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el enlace recargue la página
        
        plantillasSection.style.display = 'none';
        manualSection.style.display = 'none';
        checklistSection.style.display = 'none';
        userSection.style.display = 'none'
        // Oculta los módulos del dashboard
        
        mensajeSection.style.display = 'block';
        mensajeIframe.src = '/pages/editor_modal.php'; // Carga el archivo en el iframe
    });
});
