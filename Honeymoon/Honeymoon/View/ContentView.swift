//
//  ContentView.swift
//  Honeymoon
//
//  Created by paige on 2021/09/22.
//

import SwiftUI

extension AnyTransition {
    static var trailingBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
}

struct ContentView: View {
    // MARK: - PROPERTIES
    @State var showGuide: Bool = false
    @State var showAlert: Bool = false
    @State var showInfo: Bool = false
    @GestureState private var dragState = DragState.inactive
    //left or right more than 65 degree. standard point
    private var dragThreshold: CGFloat = 65.0
    @State private var lastCardIndex: Int = 1
    // transition type
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    
    // MARK: - CARD VIEWS
    // render only two cards at first
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views
    }()
    
    // MARK: TOP CARD
    // check if cardview is top most card
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: {$0.id == cardView.id}) else {
            return false
        }
        return index == 0
    }
    
    // MARK: - MOVE THE CARD
    private func moveCard() {
        cardViews.removeFirst()
        self.lastCardIndex += 1
        let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]
        let newCardView = CardView(honeymoon: honeymoon)
        cardViews.append(newCardView)
    }
    
    // MARK: - DRAG STATES
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
        
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - HEADER
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            
            Spacer()
            
            // MARK: - CARDS
            ZStack {
                ForEach(cardViews, id: \.id) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        // Show xmark
                        .overlay(
                            ZStack {
                                // X-MARK SYMBOL
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    //if left degree is more than -65 deg and the card is the top most card, then show x mark
                                    .opacity(self.dragState.translation.width < -self.dragThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                
                                // HEART SYMBOL
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    //if RIGHT degree is more than 65 deg and the card is the top most card, then show heart
                                    .opacity(self.dragState.translation.width > self.dragThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            }
                        )
                        // Drag Object - only move top card
                        .offset(x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0)
                        // Scale & Rotation - only apply to top card
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 12) : 0))
                        // Add Smooth Animation when dragging object
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        // Capture Drag Gesture Event
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                                    .sequenced(before: DragGesture())
                                    .updating(self.$dragState, body: { (value, state, transaction) in
                                                switch value {
                                                case .first(true):
                                                    state = .pressing
                                                case .second(true, let drag):
                                                    state = .dragging(translation: drag?.translation ?? .zero)
                                                default:
                                                    break
                                            }
                                        }
                                    )
                                     //Add new transition
                                    .onChanged({(value) in
                                        guard case .second(true, let drag?) = value else { return }
                                        if drag.translation.width < -self.dragThreshold {
                                            self.cardRemovalTransition = .leadingBottom
                                        }
                                        if drag.translation.width > self.dragThreshold {
                                            self.cardRemovalTransition = .trailingBottom
                                        }
                                    })
                                    .onEnded({(value) in
                                        guard case .second(true, let drag?) = value else {
                                            return
                                        }
                                        if drag.translation.width < -self.dragThreshold || drag.translation.width > self.dragThreshold {
                                            playSound(sound: "sound-rise", type: "mp3")
                                            self.moveCard()
                                        }
                                    })
                        )
                        //Add new transition
                        .transition(self.cardRemovalTransition)
                    
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // MARK: - FOOTER
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("SUCCESS"), message: Text("Wishing a lovely and most precious of the times together for the amazing couple."), dismissButton: .default(Text("Happy Honeymoon")))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
