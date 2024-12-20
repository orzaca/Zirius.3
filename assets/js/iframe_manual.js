document.addEventListener('DOMContentLoaded', function() {
    const manualLink = document.getElementById('load-manual');
    const manualSection = document.getElementById('manual-section');
    const manualIframe = document.getElementById('manual-iframe');
    const module1 = document.querySelector('.module-1');
    const module2 = document.querySelector('.module-2');
    const module3 = document.querySelector('.module-3');
    const noticias = document.querySelector('.noticias');
    const quejasSection = document.querySelector('.quejas-section');
    const checklistSection = document.querySelector('.checklist-section');
    const guionSection = document.querySelector('.guion-section');
    const wfSection = document.querySelector('.wf-section');
    const zonaSection = document.querySelector('.zona-section');
    const grillaSection = document.querySelector('.grilla-section');


    manualLink.addEventListener('click', function(event) {
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
        zonaSection.style.display = 'none';
        grillaSection.style.display = 'none';

        
        // Muestra la sección de quejas y carga el iframe
        manualSection.style.display = 'block';
        manualIframe.src = '/pages/manuales/manuales.php'; // Carga el archivo en el iframe
    });
});
