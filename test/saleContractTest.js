'use strict'

import MerkleTree from './helpers/MerkleTree'
const Utils = require('./helpers/utils')
const ethAccess = artifacts.require('./EthAccess.sol')
const CKProxy = artifacts.require('./CKProxy.sol')

const Web3latest = require('web3')
const web3latest = new Web3latest(new Web3latest.providers.HttpProvider("http://localhost:7545")) //ganache port


let ea
let ckAddress = '0x0'
let betaEndTime = '1'

let partyA
let partyB
let partyI

contract('E.T.H. sale contract tests', function(accounts) {

  before(async () => {
    partyA = accounts[0]
    partyB = accounts[1]
    partyI = accounts[2]

    ea = await ethAccess.new(betaEndTime, ckAddress)
  })

  it("set owner of token to sale contract", async () => {

  })
})