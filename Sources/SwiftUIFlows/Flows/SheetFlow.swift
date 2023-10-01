//
//  SheetFlow.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 09.06.2023.
//

import Foundation
import SwiftUI

struct SheetFlowModifier: ViewModifier {
    @ObservedObject var builder: FlowBuilder

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: Binding(
                get: { builder.currentSheetView != nil },
                set: { if !$0 { builder.dismissSheet() }}
            )) {
                if let presentingView = builder.currentSheetView {
                    presentingView
                }
            }
    }
}

extension FlowBuilder {
    var currentSheetView: AnyView? {
        return presentingSheets.last
    }
}
