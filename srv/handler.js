const cds = require('@sap/cds');
const { where } = require('@sap/cds/lib/ql/cds-ql');

module.exports = (srv)=>{
    srv.on("CREATE", "Orders", (req) => {
     console.log("REQ:", req.data);
      return req.data;
});b  
};

