const ethAccess = artifacts.require('./ETHAccess.sol')

module.exports = async function(deployer) {
	// dont forget to set CK mainnet address
	// 0x06012c8cf97bead5deae237070f9587f8e7a266d
	let ckAddy = '0x95ef2833688ee675dfc1350394619ae22b7667df'
	let secureWallet = '0x84068c0b832e200bc44ea5bee3ea24b2e540bcc7'
	
    ea = await ethAccess.new(ckAddy, secureWallet, 'E.T.H. Quarter', 'QRTETH')
    console.log(ea.address)
};
