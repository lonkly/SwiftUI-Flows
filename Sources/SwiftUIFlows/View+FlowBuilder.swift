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
    @MainActor func sheetFlow(_ builder: FlowBuilder) -> some View {
        return self.modifier(SheetFlowModifier(builder: builder))
    }
    
    
    @MainActor func fullScreenFlow(_ builder: FlowBuilder) -> some View {
        self.modifier(FullScreenFlowModifier(builder: builder))
    }
    
    
    @MainActor func popupFlow(_ builder: FlowBuilder, config: PopoverConfig) -> some View {
        return self.modifier(PopoverFlowModifier(config: config, builder: builder))
    }
}
