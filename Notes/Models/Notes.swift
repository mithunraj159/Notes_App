//
//  Notes.swift
//  Notes
//
//  Created by Mithun Raj on 08/06/20.
//  Copyright © 2020 Mithun Raj. All rights reserved.
//

import Foundation
import RealmSwift

class Notes: Object {
    @objc dynamic var notesTitle: String = ""
    @objc dynamic var notesContents: String = ""
}
