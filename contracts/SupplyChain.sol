pragma solidity ^0.5.0;

contract Delivery
{
  string public name;
  uint public sku = 0;
  mapping(uint => Order) public orders;
  mapping(uint => Test) public tests;

  enum State {
    ForSale, Sold, Shipped, Received
  }

  struct Order
  {
    uint sku;
    string name;
    State state;
    string location;
    uint price;
    address seller; 
    address buyer;
  }

  struct Test{string check;}
  event TestChecked(string check);

  event OrderPlaced
  (
    uint sku,
    string name,
    State state,
    string location,
    uint price,
    address seller,
    address buyer
  );

  function createOrder(string memory _name, string memory _location, uint _price, address _seller,   address _buyer) public {
       require(bytes(_name).length > 0);
       sku ++;
       State _state = State.ForSale;
       orders[sku] = Order(sku, _name, _state, _location, _price, _seller, _buyer);
       emit OrderPlaced(sku, _name, _state, _location, _price, _seller, _buyer);}

}