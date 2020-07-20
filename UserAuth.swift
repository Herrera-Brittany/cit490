//
//  UserAuth.swift
//  GoToTheTemple
//
//  Created by owner on 7/15/20.
//  Copyright © 2020 owner. All rights reserved.
//
import Combine
import SwiftUI
class UserAuth: ObservableObject {
     // published property to update view
  @Published var isLoggedin: Bool = false

  func login() {
      self.isLoggedin = true
  }
  }

