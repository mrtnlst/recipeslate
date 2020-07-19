//
//  AboutStore.swift
//  Recipe Slate
//
//  Created by Martin List on 12.07.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import UIKit

struct LinkButtonContent {
    var url: URL
    var title: String
    var sectionTitle: String
    var icon: String
}

final class AboutStore {
    
    var twitter = LinkButtonContent(url: URL(string: "https://twitter.com/mrtnlst")!,
                                    title: "@mrtnlst",
                                    sectionTitle: "Twitter",
                                    icon: "link.circle.fill")
    var homepage = LinkButtonContent(url: URL(string: "https://martinlist.org")!,
                                     title: "martinlist.org",
                                     sectionTitle: "Website",
                                     icon: "safari.fill")
    
    let about = """
                Recipe Slate provides a collection of recipes, elixirs and materials found in Breath of the Wild. Send me any improvements or feature suggestions via Twitter (link below). 
                """
    let version = "Version 2.0"
}
