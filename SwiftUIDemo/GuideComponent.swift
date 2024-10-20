//
//  GuideComponent.swift
//  SwiftUIDemo
//
//  Created by Mac on 19/10/24.
//

import SwiftUI

struct GuideComponent: View {
    var title :String
    var subtitle :String
    var description :String
    var icon :String
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: icon)
                .resizable()
                .foregroundStyle(.red)
                .frame(width: 50,height: 50)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Spacer()
                    Text(subtitle)
                        .foregroundStyle(.red)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .padding(.trailing)
                }
                
                Divider().padding(.top,-10)
//                Divider()
                Text(description)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    GuideComponent(
        title: "Title",
        subtitle: "Swipe right",
        description: "This is a placeholder sentence. This is a placeholder sentence. This is a placeholder sentence.",
        icon: "heart.circle")
}
