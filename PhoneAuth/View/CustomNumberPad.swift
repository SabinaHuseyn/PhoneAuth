//
//  CustomNumberPad.swift
//  PhoneAuth
//
//  Created by Sabina Huseynova on 06.12.21.
//

import SwiftUI

struct CustomNumberPad: View {
    @Binding var value: String
    var isVerify: Bool
    var rows = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "", "0", "delete.left"]
    
    var body: some View {
        
        GeometryReader { reader in
            VStack{
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 0), count: 3), spacing: 5){
                    ForEach(rows,id: \.self){value in
                        Button(action: {buttonAction(value: value)}){
                            
                            ZStack{
                                if value == "delete.left" {
                                    Image(systemName: value)
                                        .font(.title2)
                                        .foregroundColor(.black)
                                } else {
                                    
                                    Text(value)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                }
                            }
                            .frame(width: getWidth(width: reader.frame(in: .global).width))
                            .frame(height: getHeight(height: reader.frame(in: .global).height))
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        .disabled(value == "" ? true: false)
                    }
                }
            }
        }
        
    }
    
    func getWidth(width: CGFloat) -> CGFloat{
        let actualWidth = width - 40
        return actualWidth / 3
    }

    func getHeight(height: CGFloat) -> CGFloat{
        let actualHeight = height - 40
        return (actualHeight / 4) > 0 ? (actualHeight / 4) : 0
    }
    
    func buttonAction(value:String){
        if value == "delete.left" && self.value != ""{
            self.value.removeLast()
        }else if value != "delete.left"{
            if isVerify {
                
                if self.value.count < 6 {
                    self.value.append(value)
                }
            } else{
                self.value.append(value)
                
            }
        }
        
    }
}

