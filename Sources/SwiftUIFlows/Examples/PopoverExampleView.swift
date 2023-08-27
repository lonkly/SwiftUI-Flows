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
            //HStack { Spacer() }
            
            Text("Popup 1")
                .font(.title)
                .padding()
            
            Text("Drag a bit to move, or a lot to dismiss, or")
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            
            if showDismissButton {
                HStack {
                    Spacer()
                    Button {
                        flow.dismissPopup()
                    } label: {
                        Text("Dismiss")
                            .tint(.black)
                            .foregroundColor(.black)
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundStyle(Color.primary)
                    Spacer()
                }
            }
            
            Spacer()
        }
        .onAppear {
            print("PopupExample1 appeared")
        }
        .onDisappear {
            print("PopupExample1 disappeared")
        }
        .background(.red)
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
            
            Text("Popup 2")
                .font(.title)
                .padding()
            
            if showDismissButton {
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation {
                            flow.dismissPopup()
                        }
                    } label: {
                        Text("Dismiss")
                            .tint(.black)
                            .foregroundColor(Color.black)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    
                    Spacer()
                }
            }
            
            Spacer()
        }
        .onAppear {
            print("PopupExample2 appeared")
        }
        .onDisappear {
            print("PopupExample2 disappeared")
        }
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
