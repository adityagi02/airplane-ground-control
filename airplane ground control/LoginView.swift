//
//  LogInView.swift
//  airplane ground control
//
//  Created by Aditya Tyagi  on 07/03/23.
//

import SwiftUI
import Firebase

class FirebaseManager: NSObject {
    
    let auth: Auth
    
    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        
        self.auth = Auth.auth()
        
        super.init()
    }
    
}

struct loginView: View {
    
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)
    let lightGreyColor2 = Color(red: 200.0/255.0, green: 203.0/255.0, blue: 204.0/255.0)
    
    var body: some View {
        NavigationView {
  //          ScrollView {
                
                VStack(spacing: 16) {
                    HelloText()
                    Button {
                        
                    } label: {
                        Image(systemName:"nonAuthImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(1)
                            .padding()
                    }

                    Picker(selection: $isLoginMode, label: Text("Picker here")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                        
                    
                    Group() {
                        TextField("Username", text: $email)
                            .padding()
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                        departmentTypeMenu()
                        SecureField("ENTER PIN", text: $password)
                            .padding()
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                    }
                    .background(Color.white)
                    
                    Button {
                        handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Log In" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 20, weight: .semibold))
                              
                            Spacer()
                        }.background(Color.blue).cornerRadius(15).buttonStyle(.borderedProminent)
                    }
                    
                    Text(self.loginStatusMessage)
                        .foregroundColor(.red)
                }
                .padding()
                
//            }
//            .navigationTitle(isLoginMode ? "Log In" : "Create Account")
//            .background(Color(.init(white: 0, alpha: 0.05))
//                            .ignoresSafeArea())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func handleAction() {
        if isLoginMode {
//            print("Should log into Firebase with existing credentials")
            loginUser()
        } else {
            createNewAccount()
//            print("Register a new account inside of Firebase Auth and then store image in Storage somehow....")
        }
    }
    
    private func loginUser() {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Information not correct. Try again.", err)
                self.loginStatusMessage = "Failed to login user!!"
                return
            }
            
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            
            self.loginStatusMessage = "Successfully logged in as user🚀"
        }
    }
    
    @State var loginStatusMessage = ""
    
    private func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to create user:", err)
                self.loginStatusMessage = "Failed to create user!!☹️"
                return
            }
            
            print("Successfully created user: \(result?.user.uid ?? "")")
            
            self.loginStatusMessage = "Successfully created user🚀"
        }
    }
}

struct loginView_Previews1: PreviewProvider {
    static var previews: some View {
        loginView()
    }
}


struct departmentTypeMenu: View{
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)
    let lightGreyColor2 = Color(red: 200.0/255.0, green: 203.0/255.0, blue: 204.0/255.0)
    
    @State var selectedDept = "Select Department"
    
    var body: some View {
        Menu{
            Button(action: {
                selectedDept = "Ground Staff"
            }, label: {
                Text("Ground Staff")
            })
            Button(action: {
                selectedDept = "Crew Staff"
            }, label: {
                Text("Crew Staff")
            })
            Button(action: {
                selectedDept = "Maintenance Staff"
            }, label: {
                Text("Maintenance Staff")
            })
        } label: {
            Label(
                title:{ if(selectedDept == "Select Department"){
                    Text(selectedDept + "                                          ").background(lightGreyColor)
                }else{
                    Text(selectedDept + "                                                            ").foregroundColor(.black).shadow(radius: -5)
                }
                    Image(systemName: "tag")
                },
            icon:{Image("plus")}
            )
            .font(.headline)
            .foregroundColor(lightGreyColor2)
            .padding()
            .frame(width: 360, height: 60)
            .background(lightGreyColor)
            .cornerRadius(5.0)
        }
    }
}

struct HelloText: View {
    var body: some View {
        Text("Welcome to ")
            .fontWeight(.light)
            //.padding(.bottom, 2)
        Text("SmartPort✈️")
            .font(.largeTitle)
            .fontWeight(.semibold)
    }
}
