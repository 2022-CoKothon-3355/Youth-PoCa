import productsController from "../controllers/products.controller.js";
import pocaInfoController from "../controllers/pocaInfo.controller.js";
import express from "express";

const router = express.Router()

// Create a new Product
router.post("/products", productsController.create);

// Retrieve all Products
router.get("/products", productsController.findAll);

// Retrieve a single Product with id
router.get("/products/:id", productsController.findOne);

// Update a Product with id
router.put("/products/:id", productsController.update);

// // Delete a Product with id
router.delete("/products/:id", productsController.delete);


// Create a new Poca
router.post("/pocas", pocaInfoController.create);

// Retrieve all Pocas
// router.get("/pocas", pocaInfoController.findAll)
router.get("/pocas", (req, res) => {
    res.json({
        "message": "Success",
        "data": [
            {
                "pocaId": "63ac82bb1452129929ec870b",
                "ownerId": "1",
                "name": "안지원",
                "email": "ss@kookmin.ac.kr",
                "phoneNum": "010-1111-1111",
                "address": "한국",
                "activity": "코스 운영진",
                "description": "동아리 코스임",
                "progress": true,
                "isRepresent": true,
                "images": ["fadsfaf"],
                "content": ["sdfasfa"],
                "result": "true",
            },
            {
                "pocaId": "63ac852e477008b6caf819b3",
                "ownerId": "1",
                "name": "최보석",
                "email": "ss",
                "phoneNum": "010-2222-2222",
                "address": "Seoul, Korea",
                "activity": "학생회",
                "description": "학생회활동",
                "progress": true,
                "isRepresent": true,
                "images": ["dfsfas"],
                "content": ["dsfsdfds"],
                "result": "true",
            }
        ]
    })
})

// Retrieve a single poca with poca id
router.get('/pocas/:id', pocaInfoController.findOne)


// Update a Poca with id
router.put("/pocas/:id", pocaInfoController.update)

// // Delete a Poca with id
router.delete("/pocas/:id", pocaInfoController.delete);

export default router