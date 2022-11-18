const editarAlumno = id => {

  fetch('./index.php', {
    method: 'post',
    body: id
  });

}