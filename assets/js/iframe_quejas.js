document.addEventListener('DOMContentLoaded', function() {
    const quejasLink = document.getElementById('load-quejas');
    const quejasSection = document.getElementById('quejas-section');
    const quejasIframe = document.getElementById('quejas-iframe');
    const module1 = document.querySelector('.module-1');
    const module2 = document.querySelector('.module-2');
    const module3 = document.querySelector('.module-3');
    const noticias = document.querySelector('.noticias');
    const wfSection = document.querySelector('.wf-section');
    const checklistSection = document.querySelector('.checklist-section');
    const guionSection = document.querySelector('.guion-section');
    const manualSection = document.querySelector('.manual-section');
    const zonaSection = document.querySelector('.zona-section');
    const grillaSection = document.querySelector('.grilla-section');
   

    quejasLink.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el enlace recargue la página
        
        // Oculta los módulos del dashboard
        module1.style.display = 'none';
        module2.style.display = 'none';
        module3.style.display = 'none';
        noticias.style.display = 'none';
        wfSection.style.display = 'none';
        checklistSection.style.display = 'none';
        guionSection.style.display = 'none';
        manualSection.style.display = 'none';
        zonaSection.style.display = 'none';
        grillaSection.style.display = 'none';
      
        

        // Muestra la sección de quejas y carga el iframe
        quejasSection.style.display = 'block';
        quejasIframe.src = '/pages/quejas/memo_dsl_internet.html'; // Carga el archivo en el iframe
    });
});
