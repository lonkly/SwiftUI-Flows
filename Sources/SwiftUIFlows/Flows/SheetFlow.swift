//
//  SheetFlow.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 09.06.2023.
//

import Foundation
import SwiftUI

struct SheetFlow: ViewModifier {
    @Binding var presentingView1: AnyView?
    @Binding var presentingView2: AnyView?
    @Binding var presentingView3: AnyView?
    @Binding var presentingView4: AnyView?
    @Binding var presentingView5: AnyView?
    @Binding var presentingView6: AnyView?
    @Binding var presentingView7: AnyView?
    @Binding var presentingView8: AnyView?
    @Binding var presentingView9: AnyView?

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: Binding(
                get: { presentingView1 != nil },
                set: { if !$0 { presentingView1 = nil }}
            )
            ) { presentingView1 }
            .sheet(isPresented: Binding(
                get: { presentingView2 != nil },
                set: { if !$0 { presentingView2 = nil }}
            )
            ) { presentingView2 }
            .sheet(isPresented: Binding(
                get: { presentingView3 != nil },
                set: { if !$0 { presentingView3 = nil }}
            )
            ) { presentingView3 }
            .sheet(isPresented: Binding(
                get: { presentingView4 != nil },
                set: { if !$0 { presentingView4 = nil }}
            )
            ) { presentingView4 }
            .sheet(isPresented: Binding(
                get: { presentingView5 != nil },
                set: { if !$0 { presentingView5 = nil }}
            )
            ) { presentingView5 }
            .sheet(isPresented: Binding(
                get: { presentingView6 != nil },
                set: { if !$0 { presentingView6 = nil }}
            )
            ) { presentingView6 }
            .sheet(isPresented: Binding(
                get: { presentingView7 != nil },
                set: { if !$0 { presentingView7 = nil }}
            )
            ) { presentingView7 }
            .sheet(isPresented: Binding(
                get: { presentingView8 != nil },
                set: { if !$0 { presentingView8 = nil }}
            )
            ) { presentingView8 }
            .sheet(isPresented: Binding(
                get: { presentingView9 != nil },
                set: { if !$0 { presentingView9 = nil }}
            )
            ) { presentingView9 }
    }
}
