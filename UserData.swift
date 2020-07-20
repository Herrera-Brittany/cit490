//
//  UserData.swift
//  GoToTheTemple
//
//  Created by owner on 7/13/20.
//  Copyright © 2020 owner. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject  {
    @Published var showHelpMemberOnly = false
    @Published var members = testData
    @Published var giveCarRide = false
    @Published var provideChildCare = false
    @Published var helpMember = false
    }

