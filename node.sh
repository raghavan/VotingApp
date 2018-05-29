node
Web3 = require('web3')
 web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
 code = fs.readFileSync('Voting.sol').toString()
 solc = require('solc')
 compiledCode = solc.compile(code)
 abiDefinition = JSON.parse(compiledCode.contracts[':Voting'].interface)
 VotingContract = web3.eth.contract(abiDefinition)
 byteCode = compiledCode.contracts[':Voting'].bytecode
 deployedContract = VotingContract.new(['Eli','Victor','Mary'],{data: byteCode, from: web3.eth.accounts[0], gas: 4700000})
 deployedContract.address
