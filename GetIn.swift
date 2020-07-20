//
//  GetIn.swift
//  GoToTheTemple
//
//  Created by owner on 7/19/20.
//  Copyright © 2020 owner. All rights reserved.
//

import SwiftUI

    
            
            struct GetIn: View {
 let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

 let storedUsername = "Brittany"
 let storedpassword = "abcdefg"

     @State private var isActive: Bool = false
     @State private var showing = false;
     @Binding var isShowing: Bool
     @State var index = 0
    // @State  var username: String = ""
    // @State  var password: String = ""
     @State private var selection: Int?
     @State var authenticationDidFail: Bool = false
     @State var authenticationDidSucceed: Bool = false
     @State private var selected: Int? = nil
     @State private var current: Int? = nil
     //@ObservedObject var userAuth: UserAuth
       @EnvironmentObject private var userData: UserData
     @EnvironmentObject var userAuth: UserAuth
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isLoginValid: Bool = false
    @State private var shouldShowLoginAlert: Bool = false
    var body: some View {
    
     let hide = TapGesture()
         .onEnded { _ in
             self.isShowing.toggle()
     }
     let doNothing = TapGesture()
         .onEnded { _ in}
     return VStack{
       
      //NavigationView {
    
        ZStack(alignment: .center) {
            VStack {
            SignIn()
            UserImage()
            UserNameTextField(username: $email)
            PasswordSecureField(password: $password)
               // TextField("Enter ID", text: self.$email).padding(.horizontal)
               // TextField("Enter Password", text: self.$password).padding(.horizontal)
          
          NavigationLink(destination: ContentView(store: MemberStore(members: testData)),
                         isActive: self.$isLoginValid) {
                  /*
                   Here we put the content view of `NavigationLink`.
                   It could be any `View` even `Button` but in this
                   example we use a `Text` with `onTapGesture`.
                   */
                            Text("Login").font(.title)
                      .onTapGesture {
                      //determine login validity
                      let isLoginValid = self.email == "Brittany" && self.password == "abcdefg"
                      
                      //trigger logic
                      if isLoginValid {
                        self.isLoginValid = true //trigger NavigationLink
                      }
                      else {
                        self.shouldShowLoginAlert = true //trigger Alert
                      }
                  }
                }
          }
        }
        .navigationBarTitle("")
        .alert(isPresented: $shouldShowLoginAlert) {
          Alert(title: Text("Email/Password incorrect"))
        }
      }
    }
    
}

struct GetIn_Previews: PreviewProvider {

    static var previews: some View {
        GetIn(isShowing: .constant(true))
    }
}



struct SignIn: View {
    var body: some View {
        Text("Sign In")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 10)
    }
}

struct UserImage: View {
    var body: some View {
        Image("temple-1")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            
            .font(.headline)
            .foregroundColor(.black)
            .padding()
            .frame(width: 150, height: 40)
            .background(Color.blue)
            .cornerRadius(35.0)
    }
}

struct UserNameTextField: View {
    @Binding var username: String
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .foregroundColor(.black)
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .foregroundColor(.black)
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}



