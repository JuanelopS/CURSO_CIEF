let array = [["2022-10-26"], ["2021-06-30"], ["2020-03-12"]];

let newArray = [];

for (let i in array) {
  for (let j in array[i]) {
    newArray.push(array[i][j].split("-"));  // convierto en 3 arrays cada fecha
  }
  newArray[i] = [newArray[i].reverse().join("-")];  // invierto los arrays con reverse y vuelvo a pasarlos a string
}

console.log(newArray);

