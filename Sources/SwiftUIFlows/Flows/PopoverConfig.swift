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
    
    var transition: AnyTransition = .move(edge: .bottom)
    var backgroundColor: Color = Color.black.opacity(0.5)
    
    var dismissOnTapOutside: (() -> Void)?
    var dismissBySwipeDown: (() -> Void)?
    
    var corners: RectCorner = [.topLeft, .topRight, .bottomLeft, .bottomRight]
    var cornerRadius: CGFloat = 12
    
    var shadowColor: Color = .black.opacity(0.12)
    var shadowRadius: CGFloat = 8
    var shadowOffX: CGFloat = 0
    var shadowOffY: CGFloat = -1
    
    var animation: Animation = .default
    
    var horizontalAlignment: HorizontalAlignment = .center
    var verticalAlignment: VerticalAlignment = .bottom
    
    var alignment: Alignment {
        Alignment(horizontal: horizontalAlignment, vertical: verticalAlignment)
    }
    
    var offsetX: CGFloat = 0
    var offsetY: CGFloat = 0
    
    var onTapPopover: (() -> Void)?
}
