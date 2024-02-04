// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Define a Solidity contract named "Doctor"
contract Doctor {
    // Define a struct to store doctor information
    struct DoctorData {
        string firstName;
        string lastName;
    }

    // Mapping to store doctor information by their Ethereum address
    mapping(address => DoctorData) doctors;
    
    // Array to store the addresses of all doctors
    address[] doctorAddresses;
    
    // Mapping to check if a doctor exists based on their address
    mapping(address => bool) doctorExist;

    // Event to log when a new doctor is added
    event DoctorAdded(address indexed doctorAddress, string firstName, string lastName);

    // Function to add a new doctor
    function addDoctor(string memory firstName, string memory lastName) public {
        // Check if the doctor doesn't already exist
        require(!doctorExist[msg.sender], "Doctor already exists");
        
        // Create a new DoctorData struct with the provided information
        DoctorData memory doctor;
        doctor.firstName = firstName;
        doctor.lastName = lastName;
        
        // Store the doctor information in the mapping
        doctors[msg.sender] = doctor;
        
        // Mark the doctor as existing
        doctorExist[msg.sender] = true;
        
        // Add the doctor's address to the array
        doctorAddresses.push(msg.sender);

        // Emit an event to log the addition of a new doctor
        emit DoctorAdded(msg.sender, firstName, lastName);
    }

    // Function to check if the calling address corresponds to a doctor
    function doesDoctorExist() public view returns (bool) {
        return doctorExist[msg.sender];
    }

    // Function to get the details of the calling doctor
    function getDoctorDetails() public view returns (string memory, string memory) {
        return (doctors[msg.sender].firstName, doctors[msg.sender].lastName);
    }
}
