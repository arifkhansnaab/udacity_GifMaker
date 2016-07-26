//
//  GifPreviewViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Arif Khan on 7/12/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class PreviewViewController: UIViewController {
    
    var gif: Gif?
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gifImageView.image = self.gif?.gifImage
    }
    
    @IBAction func shareGif(sender: AnyObject) {
        let url: NSURL = (self.gif?.url)!
        let animatedGIF = NSData(contentsOfURL: url)!
        let itemsToShare = [animatedGIF]
        
        let activityVC = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        
        activityVC.completionWithItemsHandler = {(activity, completed, items, error) in
            if (completed) {
                self.navigationController?.popToRootViewControllerAnimated(true)
            }
        }
        
        navigationController?.presentViewController(activityVC, animated: true, completion: nil)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
}