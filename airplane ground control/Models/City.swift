import Foundation
import CoreLocation

struct City: Identifiable {
  let id: Int
  let name: String
  let latitude: Double
  let longitude: Double

  var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
  }
}

extension City {
  static let previewData = [
    City(id: 1, name: "Bangalore", latitude: 12.9716, longitude: 77.5946),
    City(id: 2, name: "Delhi", latitude: 28.7041, longitude: 77.1025),
    City(id: 3, name: "Jaipur", latitude: 26.9124, longitude: 75.7873),
    City(id: 4, name: "Goa", latitude: -15.2993, longitude: 74.1240),
    City(id: 5, name: "Mumbai", latitude: 19.0760, longitude: 72.8777),
    City(id: 6, name: "Hyderabad", latitude: 17.3850, longitude: 78.4867),
    City(id: 7, name: "Chennai", latitude: 13.0827, longitude: 80.2707),
    City(id: 8, name: "Ahmedabad", latitude: 23.0225, longitude: 72.5714)
  ]
}
