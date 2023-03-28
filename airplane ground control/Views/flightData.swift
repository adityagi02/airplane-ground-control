//
//  flightData.swift
//  airplane ground control
//
//  Created by Aditya Tyagi  on 27/03/23.
//

import Foundation


import Foundation
import CoreLocation

struct flighData: Identifiable {
  let id: Int
  let terminal: String
  let flight: String
  let destination: String
  let time: String
  let status: String
  let gate: String
}

extension flighData {
  static let previewFlightData = [
    flighData(id: 1, terminal: "2", flight: "BX-6089", destination: "KLMP", time: "06:20", status: "On Time", gate: "23"),
    flighData(id: 2, terminal: "2", flight: "BX-6089", destination: "KLMP", time: "06:20", status: "On Time", gate: "23"),
    flighData(id: 3, terminal: "2", flight: "BX-6089", destination: "KLMP", time: "06:20", status: "On Time", gate: "23"),
    flighData(id: 4, terminal: "2", flight: "BX-6089", destination: "KLMP", time: "06:20", status: "On Time", gate: "23"),
    flighData(id: 5, terminal: "2", flight: "BX-6089", destination: "KLMP", time: "06:20", status: "On Time", gate: "23"),
    flighData(id: 6, terminal: "2", flight: "BX-6089", destination: "KLMP", time: "06:20", status: "On Time", gate: "23"),
    flighData(id: 7, terminal: "2", flight: "BX-6089", destination: "KLMP", time: "06:20", status: "On Time", gate: "23"),
    flighData(id: 8, terminal: "2", flight: "BX-6089", destination: "KLMP", time: "06:20", status: "On Time", gate: "23"),
    flighData(id: 9, terminal: "2", flight: "BX-6089", destination: "KLMP", time: "06:20", status: "On Time", gate: "23"),
    flighData(id: 10, terminal: "2", flight: "BX-6089", destination: "KLMP", time: "06:20", status: "On Time", gate: "23"),
    flighData(id: 11, terminal: "2", flight: "BX-6089", destination: "KLMP", time: "06:20", status: "On Time", gate: "23"),
    flighData(id: 12, terminal: "2", flight: "BX-6089", destination: "KLMP", time: "06:20", status: "On Time", gate: "23"),
    flighData(id: 13, terminal: "2", flight: "BX-6089", destination: "KLMP", time: "06:20", status: "On Time", gate: "23"),
  ]
}
