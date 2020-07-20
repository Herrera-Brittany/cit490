//
//  MemberList.swift
//  GoToTheTemple
//
//  Created by owner on 7/14/20.
//  Copyright © 2020 owner. All rights reserved.
//

import SwiftUI

struct MemberList: View {
  
    @EnvironmentObject private var userData: UserData
   // @State var showHelpMemberOnly = false
    var body: some View {
       NavigationView {
            List {
                Toggle(isOn: $userData.showHelpMemberOnly) {
                    Text("Helping These Members")
                }

                ForEach(userData.members) { member in
                    if !self.userData.showHelpMemberOnly || member.helpMember {
                        NavigationLink(
                            destination: MemberDetail(member: member)
                                .environmentObject(self.userData)
                       ) {
                            MemberRow(member: member)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Members"))
        }
    }
}


struct MemberList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            MemberList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}

