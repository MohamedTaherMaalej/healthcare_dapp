var doctor = artifacts.require("Doctor");
var patient = artifacts.require("Patient");

module.exports = function(deployer) {
  deployer.deploy(doctor);
  deployer.deploy(patient);
}