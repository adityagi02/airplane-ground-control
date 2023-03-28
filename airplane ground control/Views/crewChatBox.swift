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
                
                Text("Please avoid any personal message!!")
                    .fontWeight(.heavy)
                    .padding(.horizontal)
                    .padding(.top, 1)
                    .foregroundColor(.red)
            }
            VStack {
                ScrollView{
                    if delay1 {
                        HStack {
                            Spacer()
                            HStack() {
                                Text("Hello bot, how are you?")
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
                        
                        Text("I'm fine, what about you?")
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
                                Text("Can you give me a lorem ipsum?")
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
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer volutpat urna ante, id pretium libero ullamcorper et. Phasellus vehicula nisl sed consequat vehicula. Duis pellentesque nulla eget porttitor molestie. Morbi maximus nulla eu nisl suscipit, nec imperdiet odio ultricies. Donec non accumsan massa. Quisque quis dignissim lacus. Morbi viverra egestas augue, ac aliquet libero. Etiam ut odio et leo sodales placerat. Pellentesque nec ipsum eget eros cursus cursus a ac erat. Morbi ac convallis ipsum. Aenean venenatis aliquet est in vehicula. Sed dictum aliquet molestie.")

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
                                Text("Can you give me a lorem ipsum?")
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
                        
                        Text("I'm fine, what about you?")
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
