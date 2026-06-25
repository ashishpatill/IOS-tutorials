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
| **ToDoList** | A simple todo app | My first real-ish app. Tying UI, data, and interaction together. It's where table views, navigation, and user input all come together. |
| **Trie Algorithm.playground** | Trie data structure in a Swift playground | A Swift playground experiment implementing a Trie. This was when I was exploring data structures in Swift — learning the language while practicing algorithms. Playgrounds were a game changer for quick experimentation. |
| **SwiftUIdemo** | First steps with SwiftUI | By the time SwiftUI came out, most of this repo was already Objective-C. This folder is where I dipped into the declarative future — `VStack`, `Text`, `Button`, and realizing how much simpler UI code could be. |
| **CustomCell** | Custom table view cell | Standard `UITableViewCell` wasn't enough. This was where I learned to subclass cells, add custom subviews, and style each row to look like it actually belonged in the app. |
| **CustomPicker** | `UIPickerView` implementation | Picking dates, states, or custom values — `UIPickerView` required implementing delegate and data source methods, and it was one of the trickier UIKit components to get working. |
| **FBLogin** | Facebook SDK login integration | Adding third-party login was a rite of passage. This involved embedding the Facebook SDK, handling app ID configuration, and dealing with URL scheme callbacks — all before Sign in with Apple existed. |
| **GetDataFromApi** | Basic networking / API call | Making a simple API call in Objective-C with `NSURLSession` or `NSURLConnection` (depending on which iOS version I was targeting). This was my introduction to async callbacks and JSON parsing. |
| **BucketListWithApi** | Bucket list app with network calls | Taking the API calls from `GetDataFromApi` and combining them with a UI. Building a list that fetches data and displays it in a table view. |
| **BucketListWithCoreData** | Bucket list app with CoreData | Same concept but using CoreData for persistence instead of an API. Learning to create entities, manage contexts, and handle the CoreData stack was a whole other beast. |
| **DictionaryDemo** | Dictionary usage in Objective-C | `NSDictionary` and `NSMutableDictionary` — learning how to store and retrieve key-value pairs in Obj-C without Swift's nice `String` keys and type inference. |
| **OptionalDemo-master** | Handling optionals in Swift | A dedicated demo for Swift optionals — the `if let`, `guard let`, and `??` operators that keep your code safe from nil crashes. |
| **Delegates.playground** | Delegate pattern in Swift | The delegate pattern is fundamental to iOS. This playground was where I practiced defining protocols, setting delegates, and making view controllers talk to each other the "correct" way. |
| **SearchDemo** | Search bar / search functionality | Adding a search bar to filter a table view. This meant wiring up `UISearchBar` delegate methods and dynamically updating the data source as the user typed. |
| **Programmatic Navigation** | Navigation without Storyboards | Programmatically pushing view controllers using `UINavigationController`. No segues, no Storyboards — just code. This was the "pure" way to navigate before Storyboards became the default. |
| **Assignment** | General / school assignment | A generic folder from an iOS-related assignment — probably covering a mix of UI and logic. One of the early learning exercises. |
| **DisableBackspaceDemo** | UITextField input restriction | Controlling what a user can type in a text field by implementing `UITextFieldDelegate`. A small but useful trick for things like phone number formatting or blocking certain keys. |
| **Progressive-Image-Download** | Progressive image download demo | Downloading images progressively — loading them in chunks or with a placeholder. A step above basic `SDWebImage` or async image loading. |
| **CustomPicker** | Custom picker view | A custom `UIPickerView` implementation for picking from a dynamic or non-standard set of values. |
| **OptionalDemo-master** | Swift optionals demo | Focused practice on Swift's optional system — unwrapping, chaining, and safe access patterns. |

---

## A Glimpse Into How Things Were

### Objective-C

Most of the code here is written in **Objective-C** — the language that built iOS before Swift. The square brackets, the colons in method names, the `@"string"` literals, the `alloc/init/release` pattern. It reads like a telegram, but it forced you to understand memory, pointers, and the runtime in a way Swift abstracts away.

### Manual Memory Management

Before ARC became the default, we manually managed memory with `retain`, `release`, and `autorelease`. Forget to release? Memory leak. Release too early? Crash. ARC felt like magic when it arrived, but back then it was just another Friday night debugging session.

### No SwiftUI, No Live Previews

Back then, you wrote code, built the app, ran the simulator (which took 30 seconds on a good day), navigated to the screen, checked if something was 2 pixels off, went back, tweaked, rebuilt. Repeat. Live previews? Instant UI feedback? Those felt like science fiction.

### Interface Builder (.xib files)

The glorious `.xib` files. You'd design your UI in Interface Builder, then spend hours wiring up `IBOutlet` and `IBAction` connections. One broken connection and your button just... didn't work. No error, no warning. Just a dead button staring back at you.

### Debugging Was an Art Form

The debugger, `NSLog`, and a whole lot of `NSLog(@"%p", myObject)` statements were our best friends. Xcode would sometimes just crash without a clear reason, and you'd spend an hour figuring out you forgot to connect an outlet.

---

## The Transition

Around the middle of my iOS journey, **Swift** arrived. Suddenly, memory management was automatic with ARC, optionals kept you honest, and the syntax became readable. Then **SwiftUI** came along and flipped the entire UI paradigm from imperative to declarative.

This repo captures both eras — the slow, deliberate, sometimes painful learning curve of Objective-C/UIKit, and the early excitement of Swift and its playgrounds.

If you're starting iOS dev today with SwiftUI and modern tools, I envy you. But I also hope these old folders help you understand how things used to work, because that context still matters.

---

## License

GPL-3.0
