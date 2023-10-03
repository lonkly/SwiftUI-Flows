# SwiftUI Flows


![Simulator Screen Recording - iPhone 14 - 2023-10-02 at 21 46 04](https://github.com/lonkly/SwiftUI-Flows/assets/1292110/52e8b6de-edb0-4c9d-b00b-258a9ad946ea)


🚀 SwiftUIFlows: Ultimate Navigation for Apple Ecosystem 🍎

Seamlessly present modal screens, popups, and more in SwiftUI, across iOS and Mac!

📱 What Can SwiftUIFlows Do?

- Full-screen Displays: Dive into immersive content.
- Sheet-styled Modals: Classic, yet elegant.
- Custom-sized Modals: Your size, your rules.
- Popovers: The cherry on top for contextual info.

🌟 Why Choose SwiftUIFlows?

 - Declarative & Clean: Say goodbye to scattered navigation logic and constant flag checking, like @State private var isPresentingMyScreen = false.
 - Streamlined Flows: Easy-to-write navigation flows that save you time and reduce boilerplate. No more manual callbacks and dismissals.
 - Multiple Modals: Show any number of modals in a view, and control their presentation and dismissal with ease.
 - Custom Popups: Design and present popups as unique as your app.

💡 Features At A Glance:

 - Light & Swift: Zero dependencies. Built with the KISS (Keep It Simple, Stupid) principle.
 - Cross-Platform: Designed for both iOS and Mac.
 - Supercharged Fullscreen & Popups: Uses ZStack for native, enhanced presentations.
 - Limitless Customization: Style it, modify it, make it yours.


## Simple FlowBuilder Example:

```
@MainActor class ExampleFlow: FlowBuilder {
    func presentSomePopup()  {
         presentPopup(Example1View(showDismiss: true, flow: self))
    }

    func presentFullScreen()  {
         presentFullScreen(Example2View(showDismiss: true, flow: self))
    }

    func presentAnotherPopup()  {
         presentPopup(Example3View(showDismiss: true, flow: self))
    }
}
```

## [Example Project](https://github.com/lonkly/SwiftUIFlows-Examples)
## Usage Example:

```
     flow.presentSomePopup() // popup
     flow.presentFullScreen() // full-screen
     flow.presentAnotherPopup() // another popup
}
```

## More Avdanced FlowBuilder Example:
```
import SwiftUIFlows

@MainActor class RootFlow: FlowBuilder {
    
    func showVerified(viewModel: AuthVM)  {
         presentFullScreen(
            VerifiedView(viewModel: viewModel, completion: { [weak self] in
                self?.dismissFullScreen()
            })
        )
    }
    
    func showAnythingYouWant(view: AnyView)  {
         presentFullScreen(
            view
                .onAppear {
                        self.dismissFullScreen()
                }
        )
    }
}
```

## Projects already using SwiftUI-Flows:

[Stakes](https://apps.apple.com/us/app/stakes-predict-sports/id1564167571?shortlink=website&c=Website%20Button&pid=Website&af_channel=Website%20Button&source_caller=ui)

### Contributions and feature requests are welcome!
