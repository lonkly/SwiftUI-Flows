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
    
    func presentAll() async {
            
            await flow.presentExample1()
            await flow.presentExample2()
            await anotherFlow.presentExample3()
    }

    var body: some View {
        
        VStack {
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Root View").font(.largeTitle).bold()
                    Text("that shows other after delay").font(.title3).bold()
                }.padding()
                Spacer()
            }
            Spacer()
            Button(action: {
                Task {
                    await presentAll()
                }
            }) {
                Text("Show Everything")
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
            
            
            Spacer()
        }
        
        .onAppear {
            Task {
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                await presentAll()
            }
        }
        
        // This line is required for flow to present full-screen views
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
            width: 120,
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
    func presentExample1() async {
        await presentPopup(PopupExampleView(showDismissButton: true).environmentObject(self))
    }

    func presentExample2() async {
        await presentFullScreen(FullscreenExampleView(showDismissButton: true).environmentObject(self))
    }

    func presentExample3() async {
        await presentPopup(PopupExample2View(showDismissButton: true).environmentObject(self))
    }
}

struct previewz: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

