//
//  FlowBuilder.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 05.06.2023.
//

import Foundation
import SwiftUI

@MainActor open class FlowBuilder: ObservableObject {
    @Published var presentingSheets: [AnyView] = []
    @Published var presentingFullScreens: [AnyView] = []
    @Published var presentingPopups: [AnyView] = []
    
    @Published var isPresented: Binding<Bool>
    
    var currentSheetIndex: Int? {
        presentingSheets.isEmpty ? nil : presentingSheets.count - 1
    }
    
    var currentPopoverIndex: Int? {
        presentingPopups.isEmpty ? nil : presentingPopups.count - 1
    }
    
    var currentFullscreenIndex: Int? {
        presentingFullScreens.isEmpty ? nil : presentingFullScreens.count - 1
    }
    
    public init(isPresented: Binding<Bool>) {
        self.isPresented = isPresented
    }
    
    public func addPopup(_ view: AnyView) {
        presentingPopups.append(view)
    }
    
    public func addFullScreen(_ view: AnyView) {
        presentingFullScreens.append(view)
    }
    
    public func addSheet(_ view: AnyView) {
        presentingSheets.append(view)
    }
}
