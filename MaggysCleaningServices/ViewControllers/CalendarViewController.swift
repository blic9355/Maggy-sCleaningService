//
//  CalendarViewController.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/5/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//

import UIKit
import Firebase

import JTAppleCalendar
import EventKit

class CalendarViewController: UIViewController {
    var window: UIWindow?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDayEvents" {
            guard let destinationVC = segue.destination as? EventsTableViewController else { return }
            guard let dateText = dateLabel.text else { return }
            
            destinationVC.startDate = dateText
        }
    }
    
    func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            performSegue(withIdentifier: "toDayEvents", sender: self)
        }
    }
    var calendarFormatter = DateFormatter()
    let dateFormatter = DateFormatter()
    
    
    
    let cell = CustomCell()
    let eventStore = EKEventStore()
    
    // Mark: - Outlets
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    
    // Mark: - Actions
    @IBAction func makeAppointmentBtnTapped(_ sender: Any) {
        let eventStore: EKEventStore = EKEventStore()
        let appointmentDate = dateLabel.text?.toDateFormattedWith(format: "d/M/yy")
        
        
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
    
    @IBAction func signOutBtnTapped(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
        } catch {
            print("error: there was a problem signing out")
        }
        
        storyboard?.instantiateViewController(withIdentifier: "FirstVC")
    }
    //    guard (navigationController?.popToRootViewController(animated: true)) != nil
    //    else {
    //    print("No View Controller to pop off"),
    //    return
    //
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCalendarView()
        
    }
    
    func configureCell(view: JTAppleCell?, cellState: CellState) {
        guard let myCustomCell = view as? CustomCell else { return }
        
        handleCellTextColor(view: myCustomCell, cellState: cellState)
        //        handleCellSelection(view: myCustomCell, cellState: cellState)
    }
    
    func handleCellTextColor(view: CustomCell, cellState: CellState) {
        if cellState.dateBelongsTo == .thisMonth {
            view.dateLabel.textColor = UIColor.black
        } else {
            view.dateLabel.textColor = UIColor.gray
        }
    }
    
    var iii: Date?
    
}
















