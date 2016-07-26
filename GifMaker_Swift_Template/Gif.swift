//
//  Gif.swift
//  GifMaker_Swift_Template
//
//  Created by Arif Khan on 7/11/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class Gif {
    let url: NSURL
    let videoURL: NSURL
    var caption: String?
    let gifImage: UIImage?
    let gifData: NSData?
    
    init(url: NSURL, videoURL: NSURL, caption: String?) {
        self.url = url
        self.videoURL = videoURL
        self.caption = caption
        self.gifImage = UIImage.gifWithURL(url.absoluteString)
        self.gifData = nil
    }
    
   // init(name: String) {
   //     self.gifImage = UIImage.gifWithName(name)
        
   // }
}
