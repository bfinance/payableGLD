// SPDX-License-Identifier: MIT
pragma solidity 0.8.7; 
import "./GLD.sol";



contract buyeth{

    GLDToken public token;
    uint public rate = 100;
    uint public tokenAmount;
    uint  public etherAmount=100;
    address payable public owner;


    
    event Bought(address account,address token,uint amount,uint rate);
    event Sold(address account,address token,uint amount,uint rate);


    constructor() payable {
    token = token;
    owner = payable(msg.sender);

    }

    function buycoins() payable public {
        uint256 amountTobuy = msg.value;
        uint256 dexBalance = token.balanceOf(address(this));
        require(amountTobuy > 0, "You need to send some ether");
        require(amountTobuy <= dexBalance, "Not enough tokens in the reserve");
        token.transfer(msg.sender, amountTobuy);
        
        emit Bought(msg.sender, address(token), tokenAmount, rate  );
        

        
    }

    function sellcoins(uint256 amount) payable public {
        require(amount > 0, "You need to sell at least some tokens");
        uint256 allowance = token.allowance(msg.sender, address(this));
        require(allowance >= amount, "Check the token allowance");
        token.transferFrom(msg.sender, address(this), amount);
        owner.transfer(etherAmount) ;
        emit Sold(msg.sender, address(token), amount, rate  );
       
       
        
    }


}

//notes
    
       // msg.sender.transfer(etherAmount) ;

        
        
        //emit Sold(amount, (inputTokenSymbol ('ETH')), (inputTokenAddress (0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee))


      //inputTokenSymbol: 'ETH',
      //inputTokenAddress: '0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee','
