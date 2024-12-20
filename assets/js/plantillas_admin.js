document.addEventListener('DOMContentLoaded', function() {
    const plantillasLink = document.getElementById('plantillas');
    const plantillasSection = document.getElementById('plantillas-section');
    const plantillasIframe = document.getElementById('plantillas-iframe');
    const manualSection = document.querySelector('.manual-section');
    const checklistSection = document.querySelector('.checklist-section');
    const userSection = document.querySelector('.user-section');
    const mensajeSection = document.querySelector('.mensaje-section');
    
    plantillasLink.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el enlace recargue la página
        
        manualSection.style.display = 'none';
        checklistSection.style.display = 'none';
        userSection.style.display = 'none';
        mensajeSection.style.display = 'none';
        // Oculta los módulos del dashboard
    
        plantillasSection.style.display = 'block';
        plantillasIframe.src = '/pages/tipi/editar_plantillas.html'; // Carga el archivo en el iframe
    });
});
