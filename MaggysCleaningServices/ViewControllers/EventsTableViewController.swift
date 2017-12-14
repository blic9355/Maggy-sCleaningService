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
        let start = startDate.toDateFormattedWith(format: "d/M/yy")
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
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
// Mark: - plan B
//    func fetchEventsFromCalendar(calendartitle: String) -> Void {
//        //        for calendar:EKCalendar in cal {
//        //
//        //        }
//    }
//
//    func requestAccessToCalendar() {
//        eventStore.requestAccess(to: EKEntityType.event) { (accessGranted, error) in
//            if accessGranted == true {
//                self.fetchEventsFromCalendar(calendartitle: "Calendar")
//            }
//        }
//    }
//
//    func checkCalendarAuthorizationStatus() {
//        let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
//
//        switch (status) {
//        case EKAuthorizationStatus.notDetermined:
//            requestAccessToCalendar()
//        case EKAuthorizationStatus.authorized:
//
//        }
//    }


//    func gettingEvents() {
//
//        let calendars = eventStore.calendars(for: .event)
//
//        for calendar in calendars {
//
//            if calendar.title == "Work" {
//
//                let today = NSDate(timeIntervalSinceNow: -30*24*3600)
//                let oneMonthAfter = NSDate(timeIntervalSinceNow: +30*24*3600)
//
//                let predicate = eventStore.predicateForEvents(withStart: Date() , end: Date(), calendars: [calendar])
//
//                var events = eventStore.events(matching: predicate)
//
//                for event in events {
//                    titles.append(event.title)
//                    .append(event.startDate as! NSDate)
//                    endDates.append(event.endDate as! NSDate)
//
//                }
//            }
//        }
//    }

