import express from "express"
import pocaInfoController from "../controllers/pocaInfo.js";

let router = express.Router()

router.get('/:userId', (req, res) => {
    pocaInfoController.get()
    res.send(JSON.stringify({"helloworld": "hahaha"}))
})

router.post('/:userId', (req, res) => {
    pocaInfoController.create()
    pocaInfoController.save()
    res.send(JSON.stringify({"helloworld": "hahaha"}))
})

router.put('/:userId/:cardId', (req, res)=>{
    pocaInfoController.edit()
    pocaInfoController.save()
    res.send(JSON.stringify({"helloworld": "hahaha"}))
})

export default router
