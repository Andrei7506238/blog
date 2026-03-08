---
layout: single
title: "The Permanent Temporary: Navigating the Maze of Software Workarounds"
date: 2026-03-05
categories: [dev]
author_profile: true
read_time: true
header:
  teaser: https://images.pexels.com/photos/18373855/pexels-photo-18373855.jpeg
image: https://images.pexels.com/photos/18373855/pexels-photo-18373855.jpeg
---

During my day job, I often work with technologies that feel like a patchwork of solutions, each with its own quirks and "load-bearing" workarounds. Navigating this ecosystem is like a maze where every turn leads to a new challenge: updates bring breaking changes, everything works fine until it doesn't, and when it fails, it fails in the most spectacular ways possible.

![Photo from Pexels](https://images.pexels.com/photos/18373855/pexels-photo-18373855.jpeg)

### Gradle: The King of Build Tools (and Headaches)
Take Gradle, for example. It’s a powerful tool capable of handling immense complexity, but it often feels like you’re wrestling the beast rather than working with it.

Did you update Android Studio? Great. Now your Android Gradle Plugin (AGP) version doesn't match your Gradle version, Kotlin is suddenly incompatible with AGP, and if you’re particularly unlucky, you’ll need to hunt down a new Java version.

Every update seems to deprecate half your configuration. This wouldn't be so bad if the replacements were backward compatible, but they rarely are. Settings migrated from one `build.gradle` to another (who thought two files with the identical names was a good idea?), and now we’re all transitioning to `build.gradle.kts`. You'd think a migration of this scale is a "one-and-done" deal, right?

Not quite. If you're managing 80+ small projects and the Android Studio migration tool decides the stars aren't aligned today, you’re stuck. I ended up writing a Python script that nukes the `/android` folder from my Flutter projects and runs `flutter create .` to regenerate it. It’s not elegant, but it works. For now. I still have to automate the reintegration of custom dependencies and plugins like the [permission handler](https://pub.dev/packages/permission_handler), which is a lot of heavy lifting for a "shortcut."

Fast forward a few months: life is good, Gradle is quiet. Then, I see a Reddit post: [“AGP 9.0 is Out, and It’s a Disaster. Here’s a Full Migration Guide so you don't have to suffer.”](https://www.reddit.com/r/androiddev/comments/1qi110y/agp_90_is_out_and_its_a_disaster_heres_full/) I find myself scrolling... and scrolling... and the post does not seem to end. I was wondering if I backed up that Python script.

Sometimes it feels like Gradle was designed for the job security of build engineers rather than the productivity of developers.

### Podfiles: The iOS Equivalent

Podfiles are the iOS counterpart to Gradle, complete with their own unique frustrations. You can have a perfectly stable environment, change one dependency, and suddenly the entire house of cards collapses.

I often wish Flutter would just automatically run:
```
flutter clean
flutter pub get
cd ios
pod install
cd ..
```
everytime you run the app. Missing this "magical" sequence is the most common source of iOS dev errors working with C++ libs. Xcode will happily ignore your native breakpoints while you're left wondering why your new code isn't executing, only to realize you're running a cached, stale build.

And don't get me started on the "cross-platform" promise. You're told you only need to know Dart, but the moment you need an advanced feature, you're deep-diving into Swift and Kotlin. I just wish, for once, they would agree on a similar API for the same feature. There is no better workaround filled workflow than having to work with multiplatform frameworks that break the abstraction every time you need to do something non-trivial.

### Setting Up This Blog: "It'll Be Easy," They Said

I asked ChatGPT for blog recommendations with a few simple requirements
- It had to be free, or at least have a free tier that would allow me to get started without having to worry about costs as this is just a hobby project for me.
- I would like it to be somewhat customizable but look good out of the box
- I like markdown, for the same reasons Uncle Bob mentions in the afterword of the Clean Code book
- **It had to be easy to setup and maintain** as I don't want to spend more time maintaining the blog than actually writing content for it

It recommended Jekyll with the Minimal Mistakes theme. It’s a solid combo, but the "easy" part felt like a lie. Installing Ruby 4 felt like a battle against a system designed for an earlier era. Even after fiddling with `_config.yml` for hours, I’m still greeted by a wall of deprecation warnings. If this blog disappears in two years, you’ll know why.

When I see all the deprecation warnings, I can only think about a video from [No Boilerplate](https://www.youtube.com/c/NoBoilerplate) comparing Rust with a bridge that has been there for 70 years and will be here for the next 70 years to come. I wish the software world had more of these long-lasting solutions, but it seems like we are always chasing the next big thing, and in the process, we end up with a lot of workarounds and temporary solutions that eventually become permanent fixtures in our codebases until they are finally no longer mentained and fall apart.

### MKVTool - The backbone of all media tools

On the flip side, we have tools like MKVToolNix. It just works. It’s a battle-tested command-line staple that has stood the test of time. But even the greats have quirks—mostly due to licensing.

Because it’s licensed under GPLv2, statically linking it would force your entire commercial app to be GPL as well. The "easy" fix is dynamic linking, but iOS famously forbids dynamic linking of third-party libraries. The result? Developers have to build wrappers around the command-line tool to call it externally. It screams "workaround," but it's the only way to play by the rules.

This shows that even the most reliable and long-lasting tools can have their own quirks and workarounds, and it is up to us as developers to navigate these challenges and find the best solutions for our projects.

### Final Thoughts

The software world is built on "temporary" solutions that somehow become permanent fixtures. Whether it’s build tools, dependency managers, or static site generators, we are constantly navigating a maze of creative fixes.

While frustrating, this adaptability is what makes development rewarding. However, I often find myself yearning for the "Rust philosophy", the idea of building a bridge that stands for 70 years and is ready for the next 70 years to come. I wish we prioritized long-lasting, stable solutions over "the next big thing."