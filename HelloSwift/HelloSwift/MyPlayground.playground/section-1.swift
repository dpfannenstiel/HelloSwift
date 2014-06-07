// Playground - noun: a place where people can play

import UIKit

var contentView : UIView?

contentView = UIView()

let animationDuration : NSString = "0.25"
println(animationDuration)
let duration = animationDuration.floatValue
let animationOption = UIViewAnimationCurve.EaseInOut
println(animationOption)
let animationValue = animationOption.toRaw()


