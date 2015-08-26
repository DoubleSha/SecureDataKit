# SecureDataKit
SecureDataKit is a library for storing sensitive data such as private keys. It has two primary classes: SecureData and OSKeyChainSecureDataStore (which implements the SecureDataStore protocol).

SecureData
============
The SecureData object is used for storing sensitive data securely in memory. It ensures that the memory will automatically be cleared when the object is deallocated so an attacker can't try to read the memory after it has been freed. It also prevents the memory from being paged to disk.

OSKeyChainSecureDataStore
============
The OSKeyChainSecureDataStore class is used to easily persist sensitive data such as private keys to the keychain. The keychain is a tool provided by the operating system. It stores the data on a secure enclave so it is nearly impossible for attackers to access it.

More information about the Apple keychain can be found here: https://developer.apple.com/library/mac/documentation/Security/Conceptual/keychainServConcepts/01introduction/introduction.html
