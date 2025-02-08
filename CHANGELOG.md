## [3.1.1] - 29/01/2023

- Fix deprecations
- Solve issues where `INSTALL_PACKAGES` was set, issues with Google Play Review
- Upgrade dependencies

## [3.1.0] - 29/05/2022

- Fix build issues related to platform 3.0.0
- Stop using private types in public APIs
- Fix example
- Update dependencies

## [3.0.1+1] - 28/05/2022

- Fix RequireEmailUpfront key constructor

## [3.0.1] - 28/05/2022
- Apply flutter lints
- Formatting and applying conventions

## [3.0.0] - 28/05/2022
This new version brings full internationalization support along with file upload and unlimited chat appearance customization. This is a breaking release due to the introduction of the `EcodeskIntl()` and `EcodeskStyle()` classes.

A HUGE thank you to all of the contributors in this release. It is great to see new people contributing features. To the rest, thank you for your patience, here's the new release!





### 💥 Breaking changes

- New `EcodeskIntl()`  and `EcodeskStyle()` classes for customizing the ecodesk, check README.md for migration guide. By @CharlesMangwa

## New Contributors

* @ryg-git made their first contribution in <https://github.com/ecodesk-io/ecodesk_flutter/pull/66>
- @jonatascm made their first contribution in <https://github.com/ecodesk-io/ecodesk_flutter/pull/68>
- @marwenbk made their first contribution in <https://github.com/ecodesk-io/ecodesk_flutter/pull/74>
- @CharlesMangwa made their first contribution in <https://github.com/ecodesk-io/ecodesk_flutter/pull/77>
- @dependabot made their first contribution in <https://github.com/ecodesk-io/ecodesk_flutter/pull/80>

**Full Changelog**: <https://github.com/ecodesk-io/ecodesk_flutter/compare/2.1.4...3.0.0>

### 💥 Breaking changes
- New `EcodeskIntl()` class for customizing the ecodesk, check README.md for migration guide. By (@CharlesMangwa)[https://github.com/CharlesMangwa]

## [2.1.4] - 12/09/2021.
🐛 Fixed an issue where new customer conversations would create a new ID, stopping links between conversations.

## [2.1.3] - 11/09/2021.
🐛 Fixed an issue where chats appeared as Anonymous in specific cases even if externalId was provided. (covers more cases)

## [2.1.2] - 11/09/2021.
🐛 Fixed an issue where chats appeared as Anonymous in specific cases even if externalId was provided.

## [2.1.1] - 21/08/2021.
🐛 Fixed an issue where chats are not recovered due to an API change.

## [2.1.0+1] - 18/04/2021.
🎨 Format code

## [2.1.0] - 07/04/2021.
✨ Support null-safety

## [2.0.5] - 27/02/2021.
⬆️ Allows `timeago` to go up to version 3.x.x
♻️ Internal improvements to have the message list inside the conversation
⚡️ Stop passing the whole widget to getCustomerHistory

## [2.0.4] - 18/02/2021.
Bumps `flutter_markdown` to 0.6.0

## [2.0.1, 2.0.2, 2.0.3] - 16/02/2021.
These releases are maintenance related, addressing some issues found on pub.dev to improve its score.

### Fixes
* Bump `intl` to 0.17.0
* Bump `http` to 0.13.0
* Modify description to make it over 60 characters
* Avoided using braces in interpolation when not needed. 

## [2.0.0] - 16/02/2021.

# 🎉 2.0 has landed!
This release brings major changes to how this package works. Most importantly, it is now completely native, ensuring speed and performance along with more customisability. This will also enable new features such as chat message notifications, in-app overlays, local message retention and many others, make sure to leave suggestions [here](https://github.com/ecodesk-io/ecodesk_flutter) for what to build next.

### New Features
* Native Dart implementation!
* Full theming control w/gradients.
* Full Internationalization control - every part can be set to any language.
* Dark mode
* Added elevation option to message box


## [1.0.1] - 05/01/2021.

* 🍱 Update Readme.md with new logo


## [1.0.0+1] - 1/12/2020.

* 🎉 1.0 Release!
* 🐛 Fix customer data bug

## [0.2.2] - 30/11/2020.

* ⚡️ Performance improvements to `genIframeUrl`
* ✨ Added `toMap()` and `toJsonString()` to the classes, better URI generation.

## [0.2.1] - 26/11/2020.

* 🚨 Remove unused import (improve pub score)

## [0.2.0] - 26/11/2020.

### New features
* ✨ `onStartLoading`, `onFinishLoading` and `onError` functions. (#4)

### Enhancements
* 📝 Improved docs with higher coverage and syntax highlighting.
* ⚡️ Web widget is now constant. Better performance.
* ✨ Update example to show new features.

## [0.1.4] - 23/11/2020.

* 🎨 Restructure code and fix warnings

## [0.1.3] - 23/11/2020.

* 🐛 Add platformView stub, should fix platform id and pub score

## [0.1.2] - 22/11/2020.

* 🐛 Try and fix analyzer error again


## [0.1.0] - 22/11/2020.

### New features
* ✨ Flutter Web support!

### Enhancements
* 📝 Added Known Issues (#10)
* 🎨 Internal restructuring to support Flutter Web.

### Fixes
* ✏️ Fixed changelog typos

## [0.0.3] - 20/11/2020.

### Enhancements
* 📝 Improved Readme.md (#9)
* 📝 Improved API documentation (#1)

### Bug Fixes
* 🐛 Fixed external id not working correctly (#9)
* 🐛 Fixed bools being sent incorrectly (#3)

## [0.0.2] - 18/11/2020.

* Increase Pub Score.

## [0.0.1] - 17/11/2020.

* 🎉 Initial Release.
