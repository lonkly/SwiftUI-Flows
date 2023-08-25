//
//  PopoverFlow.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 26.06.2023.
//

import SwiftUI

struct PopoverFlow: ViewModifier {
    
    let config: PopoverConfig
    
    @State private var animationValue = false
    @State private var dragOffset = CGFloat.zero
    
    @Binding var presentingView1: AnyView?
    @Binding var presentingView2: AnyView?
    @Binding var presentingView3: AnyView?
    @Binding var presentingView4: AnyView?
    @Binding var presentingView5: AnyView?
    @Binding var presentingView6: AnyView?
    @Binding var presentingView7: AnyView?
    @Binding var presentingView8: AnyView?
    @Binding var presentingView9: AnyView?
    
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
            ZStack(alignment: config.alignment) {
                config.backgroundColor
                    .ignoresSafeArea()
                    .zIndex(1)
                    .onTapGesture {
                        withAnimation {
                            animationValue = false
                        }
                        config.dismissOnTapOutside?()
                    }
                
                presentingView
                    .frame(width: config.width, height: config.height)
                    .shadow(color: config.shadowColor,
                                    radius: config.shadowRadius,
                                    x: config.shadowOffX,
                                    y: config.shadowOffY)
                    
                    .roundedCorners(radius: config.cornerRadius, corners: config.corners)
                    .zIndex(6669) // always on top
                    .scaleEffect(animationValue ? 1 : 0)
                    .animation(config.animation, value: animationValue)
                    .transition(config.transition)
                    .gesture(
                        DragGesture(minimumDistance: 10 , coordinateSpace: .local)
                            .onChanged { value in
                                if config.dismissBySwipeDown != nil {
                                    dragOffset += value.translation.height
                                }
                            }
                            .onEnded { val in
                                guard val.translation.height > 30 else {
                                    return
                                }
                                withAnimation {
                                    withAnimation {
                                        animationValue = false
                                    }
                                    config.dismissBySwipeDown?()
                                }
                            }
                    )
                    .onAppear {
                        withAnimation {
                            animationValue = true
                        }
                    }
                    .onDisappear {
                        withAnimation {
                            animationValue = false
                            dragOffset = .zero
                        }
                    }
                    .offset(x: config.offsetX, y: config.offsetY + dragOffset)
                    .simultaneousGesture(TapGesture(count: 1).onEnded { config.onTapPopover?() } )
            }
        }
    }
}
