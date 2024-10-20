//
//  InfoView.swift
//  SwiftUIDemo
//
//  Created by Mac on 20/10/24.
//

import SwiftUI

struct AppInfoData {
    var title: String
    var subTitle: String
}

struct InfoView: View {
    var arrAppInfodata =  arrAppInfo
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 200, height: 10)
                .foregroundStyle(.gray.opacity(0.5))
            Spacer(minLength: 20)
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Spacer(minLength: 30)
            Text("App Info")
                .foregroundStyle(.red)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            
            VStack {
                ForEach(arrAppInfodata.indices, id: \.self) { index in
                    RowComponents(title: arrAppInfodata[index].title, subtitle: arrAppInfodata[index].subTitle)
                }
                
            }
            .padding(.top)
            .padding(.bottom)
            Text("Credits")
                .foregroundStyle(.red)
                .font(.largeTitle)
                .fontWeight(.heavy)
            RowComponents(title: "Photos", subtitle: "UnSplash")
            Text("Photographers")
                .frame(maxWidth: .infinity,alignment: .leading)
                .font(.title2)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.leading)
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .padding(.top,5)
            
            Spacer(minLength: 20)
            Button {
                print("Tap Continue")
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Continue")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.red)
            .clipShape(.capsule)
        }
        .padding(25)
                
                
    }
}

#Preview {
    InfoView()
}
