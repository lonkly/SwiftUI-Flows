//
//  View+FlowBuilder.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 09.08.2023.
//

import Foundation
import SwiftUI

/// This extension provides the hook method that your parent view, that stores that flow object should have, or the magic won't work. Add one for each type of flows you want to use.
/// Basically what it does it creates bindings for all possible modals, so that you never have to
public extension View {
    @MainActor
    func sheetFlow(_ builder: FlowBuilder) -> some View {
        modifier(SheetFlow(
            presentingView1: builder.binding(keyPath: \.presentingSheet1),
            presentingView2: builder.binding(keyPath: \.presentingSheet2),
            presentingView3: builder.binding(keyPath: \.presentingSheet3),
            presentingView4: builder.binding(keyPath: \.presentingSheet4),
            presentingView5: builder.binding(keyPath: \.presentingSheet5),
            presentingView6: builder.binding(keyPath: \.presentingSheet6),
            presentingView7: builder.binding(keyPath: \.presentingSheet7),
            presentingView8: builder.binding(keyPath: \.presentingSheet8),
            presentingView9: builder.binding(keyPath: \.presentingSheet9)
        ))
    }
    
    @MainActor
    func fullScreenFlow(_ builder: FlowBuilder) -> some View {
        modifier(FullScreenFlow(
            presentingView1: builder.binding(keyPath: \.presentingFullScreen1),
            presentingView2: builder.binding(keyPath: \.presentingFullScreen2),
            presentingView3: builder.binding(keyPath: \.presentingFullScreen3),
            presentingView4: builder.binding(keyPath: \.presentingFullScreen4),
            presentingView5: builder.binding(keyPath: \.presentingFullScreen5),
            presentingView6: builder.binding(keyPath: \.presentingFullScreen6),
            presentingView7: builder.binding(keyPath: \.presentingFullScreen7),
            presentingView8: builder.binding(keyPath: \.presentingFullScreen8),
            presentingView9: builder.binding(keyPath: \.presentingFullScreen9)
        ))
    }
    
    //TODO: Add more Popover Configs
    @MainActor
    func popupFlow(_ builder: FlowBuilder, config: PopoverConfig) -> some View {
        modifier(PopoverFlow(config: config,
                             presentingView1: builder.binding(keyPath: \.presentingPopup1),
                             presentingView2: builder.binding(keyPath: \.presentingPopup2),
                             presentingView3: builder.binding(keyPath: \.presentingPopup3),
                             presentingView4: builder.binding(keyPath: \.presentingPopup4),
                             presentingView5: builder.binding(keyPath: \.presentingPopup5),
                             presentingView6: builder.binding(keyPath: \.presentingPopup6),
                             presentingView7: builder.binding(keyPath: \.presentingPopup7),
                             presentingView8: builder.binding(keyPath: \.presentingPopup8),
                             presentingView9: builder.binding(keyPath: \.presentingPopup9)))
    }
}
