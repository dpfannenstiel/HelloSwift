//
//  ViewController.swift
//  HelloSwift
//
//  Created by Dustin Pfannenstiel on 6/6/14.
//  Copyright (c) 2014 Dustin Pfannenstiel. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UIScrollViewDelegate {
                            
    @IBOutlet var scrollView : UIScrollView = nil
    var contentView : UIView = UIView()
    var label : UILabel = UILabel()
    var textField : UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentView.backgroundColor = UIColor.redColor()
        scrollView.addSubview(contentView)
    
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.text = "View Should Be Red"
        label.sizeToFit()
		
		textField.setTranslatesAutoresizingMaskIntoConstraints(false)
		textField.sizeToFit()
		textField.backgroundColor = UIColor.cyanColor()
		
        contentView.addSubview(label)
		contentView.addSubview(textField)

		contentView.frame = scrollView.bounds
        scrollView.contentSize = contentView.bounds.size;
        scrollView.backgroundColor = UIColor.yellowColor()
        
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

		var labelTop = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: topInset)
        contentView.addConstraint(labelTop)
        
        var labelCenter = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        contentView.addConstraint(labelCenter)

		var textFieldLeading = NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: layoutInset)
		contentView.addConstraint(textFieldLeading)

		var textFieldTrailing = NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: layoutInset)
		contentView.addConstraint(textFieldTrailing)

		var textFieldBottom = NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: contentView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -20)
		contentView.addConstraint(textFieldBottom)
		
        super.updateViewConstraints()

    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        contentView.frame = scrollView.bounds
        scrollView.contentSize = contentView.bounds.size

        super.viewDidLayoutSubviews()
        
    }
}

