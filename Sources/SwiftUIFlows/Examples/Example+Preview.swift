//
//  SwiftUIFlows.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 09.06.2023.
//

import Foundation
import SwiftUI

/// This is an example, showing that any view can hold it's own flow and be able to present other screens or popups I do not recommend passing flows to nested views as it creates unnecessary binding, but it is totally legal to do so, because FlowBuilder is a class. Provided that you have only 1 flow at a time it is safe to pass it through @EnvironmentObject
struct ContentView: View {
    @StateObject var flow = ExampleFlow(isPresented: .constant(true))
    
    @StateObject var anotherFlow = ExampleFlow(isPresented: .constant(true))
    
    func presentAll() {
        
        flow.presentExample1()
        flow.presentExample2()
        anotherFlow.presentExample3()
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Root View")
                        .font(.largeTitle)
                    Text("shows fullscreen and 2 popups after delay. tap the button to invoke manually")
                        .font(.title3)
                }
                .padding()
                .foregroundStyle(.black)
                
                Spacer()
            }
            
            Spacer()
            
            Button(action: {
              
                  presentAll()
                
            }) {
                Text("Show Everything")
                    .font(.title3)
                    .tint(.black)
                    .foregroundColor(.black)
            }
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.black)
            
            
            Spacer()
        }
        
        .onAppear {
        
              //  try? await Task.sleep(nanoseconds: 3_000_000_000)
                presentAll()
            
        }
        
        // This line is required for flow to present native iOS sheets
        .sheetFlow(flow)
        // This line is required for flow to present full-screen views
        .fullScreenFlow(flow)
        // This line is required for flow to present popovers. You can provide different configs for respective flows
        .popupFlow(flow, config: PopoverConfig(
            width: 320,
            height: 300,
            dismissOnTapOutside: {
                flow.dismissPopup()
            },
            dismissBySwipeDown: {
                flow.dismissPopup()
            },
            verticalAlignment: .center
        ))
        .popupFlow(anotherFlow, config: PopoverConfig(
            width: 180,
            height: 200,
            dismissOnTapOutside: {
                anotherFlow.dismissPopup()
            },
            dismissBySwipeDown: {
                anotherFlow.dismissPopup()
            },
            horizontalAlignment: .trailing,
            verticalAlignment: .top,
            offsetX: -20,
            offsetY: 10
        ))
        .background(Color.purple)
        
    }
}

@MainActor open class ExampleFlow: FlowBuilder {
    func presentExample1() {
        presentPopup(
            PopupExampleView(showDismissButton: true)
                .environmentObject(self)
        )
    }
    
    /// only thing special about these methods is how you actually want to present you view - via popup, fullscreen or a modal sheet.
    func presentExample2() {
        presentFullScreen(
            FullscreenExampleView(showDismissButton: true)
                .environmentObject(self)
        )
    }
    
    func presentExample3() {
        presentPopup(
            PopupExample2View(showDismissButton: true)
                .environmentObject(self)
        )
    }
}

struct previewz: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

