//
//  UIImageViewExtension.swift
//  AMPNews
//
//  Created by Jithesh Valsan on 25/2/18.
//  Copyright © 2018 Jithesh. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImageFromLink(_ link:String?) {
        if let link = link {
            if !link.isEmpty {
                let url = URL(string: link)
                self.kf.setImage(with:url) //lazy load and cache the image
            }
        }
    }
}
