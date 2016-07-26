//
//  GifEditorViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Arif Khan on 7/11/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class GifEditorViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    var gif: Gif?
    
    let frameCount = 16
    let delayTime: Float = 0.2
    let loopCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captionTextField.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)

        gifImageView.image = gif?.gifImage
    }
    
    @IBAction func presentPreview(sender: AnyObject) {
        
        let previewVC = storyboard?.instantiateViewControllerWithIdentifier("PreviewViewController") as! PreviewViewController
        self.gif?.caption = self.captionTextField.text;
        
        let regift = Regift(sourceFileURL: (self.gif?.videoURL)!, destinationFileURL: nil, frameCount: frameCount, delayTime: delayTime, loopCount: loopCount)
        
        let captionFont = self.captionTextField.font
        let gifURL = regift.createGif(caption: self.captionTextField.text, font: captionFont)
        
        let newGif = Gif(url:gifURL! , videoURL: self.gif!.videoURL, caption: self.captionTextField.text)
        
        previewVC.gif = newGif
        
        navigationController?.pushViewController(previewVC, animated: true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        captionTextField.placeholder = ""
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        captionTextField.resignFirstResponder()
        return true
    }
    
    func subscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GifEditorViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GifEditorViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if ( captionTextField.isFirstResponder()) {
            //view.frame.origin.y = -getKeyboardHeight(notification)+450
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if captionTextField.isFirstResponder() {
            view.frame.origin.y = 0
        }
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.CGRectValue().height
    }

}
