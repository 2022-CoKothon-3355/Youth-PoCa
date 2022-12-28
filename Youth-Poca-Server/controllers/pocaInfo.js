import {PocaInfo} from "../models/pocaInfo.model.js"

let pocaInfoController = {}

// 포트폴리오 카드 목록 보여주기
pocaInfoController.list = async (req, res) => {

    const pocainfoList = await PocaInfo.find({_id:req.params.ownerId})

    return pocainfoList
}




// 포트폴리오 카드 하나 찾기
pocaInfoController.show = (req, res) => {

    PocaInfo.findOne({_id: req.params.id}).exec(function(err, employee) {

    })

}




// 포트폴리오 카드 생성

pocaInfoController.create = async (req, res) => {

    const data = {ownerId, pocaId, name, email, phoneNum, address, activity,
        description,
        progress,
        isRepresent,
        images,
        content} = req.body


    const pocaInfo = new PocaInfo(data)

    let result = await pocaInfo.save()
    return result
};




// 포트폴리오 카드 저장

pocaInfoController.save = (req, res) => {

    let pocaInfo = new PocaInfo(req.body);

};





// 직원 편집

pocaInfoController.edit = (req, res) => {

    pocaInfo.findOne({_id: req.params.id}).exec(function(err, employee) {

    });

};





// 포트폴리오 카드 하나 업데이트

pocaInfoController.update = (req, res) => {

    pocaInfo.findByIdAndUpdate(

        req.params.id
    )

};




// 단일 직원 데이터 제거

pocaInfoController.delete = (req, res) => {

    PocaInfo.remove({_id:req.params.id}, function(err) {

    });

};

export default pocaInfoController