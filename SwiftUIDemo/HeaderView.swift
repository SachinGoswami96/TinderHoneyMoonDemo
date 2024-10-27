//
//  HeaderView.swift
//  SwiftUIDemo
//
//  Created by Mac on 16/10/24.
//

import SwiftUI

struct HeaderView: View {
    @Binding var isShowGuide: Bool
    @Binding var isShowInfo: Bool
    var body: some View {
        HStack (alignment: .center){
            Button {
                print("Info")
                isShowInfo.toggle()
            } label: {
                Image(systemName: "info")
                    .frame(width: 30,height: 30)
                    .foregroundStyle(.black)
                    .overlay(Capsule().stroke(Color.black, lineWidth: 1.5))
            }
            .sheet(isPresented: $isShowInfo) {
                InfoView()
            }
            Spacer()
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
            Spacer()
            Button {
                print("Info")
                isShowGuide.toggle()
            } label: {
                Image(systemName: "questionmark")
                    .frame(width: 30,height: 30)
                    .foregroundStyle(.black)
                    .overlay(Capsule().stroke(Color.black, lineWidth: 1.5))
            }
            .sheet(isPresented: $isShowGuide) {
                GuideView()
            }

        }
        .padding()
    }
}

#Preview {
    @Previewable @State var isShowGuide: Bool = false
    @Previewable @State var isShowInfo: Bool = false
    HeaderView(isShowGuide: $isShowGuide, isShowInfo: $isShowInfo)
}
