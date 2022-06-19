//
//  SwiftUIHostingController.swift
//  Noonalu
//
//  Created by Peter Kos on 6/9/22.
//

import UIKit
import SwiftUI

class SwiftUIHostingController: UIHostingController<MainNavigation> {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: MainNavigation())
    }

}
