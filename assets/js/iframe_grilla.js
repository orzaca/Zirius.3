document.addEventListener('DOMContentLoaded', function() {
    const grillaLink = document.getElementById('load-grilla');
    const grillaSection = document.getElementById('grilla-section');
    const grillaIframe = document.getElementById('grilla-iframe');
    const module1 = document.querySelector('.module-1');
    const module2 = document.querySelector('.module-2');
    const module3 = document.querySelector('.module-3');
    const noticias = document.querySelector('.noticias');
    const quejasSection = document.querySelector('.quejas-section');
    const checklistSection = document.querySelector('.checklist-section');
    const guionSection = document.querySelector('.guion-section');
    const wfSection = document.querySelector('.wf-section');
    const manualSection = document.querySelector('.manual-section');
    const zonaSection = document.querySelector('.zona-section');




    grillaLink.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el enlace recargue la página
        
        // Oculta los módulos del dashboard
        module1.style.display = 'none';
        module2.style.display = 'none';
        module3.style.display = 'none';
        noticias.style.display = 'none';
        quejasSection.style.display = 'none';
        checklistSection.style.display = 'none';
        guionSection.style.display = 'none';
        wfSection.style.display = 'none';
        manualSection.style.display = 'none';
        zonaSection.style.display = 'none';

        
        
        // Muestra la sección de quejas y carga el iframe
        grillaSection.style.display = 'block';
        grillaIframe.src = '/pages/grillas/grillas.html'; // Carga el archivo en el iframe
    });
});
