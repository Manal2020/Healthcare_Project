pragma solidity ^0.5.16;

contract Medical {

    struct Record {

        string patientNo;

        string name;
        
        string gender;
        
        string hospital;

        string blood;

        string diabetic;

        address[] patientsAddress;

    }

 

    /** @dev Records array */

    Record[] public records;

    

    mapping(address => bool) public patients;

        address public owner = msg.sender;

    event CreatedPatientEvent();

        /** @dev Restrict read access to contract’s state by other contracts */

    modifier onlyBy(address _account)

    {

        require(

            msg.sender == _account,

            "Sender not authorized."

        );

        _;

    }

        

    /** @dev Returns the number of patients. */

    function getNumPatients() public view 

        //onlyBy(owner)

        returns (uint) {

            return records.length;

    }

    

    /** @dev Adds a new patient record. */

     function addPatient(
     string memory _patientNo,
     string memory _name, 
     string memory _gender,
     string memory _hospital, 
     string memory _blood,
     string memory _diabetic)  public 

     //onlyBy(owner)  //restrict access

     returns (bool) {

        require(bytes(_patientNo).length > 0, "patientNo Number is required"); //check the admission number is entered

        require(bytes(_name).length > 0, "Patient Name is required"); //check the patient name is entered

        require(bytes(_patientNo).length <= 9, "patientNo Length is 9"); //check the admission number length is 9 characters

        

        Record memory record;

        emit CreatedPatientEvent();  //update the event

        

        record.patientNo = _patientNo;

        record.name = _name;
        
        record.gender = _gender;

        record.hospital = _hospital;

        record.blood = _blood;

        record.diabetic = _diabetic;

        

        records.push(record); //add the patient record

        

        patients[msg.sender] = true; //update to true

        return true;

    }

 

    /** @dev Gets the patient record based on the record id. */

    function getPatient(uint recordInt) public view 

    //onlyBy(owner)  //restrict access

    returns (
        uint, 
        string memory, 
        string memory, 
        string memory,
        string memory, 
        string memory, 
        string memory,
        address[] memory) {

        if (records.length > 0) {  //check the record length is greater than 0

            Record storage p = records[recordInt]; // Get the record

            return (recordInt, p.patientNo, p.name, p.gender, p.hospital, p.blood, p.diabetic,  p.patientsAddress);  //return the record set based on the id

        }

    }

}
