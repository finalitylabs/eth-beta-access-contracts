const ethAccess = artifacts.require('./ETHAccess.sol')

module.exports = async function(deployer) {
    ea = await ethAccess.new('1632743004', '0x95ef2833688ee675dfc1350394619ae22b7667df', 'E.T.H. Quarter', 'QRTETH')
    console.log(ea.address)
};
