//
//  crewChatBox.swift
//  airplane ground control
//
//  Created by Aditya Tyagi  on 26/03/23.
//


import SwiftUI

struct crewChatBox: View {
    
    //This init is used in order to change the colors of the dots in the page indicators
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemBlue
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemBlue.withAlphaComponent(0.5)
       }
    
    @State var delay1 = false
    @State var delay2 = false
    @State var delay3 = false
    @State var delay4 = false
    @State var delay5 = false
    @State var delay6 = false
    
    @State var scale1 = 0.9
    @State var scale2 = 0.9
    @State var scale3 = 0.9
    @State var scale4 = 0.9
    @State var scale5 = 0.9
    @State var scale6 = 0.9

    @State var text = "Ask me anything..."
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Ground Crew👨🏻‍💼")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, -60)
                
                Text("Please avoid any personal message!!")
                    .fontWeight(.heavy)
                    .padding(.horizontal)
                    .padding(.top, -40)
                    .foregroundColor(.red)
            }
            VStack {
                ScrollView{
                    if delay1 {
                        HStack {
                            Spacer()
                            HStack() {
                                Text("A passenger is not getting his luggage at Belt 3, Need a staff crew  at Domestic Terminal")
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading, 30)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                                    .padding(.trailing, 15)
                            }.background {
                                ZStack {
                                    Rectangle().foregroundColor(.blue)
                                        .cornerRadius(20)
                                    
                                        .padding(.leading, 30).padding(.trailing, 15)
                                }
                            }
                            .scaleEffect(scale1)
                            .onAppear{
                                let baseAnimation = Animation.easeIn(duration: 0.2)
                                    
                                withAnimation(baseAnimation) {
                                    scale1 = 1
                                }
                            }
                            
                        }
                    }
                    if delay2 {
                        
                        HStack {
                        
                        Text("Sure, Amit is coming!!")
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 30)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                            .padding(.leading, 15)
                            .background {
                                ZStack {
                                    Rectangle()               .foregroundColor(.blue.opacity(0.6))
                                        .cornerRadius(20)
                                        .padding(.trailing, 30).padding(.leading, 15)
                                }
                            }
                            .scaleEffect(scale2)
                            .onAppear{
                                let baseAnimation = Animation.easeIn(duration: 0.2)
                                
                                withAnimation(baseAnimation) {
                                    scale2 = 1
                                }
                            }
                            Spacer()
                            }
                    }
                    if delay3 {
                        HStack {
                            Spacer()
                            HStack() {
                                Text("Any update about International Terminal?")
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading, 30)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                                    .padding(.trailing, 15)
                            }.background {
                                ZStack {
                                    Rectangle().foregroundColor(.blue)
                                        .cornerRadius(20)
                                        .padding(.leading, 30).padding(.trailing, 15)
                                }
                            }
                            .scaleEffect(scale3)
                            .onAppear{
                                let baseAnimation = Animation.easeIn(duration: 0.2)
                                
                                withAnimation(baseAnimation) {
                                    scale3 = 1
                                }
                            }
                            
                        }
                    }
                    if delay4 {
                        
                        HStack {
                        VStack{
                            Image("emergencySampleImage").cornerRadius(14)
                            Text("A person at Gate 34, International Terminal 2, fainted with heavy breath and sweating. Ground Crew reached immediately and medical Services Staff are informed in no time. We are taking him to the Medical Care Unit, Terminal 2. No extra crew needed.")

                        }       .multilineTextAlignment(.leading)
                                .padding(.trailing, 30)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 10)
                                .padding(.leading, 15)
                                .background {
                                    ZStack {
                                        Rectangle()               .foregroundColor(.blue.opacity(0.6))
                                            .cornerRadius(20)
                                            .padding(.trailing, 30).padding(.leading, 15)
                                    }
                                }
                           
                            }                        .scaleEffect(scale4)
                            .onAppear{
                                let baseAnimation = Animation.easeIn(duration: 0.2)
                                
                                withAnimation(baseAnimation) {
                                    scale4 = 1
                                }
                            }
                    }
                    if delay5 {
                        HStack {
                            Spacer()
                            HStack() {
                                Text("We need a WheelChair Crew at Gate no. 9")
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading, 30)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                                    .padding(.trailing, 15)
                            }.background {
                                ZStack {
                                    Rectangle().foregroundColor(.blue)
                                        .cornerRadius(20)
                                        .padding(.leading, 30).padding(.trailing, 15)
                                }
                            }
                            .scaleEffect(scale5)
                            .onAppear{
                                let baseAnimation = Animation.easeIn(duration: 0.2)
                                
                                withAnimation(baseAnimation) {
                                    scale5 = 1
                                }
                            }
                            
                        }
                    }
                    if delay6 {
                        
                        HStack {
                        
                        Text("Coming!!")
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 30)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                            .padding(.leading, 15)
                            .background {
                                ZStack {
                                    Rectangle()               .foregroundColor(.blue.opacity(0.6))
                                        .cornerRadius(20)
                                        .padding(.trailing, 30).padding(.leading, 15)
                                }
                            }
                            .scaleEffect(scale6)
                            .onAppear{
                                let baseAnimation = Animation.easeIn(duration: 0.2)
                                
                                withAnimation(baseAnimation) {
                                    scale6 = 1
                                }
                            }
                            Spacer()
                            }
                    }
                    
                }
                HStack{
                    if #available(iOS 16.0, *) {
                        TextField("Ask me something...", text: $text , axis: .vertical)
                            .padding(.vertical, 10)

                    } else {
                        TextField("Ask me something...", text: $text)
                            .lineLimit(5)
                            .padding(.vertical, 10)
                    }
                    Button(action: {
                        
                }, label: {
                            Image(systemName: "photo.circle.fill").resizable().frame(width: 30, height: 30)
                        })
                    Button(action: {
                        }, label: {
                            Image(systemName: "message.circle.fill").resizable().frame(width: 30, height: 30)
                        })
                
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "arrow.right.circle.fill").resizable().frame(width: 30, height: 30)
                    })
                    
                    }.multilineTextAlignment(.leading)
                    .padding(.trailing, 25)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 5)
                    .padding(.leading, 15)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    delay1 = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    delay2 = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    delay3 = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                    delay4 = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
                    delay5 = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
                    delay6 = true
                }
            }
        }
    }

struct crewChatBox_Previews: PreviewProvider {
    static var previews: some View {
        crewChatBox()
    }
}
