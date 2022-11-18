function division (a, b) {
  return a / b;
}

function dividir (a, b) {
  if( isNaN(a) || isNaN(b) ){
    return "Hay que pedir números...";
  } else if( b === 0 ){
    return "No se puede dividir por 0...";
  } else {
    return division (a, b);
  }
}

export default dividir;