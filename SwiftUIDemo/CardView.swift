//
//  CardView.swift
//  SwiftUIDemo
//
//  Created by Sachin Goswami on 16/10/24.
//

import SwiftUI

struct CardView: View {
    var honeymoon : Destination
    var body: some View {
        Image(honeymoon.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(15)
            .padding(20)
            .overlay(
                VStack(alignment: .center,spacing: 15) {
                    Text(honeymoon.place)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.largeTitle)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .background(LinearGradient(colors: [Color.red,Color.blue], startPoint: .leading, endPoint: .bottomTrailing))
                        .cornerRadius(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                        }
                    Text(honeymoon.country)
                        .multilineTextAlignment(.center)
                        .padding(.leading)
                        .padding(.trailing)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.title)
                        .background(.red)
                        .cornerRadius(20)
                
                }
                    .frame(minWidth: 280)
                    .padding(.bottom, 40),
                    alignment: .bottom
            )
            
            
    }
}

#Preview {
    CardView(honeymoon: honeymoonData[0])
        .previewLayout(.fixed(width: 300, height: 500))
}
