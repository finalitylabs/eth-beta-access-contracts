const ethAccess = artifacts.require('./ETHAccess.sol')

module.exports = async function(deployer) {
	// dont forget to set CK mainnet address
	// 0x06012c8cf97bead5deae237070f9587f8e7a266d
    ea = await ethAccess.new('0x95ef2833688ee675dfc1350394619ae22b7667df', 'E.T.H. Quarter', 'QRTETH')
    console.log(ea.address)
};
