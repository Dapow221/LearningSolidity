pragma solidity >=0.7.0 <0.9.0;

contract AddressContract {
    // analogi address di cryptocurrency sama dengan kayak nomer rekening yang digunakan untuk menerima maupun mengirim ether
    // selain akun yang punya adress, smart contract juga punya address sendiri 
    // address menyimpan data 20 bytes
    // ada dua jenis address, ada address biasa dan ada address payable (send dan transfer)

    // cara 1
    address public caller;

    function getCallerAddress() public returns (address) {
        caller = msg.sender;

        return caller;
    }

    // cara 2
    function getAddress() public view returns(address caller) {
        caller = msg.sender;
    }

    // cara 3
    function getAddress() public view returns(address) {
        address MyAddress = address(this);
        return MyAddress; // me return nilai dengan address dari alamat contract nya
    }

    // address payable (send and transfer)

    uint receivedEtherToSmartContract;

    function received() payable public {
        receivedEtherToSmartContract = msg.value;
    }

    function sendEthereum(address payable _address, uint ammount) public returns(bool) {
        _address.send(ammount);
    }

    function transferEthereum(address payable _address, uint ammount) public {
        _address.transfer(ammount);
    }
}