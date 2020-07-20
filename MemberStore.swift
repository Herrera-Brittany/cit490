//
//  MemberStore.swift
//  GoToTheTemple
//
//  Created by owner on 7/13/20.
//  Copyright © 2020 owner. All rights reserved.
//

import SwiftUI
import Combine

class MemberStore  : ObservableObject {
    var members: [Member] {
        didSet { didChange.send() }
    }
    init(members: [Member] = [] ) {
        self.members = members
    }
    var didChange = PassthroughSubject<Void, Never>()
    }


