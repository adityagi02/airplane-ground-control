import SwiftUI


//public extension Color {
//
//    static func random(randomOpacity: Bool = false) -> Color {
//        Color(
//            red: .random(in: 0...1),
//            green: .random(in: 0...1),
//            blue: .random(in: 0...1),
//            opacity: randomOpacity ? .random(in: 0...0.3) : 0.2
//        )
//    }
//}

struct CityCurrentScreen: View {
  @EnvironmentObject var currentConditionsLoader: CurrentConditionsLoader
  let city: City


  var body: some View {
      
    
      ZStack{
          BackgroundView(topColor: Color.random(), bottomColor: Color("lightBlue"))
          
        ScrollView {
          switch currentConditionsLoader.state {
          case .idle: Color.clear
          case .loading: ProgressView()
          case .failed(let error): Text("Error \(error.localizedDescription)")
          case .success(let currentConditions):
            WeatherDisplay(currentConditions: currentConditions, city: city)
          }
        }
        .navigationTitle("\(city.name)")
        .task { await currentConditionsLoader.loadWeatherData(city: city) }
    }
  }
}

struct WeatherDisplay: View {
  let currentConditions: CurrentConditionsLoader.CurrentConditionsSummary
  let city: City

  var body: some View {
      Spacer()
    VStack() {
        Text(city.name).font(.system(size: 56)).foregroundColor(.secondary)
        Spacer()
        .font(.caption)
        Text(currentTemperature(currentConditions)).font(.system(size: 100))
        Text(currentConditions.description + "☁️" ).fontWeight(.light).font(.system(size: 34))
        Spacer(minLength: 44)
        VStack{
            HStack(spacing: 20) {
                WeatherDayView(dayOfWeek: "Mon", imageName: "cloud.fill", temperature: 28)
                WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.sun.fill", temperature: 28)
                WeatherDayView(dayOfWeek: "Wed", imageName: "cloud.fill", temperature: 33)
                WeatherDayView(dayOfWeek: "Thur", imageName: "cloud.sun.fill", temperature: 30)
            }
            
            HStack(spacing: 20){
                WeatherDayView(dayOfWeek: "Fri", imageName: "cloud.sun.fill", temperature: 31)
                WeatherDayView(dayOfWeek: "Sat", imageName: "cloud.fill", temperature: 31)
                WeatherDayView(dayOfWeek: "Sun", imageName: "cloud.sun.fill", temperature: 32)
            }
        }
    }
    .padding(20)
  }

  func currentConditions(_ weather: WeatherInfo) -> String {
    weather.description
  }

  func currentTemperature(_ conditions: CurrentConditionsLoader.CurrentConditionsSummary) -> String {
    let formattedTemp = NumberFormatting.temperature(conditions.temperature) ?? "n/a"
    return "\(formattedTemp)°"
  }
}

struct CityCurrent_Previews: PreviewProvider {
  static var previews: some View {
    CityCurrentScreen(city: City.previewData[0])
      .environmentObject(ForecastLoader(apiClient: MockWeatherAPIClient()))
      .environmentObject(CurrentConditionsLoader(apiClient: MockWeatherAPIClient()))
  }
}
