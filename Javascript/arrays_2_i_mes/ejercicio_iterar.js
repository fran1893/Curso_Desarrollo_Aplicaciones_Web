// dado este objeto:

let compositores = [
  { nombre: "John Barry", salario: 100000, ciudad: "Londres" },
  { nombre: "James Horner", salario: 90000, ciudad: "Los Angeles" },
  { nombre: "Ennio Morricone", salario: 120000, ciudad: "Roma" },
  { nombre: "Nino Rota", salario: 80000, ciudad: "Roma" },
  { nombre: "Vangelis", salario: 120000, ciudad: "Londres" },
  { nombre: "Hans Zimmer", salario: 120000, ciudad: "Nueva York" },
  { nombre: "John Williams", salario: 120000, ciudad: "Nueva York" },
  { nombre: "Max Steiner", salario: 65000, ciudad: "Nueva York" },
];

// Hay que:

// 1) crear otro array en que los objetos aparezcan 
// con los nombres ordenados de forma descendente.
let compositoresAlfa = compositores.sort(function (a, b) {
  if (a.nombre < b.nombre)
    return 1;
  if (a.nombre > b.nombre)
    return -1;
  return 0;
});
console.log(compositoresAlfa);
// 2) crear otro array en que los objetos aparezcan
// con el salario de forma ascendente (de menos a mayor).
let compositoresSalario = compositores.sort(function (a, b) {
  if (a.salario < b.salario)
    return -1;
  if (a.salario > b.salario)
    return 1;
  return 0;
});
// 3) Crear otro array solo con los músicos de Nueva York

// 4) Obtenr la suma de los salarios de los músicos de Londres
const sumaSalarios = compositores.map(item => item.salario).reduce((a, b) => a + b, 0);
console.log(sumaSalarios);
