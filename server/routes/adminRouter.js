const express = require("express");
const { Product } = require("../models/product.js");
const adminRouter = express.Router();
const admin = require("../middlewares/adminMiddleware.js");

adminRouter.post("/admin/add-a-product", admin, async (req, res) => {
  try {
    const { name, description, images, quantity, price, category } = req.body;

    let product = new Product({
      name,
      description,
      images,
      quantity,
      price,
      category,
    });
    product = await product.save();
    res.json(product);
  } catch (error) {
    res.status(401).json({ error: error.message });
  }
});

adminRouter.get("/admin/get-all-product", admin, async (req, res) => {
  try {
    const product = await Product.find({});
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

adminRouter.post("/admin/delete-a-product/", admin, async (req, res) => {
  try {
    const { id } = req.body;
    let product = await Product.findByIdAndDelete(id);
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = adminRouter;
