//
//  File.swift
//  
//
//  Created by Vivienne Fosh on 24.08.2023.
//

import SwiftUI

// Big popup in the center
struct PopupExampleView: View {
    var showDismissButton = true
    @EnvironmentObject var flow: ExampleFlow
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            HStack { Spacer() }
            Button {} label: {
                Text("Popup 1").bold()
            }
            .padding()
            
            Text("Drag a bit to move, or a lot to dismiss, or").bold()
            
            if showDismissButton {
                HStack {
                    Spacer()
                    Button {
                        flow.dismissPopup()
                    } label: {
                        Text("Dismiss")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.primary)
                    Spacer()
                }
            }
           
            Spacer()
        }
        .onAppear {
            print("Example1 Appeared")
        }
        .onDisappear {
            print("Example1 Disappear")
        }
        .tint(Color.primary)
        .background(Color(red: 51/255, green: 124/255, blue: 207/255))
    }
}

// Small Popover
struct PopupExample2View: View {
    var showDismissButton = true
    @EnvironmentObject var flow: ExampleFlow
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack { Spacer() }
            Spacer()
            if showDismissButton {
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            flow.dismissPopup()
                        }
                    } label: {
                        Text("Dismiss")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.primary)
                    Spacer()
                }
            }
            Button {} label: {
                Text("Popup 2").bold()
            }
            Spacer()
        }
        .onAppear {
            print("Example3 Appeared")
        }
        .onDisappear {
            print("Example3 Disappear")
        }
        .tint(Color.primary)
        .background(Color(red: 20/255, green: 80/255, blue: 163/255))
    }
}

// To see how pure View looks
struct PopupExample2View_Preview: PreviewProvider {
    static var previews: some View {
        PopupExampleView()
            .environmentObject(ExampleFlow(isPresented: .constant(true)))
        PopupExample2View()
            .environmentObject(ExampleFlow(isPresented: .constant(true)))
    }
}
