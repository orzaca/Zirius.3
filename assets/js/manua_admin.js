document.addEventListener('DOMContentLoaded', function() {
    const manualLink = document.getElementById('cargar-manual');
    const manualSection = document.getElementById('manual-section');
    const manualIframe = document.getElementById('manual-iframe');
    const plantillasSection = document.querySelector('.plantillas-section');
    const checklistSection = document.querySelector('.checklist-section');
    const userSection = document.querySelector('.user-section');
    const mensajeSection = document.querySelector('.mensaje-section');

    manualLink.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el enlace recargue la página
         plantillasSection.style.display = 'none';
        checklistSection.style.display = 'none';
        userSection.style.display = 'none';
        mensajeSection.style.display = 'none'


        // Oculta los módulos del dashboard
        manualSection.style.display = 'block';
        manualIframe.src = '/pages/manuales/upload_manual.html'; // Carga el archivo en el iframe
    });
});


document.addEventListener('DOMContentLoaded', function() {
    const manualLink = document.getElementById('eliminar-manual');
    const manualSection = document.getElementById('manual-section');
    const manualIframe = document.getElementById('manual-iframe');

    manualLink.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el enlace recargue la página
        
        // Oculta los módulos del dashboard
        manualSection.style.display = 'block';
        manualIframe.src = '/pages/manuales/eliminar.php'; // Carga el archivo en el iframe
    });
});
