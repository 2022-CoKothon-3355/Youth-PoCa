import express from "express"

let router = express.Router()

router.get('/', (req, res) => {
    res.send(JSON.stringify({"helloworld": "hahaha"}))
})

router.post('/', (req, res) => {
    res.send(JSON.stringify({"helloworld": "hahaha"}))
})

export default router
