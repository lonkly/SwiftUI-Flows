//
//  SwiftUIFlows.swift
//  Copyright [2023] [Vivienne Fosh]
//
//  Created by Vivienne Fosh on 09.06.2023.
//

import Foundation
import SwiftUI

struct Example1View: View {
    var showDismiss = false
    @StateObject var flow: ExampleFlow
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            if showDismiss {
                HStack {
                    Button {
                        withAnimation {
                            flow.dismissPopup()
                        }
                    } label: {
                        Text("Dismiss")
                    }
                    .tint(Color.primary)
                    Spacer()
                }
            }
            Button {} label: {
                Text("Example1View")
            }
        }
        .onAppear {
            print("Example1 Appeared")
        }
        .onDisappear {
            print("Example1 Disappear")
        }
        .foregroundColor(.blue)
        .background(Color.primary.colorInvert())
    }
}

struct Example2View: View {
    var showDismiss = false
    @StateObject var flow: ExampleFlow
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Spacer()
            HStack { Spacer() }
            if showDismiss {
                HStack {
                    Button {
                        withAnimation {
                            flow.dismissFullScreen()
                        }
                    } label: {
                        Text("Dismiss")
                    }.buttonStyle(.borderedProminent)
                        .tint(Color.primary)
                }
            }
            Button {} label: {
                Text("Example2View")
            }
            Spacer()
        }
        .onAppear {
            print("Example2 Appeared")
        }
        .onDisappear {
            print("Example2 Disappear")
        }.foregroundColor(.blue)
            .tint(Color.primary)
    }
}

struct Example3View: View {
    var showDismiss = false
    @StateObject var flow: ExampleFlow
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            if showDismiss {
                HStack {
                    Button {
                        withAnimation {
                            flow.dismissPopup()
                        }
                    } label: {
                        Text("Dismiss")
                    }.buttonStyle(.borderedProminent)
                        .tint(Color.primary)
                    Spacer()
                }
            }
            Button {} label: {
                Text("Example3View")
            }
        }
        .onAppear {
            print("Example3 Appeared")
        }
        .onDisappear {
            print("Example3 Disappear")
        }.foregroundColor(.blue)
            .tint(Color.primary)
    }
}

struct ExampleView: View {
    @StateObject var flow = ExampleFlow(isPresented: .constant(true))

    var body: some View {
        VStack {
            Spacer()
            Text("RootView")
            Spacer()
        }
        .sheetFlow(flow)
        .onAppear {
            Task {
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                await flow.presentExample1()
                await flow.presentExample2()
                await flow.presentExample3()
            }
        }
        .fullScreenFlow(flow)
        .popupFlow(flow, config: PopoverConfig(
            width: 320,
            height: 80,
            offsetTop: 4,
            dismissOnTapOutside: {
                withAnimation {
                    flow.dismissPopup()
                }
            }
        ))
    }
}

@MainActor class ExampleFlow: FlowBuilder {
    func presentExample1() async {
        await presentPopup(Example1View(showDismiss: true, flow: self))
    }

    func presentExample2() async {
        await presentFullScreen(Example2View(showDismiss: true, flow: self))
    }

    func presentExample3() async {
        await presentPopup(Example3View(showDismiss: true, flow: self))
    }
}

struct previewz: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}

