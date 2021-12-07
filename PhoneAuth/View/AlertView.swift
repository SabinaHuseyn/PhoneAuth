//
//  AlertView.swift
//  PhoneAuth
//
//  Created by Sabina Huseynova on 06.12.21.
//

import SwiftUI

struct AlertView: View {
    var msg: String
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Text("Message")
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            Text(msg)
                .foregroundColor(.gray)
            
            Button(action: {
              show.toggle()
            }, label: {
                Text("Close")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .background(Color("buttonColor"))
                    .cornerRadius(15)
            })
                .frame(alignment: .center)
            
        })
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .padding(.horizontal, 25)
        
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.3).ignoresSafeArea())
                
                }
}
