document.addEventListener('DOMContentLoaded', function() {
    const guionLink = document.getElementById('load-guion');
    const guionSection = document.getElementById('guion-section');
    const guionIframe = document.getElementById('guion-iframe');
    const module1 = document.querySelector('.module-1');
    const module2 = document.querySelector('.module-2');
    const module3 = document.querySelector('.module-3');
    const noticias = document.querySelector('.noticias');
    const quejasSection = document.querySelector('.quejas-section');
    const checklistSection = document.querySelector('.checklist-section');
    const wfSection = document.querySelector('.wf-section');
    const manualSection = document.querySelector('.manual-section');
    const zonaSection = document.querySelector('.zona-section');
    const grillaSection = document.querySelector('.grilla-section');




    guionLink.addEventListener('click', function(event) {
        event.preventDefault(); // Evita que el enlace recargue la página
        
        // Oculta los módulos del dashboard
        module1.style.display = 'none';
        module2.style.display = 'none';
        module3.style.display = 'none';
        noticias.style.display = 'none';
        quejasSection.style.display = 'none';
        checklistSection.style.display = 'none';
        wfSection.style.display = 'none';
        manualSection.style.display = 'none';
        zonaSection.style.display = 'none';
        grillaSection.style.display = 'none';
      
        
        
        // Muestra la sección de quejas y carga el iframe
        guionSection.style.display = 'block';
        guionIframe.src = '/pages/guion/principal.php'; // Carga el archivo en el iframe
    });
});
