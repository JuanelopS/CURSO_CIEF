function arrayMcm (arr)
{
    // ordeno el array pasado como argumento

    let ordenar = () => arr.sort((a, b) => a - b);
    let newArray = [];
    // relleno del array de numeros
    for (let i = arr[0]; i <= arr[1]; i++)  newArray.push(i);
    console.log(newArray);

    // recorro el bucle (mientras queden valores), ordeno el indice 0 y el 1 si es necesario (if - function ordenar),
    // llamo a la función checkMcm para que calcule el mcm de dichos índices, almacenando su valor
    // borro esos dos valores y coloco como nuevo índice 0 el resultado del cálculo del mcm
    
    while (newArray.length - 1 > 0){
        if (newArray[0] > newArray[1]) ordenar(newArray[0], newArray[1]);
        let mcm = checkMcm(newArray[0], newArray[1]);
        newArray.splice(0,2);
        newArray.unshift(mcm);
        console.log(newArray);
    };

    // mientras que la división entre el índice 1 y sus multiplos consecutivos (b * cont) y el índice 0 no sea exacta
    // se sigue ejecutando, devolviendo como resultado el "mínimo común múltiplo".

    function checkMcm (a, b){
        let cont = 1;
        let multiplier = b * cont;

        while (multiplier % a != 0){
                multiplier = b * cont;
                cont++;
        }
        console.log(multiplier);
        return multiplier;
    };
}

arrayMcm([1, 5]); 