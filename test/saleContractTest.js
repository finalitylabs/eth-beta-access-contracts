'use strict'

import MerkleTree from './helpers/MerkleTree'
const Utils = require('./helpers/utils')
const ethAccess = artifacts.require('./ETHAccess.sol')
const kittyInterface = artifacts.require('./CKInterface.sol')

const Web3latest = require('web3')
const web3latest = new Web3latest(new Web3latest.providers.HttpProvider("http://localhost:8545")) //ganache port


let ea
let ck
let ckAddress = '0x95ef2833688ee675dfc1350394619ae22b7667df'
let betaEndTime = '1632743004'

let partyA
let partyB
let partyI

contract('E.T.H. sale contract tests', function(accounts) {

  before(async () => {
    partyA = accounts[0]
    partyB = accounts[1]
    partyI = accounts[2]
    console.log(partyA)

    ck = await kittyInterface.at(ckAddress)
    //ea = await ethAccess.new(betaEndTime, ckAddress, 'E.T.H. Quarter', 'QRTETH')
  })

  // it("set owner of token to sale contract", async () => {
  //   let owner = await ea.owner()
  //   let betaSaleEnd = await ea.betaSaleEnd()
  //   assert(owner, partyA)
  //   assert(betaSaleEnd, betaEndTime);
  // })

  // it("can purchase QRT during beta", async () => {
  //   let res = await ea.purchaseQRTbeta({from: partyB, value: web3latest.utils.toWei('0.1')})
  //   let participant = await ea.participants(partyB)
  //   let QRTsupply = await ea.totalSupply()
  //   let ownerOf = await ea.ownerOf(QRTsupply)
  //   assert(QRTsupply, '1')
  //   assert(ownerOf, partyB)
  //   assert(participant, partyB)
  // })

  // it("can not purchase with wrong ether amt", async () => {
  //   await Utils.expectThrow(ea.purchaseQRTbeta({from: partyB, value: web3latest.utils.toWei('0.2')}))
  // }) 

  // it("can not purchase QRT mainsale during beta", async () => {
  //   await Utils.expectThrow(ea.purchaseQRT({from: partyB, value: web3latest.utils.toWei('0.1')}))
  // }) 

  // it("can purchase up to QRT beta total", async () => {
  //   for(var i=0; i<9; i++) {
  //     let res = await ea.purchaseQRTbeta({from: partyA, value: web3latest.utils.toWei('0.1')})
  //   }
  // })

  // it("can't purchase more than beta total before mainsale", async () => {
  //   await Utils.expectThrow(ea.purchaseQRTbeta({from: partyB, value: web3latest.utils.toWei('0.1')}))
  // })

  it("can deposit kitties", async () => {
    let count = await ck.balanceOf(partyA)
    console.log('kitty count: '+ count)

    let owner = await ck.ownerOf('4')
    console.log(owner)

    await ck.createPromoKitty('513061484113755770745526522555723468707689511460688830279873704098216300', partyA)

    owner = await ck.ownerOf('8')
    console.log(owner)
  }) 

})