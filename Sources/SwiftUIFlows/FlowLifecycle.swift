//
//  File.swift
//  
//
//  Created by Vivienne Fosh on 09.08.2023.
//

import Foundation
import SwiftUI

extension View {
    func flowOnAppear(_ block: @escaping () -> Void) -> some View {
        environment(\.flowOnAppear, block)
    }
    
    func flowOnDisappear(_ block: @escaping () -> Void) -> some View {
        environment(\.flowOnDisappear, block)
    }
}

private struct AppearKey: EnvironmentKey {
    static let defaultValue: (() -> Void) = { }
}

private struct DisappearKey: EnvironmentKey {
    static let defaultValue: (() -> Void) = { }
}

extension EnvironmentValues {
    var flowOnAppear: () -> Void {
        get { self[AppearKey.self] }
        set { self[AppearKey.self] = newValue }
    }
    
    var flowOnDisappear: () -> Void {
        get { self[DisappearKey.self] }
        set { self[DisappearKey.self] = newValue }
    }
}
