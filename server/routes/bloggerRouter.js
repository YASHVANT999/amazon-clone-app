const express = require("express");
const { Blogger } = require("../models/blogger.js");
const bloggerRouter = express.Router();

bloggerRouter.post("/add-a-blog", async (req, res) => {
  try {
    const { name, title, description, images } = req.body;

    let blog = new Blogger({
      name,
      title: title,
      description,
      images,
    });
    blog = await blog.save();
    res.json(blog);
  } catch (error) {
    res.status(401).json({ error: error.message });
  }
});

bloggerRouter.get("/get-all-blog", async (req, res) => {
  try {
    const blog = await Blogger.find({});
    res.json(blog);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});
module.exports = bloggerRouter;
