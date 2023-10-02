//
//  PopoverFlow.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 26.06.2023.
//

import SwiftUI

struct PopoverFlowModifier: ViewModifier {
    
    let config: PopoverConfig
    
    @State private var animationValue = false
    @State private var dragOffset = CGSize.zero
    
    @ObservedObject var builder: FlowBuilder
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
            presentedView
        }
    }
    
    @ViewBuilder
    var presentedView: some View {
        if let presentingView = builder.currentPopoverView {
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
                    .padding(config.contentPadding)
                    .background(
                        RoundedRectangle(cornerRadius: config.cornerRadius)
                            .strokeBorder(config.borderColor, lineWidth: config.borderWidth)
                    )
                    .shadow(color: config.shadowColor,
                            radius: config.shadowRadius,
                            x: config.shadowOffX,
                            y: config.shadowOffY)
                
                    .roundedCorners(radius: config.cornerRadius, corners: config.corners)
                    .zIndex(6669) // always on top
                    .scaleEffect(animationValue ? 1 : 0)
                    .animation(config.animation, value: animationValue)
                    .transition(config.transition)
                    .gesture((config.isDraggable || (config.dismissBySwipe != nil)) ?
                             DragGesture(minimumDistance: 10 , coordinateSpace: .local)
                        .onChanged { value in
                            if config.dismissBySwipe != nil || config.isDraggable {
                                if config.dragRestrictions.contains(.up) && value.translation.height < 0 {
                                    dragOffset.height += value.translation.height
                                }
                                if config.dragRestrictions.contains(.down) && value.translation.height > 0 {
                                    dragOffset.height += value.translation.height
                                }
                                if config.dragRestrictions.contains(.left) && value.translation.width < 0 {
                                    dragOffset.width += value.translation.width
                                }
                                if config.dragRestrictions.contains(.right) && value.translation.width > 0 {
                                    dragOffset.width += value.translation.width
                                }
                            }
                        }
                        .onEnded { val in
                            guard config.dismissBySwipe != nil || config.isDraggable else { return }
                            
                            let exceededHeightThreshold = abs(val.translation.height + val.predictedEndTranslation.height) > config.interactiveDismissThreshold
                            let exceededWidthThreshold = abs(val.translation.width + val.predictedEndTranslation.width) > config.interactiveDismissThreshold
                            
                            let swipeVertical = (config.dragRestrictions.contains(.up) || config.dragRestrictions.contains(.down)) && exceededHeightThreshold
                            let swipeHorizontal = (config.dragRestrictions.contains(.left) || config.dragRestrictions.contains(.right)) && exceededWidthThreshold
                            
                            if swipeVertical || swipeHorizontal {
                                withAnimation {
                                    animationValue = false
                                }
                                config.dismissBySwipe?()
                            }
                        } : nil
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
                    .offset(x: config.offsetX + dragOffset.width, y: config.offsetY + dragOffset.height)
                    .simultaneousGesture(TapGesture(count: 1).onEnded { config.onTapPopover?() } )
            }
        }
    }
}

extension FlowBuilder {
    var currentPopoverView: AnyView? {
        guard let idx = currentPopoverIndex else { return nil }
        return presentingPopups[idx]
    }
}
