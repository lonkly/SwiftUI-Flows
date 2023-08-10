//
//  FlowBuilder.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 05.06.2023.
//

import Foundation
import SwiftUI

/// This is an Observable class that is open because you will inherit your router from it and might want additional customization
/// FlowBuilder stores all possible states that a single screen of yours can produce.
///
/// It stores all possible bindings and ithe logic here is that if at least one of 9 views exists - show it.
///
@MainActor open class FlowBuilder: ObservableObject {
    public struct State {
        var presentingSheet1: AnyView? = nil
        var presentingSheet2: AnyView? = nil
        var presentingSheet3: AnyView? = nil
        var presentingSheet4: AnyView? = nil
        var presentingSheet5: AnyView? = nil
        var presentingSheet6: AnyView? = nil
        var presentingSheet7: AnyView? = nil
        var presentingSheet8: AnyView? = nil
        var presentingSheet9: AnyView? = nil
        
        var presentingFullScreen1: AnyView? = nil
        var presentingFullScreen2: AnyView? = nil
        var presentingFullScreen3: AnyView? = nil
        var presentingFullScreen4: AnyView? = nil
        var presentingFullScreen5: AnyView? = nil
        var presentingFullScreen6: AnyView? = nil
        var presentingFullScreen7: AnyView? = nil
        var presentingFullScreen8: AnyView? = nil
        var presentingFullScreen9: AnyView? = nil
        
        var presentingPopup1: AnyView? = nil
        var presentingPopup2: AnyView? = nil
        var presentingPopup3: AnyView? = nil
        var presentingPopup4: AnyView? = nil
        var presentingPopup5: AnyView? = nil
        var presentingPopup6: AnyView? = nil
        var presentingPopup7: AnyView? = nil
        var presentingPopup8: AnyView? = nil
        var presentingPopup9: AnyView? = nil
        
        var isPresented: Binding<Bool>
    }
    
    @Published var state: State
    
    public init(isPresented: Binding<Bool>) {
        state = State(isPresented: isPresented)
    }
}

private extension FlowBuilder {
    var isPresentingSheet1: Binding<Bool> { boolBinding(keyPath: \.presentingSheet1) }
    var isPresentingSheet2: Binding<Bool> { boolBinding(keyPath: \.presentingSheet2) }
    var isPresentingSheet3: Binding<Bool> { boolBinding(keyPath: \.presentingSheet3) }
    var isPresentingSheet4: Binding<Bool> { boolBinding(keyPath: \.presentingSheet4) }
    var isPresentingSheet5: Binding<Bool> { boolBinding(keyPath: \.presentingSheet5) }
    var isPresentingSheet6: Binding<Bool> { boolBinding(keyPath: \.presentingSheet6) }
    var isPresentingSheet7: Binding<Bool> { boolBinding(keyPath: \.presentingSheet7) }
    var isPresentingSheet8: Binding<Bool> { boolBinding(keyPath: \.presentingSheet8) }
    var isPresentingSheet9: Binding<Bool> { boolBinding(keyPath: \.presentingSheet9) }
    
    var isPresentingFullScreen1: Binding<Bool> { boolBinding(keyPath: \.presentingFullScreen1) }
    var isPresentingFullScreen2: Binding<Bool> { boolBinding(keyPath: \.presentingFullScreen2) }
    var isPresentingFullScreen3: Binding<Bool> { boolBinding(keyPath: \.presentingFullScreen3) }
    var isPresentingFullScreen4: Binding<Bool> { boolBinding(keyPath: \.presentingFullScreen4) }
    var isPresentingFullScreen5: Binding<Bool> { boolBinding(keyPath: \.presentingFullScreen5) }
    var isPresentingFullScreen6: Binding<Bool> { boolBinding(keyPath: \.presentingFullScreen6) }
    var isPresentingFullScreen7: Binding<Bool> { boolBinding(keyPath: \.presentingFullScreen7) }
    var isPresentingFullScreen8: Binding<Bool> { boolBinding(keyPath: \.presentingFullScreen8) }
    var isPresentingFullScreen9: Binding<Bool> { boolBinding(keyPath: \.presentingFullScreen9) }
    
    var isPresentingPopup1: Binding<Bool> { boolBinding(keyPath: \.presentingPopup1) }
    var isPresentingPopup2: Binding<Bool> { boolBinding(keyPath: \.presentingPopup2) }
    var isPresentingPopup3: Binding<Bool> { boolBinding(keyPath: \.presentingPopup3) }
    var isPresentingPopup4: Binding<Bool> { boolBinding(keyPath: \.presentingPopup4) }
    var isPresentingPopup5: Binding<Bool> { boolBinding(keyPath: \.presentingPopup5) }
    var isPresentingPopup6: Binding<Bool> { boolBinding(keyPath: \.presentingPopup6) }
    var isPresentingPopup7: Binding<Bool> { boolBinding(keyPath: \.presentingPopup7) }
    var isPresentingPopup8: Binding<Bool> { boolBinding(keyPath: \.presentingPopup8) }
    var isPresentingPopup9: Binding<Bool> { boolBinding(keyPath: \.presentingPopup9) }
    
    /// this isPresented comes from the Host view and is .constant(true) at Parent Vie/
    var isPresented: Binding<Bool> { state.isPresented }
}

public extension FlowBuilder {
    func binding<T>(keyPath: WritableKeyPath<State, T>) -> Binding<T> {
        Binding(
            get: { self.state[keyPath: keyPath] },
            set: { self.state[keyPath: keyPath] = $0 }
        )
    }
    
    func boolBinding<T>(keyPath: WritableKeyPath<State, T?>, animated: Bool = false) -> Binding<Bool> {
        Binding(
            get: { self.state[keyPath: keyPath] != nil },
            set: {
                if !$0 {
                    if animated {
                        withAnimation { self.state[keyPath: keyPath] = nil }
                    } else {
                        self.state[keyPath: keyPath] = nil
                    }
                }
            }
        )
    }
}
