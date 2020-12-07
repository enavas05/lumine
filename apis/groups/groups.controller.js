const {
    getGroups,
    createGroup
}= require('./groups.service');


module.exports = {
    createGroup: (req, res) => {
        const body = req.body;

        createGroup(body, (err, results) => {

        });
    },
    getGroups: (req, res)=> {
        getGroups((err, results) => {
            if(err) throw err;

            return res.json({
                succes: 1,
                data: results 
            })
        });

    }
}

