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
    func presentSheet<V: View>(_ view: V) {
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
            // otherwise, our nav is ruined beyoud repair at this point. do nothing
        }
    }
    
    /// Present as a full-screen
    func presentFullScreen<V: View>(_ view: V) {
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
    
    /// Present as a popup
    func presentPopup<V: View>(_ view: V) {
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
