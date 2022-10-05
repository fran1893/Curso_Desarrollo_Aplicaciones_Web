
//Crear otro array idéntico donde las fechas esten en formato día/mes/año

let array = [["2022-10-36"], ["2021-06-30"], ["2020-03-12"]];

//Se crea un array "formato" vacío donde vamos a almacenar los elementos del nuevo array
let formato = [];

//Creamos un bucle for para recorrer los elementos del primer array
for (let i = 0; i < array.length; i++) {

    //Creación de un un array de nombre "array2" donde la función .split en "array" dividira los elementos del mismo por donde se encuentra el "-" y los contendra dentro de "array2" como 3 elementos distintos.
    let array2 = array[i][0].split("-");

    //Aqui vamos introduciendo los elementos conseguidos en "array2" en el orden que queremos y gracias la función .join nos los unira por "-" tal como se ve en "array".
    formato.push([[array2[2], array2[1], array2[0]].join("-")]);

}

//Aquí podemos ver el resultado:
console.log(array);
console.log(formato);


