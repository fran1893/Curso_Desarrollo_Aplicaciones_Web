// const abuelo = document.querySelector("#abuelo")
// const padre = document.querySelector("#padre")
// const nieto = document.querySelector("#nieto")

// abuelo.addEventListener(
//     'click',
//     (e)=> {
//         console.log(e.target.id);
//         e.stopPropagation();
//     },
// )

// padre.addEventListener(
//     'click',
//     (e)=> {
//         console.log(e.target.id);
//         e.stopPropagation();
//     },
// )

// nieto.addEventListener(
//     'click',
//     (e)=> {
//         console.log(e.target.id);
//         e.stopPropagation();
//     },
// )

document, addEventListener(
    'click',
    (e) => {
        // if (e.target.classList[0] == 'familia'){
        //     alert('Soy el padre')
        // }

        //     if (e.target.classList.contains('familia')){
        //         alert("Somos familia")
        //     }

        // if (e.target.matches('.familia')) {
        //     alert("Somos familia")
        // }
        if (e.target.dataset['div']=="divABUELO"){
            alert("Soy el abuelo");
        }
    }
);