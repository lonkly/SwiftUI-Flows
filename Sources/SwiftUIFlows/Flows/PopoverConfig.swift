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
    var dismissBySwipe: (() -> Void)?
    
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
    
    
    var borderColor: Color
    var borderWidth: CGFloat
    
    var contentPadding: EdgeInsets
    
    var backgroundBlurRadius: CGFloat
    
    var isDraggable: Bool
    
    var dragRestrictions: DragRestrictions = [.all] // Assuming you'd define a DragRestrictions type
    
    var overlayColor: Color
    
    var interactiveDismissThreshold: CGFloat
    
    public init(width: CGFloat,
                height: CGFloat,
                transition: AnyTransition = .move(edge: .bottom).combined(with: .opacity),
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
                
                onTapPopover: (() -> Void)? = nil,
                borderColor: Color = .clear,
                borderWidth: CGFloat = 0,
                contentPadding: EdgeInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8),
                backgroundBlurRadius: CGFloat = 0,
                isDraggable: Bool = true,
                dragRestrictions: DragRestrictions = [.all],
                
                overlayColor: Color = .black.opacity(0.3),
                interactiveDismissThreshold: CGFloat = 50
    ) {
        self.width = width
        self.height = height
        self.transition = transition
        self.backgroundColor = backgroundColor
        self.dismissOnTapOutside = dismissOnTapOutside
        self.dismissBySwipe = dismissBySwipeDown
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
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.contentPadding = contentPadding
        self.backgroundBlurRadius = backgroundBlurRadius
        self.isDraggable = isDraggable
        self.dragRestrictions = dragRestrictions
        self.overlayColor = overlayColor
        self.interactiveDismissThreshold = interactiveDismissThreshold
    }
}


