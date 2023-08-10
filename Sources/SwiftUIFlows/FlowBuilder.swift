//
//  FlowBuilder.swift
//
//  Created by Vivienne Fosh on 05.06.2023.
//

import Foundation
import SwiftUI

@MainActor open class FlowBuilder: ObservableObject {
    struct State {
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

    /// for sheets use @Environment(\.dismiss) var dismiss
    
    /// Dismiss popups
    @MainActor
    public func dismissPopup() {
        if state.presentingPopup9 != nil {
            state.presentingPopup9 = nil
        } else if state.presentingPopup8 != nil {
            state.presentingPopup8 = nil
        } else if state.presentingPopup7 != nil {
            state.presentingPopup7 = nil
        } else if state.presentingPopup6 != nil {
            state.presentingPopup6 = nil
        } else if state.presentingPopup5 != nil {
            state.presentingPopup5 = nil
        } else if state.presentingPopup4 != nil {
            state.presentingPopup4 = nil
        } else if state.presentingPopup3 != nil {
            state.presentingPopup3 = nil
        } else if state.presentingPopup2 != nil {
            state.presentingPopup2 = nil
        } else if state.presentingPopup1 != nil {
            state.presentingPopup1 = nil
        } else {
            state.isPresented.wrappedValue = false
        }
    }
    
    // Dismiss Full-Screens
    @MainActor
    public func dismissFullScreen() {
        if state.presentingFullScreen9 != nil {
            state.presentingFullScreen9 = nil
        } else if state.presentingFullScreen8 != nil {
            state.presentingFullScreen8 = nil
        } else if state.presentingFullScreen7 != nil {
            state.presentingFullScreen7 = nil
        } else if state.presentingFullScreen6 != nil {
            state.presentingFullScreen6 = nil
        } else if state.presentingFullScreen5 != nil {
            state.presentingFullScreen5 = nil
        } else if state.presentingFullScreen4 != nil {
            state.presentingFullScreen4 = nil
        } else if state.presentingFullScreen3 != nil {
            state.presentingFullScreen3 = nil
        } else if state.presentingFullScreen2 != nil {
            state.presentingFullScreen2 = nil
        } else if state.presentingFullScreen1 != nil {
            state.presentingFullScreen1 = nil
        } else {
            state.isPresented.wrappedValue = false
        }
    }
    
    /// Dismiss sheets
    @MainActor
    func dismissSheet() {
        if state.presentingSheet9 != nil {
            state.presentingSheet9 = nil
        } else if state.presentingSheet8 != nil {
            state.presentingSheet8 = nil
        } else if state.presentingSheet7 != nil {
            state.presentingSheet7 = nil
        } else if state.presentingSheet6 != nil {
            state.presentingSheet6 = nil
        } else if state.presentingSheet5 != nil {
            state.presentingSheet5 = nil
        } else if state.presentingSheet4 != nil {
            state.presentingSheet4 = nil
        } else if state.presentingSheet3 != nil {
            state.presentingSheet3 = nil
        } else if state.presentingSheet2 != nil {
            state.presentingSheet2 = nil
        } else if state.presentingSheet1 != nil {
            state.presentingSheet1 = nil
        } else {
            state.isPresented.wrappedValue = false
        }
    }
}

public extension FlowBuilder {
    @MainActor func presentSheet<V: View>(_ view: V) async {
        if state.presentingSheet1 == nil { state.presentingSheet1 = AnyView(view)
        } else if state.presentingSheet2 == nil { state.presentingSheet2 = AnyView(view)
        } else if state.presentingSheet3 == nil { state.presentingSheet3 = AnyView(view)
        } else if state.presentingSheet4 == nil { state.presentingSheet4 = AnyView(view)
        } else if state.presentingSheet5 == nil { state.presentingSheet5 = AnyView(view)
        } else if state.presentingSheet6 == nil { state.presentingSheet6 = AnyView(view)
        } else if state.presentingSheet7 == nil { state.presentingSheet7 = AnyView(view)
        } else if state.presentingSheet8 == nil { state.presentingSheet8 = AnyView(view)
        } else if state.presentingSheet9 == nil { state.presentingSheet9 = AnyView(view)
        } else {
            // otherwise, our nav is ruined beyoud repair at this point
        }
    }
    
    @MainActor func presentFullScreen<V: View>(_ view: V) async {
        if state.presentingFullScreen1 == nil { state.presentingFullScreen1 = AnyView(view)
        } else if state.presentingFullScreen2 == nil { state.presentingFullScreen2 = AnyView(view)
        } else if state.presentingFullScreen3 == nil { state.presentingFullScreen3 = AnyView(view)
        } else if state.presentingFullScreen4 == nil { state.presentingFullScreen4 = AnyView(view)
        } else if state.presentingFullScreen5 == nil { state.presentingFullScreen5 = AnyView(view)
        } else if state.presentingFullScreen6 == nil { state.presentingFullScreen6 = AnyView(view)
        } else if state.presentingFullScreen7 == nil { state.presentingFullScreen7 = AnyView(view)
        } else if state.presentingFullScreen8 == nil { state.presentingFullScreen8 = AnyView(view)
        } else if state.presentingFullScreen9 == nil { state.presentingFullScreen9 = AnyView(view)
        } else {
            // otherwise, our nav is ruined beyoud repair at this point
        }
    }
    
    @MainActor func presentPopup<V: View>(_ view: V) async {
        if state.presentingPopup1 == nil { state.presentingPopup1 = AnyView(view)
        } else if state.presentingPopup2 == nil { state.presentingPopup2 = AnyView(view)
        } else if state.presentingPopup3 == nil { state.presentingPopup3 = AnyView(view)
        } else if state.presentingPopup4 == nil { state.presentingPopup4 = AnyView(view)
        } else if state.presentingPopup5 == nil { state.presentingPopup5 = AnyView(view)
        } else if state.presentingPopup6 == nil { state.presentingPopup6 = AnyView(view)
        } else if state.presentingPopup7 == nil { state.presentingPopup7 = AnyView(view)
        } else if state.presentingPopup8 == nil { state.presentingPopup8 = AnyView(view)
        } else if state.presentingPopup9 == nil { state.presentingPopup9 = AnyView(view)
        } else {
            // otherwise, our nav is ruined beyoud repair at this point
        }
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
    
    var isPresented: Binding<Bool> { state.isPresented } // this comes from the Host view and is constant at Root
}

private extension FlowBuilder {
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
    
    @MainActor /// One Popover flow is only bound to one config for the sake of saving implementation time
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
