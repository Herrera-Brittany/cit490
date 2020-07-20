//
//  MemberRow.swift
//  GoToTheTemple
//
//  Created by owner on 7/13/20.
//  Copyright © 2020 owner. All rights reserved.
//

import SwiftUI

struct MemberRow: View {
    var member: Member

    var body: some View {
        VStack {
            HStack {
             
            Image(member.imageName)
            .resizable()
                .frame(width: 50, height: 50)
            Text(member.name)
            

            if member.helpMember {
                Image(systemName: "heart.fill")
                    .imageScale(.large)
                    .foregroundColor(.red)
                }
            }
        }
    }
}

struct MemberRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MemberRow(member: testData[0])
            MemberRow(member: testData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
