const fs = require('fs');

const alumnos = 
[
{"nombre":"Zoe","apellido":"Ramirez","ciudad":"Almería","fecha_nacimiento":"2005-08-19","sexo":"M"},
{"nombre":"David","apellido":"Schmidt","ciudad":"Almería","fecha_nacimiento":"2004-10-20","sexo":"H"},
{"nombre":"Cristina","apellido":"Lemke","ciudad":"Almería","fecha_nacimiento":"2005-01-06","sexo":"M"},
{"nombre":"Esther","apellido":"Spencer","ciudad":"Almería","fecha_nacimiento":"1956-12-19","sexo":"M"},
{"nombre":"Carmen","apellido":"Streich","ciudad":"Almería","fecha_nacimiento":"1958-10-15","sexo":"M"},
{"nombre":"Alfredo","apellido":"Stiedemann","ciudad":"Almería","fecha_nacimiento":"1957-01-01","sexo":"H"},
{"nombre":"Manolo","apellido":"Hamill","ciudad":"Almería","fecha_nacimiento":"2005-04-23","sexo":"H"},
{"nombre":"Alejandro","apellido":"Kohler","ciudad":"Almería","fecha_nacimiento":"1980-03-14","sexo":"H"},
{"nombre":"Antonio","apellido":"Fahey","ciudad":"Almería","fecha_nacimiento":"1982-03-18","sexo":"H"},
{"nombre":"Guillermo","apellido":"Ruecker","ciudad":"Almería","fecha_nacimiento":"1973-05-05","sexo":"H"},
{"nombre":"Micaela","apellido":"Monahan","ciudad":"Almería","fecha_nacimiento":"1976-02-25","sexo":"H"},
{"nombre":"Francesca","apellido":"Schowalter","ciudad":"Almería","fecha_nacimiento":"1980-10-31","sexo":"H"}
]


const alumnosString = JSON.stringify(alumnos);

fs.writeFileSync('datosAlumnos.json', alumnosString);


