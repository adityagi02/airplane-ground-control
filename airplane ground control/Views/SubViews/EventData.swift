//
//  DatePlannerApp.swift
//  airplane ground control
//
//  Created by Aditya Tyagi  on 26/03/23.
//


import SwiftUI

class EventData: ObservableObject {
    @Published var events: [Event] = [
        Event(symbol: "chart.bar.fill",
              color: .red,
              title: "Report Submission",
              tasks: [EventTask(text: "Guava kombucha"),
                      EventTask(text: "Paper cups and plates"),
                      EventTask(text: "Cheese plate"),
                      EventTask(text: "Party poppers"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 30)),
        Event(symbol: "arrow.2.circlepath.circle.fill",
              color: .yellow,
              title: "Handling reserve parts",
              tasks: [EventTask(text: "Buy new tux"),
                      EventTask(text: "Get tickets"),
                      EventTask(text: "Pick up Carmen at the airport and bring her to the show"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 22)),
        Event(symbol: "bag.fill.badge.plus",
              color: .indigo,
              title: "Ordering nonstock parts",
              tasks: [EventTask(text: "Bring medical ID"),
                      EventTask(text: "Record heart rate data"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 4)),
        Event(symbol: "wrench.fill",
              color: .green,
              title: "Camping Trip",
              tasks: [EventTask(text: "Find a sleeping bag"),
                      EventTask(text: "Bug spray"),
                      EventTask(text: "Paper towels"),
                      EventTask(text: "Food for 4 meals"),
                      EventTask(text: "Straw hat"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 36)),
        Event(symbol: "airplane",
              color: .cyan,
              title: "Routine Check",
              tasks: [EventTask(text: "Find a board game to bring"),
                      EventTask(text: "Bring a desert to share"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 2)),
        Event(symbol: "wrench.fill",
              color: .primary,
              title: "Staging parts",
              tasks: [
                  EventTask(text: "Notebooks"),
                  EventTask(text: "Pencils"),
                  EventTask(text: "Binder"),
                  EventTask(text: "First day of school outfit"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 365)),
        Event(symbol: "eye.fill",
              color: .purple,
              title: "Quality assurance (QA) and quality control (QC)",
              tasks: [
                  EventTask(text: "Finish first draft"),
                  EventTask(text: "Send draft to editor"),
                  EventTask(text: "Final read-through"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 365 * 2)),
        Event(symbol: "wrench.fill",
              color: .gray,
              title: "Chain Maintainence",
              tasks: [
                  EventTask(text: "Watch Keynote"),
                  EventTask(text: "Watch What's new in SwiftUI"),
                  EventTask(text: "Go to DT developer labs"),
                  EventTask(text: "Learn about Create ML"),
              ],
              date: Date.from(month: 6, day: 7, year: 2021)),
        Event(symbol: "exclamationmark.octagon.fill",
              color: .orange,
              title: "Sayulita Trip",
              tasks: [
                  EventTask(text: "Buy plane tickets"),
                  EventTask(text: "Get a new bathing suit"),
                  EventTask(text: "Find a hotel room"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 19)),
    ]

    func delete(_ event: Event) {
        events.removeAll { $0.id == event.id }
    }
    
    func add(_ event: Event) {
        events.append(event)
    }
    
    func exists(_ event: Event) -> Bool {
        events.contains(event)
    }
    
    func sortedEvents(period: Period) -> Binding<[Event]> {
        Binding<[Event]>(
            get: {
                self.events
                    .filter {
                        switch period {
                        case .nextSevenDays:
                            return $0.isWithinSevenDays
                        case .nextThirtyDays:
                            return $0.isWithinSevenToThirtyDays
                        case .future:
                            return $0.isDistant
                        case .past:
                            return $0.isPast
                        }
                    }
                    .sorted { $0.date < $1.date }
            },
            set: { events in
                for event in events {
                    if let index = self.events.firstIndex(where: { $0.id == event.id }) {
                        self.events[index] = event
                    }
                }
            }
        )
    }
}

enum Period: String, CaseIterable, Identifiable {
    case nextSevenDays = "Today"
    case nextThirtyDays = "Next 7 Days"
    case future = "Future"
    case past = "Past"
    
    var id: String { self.rawValue }
    var name: String { self.rawValue }
}

extension Date {
    static func from(month: Int, day: Int, year: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let calendar = Calendar(identifier: .gregorian)
        if let date = calendar.date(from: dateComponents) {
            return date
        } else {
            return Date()
        }
    }

    static func roundedHoursFromNow(_ hours: Double) -> Date {
        let exactDate = Date(timeIntervalSinceNow: hours)
        guard let hourRange = Calendar.current.dateInterval(of: .hour, for: exactDate) else {
            return exactDate
        }
        return hourRange.end
    }
}
