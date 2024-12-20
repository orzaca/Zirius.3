function loadContent(url) {
            var tabs = document.querySelectorAll('.tab');
            tabs.forEach(function(tab) {
                tab.classList.remove('active');
            });

            var activeTab = document.querySelector('.tab[onclick="loadContent(\'' + url + '\')"]');
            if (activeTab) {
                activeTab.classList.add('active');
            }

            var xhr = new XMLHttpRequest();
            xhr.open('GET', url, true);
            xhr.onload = function() {
                if (xhr.status >= 200 && xhr.status < 400) {
                    document.getElementById('dynamic-content').innerHTML = xhr.responseText;
                } else {
                    document.getElementById('dynamic-content').innerHTML = '';
                }
            };
            xhr.onerror = function() {
                document.getElementById('dynamic-content').innerHTML = 'Error de red.';
            };
            xhr.send();
        }

        document.addEventListener('DOMContentLoaded', function() {
            // Mostrar mensaje inicial
            document.getElementById('dynamic-content').innerHTML = '<p>Selecciona una pestaña para Ver tus Scripts.</p>';
        });