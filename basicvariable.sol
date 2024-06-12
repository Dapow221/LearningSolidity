pragma solidity >=0.7.0 <0.9.0;

contract BasicVariable {
    // state variable
    uint sum;

    // local variable
    function tambah(uint num1, uint num2) public {
        uint temp  = num1 + num2;

        sum = temp;
    }

    function gethasil() public view returns (uint) {
        return sum;
    }
}

contract Types {
    bool public isValid = true; // untuk types boolean true atau false

    int32 public myNumber = -32; // int32 bisa menambahkan angka sampe mines
    uint public yourNumber = 0; // sedangakan uint gabisa sampe mines

    uint32 public ui_data = 5_01_2024; // unit32 meskipun kita menuliskan 5_01_2024 akan muncul 5012024

    uint8 result; // state variables

    function tambah() public {
        // result = 3/5; // untuk data float seperti ini tidak bisa dibahasa solidity

        result = 3.5 + 1.5; // instead of 3/5 
    }

    // bytes 1-32
    bytes1 public leter = "A"; // bytes memungkinkan untuk gas fee tidak terlalu mahal
    string public words = "This is unspoked words"; // kalau string biasanya gas fee agak mahal
}

contract Enum {
    enum Jobs { Programmer, Analyst, DataScience }
    // enum akan mengembalikan sebuah data dengan bentuk uint sesuai urutan dan dimulai dari 0
    // Programmer index 0 = uint0, Analyst index 1 = uint1, DataScience index 2 = uint2

    function getEnum() public pure returns (Jobs) {
        return  Jobs.Programmer;
    }
}