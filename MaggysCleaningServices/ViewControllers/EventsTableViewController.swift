//
//  EventsTableViewController.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/12/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//

import UIKit
import EventKit


class EventsTableViewController: UITableViewController {
    let eventStore = EKEventStore()
    var startDate = ""
    
    
    
    var events: [EKEvent] = []
    
    func readEvents() {
        let start = startDate.toDateFormattedWith(format: "en_US")
        let end = start.addingTimeInterval(3600 as TimeInterval)
        let eventStore = EKEventStore()
        let calendars = eventStore.calendars(for: .event)
        
        for calendar in calendars {
            if calendar.title == "Calendar" {
                
                
                let predicate = eventStore.predicateForEvents(withStart: start, end: end, calendars: [calendar])
                
                let events = eventStore.events(matching: predicate)
                
                self.events = events
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readEvents()
    }
    
    
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppointmentCell", for: indexPath)
        
        let event = events[indexPath.row]
        cell.textLabel?.text = event.title
        cell.detailTextLabel?.text = "\(String(describing: event.startDate))"
        
        
        return cell
    }
    
    
    @IBAction func scheduleAppointment(_ sender: Any) {
        let eventStore: EKEventStore = EKEventStore()
        let appointmentDate: Date = startDate.toDateFormattedWith(format: "d/M/yy")
        
        
        eventStore.requestAccess(to: .event) { (granted, error) in
            if (granted) && (error == nil) {
                print("granted\(granted)")
                print("error \(String(describing:error))")
                
                let event: EKEvent = EKEvent(eventStore: eventStore)
                event.title = "test"
                DispatchQueue.main.async {
                    event.startDate = appointmentDate
                    event.endDate = event.startDate.addingTimeInterval(3600 as TimeInterval)
                }
                event.notes = "This is note"
                event.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    try eventStore.save(event, span: .thisEvent)
                } catch let error as NSError {
                    print("error \(error)")
                }
                print("save event")
            } else {
                print("error : \(String(describing:error))")
            }
        }
    }
    
}


