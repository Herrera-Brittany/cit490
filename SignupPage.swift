//
//  SignupPage.swift
//  GoToTheTemple
//
//  Created by owner on 7/13/20.
//  Copyright © 2020 owner. All rights reserved.
//

import SwiftUI


//let storedUsername = "Brittany"
//let storedpassword = "abcdefg"

struct SignupPage: View {
    
    @Binding var isShowing: Bool
    @State var index = 0
   @State  var username: String = ""
   @State  var password: String = ""
   @State  var password1: String = ""
    @State var authenticationDidFail: Bool = false
   @State var authenticationDidSucceed: Bool = false
    @State private var isActive: Bool = false
    @State private var showing = false;
  
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
            PasswordSecureField1(password1: $password1)
            if authenticationDidFail {
                Text("Please enter a valid Username or password.")
                    .offset(y: -10)
                    .foregroundColor(.red)
            }
            
            Button(action: {
                if self.username == storedUsername && self.password == storedpassword && self.password1 == storedpassword {
                    self.authenticationDidSucceed = true
                    self.authenticationDidFail = false
                } else {
                    self.authenticationDidFail = true
                    self.authenticationDidSucceed = false
                }
            })
            {
                LoginButtonContent()
                
            }
        }
        .padding()
            if authenticationDidSucceed {
                Text("Thank you for Signing Up")
                    .font(.headline)
                    .frame(width: 250, height: 30)
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .animation(Animation.default)
                
            }
        }
        }
            
        }
struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        SignupPage(isShowing: .constant(true))
    }
}

struct SignIn: View {
    var body: some View {
        Text("Sign Up")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
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
        Text("Sign Up")
  
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
        TextField("Enter a Username", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    @Binding var password: String
    var body: some View {
        SecureField("Enter a Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
    struct PasswordSecureField1: View {
        @Binding var password1: String
        var body: some View {
            SecureField("Re-Enter Password", text: $password1)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
        }
    }}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        SignupPage(isShowing: .constant(true))
    }
}

