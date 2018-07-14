# SmallAutoLayout

[![CI Status](http://img.shields.io/travis/BetrayalPromise/SmallAutoLayout.svg?style=flat)](https://travis-ci.org/BetrayalPromise/SmallAutoLayout)
[![Version](https://img.shields.io/cocoapods/v/SmallAutoLayout.svg?style=flat)](http://cocoapods.org/pods/SmallAutoLayout)
[![License](https://img.shields.io/cocoapods/l/SmallAutoLayout.svg?style=flat)](http://cocoapods.org/pods/SmallAutoLayout)
[![Platform](https://img.shields.io/cocoapods/p/SmallAutoLayout.svg?style=flat)](http://cocoapods.org/pods/SmallAutoLayout)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


 单一的属性(Left, Right, Top, Bottom, Leading, Trailing, Width, Height, CenterX, CenterY, LastBaseline, Baseline, FirstBaseline, LeftMargin, RightMargin, TopMargin, BottomMargin, LeadingMargin, TrailingMargin ,CenterXMargin, CenterYMargin)是使用equalTo lessOrEqualTo greaterOrEqualTo三个函数处理约束
 符合属性(Size, Center, Insert)都有其对应的处理函数

### view0.Width == view1.Width
```obj-c
(狗娘养的API)fuck
[NSLayoutConstraint constraintWithItem:view0 attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:view1 attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:0.0];

yeah
[view0.Width equalTo:view1.Width];
```

### view0.Width == view1.Width + 10
```obj-c
(狗娘养的API)fuck
[NSLayoutConstraint constraintWithItem:view0. attribute:(NSLayoutAttributeWidth) relatedBy:(NSLayoutRelationEqual) toItem:view1 attribute:(NSLayoutAttributeNotAnAttribute) multiplier:1.0 constant:10];

yeah
[view0.Width equalTo:view1.Width trim:10];
```

###  view0.Left == self.view.safeArea.Left
```obj-c
(狗娘养的API)fuck
[NSLayoutConstraint constraintWithItem:view0 attribute:(NSLayoutAttributeLeft) relatedBy:(NSLayoutRelationEqual) toItem:self.view.safeAreaLayoutGuide attribute:(NSLayoutAttributeLeft) multiplier:1.0 constant:0.0];

yeah
[view0.Left equalTo:self.view.SafeAreaGuide.Left];
```

### view0.Top == self.topLayoutGuide.Bottom
```obj-c
(狗娘养的API)fuck
[NSLayoutConstraint constraintWithItem:self.topLayoutGuide attribute:(NSLayoutAttributeBottom) relatedBy:(NSLayoutRelationEqual) toItem:view0 attribute:(NSLayoutAttributeTop) multiplier:1.0 constant:0.0];

yeah
[view0.Top equalTo:self.TopGudie.Bottom];
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
