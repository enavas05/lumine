const {
    create,
    getUserByUserEmail,
    getUserByUserId,
    getUsers,
    updateUser,
    deleteUser
  } = require("./users.service");
  
  
  const { hashSync, genSaltSync, compareSync } = require("bcrypt");
  const { sign } = require("jsonwebtoken");
  
  
  module.exports = {
    createUser: (req, res) => {
      const body = req.body;
      const salt = genSaltSync(10);
      body.password = hashSync(body.password, salt);
      create(body, (err, results) => {
        if (err) {
          console.log(err);
          return res.status(500).json({
            success: 0,
            message: "Error de conexión a la base de datos"
          });
        }
        return res.status(200).json({
          success: 1,
          data: results
        });
      });
    },
    login: (req, res,next) => {
      const body = req.body;
      getUserByUserEmail(body.email, (err, results) => {
        if (err) {
          console.log(err);
        }
        if (!results) {
          return res.json({
            success: 0,
            data: "usuario o contraseña errónea"
          });
        }
        const result = capi.usersompareSync(body.password, results.password);
        if (result) {
          results.password = undefined;
          const jsontoken = sign({ result: results }, "qwe1234", {
            algorithm: "HS256",
            expiresIn: process.env.ACCESS_TOKEN_LIFE
          });
          return res.json({
            success: 1,
            message: "Bienvenido",
            token: jsontoken
            
          });
        } else {
          return res.json({
            success: 0,
            data: "Usuario o contraseña incorrectos"
          });
        }
      });
    },
    getUserByUserId: (req, res) => {
      const id = req.params.id;
      getUserByUserId(id, (err, results) => {
        if (err) {
          console.log(err);
          return;
        }
        if (!results) {
          return res.json({
            success: 0,
            message: "Registro no encontrado"
          });
        }
        results.password = undefined;
        return res.json({
          success: 1,
          data: results
        });
      });
    },
    getUsers: (req, res) => {
      getUsers((err, results) => {
        if (err) {
          console.log(err);
          return;
        }
        return res.json({
          success: 1,
          data: results
        });
      });
    },
    updateUsers: (req, res) => {
      const body = req.body;
      const salt = genSaltSync(10);
      body.password = hashSync(body.password, salt);
      updateUser(body, (err, results) => {
        if (err) {
          console.log(err);
          return;
        }
        return res.json({
          success: 1,
          message: "Actualizado correctamente"
        });
      });
    },
    deleteUser: (req, res) => {
      const data = req.body;
      deleteUser(data, (err, results) => {
        if (err) {
          console.log(err);
          return;
        }
        if (!results) {
          return res.json({
            success: 0,
            message: "usuario no encontrado"
          });
        }
        return res.json({
          success: 1,
          message: "usuario eliminado correctamente"
        });
      });
    }
  };
  