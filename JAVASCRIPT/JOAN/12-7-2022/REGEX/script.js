window.onload = inicio;


function inicio(){

    let caja = document.querySelector('#caja');

    caja.insertAdjacentHTML('beforeend',`

    <h1>Expresiones regulares...&lt;/&gt;</h1>
    <br>
    <strong>const regEx = /a[lt]o/i;</strong><br>
    <strong>let resultado = regEx.test(...); <em>//true or false</em>
    
    <pre>
    i:        case insensitive 
    g:        global
    ^:        comienzo
    $:        final
    .:        comodín de un carácter (debe haber 1 al menos)
    []:       rangos con o sin '-'. Ej: [aef], [a-f]
    [^grupo]: negación de un grupo Ej: [^a-z]
    |:        alternativa Ej: /roja|verde/
    *:        0 ó más veces el elemento anterior Ej: /bo*/ -> boooo
    +:        1 ó más veces Ej: /a+/
    ?:        0 ó 1 vez el elemento anterior Ej: /e?Le?/ -> el-angel: true | le-angle: true
    x{n}:     exacto nº de apariciones de n;
    x{n,}:    al menos n apariciones de n;
    x{n,m}:   mín y máx nº de apariciones;
    \\n:      todos los números enteros
    \\w:      [a-zA-Z0-9_]
    \\N:      no entero
    \\W:      [^a-zA-Z0-9_]
    \\s:      espacio en blanco
    
    <br>
    Ej: /^[0-9]{2}/ -> Que empiece con dos números


    </pre>
    <br>
    `);
   
}