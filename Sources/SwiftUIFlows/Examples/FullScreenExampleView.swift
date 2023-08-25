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
                            .bold()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
            }
            Spacer()
            
            Button {} label: {
                Text("FullScreen View")
                    .bold()
            }
            Spacer()
        }
        .onAppear {
            print("Example2 Appeared")
        }
        .onDisappear {
            print("Example2 Disappear")
        }
        .tint(Color.primary)
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
