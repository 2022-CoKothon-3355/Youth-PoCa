import mongoose from "mongoose"

let PocaInfoSchema = new mongoose.Schema(
    {
        ownwerId: String,
        pocaId: String,
        name: String,
        email: String,
        phoneNum: String,
        address: String,
        activity: String,
        description: String,
        progress: String,
        isRepresent: Boolean,
        images:[String],
        content:[String]
    })

export const PocaInfo = mongoose.model("PocaInfo", PocaInfoSchema)