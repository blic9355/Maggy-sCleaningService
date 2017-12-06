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
    
    // Mark: - Outlets
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var calendarView: JTAppleCalendarView!
        
//    @IBOutlet weak var viewHeightConstant: NSLayoutConstraint!
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
//        setUp()
        self.calendarView.visibleDates {[unowned self] (visibleDates: DateSegmentInfo) in
            self.setupViewsOfCalendar(from: visibleDates)
        }
    }
    // Mark: - you should probably remove
    
    func setUp() {
    }
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        guard let startDate = visibleDates.monthDates.first?.date else { return }
        let month = Calendar.current.dateComponents([.month], from: startDate).month
        let monthName = formatter.monthSymbols[(month!-1) % 12]
        let year = Calendar.current.component(.year, from: startDate)
        monthLabel.text = monthName + " " + String(year)
    }
    
    func configureCell(view: JTAppleCell?, cellState: CellState) {
        guard let myCustomCell = view as? CustomCell else { return }
        handleCellTextColor(view: myCustomCell, cellState: cellState)
//        handleCellSelection(view: myCustomCell, cellState: cellState)
    }
    
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
    
    func handleCellTextColor(view: CustomCell, cellState: CellState) {
        if cellState.dateBelongsTo == .thisMonth {
            view.dateLabel.textColor = UIColor.black
        } else {
            view.dateLabel.textColor = UIColor.gray
        }
    }
    
    var iii: Date?
}

// Mark: - Extention

extension CalendarViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        configureCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        configureCell(view: cell, cellState: cellState)
        if cellState.text == "1" {
            formatter.dateFormat = "MMM"
            let month = formatter.string(from: date)
            cell.dateLabel.text = cellState.text
        } else {
            cell.dateLabel.text = cellState.text
        }
        return cell
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "YYY MM DD"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2017 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupViewsOfCalendar(from: visibleDates)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let cell = cell as? CustomCell else { return }
        cell.selectedView.isHidden = false
        cell.selectedView.layer.cornerRadius = cell.selectedView.frame.size.width / 3
        
        configureCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let cell = cell as? CustomCell else { return }
        cell.selectedView.isHidden = true
        configureCell(view: cell, cellState: cellState)
    }
    
    
    
    
}












