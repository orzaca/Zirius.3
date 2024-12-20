document.addEventListener('DOMContentLoaded', () => {
    // Obtén todas las opciones del menú lateral
    const menuItems = document.querySelectorAll('.menu a');
    // Obtén todas las pestañas (secciones)
    const tabs = document.querySelectorAll('.tab-content');

    // Recupera la pestaña activa desde localStorage
    const activeTabId = localStorage.getItem('activeTab');
    
    if (activeTabId) {
        const activeTab = document.querySelector(`#${activeTabId}`);
        if (activeTab) {
            activeTab.style.display = 'block';
        }
        const activeMenuItem = document.querySelector(`#load-${activeTabId}`);
        if (activeMenuItem) {
            activeMenuItem.classList.add('active');
        }
    } else {
        // Por defecto, activa la primera pestaña si no hay pestaña guardada en el localStorage
        if (tabs.length > 0) {
            tabs[0].style.display = 'block';
        }
        if (menuItems.length > 0) {
            menuItems[0].classList.add('active');
        }
    }

    // Añadir los event listeners a cada menú
    menuItems.forEach(item => {
        item.addEventListener('click', (e) => {
            e.preventDefault(); // Evita la navegación por defecto

            // Remueve el estilo activo de todas las opciones
            menuItems.forEach(menu => menu.classList.remove('active'));

            // Oculta todas las pestañas
            tabs.forEach(tab => {
                tab.style.display = 'none';
            });

            // Muestra la pestaña correspondiente al ID del elemento clicado
            const targetId = item.getAttribute('id').replace('load-', '');
            const targetTab = document.getElementById(targetId);

            if (targetTab) {
                targetTab.style.display = 'block';
                item.classList.add('active');

                // Guarda la pestaña activa en localStorage
                localStorage.setItem('activeTab', targetId);
            }
        });
    });
});
