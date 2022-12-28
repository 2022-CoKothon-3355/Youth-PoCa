import express from "express"
import cardRouter from "./routes/card.js"
import Router from "./routes/app.routes.js"
import {mongoose} from "mongoose";
import {PocaInfo} from "./models/pocaInfo.model.js";
import cors from 'cors'
import errorHandler from "./middleware/errors.js";

mongoose.connect("mongodb://my-database:27017/mydocker")

let app = express()
app.use(express.json())
app.use(cors())
app.use("/uploads", express.static("uploads"))
app.use('/api', Router)
app.use('/card', cardRouter)
app.use(errorHandler)


app.listen(3000, ()=>{
    console.log("hello world")
})