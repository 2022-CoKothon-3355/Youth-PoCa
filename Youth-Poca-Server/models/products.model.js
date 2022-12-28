import mongoose from "mongoose"

const ProductSchema = new mongoose.Schema(
    {
        productName: String,
        productDescription: String,
        productPrice: Number,
        productImage: String,
    },{
        timestamps: true,
    }
)

export const product = mongoose.model("products", ProductSchema)
