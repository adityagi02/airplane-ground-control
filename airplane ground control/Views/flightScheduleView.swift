//
//  flightScheduleView.swift
//  airplane ground control
//
//  Created by Aditya Tyagi  on 26/03/23.
//

import SwiftUI
import SimpleTable

#if DEBUG
import SwiftUI

struct flightScheduleView: View {
  struct Person: Identifiable {
    var id = UUID()
    var flightName: String
    var flightCompany: String
    var flightDestination: String
    var color: Color
    var time: String
  }

  var people: [Person] = [
    .init(flightName: "RE 1555", flightCompany: "AI", flightDestination: "Delhi", color: .green, time: "06:15"),
    .init(flightName: "AG 6154", flightCompany: "VS", flightDestination: "Jammu", color: .green, time: "06:35"),
    .init(flightName: "CX 4971", flightCompany: "LA", flightDestination: "Singapore", color: .green, time: "07:05"),
    .init(flightName: "BI 1138", flightCompany: "IN", flightDestination: " Bangalore", color: .orange, time: "07:15"),
    .init(flightName: "FI 2097", flightCompany: "AA", flightDestination: "Hyderabad", color: .green, time: "07:25"),
    .init(flightName: "KL 4563", flightCompany: "AI", flightDestination: "Kolkata", color: .green, time: "07:30"),
    .init(flightName: "DF 7206", flightCompany: "QA", flightDestination: "Dubai", color: .green, time: "07:35"),
    .init(flightName: "IC 9014", flightCompany: "AI", flightDestination: "Delhi", color: .green, time: "07:55"),
    .init(flightName: "EK 4626", flightCompany: "AKA", flightDestination: "Mumbai", color: .red, time: "08:15"),
    .init(flightName: "UD 1740", flightCompany: "SA", flightDestination: "South Africa", color: .green, time: "08:25"),
    .init(flightName: "5T 9544", flightCompany: "AI", flightDestination: "Mauritius", color: .red, time: "08:35"),
    .init(flightName: "KE 3309", flightCompany: "IN", flightDestination: "Lucknow", color: .green, time: "08:40"),
    .init(flightName: "FI 2097", flightCompany: "AA", flightDestination: "Chennai", color: .green, time: "09:05"),
    .init(flightName: "LR 5762", flightCompany: "VS", flightDestination: "Kochi", color: .orange, time: "06:15"),
    .init(flightName: "AFIZESKL", flightCompany: "LA", flightDestination: "HongKong", color: .green, time: "06:15"),
    .init(flightName: "EK050", flightCompany: "AKA", flightDestination: "Delhi", color: .green,  time: "06:15"),
    .init(flightName: "DL7783", flightCompany: "AI", flightDestination: "Ahemadabad", color: .orange, time: "06:15"),
    .init(flightName: "LR 5762", flightCompany: "VS", flightDestination: "Patna", color: .orange, time: "06:15"),
    .init(flightName: "AZ 3635", flightCompany: "LA", flightDestination: "Bali", color: .green, time: "06:15"),
    .init(flightName: "AZ 300AF", flightCompany: "AI", flightDestination: "Chandigarh", color: .green, time: "06:15"),
    .init(flightName: "BE GES", flightCompany: "VS", flightDestination: "Junior", color: .orange, time: "06:15"),
    .init(flightName: "LR 5762", flightCompany: "VS", flightDestination: "King", color: .orange, time: "06:15"),
    .init(flightName: "AFIZESKL", flightCompany: "SJ", flightDestination: "Junior", color: .green, time: "06:15"),
    .init(flightName: "EK050", flightCompany: "AKA", flightDestination: "Senior", color: .green, time: "06:15"),
    .init(flightName: "UL 6209", flightCompany: "VS", flightDestination: "Junior", color: .orange, time: "06:15"),
    .init(flightName: "LR 5762", flightCompany: "VS", flightDestination: "King", color: .orange, time: "06:15"),
    .init(flightName: "AFIZESKL", flightCompany: "SJ", flightDestination: "Junior", color: .green, time: "06:15"),
    .init(flightName: "EK050", flightCompany: "AKA", flightDestination: "Senior", color: .green, time: "06:15"),
    .init(flightName: "UL 6209", flightCompany: "VS", flightDestination: "Junior", color: .orange, time: "06:15"),
  ]

  var body: some View {
    SimpleTableView {
      SimpleTableLayout(columnsCount: 6) {
          
        columnHeaders()

        ForEach(people) { person in
          row(person)
        }
      }
    }
  }

  @ViewBuilder
  func columnHeaders() -> some View {
    Text("Flight")
      .padding(.trailing)
      .frame(
        maxWidth: .infinity,
        maxHeight: .infinity,
        alignment: .leading
      )
      .font(.caption)
      .padding(8)
      .background(.thinMaterial)
      .overlay(alignment: .top) { VStack { Divider() } }
      .overlay(alignment: .bottom) { VStack { Divider() } }
      .overlay(alignment: .leading) { HStack { Divider() } }
      .overlay(alignment: .trailing) { HStack { Divider() } }
      .simpleTableHeader()
      .zIndex(3)

    Group {
      Text("")
        .padding(.trailing)
        .frame(
          maxWidth: .infinity,
          maxHeight: .infinity,
          alignment: .leading
        )

      Text("Flight Number")
        .padding(.trailing)
        .frame(
          maxWidth: .infinity,
          maxHeight: .infinity,
          alignment: .leading
        )

      Text("Destination")
        .padding(.trailing)
        .frame(
          maxWidth: .infinity,
          maxHeight: .infinity,
          alignment: .leading
        )

      Text("Time")
        .padding(.leading)
        .frame(
          maxWidth: .infinity,
          maxHeight: .infinity,
          alignment: .trailing
        )

      Text("Status")
        .padding(.horizontal)
        .frame(
          maxWidth: .infinity,
          maxHeight: .infinity,
          alignment: .center
        )
    }
    .font(.caption)
    .padding(8)
    .background(.thinMaterial)
    .overlay(alignment: .top) { VStack { Divider() } }
    .overlay(alignment: .bottom) { VStack { Divider() } }
    .overlay(alignment: .trailing) { HStack { Divider() } }
    .simpleTableHeaderRow()
    .zIndex(2)
  }

  @ViewBuilder
  func row(_ person: Person) -> some View {
    Text(PersonNameComponentsFormatter().string(from: PersonNameComponents(
      givenName: person.flightName,
      familyName: person.flightDestination
    )))
    .padding(.trailing)
    .frame(
      maxWidth: .infinity,
      maxHeight: .infinity,
      alignment: .leading
    )
    .padding(8)
    .background(.thinMaterial)
    .background {
      GeometryReader { geometryProxy in
        person.color.frame(width: geometryProxy.size.width / 5)
      }
    }
    .overlay(alignment: .bottom) { VStack { Divider() } }
    .overlay(alignment: .leading) { HStack { Divider() } }
    .overlay(alignment: .trailing) { HStack { Divider() } }
    .simpleTableHeaderColumn()
    .zIndex(1)

    Group {

        Image(person.flightCompany)
            .resizable()
            .frame(width: 32.0, height: 32.0)
        Text(person.flightName)
          .padding(.trailing)
          .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .leading
          )

      Text(person.flightDestination)
        .padding(.trailing)
        .frame(
          maxWidth: .infinity,
          maxHeight: .infinity,
          alignment: .leading
        )


        Text(person.time)
        .padding(.leading)
        .frame(
          maxWidth: .infinity,
          maxHeight: .infinity,
          alignment: .trailing
        )

      //  var status: String = "On Time"
        Text(person.color == Color.red ? "Cancelled" : person.color == Color.orange ? "Delayed" : "On Time")
        .frame(
          maxWidth: .infinity,
          maxHeight: .infinity
        )
    }
    .padding(8)
    .overlay(alignment: .bottom) { VStack { Divider() } }
    .overlay(alignment: .trailing) { HStack { Divider() } }
  }

  static func date(_ year: Int, _ month: Int, _ day: Int) -> Date {
    let calendar = Calendar.current
    let components = DateComponents(year: year, month: month, day: day)
    return calendar.date(from: components)!
  }

  func age(for date: Date) -> Int {
    let calendar = Calendar.current
    return calendar.dateComponents([.year], from: date, to: Date()).year!
  }
}

struct flightScheduleView_Previews: PreviewProvider {
  static var previews: some View {
      flightScheduleView()
  }
}
#endif
