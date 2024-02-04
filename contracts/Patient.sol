// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Define a Solidity contract named "Patient"
contract Patient {
    // Define a struct to store patient information
    struct PatientData {
        string firstName;
        string lastName;
    }

    // Define a struct to represent a prescription
    struct Prescription {
        address doctor;
        string diagnosis;
        string medications;
        string advices;
        string date;
    }

    // Mapping to store patient information by their Ethereum address
    mapping(address => PatientData) patients;

    // Mapping to store the doctor who has permission to add prescriptions for a patient
    mapping(address => address) permissions;

    // Mapping to store prescriptions for each patient
    mapping(address => Prescription[]) prescriptions;

    // Mapping to check if a patient exists based on their address
    mapping(address => bool) patientExist;

    // Function to add a new patient
    function addPatient(string memory firstName, string memory lastName) public {
        // Create a new PatientData struct with the provided information
        PatientData memory patient;
        patient.firstName = firstName;
        patient.lastName = lastName;

        // Store the patient information in the mapping
        patients[msg.sender] = patient;

        // Mark the patient as existing
        patientExist[msg.sender] = true;
    }

    // Function to grant permission to a doctor to add prescriptions for the patient
    function grantPermission(address doctor) public {
        permissions[msg.sender] = doctor;
    }

    // Function to revoke permission for a doctor to add prescriptions for the patient
    function revokePermission() public {
        delete permissions[msg.sender];
    }

    // Function to check if a doctor has permission to add prescriptions for a patient
    function hasPermission(address patient) public view returns (bool) {
        return permissions[patient] == msg.sender;
    }

    // Function to set a prescription for a patient
    function setPrescription(
        address patient,
        string memory diagnosis,
        string memory medications,
        string memory advices,
        string memory date
    ) public {
        require(hasPermission(patient), "Permission denied");

        // Create a new Prescription struct with the provided information
        Prescription memory prescription;
        prescription.date = date;
        prescription.diagnosis = diagnosis;
        prescription.medications = medications;
        prescription.advices = advices;
        prescription.doctor = msg.sender;

        // Add the prescription to the patient's prescriptions mapping
        prescriptions[patient].push(prescription);
    }

    // Function to check if the calling address corresponds to a patient
    function doesPatientExist() public view returns (bool) {
        return patientExist[msg.sender];
    }

    // Function to get the details of the calling patient
    function getPatientDetails() public view returns (string memory, string memory) {
        return (patients[msg.sender].firstName, patients[msg.sender].lastName);
    }

    // Function to display all prescriptions for the calling patient
    function displayPrescriptions() public view returns (Prescription[] memory) {
        return prescriptions[msg.sender];
    }
}
