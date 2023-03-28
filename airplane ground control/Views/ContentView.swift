//
//  ContentView.swift
//  weather-app
//
//  Created by Marc Mosca on 02/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))

            VStack {
                CityTextView(cityName: "Lyon, FR")

                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 15)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "Mar", imageName: "cloud.fill", temperature: 11)
                    WeatherDayView(dayOfWeek: "Mer", imageName: "cloud.rain.fill", temperature: 8)
                    WeatherDayView(dayOfWeek: "Jeu", imageName: "cloud.sun.fill", temperature: 13)
                    WeatherDayView(dayOfWeek: "Ven", imageName: "wind.snow", temperature: 10)
                    WeatherDayView(dayOfWeek: "Sam", imageName: "snow", temperature: 6)
                }
                Spacer()
                
                Button {
                    print("button taped")
                } label: {
                    LabelButtonChangeDayTimeView(labelText: "Change Day Time")
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)

            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)

            Text("\(temperature)")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct LabelButtonChangeDayTimeView: View {
    
    var labelText: String
    
    var body: some View {
        Text(labelText)
            .frame(width: 280, height: 50)
            .background(Color.white)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
