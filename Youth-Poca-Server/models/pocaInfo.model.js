import mongoose from "mongoose"

let PocaInfoSchema = new mongoose.Schema(
    {
            ownerId: String,
            name: String,
            email: String,
            phoneNum: String,
            address: String,
            activity: String,
            description: String,
            progress: Boolean,
            isRepresent: Boolean,
            images:[String],
            content:[String],
            result: String,
            sendTime: String
    })

export const pocaInfo = mongoose.model("PocaInfo", PocaInfoSchema)