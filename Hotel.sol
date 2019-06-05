

pragma solidity >=0.4.25 <0.6.0;

contract Hotel_Proposal1 {

    struct Entry{
        uint index; // index start 1 to keyList.length
        bytes32 value;
    }

    int storedData; //state variables
	string storedSecretData;
	string userIDAccessed;
	string purpose;
	string accessedTimestamp;
	string currentSecret;
	string Unsealed;
	uint Hotel_SGD_Earnings = 0;
	uint Hotel_SGD_Holdings = 0;
	string Hotel_ETH_address = '0xfdd7aa0b1bcbb77df50b9ef2a5559808d07396d7';
	
	
    string ManagerName;
	uint RequiredDepositName;
	string CurrencyDenomination;
	uint PackagePrice;
	int NumofDays;
	string NumAndTypeOfRooms;
	uint EarlyBirdDiscount;
	uint EarlyBirdEndDate;

	
	
//string[] CustomerListDeposit;
//string[] CustomerListDenomination;
mapping (string => uint) customerDeposit; //first value is address, 2nd value is the deposited amount
mapping (string => string) customerDenomination; // tocheck the denomination that the customer used for payment, first value is customer address, 2nd value is denomination



function addCustomerDeposit2List(string memory customerAcct,uint deposit) public{
  customerDeposit[customerAcct] =  deposit;
  //CustomerListDeposit.push(customerAcct);
}

function addCustomerDenomination2List(string memory customerAcct,string memory denomination) public{
  customerDenomination[customerAcct] =  denomination;
  //CustomerListDenomination.push(customerAcct);
}

    function remove(string memory customerAcct) public {
        //Entry storage entry = customerDeposit[customerAcct];
        //require(entry.index != 0); // entry not exist
        //require(entry.index <= CustomerListDeposit.length); // invalid index value
        
        // Move an last element of array into the vacated key slot.
        //uint keyListIndex = entry.index - 1;
        //uint keyListLastIndex = CustomerListDeposit.length - 1;
        //customerDeposit[CustomerListDeposit[keyListLastIndex]].index = keyListIndex + 1;
        //CustomerListDeposit[keyListIndex] = CustomerListDeposit[keyListLastIndex];
        //CustomerListDeposit.length--;
        delete customerDeposit[customerAcct];
		
		//--------------------------------------
        //Entry storage entry2 = customerDenomination[customerAcct];
        //require(entry2.index != 0); // entry not exist
        //require(entry2.index <= CustomerListDenomination.length); // invalid index value
        
        // Move an last element of array into the vacated key slot.
        //uint keyListIndex2 = entry2.index - 1;
        //uint keyListLastIndex2 = CustomerListDenomination.length - 1;
        //customerDenomination[CustomerListDenomination[keyListLastIndex2]].index = keyListIndex2 + 1;
        //CustomerListDenomination[keyListIndex2] = CustomerListDenomination[keyListLastIndex2];
        //CustomerListDenomination.length--;
        delete customerDenomination[customerAcct];
    }

    function getDepositByKey(string memory customerAcct) public view returns (uint) {
        return customerDeposit[customerAcct];
    }

    function getDenominationByKey(string memory customerAcct) public view returns (string memory) {
        return customerDenomination[customerAcct];
    }
	
	
	function customerCheckOutSGD(string memory customerAcct,string memory setHotelMessageMode) public payable {
		string memory paidDenomination = getDenominationByKey(customerAcct);
		uint paidAmount = getDepositByKey(customerAcct);
		

		  Hotel_SGD_Earnings = Hotel_SGD_Earnings + paidAmount;// 
		  Hotel_SGD_Holdings = Hotel_SGD_Holdings - paidAmount;// Hotel_SGD_Holdings - 60 -

		remove(customerAcct);
	}
	
	
	function customerCheckOutETH(string memory customerAcct,address payable hotelAdd, string memory setHotelMessageMode) public payable {
		string memory paidDenomination = getDenominationByKey(customerAcct);
		uint paidAmount = getDepositByKey(customerAcct);
		
         hotelAdd.transfer(paidAmount); 


		remove(customerAcct);
	}
	


    function deposit(uint256 amount) payable public {
        require(msg.value == amount);
        // nothing else to do!
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
	
    function getSGDBalance() public view returns (uint) {
        return Hotel_SGD_Holdings;
    }

    function getSGDEarnings() public view returns (uint) {
        return Hotel_SGD_Earnings;
    }

    function set(string memory setManagerName,uint setRequiredDepositName,string memory setCurrencyDenomination,uint setPackagePrice,int setNumofDays,string memory setNumAndTypeOfRooms,uint setEarlyBirdDiscount, uint setEarlyBirdEndDate, string memory setHotelMessageMode) public payable {
        ManagerName = setManagerName;
	    RequiredDepositName = setRequiredDepositName;
	    CurrencyDenomination = setCurrencyDenomination;
	    PackagePrice = setPackagePrice;
	    NumofDays = setNumofDays;
	    NumAndTypeOfRooms = setNumAndTypeOfRooms;
	    EarlyBirdDiscount = setEarlyBirdDiscount;
	    EarlyBirdEndDate = setEarlyBirdEndDate;
    }
	
	
    function paymentHolding(string memory customerAcct, string memory paymentDenomination,uint paymentAmount, string memory setHotelMessageMode) public payable {
        addCustomerDeposit2List(customerAcct,paymentAmount);
		addCustomerDenomination2List(customerAcct,paymentDenomination);
		if(compareStrings(paymentDenomination,"SGD"))
		{
			Hotel_SGD_Holdings = Hotel_SGD_Holdings + paymentAmount;
		}
    }

    function getManagerName() public view returns (string memory) {
        return ManagerName;	
    }
	
    function getRequiredDepositName() public view returns (uint) {
        return RequiredDepositName;	
    }
	
    function getCurrencyDenomination() public view returns (string memory) {
        return CurrencyDenomination;	
    }
	
    function getPackagePrice() public view returns (uint) {
        return PackagePrice;	
    }
	
    function getNumofDays() public view returns (int) {
        return NumofDays;	
    }
	
    function getNumAndTypeOfRooms() public view returns (string memory) {
        return NumAndTypeOfRooms;	
    }
	
    function getEarlyBirdDiscount() public view returns (uint) {
		if (EarlyBirdEndDate > now)
		{
			return 0;
		}
		else
		{
			return EarlyBirdDiscount;
		}
    }
	
    function getEarlyBirdEndDate() public view returns (uint) {
        return EarlyBirdEndDate;	
    }
	
	function compareStrings (string memory a, string memory b) public view returns (bool) {
		return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))) );
       }
}

contract Hotel_Proposal2 {

    struct Entry{
        uint index; // index start 1 to keyList.length
        bytes32 value;
    }

    int storedData; //state variables
	string storedSecretData;
	string userIDAccessed;
	string purpose;
	string accessedTimestamp;
	string currentSecret;
	string Unsealed;
	uint Hotel_SGD_Earnings = 0;
	uint Hotel_SGD_Holdings = 0;
	string Hotel_ETH_address = '0xfdd7aa0b1bcbb77df50b9ef2a5559808d07396d7';
	
	
    string ManagerName;
	uint RequiredDepositName;
	string CurrencyDenomination;
	uint PackagePrice;
	int NumofDays;
	string NumAndTypeOfRooms;
	uint EarlyBirdDiscount;
	uint EarlyBirdEndDate;

	
	
//string[] CustomerListDeposit;
//string[] CustomerListDenomination;
mapping (string => uint) customerDeposit; //first value is address, 2nd value is the deposited amount
mapping (string => string) customerDenomination; // tocheck the denomination that the customer used for payment, first value is customer address, 2nd value is denomination



function addCustomerDeposit2List(string memory customerAcct,uint deposit) public{
  customerDeposit[customerAcct] =  deposit;
  //CustomerListDeposit.push(customerAcct);
}

function addCustomerDenomination2List(string memory customerAcct,string memory denomination) public{
  customerDenomination[customerAcct] =  denomination;
  //CustomerListDenomination.push(customerAcct);
}

    function remove(string memory customerAcct) public {
        //Entry storage entry = customerDeposit[customerAcct];
        //require(entry.index != 0); // entry not exist
        //require(entry.index <= CustomerListDeposit.length); // invalid index value
        
        // Move an last element of array into the vacated key slot.
        //uint keyListIndex = entry.index - 1;
        //uint keyListLastIndex = CustomerListDeposit.length - 1;
        //customerDeposit[CustomerListDeposit[keyListLastIndex]].index = keyListIndex + 1;
        //CustomerListDeposit[keyListIndex] = CustomerListDeposit[keyListLastIndex];
        //CustomerListDeposit.length--;
        delete customerDeposit[customerAcct];
		
		//--------------------------------------
        //Entry storage entry2 = customerDenomination[customerAcct];
        //require(entry2.index != 0); // entry not exist
        //require(entry2.index <= CustomerListDenomination.length); // invalid index value
        
        // Move an last element of array into the vacated key slot.
        //uint keyListIndex2 = entry2.index - 1;
        //uint keyListLastIndex2 = CustomerListDenomination.length - 1;
        //customerDenomination[CustomerListDenomination[keyListLastIndex2]].index = keyListIndex2 + 1;
        //CustomerListDenomination[keyListIndex2] = CustomerListDenomination[keyListLastIndex2];
        //CustomerListDenomination.length--;
        delete customerDenomination[customerAcct];
    }

    function getDepositByKey(string memory customerAcct) public view returns (uint) {
        return customerDeposit[customerAcct];
    }

    function getDenominationByKey(string memory customerAcct) public view returns (string memory) {
        return customerDenomination[customerAcct];
    }
	
	
	function customerCheckOutSGD(string memory customerAcct,string memory setHotelMessageMode) public payable {
		string memory paidDenomination = getDenominationByKey(customerAcct);
		uint paidAmount = getDepositByKey(customerAcct);
		

		  Hotel_SGD_Earnings = Hotel_SGD_Earnings + paidAmount;// 
		  Hotel_SGD_Holdings = Hotel_SGD_Holdings - paidAmount;// Hotel_SGD_Holdings - 60 -

		remove(customerAcct);
	}
	
	
	function customerCheckOutETH(string memory customerAcct,address payable hotelAdd, string memory setHotelMessageMode) public payable {
		string memory paidDenomination = getDenominationByKey(customerAcct);
		uint paidAmount = getDepositByKey(customerAcct);
		
         hotelAdd.transfer(paidAmount); 


		remove(customerAcct);
	}
	


    function deposit(uint256 amount) payable public {
        require(msg.value == amount);
        // nothing else to do!
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
	
    function getSGDBalance() public view returns (uint) {
        return Hotel_SGD_Holdings;
    }

    function getSGDEarnings() public view returns (uint) {
        return Hotel_SGD_Earnings;
    }

    function set(string memory setManagerName,uint setRequiredDepositName,string memory setCurrencyDenomination,uint setPackagePrice,int setNumofDays,string memory setNumAndTypeOfRooms,uint setEarlyBirdDiscount, uint setEarlyBirdEndDate, string memory setHotelMessageMode) public payable {
        ManagerName = setManagerName;
	    RequiredDepositName = setRequiredDepositName;
	    CurrencyDenomination = setCurrencyDenomination;
	    PackagePrice = setPackagePrice;
	    NumofDays = setNumofDays;
	    NumAndTypeOfRooms = setNumAndTypeOfRooms;
	    EarlyBirdDiscount = setEarlyBirdDiscount;
	    EarlyBirdEndDate = setEarlyBirdEndDate;
    }
	
	
    function paymentHolding(string memory customerAcct, string memory paymentDenomination,uint paymentAmount, string memory setHotelMessageMode) public payable {
        addCustomerDeposit2List(customerAcct,paymentAmount);
		addCustomerDenomination2List(customerAcct,paymentDenomination);
		if(compareStrings(paymentDenomination,"SGD"))
		{
			Hotel_SGD_Holdings = Hotel_SGD_Holdings + paymentAmount;
		}
    }

    function getManagerName() public view returns (string memory) {
        return ManagerName;	
    }
	
    function getRequiredDepositName() public view returns (uint) {
        return RequiredDepositName;	
    }
	
    function getCurrencyDenomination() public view returns (string memory) {
        return CurrencyDenomination;	
    }
	
    function getPackagePrice() public view returns (uint) {
        return PackagePrice;	
    }
	
    function getNumofDays() public view returns (int) {
        return NumofDays;	
    }
	
    function getNumAndTypeOfRooms() public view returns (string memory) {
        return NumAndTypeOfRooms;	
    }
	
    function getEarlyBirdDiscount() public view returns (uint) {
		if (EarlyBirdEndDate > now)
		{
			return 0;
		}
		else
		{
			return EarlyBirdDiscount;
		}
    }
	
    function getEarlyBirdEndDate() public view returns (uint) {
        return EarlyBirdEndDate;	
    }
	

	
	function compareStrings (string memory a, string memory b) public view returns (bool) {
		return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))) );
       }
}