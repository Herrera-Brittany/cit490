import SwiftUI

struct ContentView: View {
    @ObservedObject var store = MemberStore()
    @ObservedObject var userAuth = UserAuth()
    
    var members: [Member] = []
@ViewBuilder
var body: some View {
    VStack {
            //    if userAuth.loggedIn {
          //          ContentView().transition(.opacity)
           //     } else {
             //       LoginPage(isShowing: .constant(true), userAuth: userAuth).transition(.opacity)
        
                //(isShowing: $userAuth, userAuth: true).transition(.opacity)
    
        NavigationView {
          
          List {
               
                ForEach(store.members) { member in
                    MemberCell(member: member)
                   // if !self.showhelpMemberOnly || member.helpMember {
                }
               // .onDelete(perform: delete)
                .onMove(perform: move)
            }
                }
        .navigationBarTitle(Text("Members"))
        .navigationBarItems(trailing: EditButton())
      //     .listStyle(.grouped)
                
                
        }

    }
  
    //func helpMember() {
   // MemberStore.members.append(Member(name: "Adams Family", city: "Austin", state: "Texas", ward: "Waco", details: "The Adams need a car ride to the Dallas Temple on August 2, 2020", needsCarride: true, needsChildcare: false))
       // }
        
//func delete(at offsets: IndexSet) {
  //  store.members.remove(atOffsets: offsets)
  
func move(from source: IndexSet, to destination: Int) {
        store.members.move(fromOffsets: source, toOffset: destination)
    }
    }

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            
        ContentView(store: MemberStore(members: testData))
        ContentView(store: MemberStore(members: testData))
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(store: MemberStore(members: testData)).environment(\.colorScheme, .dark)
        
        ContentView(store: MemberStore(members: testData))
            .environment(\.layoutDirection, .rightToLeft)
            .environment(\.locale, Locale(identifier: "ar"))
        }
    }
}
#endif

struct MemberCell: View {
    let member: Member
    var body: some View {
        return NavigationLink(destination: MemberDetail(member: member)) {
            Image(member.imageName)
                .resizable()
                .frame(width: 32.0, height: 32.0)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(member.name)
                Text(member.city)
                Text(member.state)
                Text(member.ward)
              
                    
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
