pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Medical.sol";

contract TestMedical {

    Medical medical = Medical(DeployedAddresses.Medical());

    // Testing the addPatient() function returns true
    function testUserCanAddRecord() public {
        
        bool returnStatus = medical.addPatient("123456789", "Ahmed Abdulrhman" ,"Male", "king Fahed", "A+", "yes");
        bool expected = true;
        Assert.equal(returnStatus, expected, "Addition of patient record will equal true.");
    }

    // Testing the number of patients
    function testGetNumOfPatients() public {
        uint returnStatus = medical.getNumPatients();
        uint expected = 1;
        Assert.equal(returnStatus, expected, "Retrieval of patient ID should be 0.");
    }

    // Testing patient mapping
    /* function testPatientMapping() public {
        bool returnStatus = medical.patients(DeployedAddresses);
        bool expected = true;
        Assert.equal(returnStatus, expected, "Retrieval of patient mapping should be true");
    } */

}
