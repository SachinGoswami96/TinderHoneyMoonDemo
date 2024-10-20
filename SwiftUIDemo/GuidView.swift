//
//  GuidView.swift
//  SwiftUIDemo
//
//  Created by Mac on 19/10/24.
//

import SwiftUI

struct GuideView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 150, height: 10)
                .padding()
                .foregroundStyle(.gray.opacity(0.5))
//            Spacer(minLength: 20)
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
            Spacer(minLength: 25)
            Text("Get Started!")
                .foregroundStyle(.red)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Spacer(minLength: 20)
            Text("Discover and pick the perfect destination for your romantic Honeymoon!")
                .foregroundStyle(.black)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .padding(20)
            Spacer(minLength: 20)
            
            VStack (alignment: .leading, spacing: 15){
                GuideComponent(
                    title: "Like",
                    subtitle: "Swipe right",
                    description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favourites.",
                    icon: "heart.circle")
                
                
                GuideComponent(
                    title: "Dismiss",
                    subtitle: "Swipe left",
                    description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.",
                    icon: "xmark.circle")
                
                GuideComponent(
                    title: "Book",
                    subtitle: "Tap the button",
                    description: "Our selection of honeymoon resorts is perfect setting for you to embark your new life together.",
                    icon: "checkmark.square")
            }
            .padding(.top)
            .padding(.bottom)
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
        .padding(.leading)
        .padding(.trailing)
    }
}

#Preview {
    GuideView()
}
