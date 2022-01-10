
const BOOToken = artifacts.require("BattleOfOlympusToken");

module.exports = function(deployer) {
  deployer.deploy(BOOToken);
};
