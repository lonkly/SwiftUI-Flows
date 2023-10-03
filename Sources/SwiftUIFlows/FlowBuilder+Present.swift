//
//  FlowBuilder+Present.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 09.08.2023.
//

import Foundation
import SwiftUI

/// This extension provides a wrapper, that determines how your router will present the View
public extension FlowBuilder {
    
    /// Present as a native iOS sheet with animation
    @MainActor func presentSheet<V: View>(_ view: V)  {
        presentingSheets.append(AnyView(view))
    }
    
    /// Present as a full-screen
    @MainActor func presentFullScreen<V: View>(_ view: V)  {
        presentingFullScreens.append(AnyView(view))
    }
    
    /// Present as a popup
    @MainActor func presentPopup<V: View>(_ view: V)  {
        presentingPopups.append(AnyView(view))
    }
}
