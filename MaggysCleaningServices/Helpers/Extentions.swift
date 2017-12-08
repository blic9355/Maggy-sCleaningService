//
//  Extentions.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/8/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//

import Foundation
import JTAppleCalendar
let formatter = DateFormatter()
// Mark: - String Extention

extension String {
    func toDateFormattedWith(format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        guard let stringDate = formatter.date(from: self) else { return Date() }
        return stringDate
    }
}

// Mark: - CalendarVC Extention

extension CalendarViewController: JTAppleCalendarViewDataSource {
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        calendarFormatter.dateFormat = "YYY MM DD"
        calendarFormatter.timeZone = Calendar.current.timeZone
        calendarFormatter.locale = Calendar.current.locale
        
        
        let startDate = calendarFormatter.date(from: "2017 01 01")!
        let endDate = calendarFormatter.date(from: "3000 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        configureCell(view: cell, cellState: cellState)
    }
    
    func setUpCalendarView() {
        
        // calendar spacing
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        // takes you to todays date
        calendarView.scrollToDate(Date(), triggerScrollToDateDelegate: false, animateScroll: false, preferredScrollPosition: nil, extraAddedOffset: 0, completionHandler: nil)
        calendarView.selectDates([Date()])
        
        // set up labels
        calendarView.visibleDates { (visibleDates) in
            guard let date = visibleDates.monthDates.first?.date else { return }
            
            formatter.dateFormat = "yyyy"
            self.yearLabel.text = formatter.string(from: date)
            formatter.dateFormat = "MMMM"
            self.monthLabel.text = formatter.string(from: date)
        }
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let cell = cell as? CustomCell else { return }
        guard let day = cell.dateLabel.text else { return }
        guard let mounth = self.monthLabel.text else { return }
        
        
        dateLabel.isHidden = false
        if dateLabel.isHidden == false {
            dateLabel.text = "\(String(describing: day))/\(String(describing: mounth))/17"
        }
        cell.selectedView.isHidden = false
        cell.selectedView.layer.cornerRadius = cell.selectedView.frame.size.width / 3
        configureCell(view: cell, cellState: cellState)
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let cell = cell as? CustomCell else { return }
        dateLabel.isHidden = true
        cell.selectedView.isHidden = true
        configureCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setUpCalendarView()
    }

    // display the cell
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.dateLabel.text = cellState.text
        
        if cellState.isSelected {
            cell.selectedView.isHidden = false
        } else {
            cell.selectedView.isHidden = true
        }
        configureCell(view: cell, cellState: cellState)
        return cell
    }
}






/*
 func handleCellSelection(view: CustomCell, cellState: CellState) {
 if calendarView.allowsMultipleSelection {
 switch cellState.selectedPosition() {
 case .full: view.backgroundColor = UIColor.green
 case .left: view.backgroundColor = UIColor.yellow
 case .middle: view.backgroundColor = UIColor.red
 case .right: view.backgroundColor = UIColor.blue
 case .none: view.backgroundColor = nil
 }
 } else {
 if cellState.isSelected {
 view.backgroundColor = UIColor.red
 } else {
 view.backgroundColor = UIColor.white
 }
 }
 }
 */
