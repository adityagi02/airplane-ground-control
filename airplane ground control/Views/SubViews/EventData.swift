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
              title: "Monthly Report Submission",
              tasks: [EventTask(text: "Reporting job progress, possible delays or the need of extra work to the superior and to the customer"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 30)),
        Event(symbol: "arrow.2.circlepath.circle.fill",
              color: .yellow,
              title: "Handling reserve parts",
              tasks: [
                      EventTask(text: "BFS (Belfast)"),
                      EventTask(text: "B737cl and B737ng"),
                      EventTask(text: "B1 position parts"),
                      
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 22)),
        Event(symbol: "bag.fill.badge.plus",
              color: .indigo,
              title: "Ordering nonstock parts",
              tasks: [EventTask(text: "Buy new EASA Part 66 B1"),
                      EventTask(text: "EASA Part-145 maintenance parts"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 4)),
        Event(symbol: "wrench.fill",
              color: .green,
              title: "Maintainence [BX23R5]",
              tasks: [EventTask(text: "Scheduled maintenance tasks"),
                      EventTask(text: "EASA Part-145 maintenance"),
                      EventTask(text: "Troubleshooting"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 36)),
        Event(symbol: "airplane",
              color: .cyan,
              title: "Routine Check",
              tasks: [EventTask(text: "Technical support"),
                      EventTask(text: "Line Maintenance"),
                      EventTask(text: "Communication with manufacturers and customers"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 2)),
        Event(symbol: "wrench.fill",
              color: .primary,
              title: "Staging parts",
              tasks: [
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 365)),
        Event(symbol: "eye.fill",
              color: .purple,
              title: "Quality assurance (QA) and quality control (QC)",
              tasks: [
                  EventTask(text: "On-site technical support in AOG"),
                  EventTask(text: " QA/QC of Learjet 45 and Bombardier Challenger 605/650"),
                  EventTask(text: "Final read-through"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 365 * 2)),
        Event(symbol: "wrench.fill",
              color: .gray,
              title: "Chain Maintainence",
              
              tasks: [
                  EventTask(text: "Part 145 Aircraft Maintenance"),
                  EventTask(text: "MAA Part 145 Aircraft Maintenance (AAG Defence Services)"),
                  EventTask(text: "CAMO & Technical Services"),
                  EventTask(text: "Part 21 Design Services and EASA Part 147"),
              ],
              date: Date.from(month: 6, day: 7, year: 2021)),
        Event(symbol: "exclamationmark.octagon.fill",
              color: .orange,
              title: "Fuel Report",
              tasks: [
                
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
