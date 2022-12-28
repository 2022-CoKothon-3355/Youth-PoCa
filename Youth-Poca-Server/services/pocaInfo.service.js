import {pocaInfo} from "../models/pocaInfo.model.js";

let pocaInfoService = {}

pocaInfoService.createPoca = async (params, callback) => {
    if(!params.ownerId){
        return callback({
            message: "OwnerId Required",
        })
    };

    const pocaInfoModel = pocaInfo(params);

    pocaInfoModel
        .save()
        .then((response) => {
            return callback(null, response);
        })
        .catch((error) => {
            return callback(error)
        });
}

pocaInfoService.getPocas = async (params, callback) => {
    const ownerId = params.ownerId;
    pocaInfo
        .find({ownerId: ownerId})
        .then((response) => {
            return callback(null, response)
        }).catch((error) => {
        return callback(error);
    })
}

pocaInfoService.getPocaById = async (params, callback) => {
    const pocaId = params.pocaId;

    pocaInfo
        .findById(pocaId)
        .then((response) => {
            return callback(null, response)
        }).catch((error) => {
        return callback(error);
    });

}

pocaInfoService.updatePoca = async (params, callback) => {

    const pocaId = params.pocaId;

    pocaInfo
        .findByIdAndUpdate(pocaId, params, { userFindAndModify: false})
        .then((response) => {
            if(!response) callback("poca Id Invalid!");
            else return callback(null, response)
        }).catch((error) => {
        return callback(error);
    });
}

pocaInfoService.deletePoca = async (params, callback) => {

    const pocaId = params.pocaId;

    pocaInfo
        .findByIdAndRemove(pocaId)
        .then((response) => {
            if(!response) callback("Poca Id Invalid");
            else return callback(null, response);
        })
        .catch((error) => {
            return callback(error);
        });
}

export default pocaInfoService
