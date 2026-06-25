# iOS Tutorials

A collection of small projects and demos from when I was first learning iOS development — mostly in Objective-C, some in Swift. Back when every concept felt like a mountain to climb.

---

## Why This Repo Exists

I started iOS development at a time when getting a button on screen meant understanding `[[UIButton alloc] initWithFrame:...]`, nesting views manually, and debugging `IBOutlet` connections that would silently fail. There was no SwiftUI, no live preview, and StackOverflow answers assumed you already knew ARC, blocks, and delegate patterns.

This repo is just a humble collection of my early experiments — the small projects I built to understand one concept at a time. Nothing fancy, but each folder taught me something that I still carry today.

---

## What's Inside

| Project | What It Is | Why It Mattered |
|---------|-----------|----------------|
| **button demo** | Adding image insets to a UIButton | One of the first things I did — learning how to style a button, add padding, and make it not look terrible. Back then, even getting an image centered in a button required `UIEdgeInsets` and `CGRect` math. |
| **XibDemo** | Login screen built with `.xib` files | `.xib` files were the standard way to design UI before Storyboards took over. You'd drag a button in Interface Builder, connect it via `IBOutlet`, wire the action via `IBAction`, and hope the connection stuck. This folder was my introduction to Interface Builder. |
| **blockDemo** | Objective-C Blocks | Blocks in Objective-C were confusing. The syntax `^(void) { ... }` looked alien coming from C-style languages. This demo helped me understand what blocks are and how they're used for closures, completion handlers, and UI animations. |
| **TableViewDemo** | `UITableView` basics | Table views were everywhere in iOS back then. Every app used `UITableView` for lists. Learning `numberOfRowsInSection`, `cellForRowAtIndexPath`, and cell reuse meant understanding the foundation of iOS list UI. |
| **Tab bar navigation** | Tab bar controller with navigation | Tab bar controllers were (and still are) the go-to for navigation between major sections of an app. This demo covered wired-up tab bar controllers, navigation stack pushes, and how view controllers talk to each other. |
| **ToDoList** | A simple todo app | My first real-ish app. CoreData or just an array — doesn't matter. What mattered was tying UI, data, and interaction together. It's where table views, navigation, and user input all come together. |
| **Trie Algorithm.playground** | Trie data structure in a Swift playground | A Swift playground experiment implementing a Trie. This was when I was exploring data structures in Swift — learning the language while practicing algorithms. Playgrounds were a game changer for quick experimentation. |
| **SwiftUIdemo** | First steps with SwiftUI | By the time SwiftUI came out, most of this repo was already Objective-C. This folder is where I dipped into the declarative future — `VStack`, `Text`, `Button`, and realizing how much simpler UI code could be. |

---

## A Glimpse Into How Things Were

### Objective-C

Most of the code here is written in **Objective-C** — the language that built iOS before Swift. The square brackets, the colons in method names, the `@"string"` literals, the `alloc/init/release` pattern. It reads like a telegram, but it forced you to understand memory, pointers, and the runtime in a way Swift abstracts away.

### No CocoaPods (at first)

Dependency management meant manually adding frameworks, copying `.a` files, and configuring build phases. CocoaPods came later and felt like stepping into the future.

### Debugging Was an Art Form

The debugger, `NSLog`, and ```objc
[NSString stringWithFormat:@"%p", myObject]
```
were our best friends. Xcode would sometimes just crash without a clear reason, and you'd spend an hour figuring out you forgot to connect an outlet.

---

## The Transition

Around the middle of my iOS journey, **Swift** arrived. Suddenly, memory management was automatic with ARC, optionals kept you honest, and the syntax became readable. Then **SwiftUI** came along and flipped the entire UI paradigm from imperative to declarative.

This repo captures both eras — the slow, deliberate, sometimes painful learning curve of Objective-C/UIKit, and the early excitement of Swift and its playgrounds.

---

## License

GPL-3.0
