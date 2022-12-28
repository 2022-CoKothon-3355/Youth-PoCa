import upload from "../middleware/upload.js";
import pocaInfoService from "../services/pocaInfo.service.js";

let pocaInfoController = {}

pocaInfoController.create = (req, res, next) => {
    upload(req, res, function (err) {
        if (err) {
            next(err);
        } else {
            const url = req.protocol + "://" + req.get("host");

            const path =
                req.file != undefined ? req.file.path.replace(/\\/g, "/") : "";

            // var model = {
            //     productName: req.body.productName,
            //     productDescription: req.body.productDescription,
            //     productPrice: req.body.productPrice,
            //     productImage: path != "" ? url + "/" + path : "",
            // };

            if(!req.body.ownerId){
                return res.status(404).send({
                    message: "OwnerId Required",
                })
            };

            var model = {
                ownerId : req.body.ownerId,
                name: req.body.name,
                email: req.body.email,
                phoneNum: req.body.phoneNum,
                address: req.body.address,
                activity: req.body.activity,
                description: req.body.description,
                progress: req.body.progress,
                isRepresent: req.body.isRepresent,
                result: req.body.result,
                sendTime: req.body.sendTime
            }

            pocaInfoService.createPoca(model, (error, results) => {
                if (error) {
                    return next(error);
                }
                let pocaId = results._id;
                results.pocaId = pocaId;
                return res.status(200).send({
                    message: "Success",
                    data: results,
                });
            });
        }
    });
};

pocaInfoController.findAll = (req, res, next) => {
    var model = {
        ownerId: req.body.ownerId,
    };

    pocaInfoService.getPocas(model, (error, results) => {
        if (error) {
            return next(error);
        }
        return res.status(200).send({
            message: "Success",
            data: results,
        });
    });
};

pocaInfoController.findOne = (req, res, next) => {
    var model = {
        pocaId: req.params.pocaId,
    };

    pocaInfoService.getPocaById(model, (error, results) => {
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
pocaInfoController.update = (req, res, next) => {
    upload(req, res, function (err) {
        if (err) {
            next(err);
        } else {
            const url = req.protocol + "://" + req.get("host");

            const path =
                req.file != undefined ? req.file.path.replace(/\\/g, "/") : "";

            // var model = {
            //     productId: req.params.id,
            //     productName: req.body.productName,
            //     productDescription: req.body.productDescription,
            //     productPrice: req.body.productPrice,
            //     productImage: path != "" ? url + "/" + path : "",
            // };
            var model = {
                ownerId : req.body.ownerId,
                name: req.body.name,
                email: req.body.email,
                phoneNum: req.body.phoneNum,
                address: req.body.address,
                activity: req.body.activity,
                description: req.body.description,
                progress: req.body.progress,
                isRepresent: req.body.isRepresent,
                result: req.body.result,
                sendTime: req.body.sendTime
            }

            console.log(model);

            pocaInfoService.updatePoca(model, (error, results) => {
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

pocaInfoController.delete = (req, res, next) => {
    var model = {
        pocaId: req.params.pocaId,
    };

    pocaInfoService.deletePoca(model, (error, results) => {
        if (error) {
            return next(error);
        }
        return res.status(200).send({
            message: "Success",
            data: results,
        });
    });
};

export default pocaInfoController