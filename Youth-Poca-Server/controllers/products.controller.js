import productsService from "../services/products.service.js"
import upload from "../middleware/upload.js";


let productsController = {}

// Create and Save a new Product
productsController.create = (req, res, next) => {
    upload(req, res, function (err) {
        if (err) {
            next(err);
        } else {
            const url = req.protocol + "://" + req.get("host");

            const path =
                req.file != undefined ? req.file.path.replace(/\\/g, "/") : "";

            var model = {
                productName: req.body.productName,
                productDescription: req.body.productDescription,
                productPrice: req.body.productPrice,
                productImage: path != "" ? url + "/" + path : "",
            };

            productsService.createProduct(model, (error, results) => {
                if (error) {
                    return next(error);
                }
                return res.status(200).send({
                    message: "Success",
                    data: results,
                });
            });
        }
    });
};

// Retrieve all Products from the database.
productsController.findAll = (req, res, next) => {
    var model = {
        productName: req.query.productName,
    };

    productsService.getProducts(model, (error, results) => {
        if (error) {
            return next(error);
        }
        return res.status(200).send({
            message: "Success",
            data: results,
        });
    });
};

// Find a single Tutorial with an id
productsController.findOne = (req, res, next) => {
    var model = {
        productId: req.params.id,
    };

    productsService.getProductById(model, (error, results) => {
        if (error) {
            return next(error);
        }
        return res.status(200).send({
            message: "Success",
            data: results,
        });
    });
};

// Update a Product by the id in the request
productsController.update = (req, res, next) => {
    upload(req, res, function (err) {
        if (err) {
            next(err);
        } else {
            const url = req.protocol + "://" + req.get("host");

            const path =
                req.file != undefined ? req.file.path.replace(/\\/g, "/") : "";

            var model = {
                productId: req.params.id,
                productName: req.body.productName,
                productDescription: req.body.productDescription,
                productPrice: req.body.productPrice,
                productImage: path != "" ? url + "/" + path : "",
            };

            console.log(model);

            productsService.updateProduct(model, (error, results) => {
                if (error) {
                    return next(error);
                }
                return res.status(200).send({
                    message: "Success",
                    data: results,
                });
            });
        }
    });
};

// Delete a Product with the specified id in the request
productsController.delete = (req, res, next) => {
    var model = {
        productId: req.params.id,
    };

    productsService.deleteProduct(model, (error, results) => {
        if (error) {
            return next(error);
        }
        return res.status(200).send({
            message: "Success",
            data: results,
        });
    });
};

export default productsController