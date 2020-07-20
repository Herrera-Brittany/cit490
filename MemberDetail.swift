//
//  MemberDetail.swift
//  GoToTheTemple
//
//  Created by owner on 7/13/20.
//  Copyright © 2020 owner. All rights reserved.
//
import SwiftUI

struct MemberDetail: View {
    
    @State private var zoomed = false
    @State private var showing = false
  //  @Binding var isShowing: Bool
    @State var selected = false
    @State var helpMember = true
    @State var showHelpMemberOnly = true
    @EnvironmentObject var userAuth: UserAuth
    @EnvironmentObject var userData: UserData
    @State private var show = false
    @State private var showLogin = false
    var member: Member
    
    var memberIndex: Int {
        userData.members.firstIndex(where: { $0.id == member.id })!
    }
    //let member: Member
    //    @ViewBuilder
    
    var body: some View {
                ZStack(alignment: .topLeading) {
                    //Spacer()
                    HStack {
                       
                        VStack {
                            
                            VStack {
                             Spacer()
                                Image(member.imageName)
                            .resizable()
                            .aspectRatio(contentMode: zoomed ? .fill : .fit)
                            .navigationBarTitle(Text(member.name), displayMode: .inline)
                            .onTapGesture {
                                withAnimation(.default) {
                                    self.zoomed.toggle() }
                                }
                             //   Spacer()
                                  //  .padding()
                                        

                                    if showing{
                                              GetIn(isShowing:
                                                  $showing.animation()).transition(AnyTransition.move(edge:.leading).combined(with: .opacity))
                                          }
                                          Button(action: {
                                              withAnimation(.easeInOut(duration: 1.5)){
                                                  self.showing.toggle()
                                              }
                                          }) {
                                             // Text("Help Member")
                                            
                                            Toggle(isOn: $selected) {
                                                             
                                                Text("Can you help " + (member.name) + " ?")
                                                    .foregroundColor(.orange).font(Font.system(size:20, design: .default) )                                                         .padding()
                                                      
                                                  }
                                }
                                                      Text(selected ? "Yes" : "No").foregroundColor(.red)
                                                                  .font(.largeTitle)
                                                      
                                          
                                
                                                   
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 700)
                                
                                
                                    Text(member.details)
                             .frame(width: 300, height: 180)
                                        .font(Font.system(size:21, design: .default))
                                .foregroundColor(.primary)
                             //Text("\(member.templeDate)")
                            //.frame(width: 380, height: 120)
                            // .font(.headline)                        .foregroundColor(.primary)
                                                 }
                            .padding()
                          //  .padding()
                           
             
            if member.needsCarride && !member.needsChildcare && !zoomed {
            Image(systemName: "car.fill").font(.title).padding(.horizontal).transition(.move(edge: .leading)) }
            
            else if member.needsChildcare && !member.needsCarride && !zoomed {
            Image("childcare").font(.title).padding(.horizontal).transition(.move(edge: .leading))
            }
            else if member.needsChildcare && member.needsCarride && !zoomed
          
           {
            HStack {
            Image(systemName: "car.fill").font(.title).padding(.horizontal).transition(.move(edge: .leading))
            
            Image("childcare").font(.title).padding(.horizontal).transition(.move(edge: .leading)).padding()
                            }
                           

                                
                                 }
                    }
                                                  }
                
            }
                  

                    
            }

        }
#if DEBUG

struct MemberDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView { MemberDetail(member: testData[0]) }
            NavigationView { MemberDetail(member: testData[1])
                
            }
            MemberDetail(member: testData[0])
                .environmentObject(UserData())        }
        
    }
}

#endif
