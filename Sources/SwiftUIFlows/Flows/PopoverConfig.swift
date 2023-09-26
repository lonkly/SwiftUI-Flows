//
//  File.swift
//
//
//  Created by Vivienne Fosh on 24.08.2023.
//

import SwiftUI

public struct PopoverConfig {
    var width: CGFloat
    var height: CGFloat
    
    var transition: AnyTransition
    var backgroundColor: Color
    
    var dismissOnTapOutside: (() -> Void)?
    var dismissBySwipeDown: (() -> Void)?
    
    var corners: RectCorner
    var cornerRadius: CGFloat
    
    var shadowColor: Color
    var shadowRadius: CGFloat
    var shadowOffX: CGFloat
    var shadowOffY: CGFloat
    
    var animation: Animation
    
    var horizontalAlignment: HorizontalAlignment
    var verticalAlignment: VerticalAlignment
    
    var alignment: Alignment {
        Alignment(horizontal: horizontalAlignment, vertical: verticalAlignment)
    }
    
    var offsetX: CGFloat
    var offsetY: CGFloat
    
    var onTapPopover: (() -> Void)?
    
    public init(width: CGFloat,
                height: CGFloat,
                transition: AnyTransition = .move(edge: .bottom),
                backgroundColor: Color = .black.opacity(0.5),
                dismissOnTapOutside: (() -> Void)? = nil,
                dismissBySwipeDown: (() -> Void)? = nil,
                corners: RectCorner = [.topLeft, .topRight, .bottomLeft, .bottomRight],
                cornerRadius: CGFloat = 12,
                
                shadowColor: Color = .black.opacity(0.12),
                shadowRadius: CGFloat = 8,
                shadowOffX: CGFloat = 0,
                shadowOffY: CGFloat = -1,
                
                animation: Animation = .default,
                
                horizontalAlignment: HorizontalAlignment = .center,
                verticalAlignment: VerticalAlignment = .bottom,
                
                offsetX: CGFloat = 0,
                offsetY: CGFloat = 0,
                
                onTapPopover: (() -> Void)? = nil) {
        self.width = width
        self.height = height
        self.transition = transition
        self.backgroundColor = backgroundColor
        self.dismissOnTapOutside = dismissOnTapOutside
        self.dismissBySwipeDown = dismissBySwipeDown
        self.corners = corners
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowOffX = shadowOffX
        self.shadowOffY = shadowOffY
        self.animation = animation
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.onTapPopover = onTapPopover
    }
}
