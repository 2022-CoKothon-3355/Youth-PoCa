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

// Retrieve all Pocas
router.get("/pocas", pocaInfoController.findAll)

// Retrieve a single poca with poca id
router.get('/pocas/:id', pocaInfoController.findOne)

router.post("/pocas", pocaInfoController.create)

// Update a Poca with id
router.put("/pocas/:id", pocaInfoController.update)

// // Delete a Poca with id
router.delete("/pocas/:id", pocaInfoController.delete);

export default router