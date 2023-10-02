//
//  SheetFlow.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 09.06.2023.
//

import Foundation
import SwiftUI

extension Int: Identifiable {
    public var id: Int { self.hashValue }
}

struct SheetFlowModifier: ViewModifier {
    @ObservedObject var builder: FlowBuilder
    
    private var currentSheet: Binding<Int?> {
        Binding(
            get: {
                return builder.currentSheetIndex
            },
            set: {
                if $0 == nil {
                    builder.dismissSheet()
                }
            }
        )
    }
    
    func body(content: Content) -> some View {
        content
            .sheet(item: currentSheet, onDismiss: {}) { index in
                builder.presentingSheets[index]
            }
    }
}
