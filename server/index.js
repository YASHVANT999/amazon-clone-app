// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/authRouter.js");
const adminRouter = require("./routes/adminRouter.js");
const bloggerRouter = require("./routes/bloggerRouter.js");

// INIT
const PORT = process.env.PORT || 3000;
const app = express();
// const DB =
//   "mongodb+srv://YASH5626:Yashvant@cluster0.f3pmu6p.mongodb.net/?retryWrites=true&w=majority";
const DB = "mongodb://0.0.0.0:27017";
// const DB =
//   "mongodb+srv://YASH5626:Yashvant@cluster0.sotedmd.mongodb.net/?retryWrites=true&w=majority";
// middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(bloggerRouter);
// app.use(productRouter);
// app.use(userRouter);

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
