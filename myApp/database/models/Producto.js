module.exports = function (sequelize, dataTypes ) {
    let alias = "Producto";
    let cols = {
        id: {
            autoIncrement : true,
            primaryKey : true,
            type : dataTypes.INTEGER
        },
        clienteId: {
            type : dataTypes.INTEGER
        },
        nombreProd: {
            type : dataTypes.STRING
        },
        imagenProd: {
            type : dataTypes.STRING
        },
        descripcion: {
            type : dataTypes.STRING
        },
        createdAt: {
            type : dataTypes.DATE
        },
        updatedAt: {
            type : dataTypes.DATE
        },
        deletedAt: {
            type : dataTypes.DATE
        }
  	}

    let config = {
        tableName: "productos",
        timestamps: true,
        underscored: false
    }
    
    let Producto = sequelize.define(alias, cols, config);
    return Producto;
}