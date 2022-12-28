import {product} from "../models/products.model.js";

let productsService = {}

productsService.createProduct = async (params, callback) => {
    if(!params.productName){
        return callback({
            message: "Product Name Required",
        })
    };

    const productModel = product(params);

    productModel
        .save()
        .then((response) => {
            return callback(null, response);
        })
        .catch((error) => {
            return callback(error)
        });
}

productsService.getProducts = async (params, callback) => {
    const productName = params.productName;
    let condition = productName ? {
            productName: {$regex: new RegExp(productName), $option: "i"},
        }
        :{};

    const productModel = product(params);
    productModel.save().then((response) => {
        return callback(null, response)
    }).catch((error) => {
        return callback(error);
    });
}

productsService.getProductById = async (params, callback) => {
    const productId = params.productId;
    product
        .findById(productId)
        .then((response) => {
            return callback(null, response)
        }).catch((error) => {
        return callback(error);
    });

}

productsService.updateProduct = async (params, callback) => {

    const productId = params.productId;

    product
        .findByIdAndUpdate(productId, params, { userFindAndModify: false})
        .then((response) => {
            if(!response) callback("product Id Invalid!");
            else return callback(null, response)
        }).catch((error) => {
        return callback(error);
    });
}

productsService.deleteProduct = async (params, callback) => {

    const productId = params.productId;

    product.findByIdAndRemove(productId)
        .then((response) => {
            if(!response) callback("Product Id Invalid");
            else return callback(null, response);
        })
        .catch((error) => {
            return callback(error);
        });
}

export default productsService
