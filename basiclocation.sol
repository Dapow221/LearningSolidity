pragma solidity >=0.7.0 <0.9.0;

// lokasi data yang ada di solidity
// 1. Storage, data yang sifat nya permanen atau sama dengan variable state yang bisa diakses di fungsi manapun di smart contract kita
// 2. Memory, data yang sifat nya sementara dan hanya bisa diakses didalam fungsi saja
// 3. Calldata, data yang sifat nya tidak dapat dimodifikasi
// 4. Stack, data yang sifat nya tidak dapat dimodifikasi, tapi data ini dikelola langsung sama EVM nya ethereum

contract DataLocation {
    // storage
    uint stateStorage;

    // uint storage stateStorageSaya; // error

    // memory, semua parameter termasuk result data itu masuknya di memory
    function sum(uint a, uint b) public pure returns (uint result) {
        result = a + b;
    }
}

contract Locations {
    uint public stateVariables1 = 10;
    uint stateVariables2 = 20;

    function MyFunction() public returns (uint) {
        stateVariables1 = stateVariables2;
        stateVariables2 = 30; // ini tidak kebaca

        return stateVariables1; // 20
    }
}

contract Whatever {
    uint stateVariable = 10;

    function ReplaceValue() public returns (uint) {
        uint localVariable = 20; // memory
        stateVariable = localVariable;
        localVariable = 40; // tidak bisa mengubah

        return stateVariable; // 20
    }
}

contract Testing {
    uint stateVariable = 10; // storage

    function Hellow() public returns (uint) {
        uint localVariable = 20; // memory
        localVariable = stateVariable;
        stateVariable = 40; // tidak berpengaruh

        return localVariable;
    }
}

contract Testing2 {
    function thisIsFunction() public pure returns(uint[] memory, uint[] memory) { // reference types, bisa melakukan replace value
        uint[] memory localMemoryArray1 = new uint[](3);

        localMemoryArray1[0] = 4;
        localMemoryArray1[1] = 5;
        localMemoryArray1[2] = 6;

        uint[] memory localMemoryArray2 = localMemoryArray1;
        localMemoryArray1[0] = 10;

        return (localMemoryArray1, localMemoryArray2); // 10, 5, 6
    }

    function thisIsFunction2() public pure returns(uint) { // types values tidak bisa melakukan penggantian value seperti yang diatas
        uint localVar1 = 10;
        uint localVar2 = 20;

        localVar1 = localVar2;
        localVar1 = 40;

        return localVar1;
    }
}