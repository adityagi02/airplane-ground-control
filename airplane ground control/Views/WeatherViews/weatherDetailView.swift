//
//  weatherDetailView.swift
//  airplane ground control
//
//  Created by Aditya Tyagi  on 25/03/23.
//

import SwiftUI

struct weatherDetailView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))

            VStack {
                CityTextView(cityName: "Bangalore, IN")

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
                    LabelButtonChangeDayTimeView(labelText: "Open Map📍")
                }
                
                Spacer()
            }
        }
    }
}

struct weatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        weatherDetailView()
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
                .foregroundColor(.secondary)

            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .foregroundColor(.secondary)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)

            Text("\(temperature)")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.secondary)
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
struct CityTextVieww: View {
    
    let city: City
    
    var body: some View {
        Text(city.name)
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
