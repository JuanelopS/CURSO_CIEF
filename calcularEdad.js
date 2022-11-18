function calculaEdad(fecha) {
    const fechaNacimiento = new Date(fecha)
    const today = new Date();
    const anyoActual = today.getFullYear();
    const anyoNacimiento = fechaNacimiento.getFullYear();
    let edad = anyoActual - anyoNacimiento;

    if (fechaNacimiento.getMonth() > today.getMonth()) {
        edad--;
    } else if (fechaNacimiento.getMonth() == today.getMonth() && fechaNacimiento.getDate() > today.getDate()) {
        edad--;
    }
    return edad;
}