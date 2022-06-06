1. You can determine if an address is a Solidity smart contract by checking the size of the code stored at the address.
2. Assembly extcodesize is used in Solidity functions to determine the size of the code at a particular address.
3. If the code size at the address is greater than 0 then the address is a smart contract.  

# pwning contract:

To pwn a contract that contains Assembly extcodesize simple put a function in the attacking contract’s constructor. During contract creation when the constructor is executed there is no code yet so the code size will be 0. The constructor will run the function and bypass the target contract’s extcodesize check.

Description of contract size Solidity hack
To see this check fail in action perform the following steps:

First deploy the target and failed contracts below.

Then deploy the attack contract with the target contract address in the constructor.

***Target Contract*** – This contract contains a function called protected() that contains a function modifier. The function modifier does not allow contracts to interact with it because it calls a function that contains extcodesize to check if the address is a contract. If an address is input into this function and the code size is greater then 0 the log will print “no contract allowed”. We are going to bypass this check.

***Failed attack*** – This contract contains a function called pwn. When you execute the function with the target address you will see that it fails in the transaction log. The target address will detect that this contact contains code which caused the call to fail.

Bypass contract size check log failed no contract allowed. Bypass Solidity contract size check
***Attack*** – The Hack contract will call the target contract in the constructor. When the contract is created the target address will detect 0 code and the transaction will be successful. It puts the results in the bool isContract in the attack contract. You can also call the pwnd function in the target contract to see that the contract was pwned.