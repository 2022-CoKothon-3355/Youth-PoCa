import express from "express"
import pocaInfoController from "../controllers/pocaInfo.js";

let router = express.Router()

router.get('/:userId', (req, res) => {
    pocaInfoController.get()
    res.send(JSON.stringify({"helloworld": "hahaha"}))
})

router.post('/:userId', (req, res) => {
    console.log("create")
    console.log(req.body);
    let userId = req.params.userId
    pocaInfoController.create(req, res, userId)
    console.log("Call save")
    res.send(JSON.stringify({"helloworld": "hahaha"}))
})

router.put('/:userId/:cardId', (req, res)=>{
    pocaInfoController.edit()
    pocaInfoController.save()
    res.send(JSON.stringify({"helloworld": "hahaha"}))
})

export default router
