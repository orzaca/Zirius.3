document.addEventListener('DOMContentLoaded', function() {
    const checklistLink = document.getElementById('load-checklist');
    const checklistSection = document.getElementById('checklist-section');
    const checklistIframe = document.getElementById('checklist-iframe');
    const module1 = document.querySelector('.module-1');
    const module2 = document.querySelector('.module-2');
    const module3 = document.querySelector('.module-3');
    const noticias = document.querySelector('.noticias');
    const wfSection = document.querySelector('.wf-section');
    const quejasSection = document.querySelector('.quejas-section');
    const guionSection = document.querySelector('.guion-section');
    const manualSection = document.querySelector('.manual-section');
    const zonaSection = document.querySelector('.zona-section');
    const grillaSection = document.querySelector('.grilla-section');

    checklistLink.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el enlace recargue la página
        
        // Oculta los módulos del dashboard
        module1.style.display = 'none';
        module2.style.display = 'none';
        module3.style.display = 'none';
        noticias.style.display = 'none';
        wfSection.style.display = 'none';
        quejasSection.style.display = 'none';
        guionSection.style.display = 'none';
        manualSection.style.display = 'none';
        zonaSection.style.display = 'none';
        grillaSection.style.display = 'none';
        
        // Muestra la sección del checklist y carga el iframe
        checklistSection.style.display = 'block';
        checklistIframe.src = 'http://zirius.000.pe/pages/checklist/inicio_checklist.html?i=1'; // Carga el archivo en el iframe
    });
});
