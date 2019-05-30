var Hotel_Proposal1 = artifacts.require("Hotel_Proposal1");
var Hotel_Proposal2 = artifacts.require("Hotel_Proposal2");
module.exports = function(deployer) {
   deployer.deploy(Hotel_Proposal1);
   deployer.deploy(Hotel_Proposal2);
};