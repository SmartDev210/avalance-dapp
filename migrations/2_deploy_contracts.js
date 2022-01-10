const GameTokens = artifacts.require("GameToken.sol");

module.exports = function (deployer) {
  deployer.deploy(GameTokens);
};
