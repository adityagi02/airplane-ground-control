//
//  ContentView.swift
//  SwiftUI Advanced
//
//  Created by Damien Gautier on 27/03/2023.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth




struct SignupView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var editingEmailTextfield: Bool = false
    @State private var editingPasswordTextfield: Bool = false
    @State private var passwordIconBounce: Bool = false
    @State private var showProfileView: Bool = false
    @State private var signUpToggle: Bool = true
    
    
    var body: some View {
        ZStack {
            Image(signUpToggle ? "background-3" : "background-1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading, spacing: 16)  {
                    Text(signUpToggle ? "Sign up" : "Sign in")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Access to 120+ hours of courses, tutorials, and livestreams")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                    
                    HStack(spacing: 12) {
                        TextfieldIcon(iconName: "envelope.open.fill", currentlyEditing: $editingEmailTextfield)
                        
                        TextField("Email", text: $email) { isEditing in
                            editingEmailTextfield = isEditing
                            editingPasswordTextfield = false
                            if isEditing {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                    }
                                }
                            }
                            
                        }
                        .preferredColorScheme(.dark)
                        .foregroundColor(.white.opacity(0.7))
                        .textInputAutocapitalization(.never)
                        .textContentType(.emailAddress)
                    }
                    .frame(height: 52)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.white, lineWidth: 1)
                            .blendMode(.overlay)
                    )
                    .background(
                        Color("secondaryBackground")
                            .cornerRadius(16)
                            .opacity(0.8)
                    )
                    
                    HStack(spacing: 12) {
                        TextfieldIcon(iconName: "key.fill", currentlyEditing: $editingPasswordTextfield)
                            .scaleEffect(passwordIconBounce ? 1.2 : 1.0)
                        
                        SecureField("Password", text: $password)
                            .preferredColorScheme(.dark)
                            .foregroundColor(.white.opacity(0.7))
                            .textInputAutocapitalization(.none)
                            .textContentType(.password)
                    }
                    .frame(height: 52)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.white, lineWidth: 1)
                            .blendMode(.overlay)
                    )
                    .background(
                        Color("secondaryBackground")
                            .cornerRadius(16)
                            .opacity(0.8)
                    )
                    .onTapGesture {
                        editingPasswordTextfield = true
                        editingEmailTextfield = false
                        
                        if editingPasswordTextfield {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                passwordIconBounce.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                    passwordIconBounce.toggle()
                                }
                            }
                        }
                    }
                    
                    GradientButton(buttonTitle: signUpToggle ? "Create account" : "Sign in") {
                        signup()
                    }
                    .onAppear {
                        Auth.auth().addStateDidChangeListener { auth, user in
                            if user != nil {
                                showProfileView.toggle()
                            }
                        }
                    }
                    
                    if signUpToggle {
                        Text("By clicking on Sign up, you agree to our Terms of service and Privacy policy")
                            .font(.footnote)
                            .foregroundColor(.white.opacity(0.7))
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.white.opacity(0.1))
                    }
                    
                    VStack(alignment: .leading, spacing: 16, content: {
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.7)) {
                                signUpToggle.toggle()
                                //  self.rotationAngle += 180
                            }
                        }, label: {
                            HStack(spacing: 4) {
                                Text(signUpToggle ? "Already have an account?" : "Don't have an account?")
                                    .font(.footnote)
                                    .foregroundColor(.white.opacity(0.7))
                                
                                Text(signUpToggle ? "Sign in": "Sign up")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                            }
                        })
                        
                        if !signUpToggle {
                            Button(action : {
                                print("Send reset password email")
                            }, label: {
                                HStack(spacing: 4) {
                                    Text("Forgot password?")
                                        .font(.footnote)
                                        .foregroundColor(.white.opacity(0.7))
                                    
                                    Text("Reset password")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                }
                            })
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.white.opacity(0.1))
                        }
                    })
                }
                .padding(20)
            }
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.white.opacity(0.2))
                    .background(Color("secondaryBackground").opacity(0.5))
                    .shadow(color: Color("shadowColor").opacity(0.5), radius: 60, x: 0, y: 30)
            )
            .cornerRadius(30)
            .padding(.horizontal)
        }
        .fullScreenCover(isPresented: $showProfileView) {
            ProfileView()
        }
    }
    
    
    func signup() {
        if signUpToggle {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                print("User signed up!")
            }
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                print("User is signed in")
            }
        }
    }
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
