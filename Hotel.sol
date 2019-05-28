

pragma solidity >=0.4.25 <0.6.0;

contract Hotel_Proposal1 {
    int storedData; //state variables
	string storedSecretData;
	string userIDAccessed;
	string purpose;
	string accessedTimestamp;
	string currentSecret;
	string Unsealed;
	int Hotel_SGD_Earnings = 0;
	string Hotel_ETH_address = "0xfdd7aa0b1bcbb77df50b9ef2a5559808d07396d7";
	
	
    string ManagerName;
	int RequiredDepositName;
	string CurrencyDenomination;
	int PackagePrice;
	int NumofDays;
	string NumAndTypeOfRooms;
	int EarlyBirdDiscount;
	uint EarlyBirdEndDate;
	
	
string[] CustomerListDeposit;
string[] CustomerListDenomination;
mapping (string => string) customerDeposit; //first value is address, 2nd value is the deposited amount
mapping (string => string) customerDenomination; // tocheck the denomination that the customer used for payment, first value is customer address, 2nd value is denomination



function addCustomerDeposit2List(string memory customerAcct,string memory deposit) public{
  customerDeposit[customerAcct] =  deposit;
  CustomerListDeposit.push(customerAcct);
}

function addCustomerDenomination2List(string memory customerAcct,string memory denomination) public{
  customerDenomination[customerAcct] =  denomination;
  CustomerListDenomination.push(customerAcct);
}


    function getDepositByKey(string memory customerAcct) public view returns (string memory) {
        return customerDeposit[customerAcct];
    }

    function getDenominationByKey(string memory customerAcct) public view returns (string memory) {
        return customerDenomination[customerAcct];
    }
	

	





    function set(string memory setManagerName,int setRequiredDepositName,string memory setCurrencyDenomination,int setPackagePrice,int setNumofDays,string memory setNumAndTypeOfRooms,int setEarlyBirdDiscount, uint setEarlyBirdEndDate, string memory setHotelMessageMode) public payable {
        ManagerName = setManagerName;
	    RequiredDepositName = setRequiredDepositName;
	    CurrencyDenomination = setCurrencyDenomination;
	    PackagePrice = setPackagePrice;
	    NumofDays = setNumofDays;
	    NumAndTypeOfRooms = setNumAndTypeOfRooms;
	    EarlyBirdDiscount = setEarlyBirdDiscount;
	    EarlyBirdEndDate = setEarlyBirdEndDate;
    }
	
	
    function paymentHolding(string memory customerAcct, string memory paymentDenomination,string memory paymentAmount, string memory setHotelMessageMode) public payable {
        addCustomerDeposit2List(customerAcct,paymentAmount);
		addCustomerDenomination2List(customerAcct,paymentDenomination);
    }

    function getManagerName() public view returns (string memory) {
        return ManagerName;	
    }
	
    function getRequiredDepositName() public view returns (int) {
        return RequiredDepositName;	
    }
	
    function getCurrencyDenomination() public view returns (string memory) {
        return CurrencyDenomination;	
    }
	
    function getPackagePrice() public view returns (int) {
        return PackagePrice;	
    }
	
    function getNumofDays() public view returns (int) {
        return NumofDays;	
    }
	
    function getNumAndTypeOfRooms() public view returns (string memory) {
        return NumAndTypeOfRooms;	
    }
	
    function getEarlyBirdDiscount() public view returns (int) {
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
	
    function writeTransacSecret(string memory userID, string memory secretMsg, string memory timestamp, string memory purposeIn) public payable {
        storedSecretData = secretMsg;
		userIDAccessed = userID;
		purpose = purposeIn;
		accessedTimestamp = timestamp;
		Unsealed = "Sealed";
    }
	
    function viewTransacSecret(string memory userID, string memory timestamp, string memory purposeIn) public payable returns (string memory){
        currentSecret = storedSecretData;
		userIDAccessed = userID;
		purpose = purposeIn;
		accessedTimestamp = timestamp;
	    Unsealed = "Unsealed";
        return storedSecretData;
    }

    function getstoredSecretData() public view returns (string memory) {
	    if(compareStrings(Unsealed,"Unsealed"))
		{
			return storedSecretData;
		}
		else
		{
			return "Error!! You need to unseal the secret message or maybe there is no secret message =D";
		}
        	
    }
	
	function compareStrings (string memory a, string memory b) public view returns (bool) {
		return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))) );
       }
}

contract Hotel_Proposal2 {
    int storedData; //state variables
	string storedSecretData;
	string userIDAccessed;
	string purpose;
	string accessedTimestamp;
	string currentSecret;
	string Unsealed;
	

    function set(int x) public payable {
        storedData = x;
    }

    function get() public view returns (int) {
        return storedData;	
    }
	
	
	
    function writeTransacSecret(string memory userID, string memory secretMsg, string memory timestamp, string memory purposeIn) public payable {
        storedSecretData = secretMsg;
		userIDAccessed = userID;
		purpose = purposeIn;
		accessedTimestamp = timestamp;
		Unsealed = "Sealed";
    }
	
    function viewTransacSecret(string memory userID, string memory timestamp, string memory purposeIn) public payable returns (string memory){
        currentSecret = storedSecretData;
		userIDAccessed = userID;
		purpose = purposeIn;
		accessedTimestamp = timestamp;
	    Unsealed = "Unsealed";
        return storedSecretData;
    }

    function getstoredSecretData() public view returns (string memory) {
	    if(compareStrings(Unsealed,"Unsealed"))
		{
			return storedSecretData;
		}
		else
		{
			return "Error!! You need to unseal the secret message or maybe there is no secret message =D";
		}
        	
    }
	
	function compareStrings (string memory a, string memory b) public view returns (bool) {
		return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))) );
       }
}