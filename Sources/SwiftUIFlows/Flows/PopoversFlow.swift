//
//  PopoverFlow.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 26.06.2023.
//

import Foundation
import SwiftUI

public struct PopoverConfig {
    var width: CGFloat
    var height: CGFloat
    var offsetTop: CGFloat = 1
    var transition: AnyTransition = .move(edge: .bottom)
    var backgroundColor: Color = Color.white
    var shadowColor: Color = Color.gray
    var dismissOnTapOutside: (() -> Void)?
    var dismissBySwipeDown: (() -> Void)?
}

struct PopoverFlow: ViewModifier {
    @State private var offset = CGFloat.zero
    
    let config: PopoverConfig
    
    @Binding var presentingView1: AnyView?
    @Binding var presentingView2: AnyView?
    @Binding var presentingView3: AnyView?
    @Binding var presentingView4: AnyView?
    @Binding var presentingView5: AnyView?
    @Binding var presentingView6: AnyView?
    @Binding var presentingView7: AnyView?
    @Binding var presentingView8: AnyView?
    @Binding var presentingView9: AnyView?
    
    @Environment(\.popupsOnAppear) var onAppear
    @Environment(\.popupsOnDisappear) var onDisappear
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
            presentedView
        }
    }
    
    @ViewBuilder
    var presentedView: some View {
        let part1 = presentingView9 ?? presentingView8 ?? presentingView7 ?? presentingView6 ?? presentingView5
        let part2 = presentingView4 ?? presentingView3 ?? presentingView2 ?? presentingView1
        if let presentingView = part1 ?? part2 { // haha, swift compiler, deal with it
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .zIndex(1)
                .onTapGesture {
                    config.dismissOnTapOutside?()
                }
            
            presentingView
                .frame(width: config.width, height: config.height)
                .clipShape(
                    Rectangle()
                )
                .padding(.top, config.offsetTop)
                .background(
                    ZStack {
                        //                        config.shadowColor
                        //                            .cornerRadius(12, corners: [.topLeft, .topRight])
                        config.backgroundColor
                            .roundedCorners(radius: 12, corners: [.topLeft, .topRight])
                            .padding(.top, 1)
                    }.shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: -1)
                        .edgesIgnoringSafeArea(.bottom)
                ).zIndex(6669) // always on top
                .transition(config.transition)
                .gesture(
                    DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onChanged { value in
                            if config.dismissBySwipeDown != nil {
                                offset += value.translation.height
                            }
                        }
                        .onEnded { _ in
                            withAnimation {
                                config.dismissBySwipeDown?()
                            }
                        }
                )
                .onAppear { onAppear() }
                .onDisappear { onDisappear() }
        }
    }
}
