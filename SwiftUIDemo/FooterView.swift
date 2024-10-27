//
//  HeaderView.swift
//  SwiftUIDemo
//
//  Created by Mac on 16/10/24.
//

import SwiftUI

struct FooterView: View {
    @Binding var isShowAlert: Bool
    var body: some View {
        HStack (alignment: .center){
            Button {
                print("Info")
            } label: {
                Image(systemName: "multiply")
                    .foregroundStyle(Color.black)
                    .frame(width: 40,height: 40)
                    .overlay(Capsule().stroke(Color.black, lineWidth: 3))
            }
            Spacer()
            Button {
                print("Book Destination")
                isShowAlert.toggle()
                
            } label: {
                Text("Book Destination")
                    .foregroundStyle(Color.red)
                    .fontWeight(.heavy)
                    .font(.headline)
                    .frame(width: 200,height: 50)
                    .shadow(color: .red.opacity(0.7), radius: 5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.red, lineWidth: 3)
                    }
            }
            .alert( isPresented: $isShowAlert) {
                Alert(title: Text("Booking Successfully"),message: Text("Enjoy Your Honeymoon"),dismissButton: .default(Text("Okay")))
            }


            Spacer()
            Button {
                print("Info")
            } label: {
                Image(systemName: "heart.fill")
                    .foregroundStyle(Color.black)
                    .frame(width: 40,height: 40)
                    .overlay(Capsule().stroke(Color.black, lineWidth: 3))
            }

        }
        .padding()
    }
}

#Preview {
    @Previewable @State var isShowAlert: Bool = false
    FooterView(isShowAlert: $isShowAlert)
}
