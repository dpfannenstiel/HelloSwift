//
//  ViewController.swift
//  HelloSwift
//
//  Created by Dustin Pfannenstiel on 6/6/14.
//  Copyright (c) 2014 Dustin Pfannenstiel. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {
                            
    @IBOutlet var scrollView : UIScrollView = nil
    var contentView : UIView = UIView()
    var label : UILabel = UILabel()
    var textField : UITextField = UITextField()
	let defaultMessage = "Hello, Swift!"

	override func viewDidLoad() {
        super.viewDidLoad()

		NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidShow:", name: UIKeyboardDidShowNotification, object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardDidHide:", name: UIKeyboardDidHideNotification, object: nil)

        contentView.backgroundColor = UIColor.clearColor()
        scrollView.addSubview(contentView)
    
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.attributedText = self.letterPressedString(defaultMessage)
        label.sizeToFit()
		label.numberOfLines = 0
		label.textAlignment = NSTextAlignment.Center
		
		textField.setTranslatesAutoresizingMaskIntoConstraints(false)
		textField.sizeToFit()
		textField.borderStyle = UITextBorderStyle.RoundedRect
		textField.delegate = self
		textField.clearButtonMode = UITextFieldViewMode.WhileEditing
		textField.placeholder = "Enter your message"

        self.view.addSubview(label)
		contentView.addSubview(textField)

		contentView.frame = scrollView.bounds
        scrollView.contentSize = contentView.bounds.size;
        scrollView.backgroundColor = UIColor.clearColor()
        
    }

	override func viewWillUnload()  {
		
		NSNotificationCenter.defaultCenter().removeObserver(self)
		
	}
	
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func updateViewConstraints() {
        
        super.updateViewConstraints()
        
        let layoutInset : CGFloat = 20.0
        let topLayoutHeight = self.topLayoutGuide.length
        let topInset = topLayoutHeight + layoutInset

		label.setContentHuggingPriority(752, forAxis: UILayoutConstraintAxis.Horizontal)
		
		var labelTop = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: topInset)
        self.view.addConstraint(labelTop)
        
        var labelCenter = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
		labelCenter.priority = 1000
        self.view.addConstraint(labelCenter)
		
		var labelLeft = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: layoutInset)
		labelLeft.priority = 751
		self.view.addConstraint(labelLeft)

		var labelRight = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -layoutInset)
		labelRight.priority = 751
		self.view.addConstraint(labelRight)

		var textFieldLeft = NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: layoutInset)
		contentView.addConstraint(textFieldLeft)

		var textFieldRight = NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -layoutInset)
		contentView.addConstraint(textFieldRight)

		var textFieldBottom = NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -20)
		contentView.addConstraint(textFieldBottom)
		
        super.updateViewConstraints()

    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        contentView.frame = scrollView.bounds
        scrollView.contentSize = contentView.bounds.size
		contentView.setNeedsLayout()
		contentView.layoutIfNeeded()

		super.viewDidLayoutSubviews()
        
    }
	
	func keyboardWillShow(notification: NSNotification) {
		
		let userInfo = notification.userInfo
		
		let frameBegin : (AnyObject!) = userInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey)
		let frameEnd : (AnyObject!) = userInfo.objectForKey(UIKeyboardFrameEndUserInfoKey)
		let animationDuration : (AnyObject!) = userInfo.objectForKey(UIKeyboardAnimationDurationUserInfoKey)
		let animationCurve : (AnyObject!) = userInfo.objectForKey(UIKeyboardAnimationCurveUserInfoKey)
		
		let beginFrame = frameBegin.CGRectValue()
		let endFame = frameEnd.CGRectValue()
		let duration = animationDuration.floatValue
		let curve = animationCurve.integerValue
		
		let deltaHeight = beginFrame.origin.y - endFame.origin.y
		
		let newFrame = CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height - deltaHeight)

		UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { self.scrollView.frame = newFrame }, completion: nil)

	}
	
	func keyboardDidShow(notification: NSNotification) {

		let userInfo = notification.userInfo

	}
	
	func keyboardWillHide(notification: NSNotification) {

		let userInfo = notification.userInfo

		let frameBegin : (AnyObject!) = userInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey)
		let frameEnd : (AnyObject!) = userInfo.objectForKey(UIKeyboardFrameEndUserInfoKey)
		let animationDuration : (AnyObject!) = userInfo.objectForKey(UIKeyboardAnimationDurationUserInfoKey)
		let animationCurve : (AnyObject!) = userInfo.objectForKey(UIKeyboardAnimationCurveUserInfoKey)
		
		let beginFrame = frameBegin.CGRectValue()
		let endFame = frameEnd.CGRectValue()
		let duration = animationDuration.floatValue
		let curve = animationCurve.integerValue
		
		let deltaHeight = beginFrame.origin.y - endFame.origin.y
		
		let newFrame = self.view.frame
		
		UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { self.scrollView.frame = newFrame }, completion: nil)

	}
	
	func keyboardDidHide(notification: NSNotification) {

		let userInfo = notification.userInfo

	}
	
	func textFieldShouldEndEditing(textField: UITextField) -> Bool {
		
		if let message = textField.text {
			label.attributedText = self.letterPressedString(message)
		} else {
			label.attributedText = self.letterPressedString(defaultMessage)
		}

		label.sizeToFit()
		contentView.setNeedsLayout()
		contentView.layoutIfNeeded()
		
		return true
	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
	func letterPressedString(originalString: NSString) -> NSAttributedString {

		var attributes = NSMutableDictionary()
		
		attributes.setValue(NSTextEffectLetterpressStyle, forKey:  NSTextEffectAttributeName)
		attributes.setValue(UIColor.darkGrayColor(), forKey: NSForegroundColorAttributeName)
		
		var attributedString = NSAttributedString(string: originalString, attributes: attributes)
		return attributedString
		
	}
}

