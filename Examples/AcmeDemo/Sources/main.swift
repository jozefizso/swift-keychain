// Copyright 2023 Cisco Systems, Inc.
// Licensed under MIT-style license (see LICENSE.txt file).

import Keychain

struct AcmeAccount: KeychainGenericPasswordType {
    let serviceName = "org.acme.account"
    let accountName: String
    let token: String
    var data = [String: Any]()

    var dataToStore: [String: Any] {
        return ["token": token]
    }
    
    var accessToken: String? {
        return data["token"] as? String
    }
    
    init(email: String, accessToken: String = "") {
        accountName = email
        token = accessToken
    }
}

print("Welcome to Keychain access demo.")

let newAccount = AcmeAccount(email: "coyote@acme.org", accessToken: "AcmeCorp12345")
try newAccount.saveInKeychain()
print("Saved Coyote account to Keychain using \(newAccount.serviceName) key.")

var account = AcmeAccount(email: "coyote@acme.org")
_ = try account.fetchFromKeychain()
print("Account fetched from Keychain.")

if let token = account.accessToken {
    print("  email: \(account.accountName), token: \(token)")
}

try account.removeFromKeychain()
print("Removed the account from Keychain.")

print("Done.")
