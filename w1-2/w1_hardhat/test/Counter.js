const { expect } = require("chai") ;


let counter;
let owner, otherAccount;

describe("Counter", function() {
    async function init() {
        [owner, otherAccount] = await ethers.getSigners();
        //A ContractFactory in ethers.js is an abstraction used to 
        //deploy new smart contracts, so Counter here is a factory for instances 
        // of our Counter contract.
        const Counter = await ethers.getContractFactory("Counter");
        //Calling deploy() on a ContractFactory
        // will start the deployment, and return a Promise that resolves to a Contract.
        counter =  await Counter.deploy(0);
        await counter.deployed();
        console.log("counter:" + counter.address);
    }

    before(async function() {
        // Perform some async setup before each test
        await init();
      });

 /*   it("init equal 0", async function()
    {
        expect (await counter.counter()).to.equal(0);
    }
    );
     it("add 1 equals 1", async function(){
        let tx  =  await counter.count();
        await tx.wait();
        expect(await counter.counter()).to.equal(1);

    }); */

    it("owner is caller", async function(){
        expect(await counter.counter()).to.equal(0);

        let tx = await counter.count();
        await tx.wait();
        expect(await counter.counter()).to.equal(1);
    }
    );

    it("caller is not owner", async function(){
        let counter2 =  counter.connect(otherAccount);
        
        
        expect(counter2.count()).to.be.revertedWith("invalid call");
    }
    );



});
