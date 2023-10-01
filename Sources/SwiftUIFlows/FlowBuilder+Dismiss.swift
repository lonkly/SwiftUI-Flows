//
//  File.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 09.08.2023.
//

import Foundation
import SwiftUI

@MainActor public extension FlowBuilder {
    
    @MainActor private func dismissFromTop(of presentations: inout [AnyView]) {
        if !presentations.isEmpty {
            presentations.removeLast()
        } else {
            isPresented.wrappedValue = false
        }
    }
    
    /// Dismisses top-level popup from your View.
    @MainActor func dismissPopup() {
        dismissFromTop(of: &presentingPopups)
    }
    
    /// Dismisses top-level modal full-screen from your View.
    @MainActor func dismissFullScreen() {
        dismissFromTop(of: &presentingFullScreens)
    }
    
    /// Dismisses top-level modal sheet from your View.
    func dismissSheet() {
          _ = self.presentingSheets.popLast()
      }

    
}
