# iOS Tutorials

> A walk down memory lane — covering the basics of Swift and iOS, and a little bit of why this repo exists in the first place.

---

## A Little Nostalgia

Before SwiftUI, before even Swift itself, iOS development was a different beast entirely.

We lived in the era of **Objective-C** — a language that looked more like sending a telegram than writing code. Picture this:

```objc
UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
[button setTitle:@"Tap Me" forState:UIControlStateNormal];
[self.view addSubview:button];
[button release];
```

Every single UI element was built **programmatically**. No drag-and-drop with live preview. You wrote frames with `CGRectMake`, nested `UIView`s inside `UIView`s inside more `UIView`s, and prayed you remembered to add all the constraints.

### Manual Memory Management

There was a time when **you** were responsible for every `retain`, `release`, and `autorelease`. Forget to release? Memory leak. Release too early? Crash. ARC (Automatic Reference Counting) felt like magic when it arrived, but back then, we called it debugging on a Friday night.

### Interface Builder (.xib files)

Oh, the glorious `.xib` files. You'd design your UI in Interface Builder, then spend hours wiring up `IBOutlet` and `IBAction` connections. One broken connection and your button just… didn't work. No error, no warning. Just a dead button staring back at you.

### Storyboards

Then came **Storyboards** — the double-edged sword. On one hand, you could visualize entire navigation flows. On the other, merge conflicts in Storyboards were (and still are) a nightmare that no version control system on earth was built to handle.

### No SwiftUI, No Previews

Back then, you wrote code, built the app, ran the simulator (which took 30 seconds on a good day), navigated to the screen, checked if the button was 2 pixels off, went back, tweaked the frame, rebuilt. Repeat. For hours.

Live previews? Instant UI feedback? Those felt like science fiction.

### Why This Repo?

This repo was created to document those foundational concepts — the stuff that shaped how we think about iOS development today. Even if you're coming in with SwiftUI and loving the declarative syntax, understanding how things worked under the hood gives you a deeper appreciation (and a few war stories to share at meetups).

From Objective-C verbosity to Swift's elegance, from manual frames to Auto Layout to SwiftUI's stacks — it's been quite a journey.

---

## Topics Covered

- Swift basics (syntax, data types, optionals, closures)
- UIKit fundamentals
- Auto Layout and constraints
- Navigation patterns
- Basic architecture (MVC, the OG)
- And whatever else we felt like documenting along the way

---

*Happy coding — and thanks for the nostalgia trip.*
