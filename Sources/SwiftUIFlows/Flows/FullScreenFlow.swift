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

struct FullScreenFlowModifier: ViewModifier {
    @ObservedObject var builder: FlowBuilder
    
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
        if let presentingView = builder.currentFullScreenView {
            presentingView
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all, edges: .bottom)
                .zIndex(100)
            
        }
    }
}

extension FlowBuilder {
    var currentFullScreenView: AnyView? {
        guard let idx = currentFullscreenIndex else { return nil }
        return presentingFullScreens[idx]
    }
}
