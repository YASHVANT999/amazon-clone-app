const mongoose = require("mongoose");
const bloggerSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  title: {
    type: String,
    required: true,
    trim: true,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
  description: {
    type: String,
    required: true,
    trim: true,
  },
});

const Blogger = mongoose.model("Blogger", bloggerSchema);
module.exports = { Blogger, bloggerSchema };
