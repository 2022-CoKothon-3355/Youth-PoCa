import express from "express"
import pocaInfoController from "../controllers/pocaInfo.js";

let router = express.Router()

router.get('/:userId', (req, res) => {
    // let result = pocaInfoController.get(req, res)
    res.send(JSON.stringify({"helloworld": "hahaha"}))
})

router.post('/:userId', async (req, res) => {
    req.body.ownerId = req.params.userId
    res.send(JSON.stringify({"helloworld": "hahaha"}))
})

router.put('/:userId/:cardId', (req, res)=>{
    res.send(JSON.stringify({"helloworld": "hahaha"}))
})

export default router
