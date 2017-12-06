//
//  CalendarViewController.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/5/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//

import UIKit
import  JTAppleCalendar

class CalendarViewController: UIViewController {
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CalendarViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "YYY MM DD"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2017 12 31")!
        
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    func configureCell(view: JTAppleCell, cellState: CellState) {
        guard let calendarcell = view as? CalendarCell else { return }
        
    }
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let calendarCell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        calendarCell.dateLabel.text = cellState.text
        return calendarCell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let calendarCell = cell as! CalendarCell
        calendarCell.dateLabel.text = cellState.text
        
        return 
    }
    
}
