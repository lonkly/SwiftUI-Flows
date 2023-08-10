//
//  File.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 09.08.2023.
//

import Foundation

/// These functions can be called on the flow stateobject to dismiss respective modals. 
public extension FlowBuilder {
    
    
    /// Dismisses top-level popup from your View.
    /// 
    @MainActor
    func dismissPopup() {
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
    
    /// Dismisses top-level modal full-screen from your View.
    ///
    @MainActor
    func dismissFullScreen() {
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
    
    /// Dismisses top-level modal sheet from your View.
    ///
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
