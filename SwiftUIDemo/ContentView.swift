//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Sachin Goswami on 14/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShowGuide: Bool = false
    @State var isShowInfo: Bool = false
    
    @State var cards : [CardView] = {
        var cards = [CardView]()
        for item in honeymoonData {
            cards.append(CardView(honeymoon: item))
        }
        return cards
    }()
    @State private var cardOffset = CGSize.zero
    @State private var isSwipedRight = false
    private let dragThreshold: CGFloat = 150.0
    
    var body: some View {
        VStack {
            HeaderView(isShowGuide: $isShowGuide, isShowInfo: $isShowInfo)
            ZStack {
                ForEach(cards.indices, id: \.self) { index in
                    cards[index]
                        .offset(index == cards.count - 1 ? cardOffset : .zero) // Move only top card
                        .rotationEffect(index == cards.count - 1 ? Angle(degrees: Double(cardOffset.width / 10)) : .zero)
                        .overlay(
                            ZStack {
                                // X-MARK SYMBOL (Dislike)
                                Image(systemName: "x.circle")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.red)
                                    .opacity(cardOffset.width < -dragThreshold && index == cards.count - 1 ? 1.0 : 0.0)
                                    .animation(.easeIn(duration: 0.2), value: cardOffset.width)
                                
                                // HEART SYMBOL (Like)
                                Image(systemName: "heart.circle")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.green)
                                    .opacity(cardOffset.width > dragThreshold && index == cards.count - 1 ? 1.0 : 0.0)
                                    .animation(.easeIn(duration: 0.2), value: cardOffset.width)
                            }
                        )
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if index == cards.count - 1 {
                                        cardOffset = gesture.translation
                                    }
                                }
                                .onEnded { gesture in
                                    if index == cards.count - 1 {
                                        if cardOffset.width > 150 {
                                            // Swiped right
                                            isSwipedRight = true
                                        } else if cardOffset.width < -150 {
                                            // Swiped left
                                            isSwipedRight = false
                                        } else {
                                            cardOffset = .zero // Return to original position if not far enough
                                            return
                                        }
                                        
                                        removeCard(index: index)
                                    }
                                }
                        )
                        .animation(.spring(), value: cardOffset)
                }
            }
            FooterView()
        }
        .padding()
    }
    
    private func removeCard(index: Int) {
           // Animate card swipe off the screen
           withAnimation {
               cardOffset = isSwipedRight ? CGSize(width: 600, height: 0) : CGSize(width: -600, height: 0)
           }
           
           // Remove card after the swipe
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
               cards.remove(at: index)
               cardOffset = .zero // Reset offset for the next card
           }
       }
}
#Preview {
    ContentView()
}
