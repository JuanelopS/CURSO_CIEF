window.onload = inicio;


function inicio(){

    let caja = document.querySelector('#caja');

    caja.insertAdjacentHTML('beforeend',`

    <span>trim</span>: Elimina los espacios al principio y al final. <br><br>
    <strong>cadena.trim();</strong><br>
    <strong>cadena.trimRight();</strong><br>
    <strong>cadena.trimLeft();</strong><br>
    <br><hr><br>
    
    <span>starstWith/endsWith</span>: indica si una cadena de texto comienza/acaba con los caracteres de una cadena de texto concreta, devolviendo true o false según corresponda. Son case-sensitive.

    <br><br>
    <strong>cadena.startsWith('cadena', posición_opcional)</strong>;

    <pre>const str1 = 'Saturday night plans';

    console.log(str1.startsWith('Sat'));
    // expected output: true

    console.log(str1.startsWith('Sat', 3));
    // expected output: false</pre>
    <hr><br>

    <span>includes</span>: determina si una matriz incluye un determinado elemento, devolviendo true/false.
    <br><br>

    <strong>array.includes(valor_buscado, posición_opcional);</strong>

    <pre>const array1 = [1, 2, 3];

    console.log(array1.includes(2));
    // expected output: true
    
    const pets = ['cat', 'dog', 'bat'];
    
    console.log(pets.includes('cat'));
    // expected output: true
    
    console.log(pets.includes('at'));
    // expected output: false</pre>
    <hr><br>

    <span>indexOf</span>: retorna el primer índice en el que se puede encontrar un elemento dado en el array, ó retorna -1 si el elemento no esta presente.
    <br><br>

    <strong>array.indexOf(valor_buscado, posición_opcional)</strong>

    <pre>
    var array = [2, 9, 9];
    array.indexOf(2);     // 0
    array.indexOf(7);     // -1
    array.indexOf(9, 2);  // 2
    array.indexOf(2, -1); // -1
    array.indexOf(2, -3); // 0
    </pre>
    <hr><br>

    <span>lastIndexOf</span>: devuelve la posicion (indice) en la que se encuentra el valorBusqueda de la última ocurrencia del valor especificado; o -1 si no se halla. La búsqueda se realiza empezando por el final de la cadena que realiza la llamada, empezando en indiceDesde.
    <br><br>

    <strong>cadena.lastIndexOf(valorBusqueda,indiceDesde)</strong>

    <pre>
    "canal".lastIndexOf("a")   // returns 3
    "canal".lastIndexOf("a", 2) // returns 1
    "canal".lastIndexOf("a", 0) // returns -1
    "canal".lastIndexOf("x")   // returns -1
    </pre>
    <hr><br>

    <span>slice</span>: devuelve una copia de una parte del array dentro de un nuevo array empezando por inicio hasta fin (fin no incluido). El array original no se modificará.
    <br><br>
    <strong>array.slice(inicio, final)</strong>

    <pre>
    var nombres = ['Rita', 'Pedro', 'Miguel', 'Ana', 'Vanesa'];
    var masculinos = nombres.slice(1, 3);
    // masculinos == ['Pedro','Miguel'];
    </pre>
    <hr><br>

    <span>search</span>: ejecuta una búsqueda de una coincidencia entre una expresión regular y una cadena.
    <br><br>
    <strong>cadena.search(regex)</strong>

    <pre>
    let str = "hey JudE"
    let re = /[A-Z]/g
    let reDot = /[.]/g
    console.log(str.search(re))    
    // returns 4, which is the index of the first capital letter "J"
    console.log(str.search(reDot)) 
    // returns -1 cannot find '.' dot punctuation
    </pre>
    <hr><br>

    `);




    
    
    
    
}