//
//  FullScreenFlow.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 09.06.2023.
//

import Foundation
import SwiftUI
import SwiftUIIntrospect
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

struct FullScreenFlow: ViewModifier {
    @Binding var presentingView1: AnyView?
    @Binding var presentingView2: AnyView?
    @Binding var presentingView3: AnyView?
    @Binding var presentingView4: AnyView?
    @Binding var presentingView5: AnyView?
    @Binding var presentingView6: AnyView?
    @Binding var presentingView7: AnyView?
    @Binding var presentingView8: AnyView?
    @Binding var presentingView9: AnyView?
    
    #if os(iOS)
    @State private var tabBar: UITabBar?
    #endif
    
    @Environment(\.fullScreensOnAppear) var onAppear
    @Environment(\.fullScreensOnDisappear) var onDisappear

    func body(content: Content) -> some View {
        ZStack {
            content

            if #available(iOS 16.0, *) {
                overlay
                    .toolbar(.hidden)
                    .onAppear { onAppear() }
                    .onDisappear { onDisappear() }
                    .transition(.move(edge: .bottom))
            } else {
                overlay
#if os(iOS)
                    .introspect(.tabView, on: .iOS(.v15)) { tabbarVC in
                        tabBar = tabbarVC.tabBar
                        tabBar?.isHidden = true
                        
                    }
#endif
                    .onAppear { onAppear() }
                    .onDisappear {
#if os(iOS)
                        tabBar?.isHidden = false
#endif
                        onDisappear()
                    }
                    .transition(.move(edge: .bottom))
            }
            
        }
    }

    @ViewBuilder
    var overlay: some View {
        let part1 = presentingView9 ?? presentingView8
        let part2 = presentingView7 ?? presentingView6
        let part3 = presentingView5 ?? presentingView4
        let part4 = presentingView3 ?? presentingView2
        if let presentingView = part1 ?? part2 ?? part3 ?? part4 ?? presentingView1 { // haha, swift compiler, deal with it
            presentingView
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                //.ignoresSafeArea(.all, edges: .bottom)
                .zIndex(100)
                
        }
    }
}
