require("dotenv").config();
const express = require('express');

const categoriesRouter = require('./apis/categories/categories.router');
const groupsRouter = require('./apis/groups/groups.router');
const rolesRouter = require('./apis/roles/roles.router');
const userRouter = require('./apis/users/users.router');
const ovasRouter = require('./apis/ovas/ovas.router');
const path = require('path');   
const { clearScreenDown } = require('readline');
const pool = require('./config/database');
const cors = require('cors');
const bodyParser = require("body-parser");



const app = express();

const port = 3000
//Configuración de express 
//app.use(express.json());
//app.use(express.urlencoded({extended:true}));
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.use(cors());

app.use(express.static(path.join(__dirname, 'public')));


//routes
// app.use(require('./routes'));
// //app.use(require('./routes/auth'));
app.use('/categories', categoriesRouter);
app.use('/groups', groupsRouter);
app.use('/roles', rolesRouter);
app.use('/users', userRouter);
app.use('/ovas', ovasRouter );






app.listen(port, () => {
console.log(`Servidor corriendo en puerto`, port);
//console.log(process.env.ACCESS_TOKEN_SECRET);
});