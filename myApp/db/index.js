const db = {
    usuario:{
        email:"chiaramuzzio@gmail.com",
        usuario: "chiamuzzio",
        contrasenia: "190105",
        bday: "2005-01-19",
        dni: 46291301,
        foto: "https://via.placeholder.com/150"
    },
    productos: [
        {
           imagen: "producto.jpg",
           nombre:  "producto",
           descripcion: "gran producto 10/10",
           comentarios: [
            {
                user: "chiardigan",
                textoComentario: "malisimo tu producto Dedicate a otra cosa",
                pfp: "/images/kiki.png"
            },
            {
                user: "moremuzzio",
                textoComentario: "buenisimo!!!!",
                pfp: "/images/monch.png"
            }
           ]
        },
        {
            imagen: "producto.jpg",
            nombre:  "producto",
            descripcion: "gran producto 10/10",
            comentarios: [
             {
                 user: "chiardigan",
                 textoComentario: "malisimo tu producto Dedicate a otra cosa",
                 pfp: "/images/kiki.png"
             },
             {
                 user: "moremuzzio",
                 textoComentario: "buenisimo!!!!",
                 pfp: "/images/monch.png"
             }
            ]
         }
    ]
}


module.exports = db;