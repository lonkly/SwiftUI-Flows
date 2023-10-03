# SwiftUI Flows

### A cross-Apple-platform library enabling the native SwiftUI for presenting multiple:
- Full-screens
- Sheet-styled modals
- Сustom-sized models
- Popovers


## Why SwiftUIFlows?
- Extract navigation from the Views
- Do it declaratively, no need to introduce tedious flags `@State private var isPresentingMyScreen = false` anymore
- Yes, finally you can show up to 9 modals in the view and present/dismiss them at any time
- Writing Flows is so simple they will actually take considerably less time to implement at scale because you don't need to write callbacks and dismissals yourself
- Customizable popups


## Features:
- Structured concurrency
- Lightweight, no dependencies, made with KISS in mind
- Works on Mac/iOS
- Native Fullscreen based on ZStack (much better than out-of-the-box ones)
- Native Popups based on ZStack
- Endless possibilities for customization


## Simple FlowBuilder Example:

```
@MainActor class ExampleFlow: FlowBuilder {
    func presentExample1()  {
         presentPopup(Example1View(showDismiss: true, flow: self))
    }

    func presentExample2()  {
         presentFullScreen(Example2View(showDismiss: true, flow: self))
    }

    func presentExample3()  {
         presentPopup(Example3View(showDismiss: true, flow: self))
    }
}
```

## Usage Example:

```

     flow.presentExample1() // popup
     flow.presentExample2() // full-screen
     flow.presentExample3() // another popup
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


### TODO:

- Turn on/off animations
- Test thoroughly

Example Project:
(currently developing a full showcase)
https://github.com/lonkly/SwiftUI-Flows-Examples
