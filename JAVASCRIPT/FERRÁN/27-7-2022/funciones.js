let nombre1 = "María", nombre2 = "Pau";

function saludar (nom1, nom2){
    return "Hola " + nom1 + ", " + nom2;
}

let saludar2 = function (nom1, nom2){
    return "Hola " + nom1 + ", " + nom2;
}

let saludar3 = function (nom1, nom2){
    return "Hola " + nom1 + ", " + nom2;
}(nombre1, nombre2);

function duplicar (a){ return a * 2}
let flecha1 = a => a * 2;

let flecha2 = (nom1, nom2) => "Hola " + nom1 + ", " + nom2;

let areaCirculo = (radio, PI = Math.PI) => (radio * 2 * PI).toFixed(4);


console.log("saludar :", saludar(nombre1, nombre2));
console.log("saludar2:", saludar2(nombre1, nombre2));
console.log("saludar3:", saludar3);
(function(){console.log("Soy una función automática");})();
console.log(flecha1(3));
console.log(flecha2(nombre1, nombre2));
console.log(areaCirculo(5));