import mongoose from "mongoose"

const PocaInfoSchema = new mongoose.Schema(
    {
        ownerId: String,
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