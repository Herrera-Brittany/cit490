//
//  LoginPage.swift
//  GoToTheTemple
//
//  Created by owner on 7/13/20.
//  Copyright © 2020 owner. All rights reserved.
//

import SwiftUI


let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

let storedUsername = "Brittany"
let storedpassword = "abcdefg"
struct LoginPage: View {
    @State private var isActive: Bool = false
    @State private var showing = false;
    @Binding var isShowing: Bool
    @State var index = 0
    @State  var username: String = ""
    @State  var password: String = ""
    @State private var selection: Int?
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    @State private var selected: Int? = nil
    @State private var current: Int? = nil
    //@ObservedObject var userAuth: UserAuth
      @EnvironmentObject private var userData: UserData
    @EnvironmentObject var userAuth: UserAuth
    var body: some View {
       
        let hide = TapGesture()
            .onEnded { _ in
                self.isShowing.toggle()
        }
        let doNothing = TapGesture()
            .onEnded { _ in}
        return VStack{
 
            ZStack {
                VStack {
                    SignIn()
                    UserImage()
                    UserNameTextField(username: $username)
                    PasswordSecureField(password: $password)
                    if authenticationDidFail {
                        Text("Invalid Login, Try again.")
                            .offset(y: -10)
                            .foregroundColor(.red)
                    }
                    
                    Button(action: {
                       
                        if self.username == storedUsername && self.password == storedpassword {
                            self.authenticationDidSucceed = true
                            self.authenticationDidFail = false
                        } else {
                            self.authenticationDidFail = true
                            self.authenticationDidSucceed = false
                        }
                    })
                    {
                        LoginButtonContent()}
                    }
                }
                .padding()
            
                if authenticationDidSucceed {
                    NavigationLink("Logging in Now...", destination: ContentView(store: MemberStore(members: testData)))
                    
                                             
                                                                                   
                    //Text("Login Succeeded!")
                    //    .font(.headline)
                     //   .frame(width: 250, height: 30)
                      //  .background(Color.green)
                      //  .cornerRadius(20.0)
                       // .animation(Animation.default)
              //  }
            //NavigationView {
         
                    
            }
    
        }
        
     
        
        
        
}


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage(isShowing: .constant(true))
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


}
