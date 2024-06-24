let queryString = location.search;
let queryStringObj = new URLSearchParams(queryString);
let resulBusqueda = queryStringObj.get("search");


let textoBusqueda = document.querySelector("#texto-busqueda");
textoBusqueda.innerText = `Resultados de búsqueda: ${resulBusqueda}`;


console.log("hola"); 