document.addEventListener('DOMContentLoaded', function() {
    const tipiLink = document.getElementById('load-tipi');
    const tipiSection = document.getElementById('tipi-section');
    const tipiIframe = document.getElementById('tipi-iframe');
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
    const checklistSection = document.querySelector('.checklist-section');


    tipiLink.addEventListener('click', function(event) {
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
        checklistSection.style.display = 'none';
        
        // Muestra la sección del checklist y carga el iframe
        tipiSection.style.display = 'block';
        tipiIframe.src = '/tipi/index.html'; // Carga el archivo en el iframe
    });
});
