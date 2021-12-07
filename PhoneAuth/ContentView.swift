//
//  ContentView.swift
//  PhoneAuth
//
//  Created by Sabina Huseynova on 05.12.21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_Status") var status = false

    var body: some View {
        
        ZStack {
            
            if status {
               Home()
            } else {
                
                NavigationView{
                    
                    Login()
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
