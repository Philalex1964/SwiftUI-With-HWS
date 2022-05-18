//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Aleksandar Filipov on 5/17/22.
//

import UserNotifications
import CodeScanner
import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    enum SortType {
        case name, recent, none
    }
    
    @EnvironmentObject var prospects: Prospects
    @State private var isShowingScanner = false
    @State private var showingSortMenu = false
    
    let filter: FilterType
    //    let sort: SortType
    //    var sortedProspects: [Prospect]
    
    var body: some View {
        var sortedProspects: [Prospect] = filteredProspects
        
        NavigationView {
            List {
                ForEach(sortedProspects) { prospect in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Image(systemName: prospect.isContacted ? "person.crop.circle.fill.badge.checkmark" : "person.crop.circle.badge.xmark")
                            .tint(prospect.isContacted ? .blue : .green)
                    }
                    .swipeActions {
                        if prospect.isContacted {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
                            }
                            .tint(.blue)
                        } else {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
                            }
                            .tint(.green)
                            
                            Button {
                                addNotification(for: prospect)
                            } label: {
                                Label("Remind Me", systemImage: "bell")
                            }
                            .tint(.orange)
                        }
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        showingSortMenu = true
                    } label: {
                        Label("Sort", systemImage: "person.crop.rectangle.stack")
                    }
                    .confirmationDialog("Sort", isPresented: $showingSortMenu) {
                        Button("Name") {
                            //                            sortedProspects = filteredProspects.sorted {
                            //                                $0.name < $1.name
                            //                            }
                        }
                        .onTapGesture {
                            sortedProspects = filteredProspects.sorted {
                                $0.name < $1.name
                            }
                        }
                            Button("Recent") {
                                
                            }
                            Button("Cancel", role: .cancel) { }
                        } message: {
                            Text("Sort by:")
                        }
                        
                        Button {
                            isShowingScanner = true
                        } label: {
                            Label("Scan", systemImage: "qrcode.viewfinder")
                        }
                        .sheet(isPresented: $isShowingScanner) {
                            CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
                        }
                    }
                    
                    //                .sheet(isPresented: $isShowingScanner) {
                    //                    CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
                    //                }
                }
                //                Button {
                //
                //                } label: {
                //                    Label("Sort", systemImage: "person.crop.rectangle.stack")
                //                }
                //
                //                Button {
                //                    isShowingScanner = true
                //                } label: {
                //                    Label("Scan", systemImage: "qrcode.viewfinder")
                //                }
                //            }
                //            .sheet(isPresented: $isShowingScanner) {
                //                CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
                //            }
                //            Spacer()
                //
                //            .toolbar {
                //                Button {
                //
                //                } label: {
                //                    Label("Sort", systemImage: "person.crop.rectangle.stack")
                //                }
                //            }
            }
        }
        
        var title: String {
            switch filter {
            case .none:
                return "Everyone"
            case .contacted:
                return "Contacted people"
            case .uncontacted:
                return "Uncontacted people"
            }
        }
        
        var filteredProspects: [Prospect] {
            switch filter {
            case .none:
                return prospects.people
            case .contacted:
                return prospects.people.filter { $0.isContacted }
            case .uncontacted:
                return prospects.people.filter { !$0.isContacted }
            }
        }
        
        //    var sortedProspects = filteredProspects.sorted {
        //        $0.name < $1.name
        //    }
        
        
        func handleScan(result: Result<ScanResult, ScanError>) {
            isShowingScanner = false
            
            switch result {
            case .success(let result):
                let details = result.string.components(separatedBy: "\n")
                guard details.count == 2 else { return }
                
                let person = Prospect()
                person.name = details[0]
                person.emailAddress = details[1]
                
                prospects.add(person)
            case .failure(let error):
                print("Scanning failed: \(error.localizedDescription)")
            }
        }
        
        func addNotification(for prospect: Prospect) {
            let center = UNUserNotificationCenter.current()
            
            let addRequest = {
                let content = UNMutableNotificationContent()
                content.title = "Contact \(prospect.name)"
                content.subtitle = prospect.emailAddress
                content.sound = UNNotificationSound.default
                
                var dateComponents = DateComponents()
                dateComponents.hour = 9
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
                //            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                center.add(request)
            }
            
            center.getNotificationSettings { settings in
                if settings.authorizationStatus == .authorized {
                    addRequest()
                } else {
                    center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            addRequest()
                        } else {
                            print("D'oh")
                        }
                    }
                }
            }
        }
    }
    
    //struct ProspectsView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        ProspectsView(filter: .none)
    //            .environmentObject(Prospects())
    //    }
    //}
