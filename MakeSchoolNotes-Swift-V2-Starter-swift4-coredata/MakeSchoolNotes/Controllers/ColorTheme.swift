//
//  ColorTheme.swift
//  MakeSchoolNotes
//
//  Created by Jun Hee Han on 7/6/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import UIKit

struct ColorTheme {
    let isDefaultStatusBar: Bool
    let listNotesTableViewControllerBackgroundColor: UIColor
    
    let primaryColor: UIColor
    let primaryTextColor: UIColor
    
    let secondaryColor: UIColor
    
    let accentColor: UIColor
    let outputTextColor: UIColor
    
    static let light = ColorTheme(isDefaultStatusBar: true, listNotesTableViewControllerBackgroundColor: .tcOffWhite,
        primaryColor: .tcWhite,
        primaryTextColor: .tcCharcoal,
        secondaryColor: .tcDarkBlue,
        accentColor: .tcHotPink,
        outputTextColor: .tcAlmostBlack)

    static let dark = ColorTheme(isDefaultStatusBar: false,
                             listNotesTableViewControllerBackgroundColor: .tcAlmostBlack,
                                 primaryColor: .tcMediumBlack,
                                 primaryTextColor: .tcWhite,
                                 secondaryColor: .tcBlueBlack,
                                 accentColor: .tcSeafoamGreen,
                                 outputTextColor: .tcWhite)
}
