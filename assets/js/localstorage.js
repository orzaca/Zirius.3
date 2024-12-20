document.querySelectorAll('.menu a').forEach(item => {
    item.addEventListener('click', function(event) {
        event.preventDefault();
        
        // Ocultar todas las secciones de iframes
        document.querySelectorAll('section[id$="-section"]').forEach(section => {
            section.style.display = 'none';
        });
        
        // Mostrar el iframe correspondiente
        const sectionId = this.id.replace('load-', '') + '-section';
        const iframe = document.getElementById(sectionId).querySelector('iframe');
        
        // Cambiar la visibilidad del iframe seleccionado
        document.getElementById(sectionId).style.display = 'block';
        
        // Si el iframe no tiene src, asignamos el valor
        if (!iframe.src) {
            const url = this.title + '.html';  // Asumiendo que la URL del iframe corresponde al "title" del enlace
            iframe.src = url;
        }
    });
});


// Guardar datos cuando el formulario cambia
document.getElementById('formulario').addEventListener('input', function() {
    localStorage.setItem('formData', JSON.stringify(getFormData()));
});

// Cargar datos cuando el iframe se vuelve a mostrar
if (localStorage.getItem('formData')) {
    setFormData(JSON.parse(localStorage.getItem('formData')));
}

function getFormData() {
    return {
        field1: document.getElementById('field1').value,
        field2: document.getElementById('field2').value
    };
}

function setFormData(data) {
    document.getElementById('field1').value = data.field1;
    document.getElementById('field2').value = data.field2;
}
