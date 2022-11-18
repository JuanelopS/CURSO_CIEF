const eliminarAlumno = id => {
  fetch('./php/eliminarAlumno2.php', {
    method: 'post',
    body: id
  });

  window.location.href = '../index.php';
}