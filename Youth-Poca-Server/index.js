import express from "express"
import cardRouter from "./routes/card.js"
import {mongoose} from "mongoose";
import {PocaInfo} from "./models/pocaInfo.model.js";
import cors from 'cors'

let app = express()
app.use(express.json())
app.use(cors())

app.use('/card', cardRouter)

mongoose.connect("mongodb://my-database:27017/mydocker")

app.listen(3000, ()=>{
    console.log("hello world")
})