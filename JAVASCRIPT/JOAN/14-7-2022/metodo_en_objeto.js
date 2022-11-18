let persona = {
    nombre: "Juan",
    edad: 39,
    dobleEdad: () => {
        this.edad * 2;
    }
};

console.log(persona.dobleEdad());
