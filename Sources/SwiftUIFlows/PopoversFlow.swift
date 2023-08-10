//
//  PopoverFlow.swift
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
        }
    }
}


struct RectCorner: OptionSet {
    
    let rawValue: Int
    
    static let topLeft = RectCorner(rawValue: 1 << 0)
    static let topRight = RectCorner(rawValue: 1 << 1)
    static let bottomRight = RectCorner(rawValue: 1 << 2)
    static let bottomLeft = RectCorner(rawValue: 1 << 3)
    
    static let allCorners: RectCorner = [.topLeft, topRight, .bottomLeft, .bottomRight]
}


struct RoundedCornersShape: Shape {
    
    var radius: CGFloat = .zero
    var corners: RectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let p1 = CGPoint(x: rect.minX, y: corners.contains(.topLeft) ? rect.minY + radius  : rect.minY )
        let p2 = CGPoint(x: corners.contains(.topLeft) ? rect.minX + radius : rect.minX, y: rect.minY )
        
        let p3 = CGPoint(x: corners.contains(.topRight) ? rect.maxX - radius : rect.maxX, y: rect.minY )
        let p4 = CGPoint(x: rect.maxX, y: corners.contains(.topRight) ? rect.minY + radius  : rect.minY )
        
        let p5 = CGPoint(x: rect.maxX, y: corners.contains(.bottomRight) ? rect.maxY - radius : rect.maxY )
        let p6 = CGPoint(x: corners.contains(.bottomRight) ? rect.maxX - radius : rect.maxX, y: rect.maxY )
        
        let p7 = CGPoint(x: corners.contains(.bottomLeft) ? rect.minX + radius : rect.minX, y: rect.maxY )
        let p8 = CGPoint(x: rect.minX, y: corners.contains(.bottomLeft) ? rect.maxY - radius : rect.maxY )
        
        
        path.move(to: p1)
        path.addArc(tangent1End: CGPoint(x: rect.minX, y: rect.minY),
                    tangent2End: p2,
                    radius: radius)
        path.addLine(to: p3)
        path.addArc(tangent1End: CGPoint(x: rect.maxX, y: rect.minY),
                    tangent2End: p4,
                    radius: radius)
        path.addLine(to: p5)
        path.addArc(tangent1End: CGPoint(x: rect.maxX, y: rect.maxY),
                    tangent2End: p6,
                    radius: radius)
        path.addLine(to: p7)
        path.addArc(tangent1End: CGPoint(x: rect.minX, y: rect.maxY),
                    tangent2End: p8,
                    radius: radius)
        path.closeSubpath()
        
        return path
    }
}

extension View {
    func roundedCorners(radius: CGFloat, corners: RectCorner) -> some View {
        clipShape( RoundedCornersShape(radius: radius, corners: corners) )
    }
}
