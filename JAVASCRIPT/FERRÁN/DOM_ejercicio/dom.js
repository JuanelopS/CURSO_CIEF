const opcionsMenu = document.querySelectorAll('.opcionesMenu');
opcionsMenu.forEach((item, index) => {
    if (index % 2 == 0) {
        item.style.background = "#f2f2f2";
    }
})

const main = document.querySelector('main');
// console.log(main);

main.addEventListener(
    'click',
    ({ target }) => {

        // console.log(target);

        const opcionesMenu = document.querySelectorAll('.opcionesMenu');

        opcionesMenu.forEach( item => {
            item.addEventListener('click', () => {
                if(item.nextElementSibling.classList == 'div-oculto'){
                    item.nextElementSibling.classList.remove('div-oculto');
                } else item.nextElementSibling.classList.add('div-oculto');

            });
        });

        const preguntas = document.querySelectorAll('.preguntas');

        preguntas.forEach( item => {
            item.addEventListener('click', () => {
                // console.log(item.previousElementSibling);
                if(item.previousElementSibling.classList == 'div-oculto'){
                    item.previousElementSibling.classList.remove('div-oculto');
                } else {
                    item.previousElementSibling.classList.add
                    ('div-oculto');
                }
            });
        });

        const pregunta = document.querySelectorAll('.pregunta');

        pregunta.forEach( item => {
            item.addEventListener('click', () => {
                if(item.innerHTML == `Convierte esta página en modo "noche".`)
                {
                    document.body.style.backgroundColor = "black";
                    document.body.style.color = "white";
                    const opcionsMenu = document.querySelectorAll('.opcionesMenu');
                    opcionsMenu.forEach((item) => {
                        item.style.background = "black";
                        item.style.color = "white";
                    });
                }
                if(item.innerHTML == `El fondo debe ser gris oscuro #2a2c2e.`)
                {
                    document.body.style.backgroundColor = "#2a2c2e";
                    document.body.style.color = "white";

                    opcionsMenu.forEach((item) => {
                        item.style.background = "#2a2c2e";
                        item.style.color = "white";

                    });
                }
                if(item.innerHTML == `El texto debe ser gris claro #f2f2f2.`)
                {
                    document.body.style.backgroundColor = "#f2f2f2";
                    document.body.style.color = "black";

                    opcionsMenu.forEach((item) => {
                        item.style.background = "#f2f2f2";
                        item.style.color = "black";
                    });
                }
                if(item.innerHTML == `El texto en cursiva (em) en color rojo.`)
                {
                    const cursiva = document.querySelectorAll('em');
                    cursiva.forEach((item) => {
                        item.style.color = "red";
                    });
                    
                }

            });
        });



        
    }
);

