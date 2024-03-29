//
//  StoryboardInstanciate.swift
//  Iddog
//
//  Created by THIAGO on 27/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

protocol StoryboardInstanciate {
    var storyboardName: String { get }
    func viewControllerFromStoryboard(withIdentifier identifier: String) -> UIViewController
}

extension StoryboardInstanciate {
    
    var storyboard: UIStoryboard {
        return UIStoryboard(name: self.storyboardName, bundle: nil)
    }
    
    func viewControllerFromStoryboard(withIdentifier identifier: String) -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}
