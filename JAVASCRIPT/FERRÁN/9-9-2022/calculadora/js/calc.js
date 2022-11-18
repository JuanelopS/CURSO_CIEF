window.onload = () => {

  const num1 = document.querySelector('#num1');
  const num2 = document.querySelector('#num2');
  const resultado = document.querySelector("#resultado");
  const operador = document.querySelectorAll("[name='operacion']");
  const boton = document.querySelector("#boton");

  // OPERACIONES
  const sumar = (valor1, valor2) => parseFloat(valor1) + parseFloat(valor2);
  const restar = (valor1, valor2) => parseFloat(valor1) - parseFloat(valor2);
  const multiplicar = (valor1, valor2) => parseFloat(valor1) * parseFloat(valor2);
  const dividir = (valor1, valor2) => parseFloat(valor1) / parseFloat(valor2);

  // RESULTADO EN PANTALLA
  const mostrarResultado = resultadoFinal => resultado.innerHTML = resultadoFinal.toFixed(2);
  
  // CÁLCULO
  const calcular = (valor1, valor2, operador) => boton.addEventListener('click', (event) => {
      // que no recargue el formulario
       event.preventDefault();
      // recorro el array arrojado por el querySelectorAll de los radios y me quedo con el "checked"
       operador.forEach(radio => {
          if(radio.checked){
            switch(radio.value){
              case("sumar"):{
                // console.log(parseFloat(num1.value) + parseFloat(num2.value));
                mostrarResultado(sumar(valor1.value,valor2.value));
                break;
              } 
              case("restar"):{
                mostrarResultado(restar(valor1.value,valor2.value));
                break;
              } 
              case("multiplicar"):{
                mostrarResultado(multiplicar(valor1.value,valor2.value));
                break;
              } 
              case("dividir"):{
                // evitando dividir por 0
                if(valor2.value == 0){
                  alert("No se divide entre 0");
                  // recargo página para limpiar formulario
                  location.reload();
                } else {
                  mostrarResultado(dividir(valor1.value,valor2.value));
                }
                break;
              }
            }
          }
       });
  });

  calcular(num1, num2, operador);

}