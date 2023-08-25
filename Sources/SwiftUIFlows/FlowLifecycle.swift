//
//  FlowLifecycle.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 09.08.2023.
//

import Foundation
import SwiftUI

/// Closures won't really work, because there is no way to efficiently update them alongside the View, therefore OnAppear and OnDisappear are provided
extension View {
    func fullscreenOnAppear(_ block: @escaping () -> Void) -> some View {
        environment(\.fullScreensOnAppear, block)
    }
    
    func fullscreenOnDisappear(_ block: @escaping () -> Void) -> some View {
        environment(\.fullScreensOnDisappear, block)
    }
}

/// By default we do nothing.
private struct AppearKey: EnvironmentKey {
    static let defaultValue: (() -> Void) = { }
}

private struct DisappearKey: EnvironmentKey {
    static let defaultValue: (() -> Void) = { }
}


/// These methods will fire on Every onAppear / onDisappear of Every full-screen/ popup / sheet that participates in the flow.
/// I strongly recommend that for general use-cases you still write separate onAppear/onDisappear logic.
extension EnvironmentValues {
    var fullScreensOnAppear: () -> Void {
        get { self[AppearKey.self] }
        set { self[AppearKey.self] = newValue }
    }
    
    var fullScreensOnDisappear: () -> Void {
        get { self[DisappearKey.self] }
        set { self[DisappearKey.self] = newValue }
    }
    
    var popupsOnAppear: () -> Void {
        get { self[AppearKey.self] }
        set { self[AppearKey.self] = newValue }
    }
    
    var popupsOnDisappear: () -> Void {
        get { self[DisappearKey.self] }
        set { self[DisappearKey.self] = newValue }
    }
}
