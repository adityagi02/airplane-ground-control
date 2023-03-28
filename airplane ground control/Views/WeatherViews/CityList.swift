import SwiftUI

struct CityList: View {
  @State var currentWeatherCity: City?
  
  let cities = City.previewData.sorted { $0.name < $1.name }

  var body: some View {
    NavigationView {
      VStack {
        List(cities) { city in
          NavigationLink(destination: detailDestination(city: city)) {
            HStack(spacing: 23) {
              Button { currentWeatherCity = city }
            label: { Image(systemName: "thermometer.sun").foregroundColor(.blue).padding(-12).font(.system(size: 20))}
                    .buttonStyle(.plain)
                Text(city.name).font(.system(size: 24))
            }
          }
        }.listStyle(.sidebar)

      }.navigationBarTitle("Airport Weather♒️")
    }
    .sheet(item: $currentWeatherCity) { city in
      CityCurrentScreen(city: city)
    }
  }

  func detailDestination(city: City) -> some View {
    CityForecastScreen(city: city)
  }
}

struct CityList_Previews: PreviewProvider {
  static var previews: some View {
    CityList()
  }
}
