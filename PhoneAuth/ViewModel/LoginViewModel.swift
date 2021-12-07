//
//  LoginViewModel.swift
//  PhoneAuth
//
//  Created by Sabina Huseynova on 05.12.21.
//

import SwiftUI
import Firebase
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var phoneNum = ""
    @Published var code = ""
    @Published var errorMsg = ""
    @Published var error = false
    @Published var CODE = ""
    @Published var gotoVerify = false
    @AppStorage("log_Status") var status = false
    @Published var loading = false
    
    func getCountryCode() -> String {
        let regionCode = Locale.current.regionCode ?? ""
        
        return countries[regionCode] ?? ""
    }
    
    func sendCode() {
        
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        let number = "+\(getCountryCode())\(phoneNum)"
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) {
            (CODE, err) in
            
            if let error = err {
                self.errorMsg = error.localizedDescription
                withAnimation{ self.error.toggle() }
                return
            }
            
                self.CODE = CODE ?? ""
                self.gotoVerify = true
                
        }
    }
    
    func verifyCode() {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.CODE, verificationCode: code)
        
        self.loading = true
        Auth.auth().signIn(with: credential) { (result, err) in
            
            self.loading = false
            
            if let error = err {
                self.errorMsg = error.localizedDescription
                withAnimation{ self.error.toggle() }
                return
            }
            
            withAnimation{ self.status = true }
        }
        
    }
    
    func requestCode(){
        
        sendCode()
        withAnimation{
            self.errorMsg = "Code Sent Successfully"
            self.error.toggle()
        }
    }
}

