# SmallAutoLayout

[![CI Status](http://img.shields.io/travis/BetrayalPromise/SmallAutoLayout.svg?style=flat)](https://travis-ci.org/BetrayalPromise/SmallAutoLayout)
[![Version](https://img.shields.io/cocoapods/v/SmallAutoLayout.svg?style=flat)](http://cocoapods.org/pods/SmallAutoLayout)
[![License](https://img.shields.io/cocoapods/l/SmallAutoLayout.svg?style=flat)](http://cocoapods.org/pods/SmallAutoLayout)
[![Platform](https://img.shields.io/cocoapods/p/SmallAutoLayout.svg?style=flat)](http://cocoapods.org/pods/SmallAutoLayout)

## NOTICE
### 1.视图的translatesAutoresizingMaskIntoConstraints属性交由使用者决定 SmallAutoLayout 并不会处理改属性 原因是 可能存在跟frame配合的情况
### 2.特殊的标记safeAreaGuide$ topGuide$ bottomGuide$必须最先设置

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### view0.width == view1.width$
```obj-c
(狗娘养的API)fuck
[NSLayoutConstraint constraintWithItem:view0 attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:view1 attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:0.0];

yeah
[view0.width$ equalTo:view1.width$];
```

### view0.width == view1.width + 10
```obj-c
(狗娘养的API)fuck
[NSLayoutConstraint constraintWithItem:view0. attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:view1 attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:10];

yeah
[view0.width$ equalTo:view1.width$ trim:10];
```

### [view0.left == self.view.safeArea.left
```obj-c
(狗娘养的API)fuck
[NSLayoutConstraint constraintWithItem:view0 attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:self.view.safeAreaLayoutGuide attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:0.0];

yeah
[view0.Left equalTo:self.view.SafeAreaGuide.Left];
```

### view0.top == self.topLayoutGuide.bottom
```obj-c
(狗娘养的API)fuck
[NSLayoutConstraint constraintWithItem:self.topLayoutGuide attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:view0 attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:0.0];

yeah
[view0.top$ equalTo:self.topGudie$.bottom$];
```

### view0.size == CGSizeMake(100, 100)
```
[view0.size$ equalTo:@(CGSizeMake(100, 100))];
```

### view0.center == view1.center
```
[view0.center$ equalTo:view1.center$];
[view0.center$ equalTo:view1];
```

### view0.safeArea.size == view1.size
```
[view0.safeAreaGuide$.size$ equalTo:view1.size$];
[view0.safeAreaGuide$.size$ equalTo:view1];
```

### view0.top == view1.top view0.left == view1.left view0.bottom == view1.bottom
```
[view1.top$.left$.bottom$ equalTo:view1];
```

## Requirements

## Installation

SmallAutoLayout is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SmallAutoLayout'
```

## Author

BetrayalPromise, BetrayalPromise@gmail.com

## License

SmallAutoLayout is available under the MIT license. See the LICENSE file for more info.
