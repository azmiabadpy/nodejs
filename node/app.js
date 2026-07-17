const express = require("express");

const app = express();
const PORT = 3000;

app.get("/", (req, res) => {
    res.send("Hello from Node.js running on AWS EC2!");
});

app.get("/health", (req, res) => {
    res.status(200).json({
        status: "UP",
        message: "Application is running successfully",
        timestamp: new Date()
    });
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
