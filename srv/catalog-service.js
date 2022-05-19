const cds = require('@sap/cds')
module.exports = function (){
   
    this.after ('READ','Books', (each)=>{
        if(each.stock >= 200){
            each.title = '10% Off ' + each.title;
        }
        
    })

    // this.on ('submitOrder', (req)=>{...}) //> custom actions
    // this.on ('CREATE',`Books`, (req)=>{...})
    // this.before ('UPDATE',`*`, (req)=>{...})

}

// module.exports = srv => {
//     console.log(`VP Service name: ${srv.name} is served at ${srv.path}`)
// }
