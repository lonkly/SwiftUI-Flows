//
//  File.swift
//
//
//  Created by Vivienne Fosh on 24.08.2023.
//

import SwiftUI

struct FullscreenExampleView: View {
    var showDismissButton = true
    @EnvironmentObject var flow: ExampleFlow
    
    var body: some View {
        VStack {
            if showDismissButton {
                HStack {
                    Spacer()
                    Button {
                        flow.dismissFullScreen()
                    } label: {
                        Text("Dismiss")
                            .foregroundColor(Color.black)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
            }
            Spacer()
            
            
            Text("FullScreen View")
                .font(.largeTitle)
                .foregroundColor(Color.black)
            
            Spacer()
        }
        .onAppear {
            print("FullScreen appeared")
        }
        .onDisappear {
            print("FullScreen disappeared")
        }
        .foregroundStyle(Color.primary)
        .background(.yellow)
    }
}

// To see how pure View looks
struct FullscreenExampleView_Preview: PreviewProvider {
    static var previews: some View {
        FullscreenExampleView()
            .environmentObject(ExampleFlow(isPresented: .constant(true)))
    }
}
