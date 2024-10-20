//
//  RowComponents.swift
//  SwiftUIDemo
//
//  Created by Mac on 20/10/24.
//

import SwiftUI

struct RowComponents: View {
    var title: String
    var subtitle : String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title2)
                    .foregroundStyle(.gray)
                Spacer()
                Text(subtitle)
                    .font(.title2)
            }
            Divider()
        }
    }
}

#Preview {
    RowComponents(title: "Application", subtitle: "Honeymoon")
}
