document.addEventListener('DOMContentLoaded', function() {
    const checklistLink = document.getElementById('crear-checklist');
    const checklistSection = document.getElementById('checklist-section');
    const checklistIframe = document.getElementById('checklist-iframe');
    const plantillasSection = document.querySelector('.plantillas-section');
    const manualSection = document.querySelector('.manual-section');
    const userSection = document.querySelector('.user-section');
    const mensajeSection = document.querySelector('.mensaje-section');


    checklistLink.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el enlace recargue la página
        plantillasSection.style.display = 'none';
        manualSection.style.display = 'none';
        userSection.style.display = 'none';
        mensajeSection.style.display = 'none'


        plantillasSection.style.display = 'none';
        checklistSection.style.display = 'block';
        
        checklistIframe.src = '/pages/checklist/crear_checklist.html'; // Carga el archivo en el iframe
    });
});


document.addEventListener('DOMContentLoaded', function() {
    const checklistLink = document.getElementById('modificar-checklist');
    const checklistSection = document.getElementById('checklist-section');
    const checklistIframe = document.getElementById('checklist-iframe');
    const plantillasSection = document.querySelector('.plantillas-section');
    const manualSection = document.querySelector('.manual-section');
    const userSection = document.querySelector('.user-section');
    const mensajeSection = document.querySelector('.mensaje-section');

    checklistLink.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el enlace recargue la página
           plantillasSection.style.display = 'none'
        manualSection.style.display = 'none';
        userSection.style.display = 'none';
        mensajeSection.style.display = 'none'

        // Oculta los módulos del dashboard
        checklistSection.style.display = 'block';
        checklistIframe.src = '/pages/checklist/editar_checklist.html'; // Carga el archivo en el iframe
    });
});


document.addEventListener('DOMContentLoaded', function() {
    const checklistLink = document.getElementById('ver-checklist');
    const checklistSection = document.getElementById('checklist-section');
    const checklistIframe = document.getElementById('checklist-iframe');
    const plantillasSection = document.querySelector('.plantillas-section');
      const manualSection = document.querySelector('.manual-section');
    const userSection = document.querySelector('.user-section');
    const mensajeSection = document.querySelector('.mensaje-section');

    checklistLink.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el enlace recargue la página
        plantillasSection.style.display = 'none'
        manualSection.style.display = 'none';
        userSection.style.display = 'none';
        mensajeSection.style.display = 'none'
        // Oculta los módulos del dashboard
        checklistSection.style.display = 'block';
        checklistIframe.src = '/pages/checklist/checklist.html'; // Carga el archivo en el iframe
    });
});

