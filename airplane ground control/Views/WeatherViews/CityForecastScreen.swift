import SwiftUI

public extension Color {

    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...0.3) : 0.2
        )
    }
}

struct CityForecastScreen: View {
  @EnvironmentObject var forecastLoader: ForecastLoader
  let city: City

  var body: some View {
//    let _ = print("DRAWING FORECAST BODY")
//    let _ = dump(viewModel.state)
    ScrollView {
      switch forecastLoader.state {
      case .idle: Color.clear
      case .loading: ProgressView()
      case .failed(let error): Text("Error \(error.localizedDescription)")
      case .success(let forecasts):
        ForecastDisplay(forecasts: forecasts)
      }
    }
    .navigationTitle(city.name)
    .task { await forecastLoader.loadForecastData(city: city) }
  }
}

struct ForecastDisplay: View {
  @EnvironmentObject var forecastLoader: ForecastLoader
  let forecasts: [ForecastSummary]

  var body: some View {
    //    let _ = dump(forecasts.count)
    VStack(alignment: .leading) {
      ForEach(forecasts, id: \.self) { forecast in
        HStack() {
          Image(systemName: conditionImageName(forecast))
                .font(.system(size: 34)).foregroundColor(.blue)
          VStack(alignment: .leading) {
              Text(dateDisplay(forecast)).foregroundColor(.secondary)
            Text(details(forecast))
              .font(.system(size: 24)).foregroundColor(.blue)
            //  font(.headline) use for potential debugging
          }
          Spacer()
          Text(temperature(forecast))
                .font(.system(size: 34))
                .shadow(radius: 12)
        }
        .padding(10)
      }.background(Color.random()).cornerRadius(15).frame(width: 350, height: 70)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
    }
  }

  func details(_ forecast: ForecastSummary) -> String {
    forecast.weather.first?.description ?? "No weather"
  }

  func temperature(_ forecast: ForecastSummary) -> String {
    let formattedTemp = NumberFormatting.temperature(forecast.data.temp) ?? "n/a"
    return "\(formattedTemp)°"
  }

  func dateDisplay(_ forecast: ForecastSummary) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter.string(from: forecast.date)
  }

  func conditionImageName(_ forecast: ForecastSummary) -> String {
    switch forecast.weather.first?.main {
    case .thunderstorm: return "cloud.bolt"
    case .drizzle: return "cloud.drizzle"
    case .rain: return "cloud.rain"
    case .snow: return "snowflake"
    case .clear: return "sun.max"
    case .clouds: return "cloud"
    case .mist: return "aqi.low"
    case .smoke: return "smoke"
    case .haze: return "sun.haze"
    case .dust: return "sun.dust"
    case .fog: return "cloud.fog"
    case .sand: return "sun.dust"
    case .ash: return "smoke.fill"
    case .squall: return "cloud.heavyrain"
    case .tornado: return "tornado"
    default: return "circle"
    }
  }
}

struct CityForecast_Previews: PreviewProvider {
  static var previews: some View {
    CityForecastScreen(city: City.previewData[0])
      .environmentObject(ForecastLoader(apiClient: MockWeatherAPIClient()))
      .environmentObject(CurrentConditionsLoader(apiClient: MockWeatherAPIClient()))
  }
}
