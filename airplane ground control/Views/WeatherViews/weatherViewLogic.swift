//
//  weatherViewLogic.swift
//  airplane ground control
//
//  Created by Aditya Tyagi  on 25/03/23.
//

import SwiftUI

struct weatherViewLogic: View {
    @StateObject var forecastLoader = ForecastLoader(apiClient: WeatherAPIClient())
    @StateObject var currentConditionsLoader = CurrentConditionsLoader(apiClient: WeatherAPIClient())
    var body: some View {
        CityList()
            .environmentObject(forecastLoader)
            .environmentObject(currentConditionsLoader)
    }
}

struct weatherViewLogic_Previews: PreviewProvider {
    static var previews: some View {
        weatherViewLogic()
    }
}
