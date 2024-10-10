//
//  PlanMakerVM.swift
//  PlanMaker
//
//  Created by Fran Malo on 4/10/24.
//

import SwiftUI

enum OrderCriteria {
    case near
    case rate
}


final class PlanMakerVM: ObservableObject {
    
    var locationManager = LocationManager()
    
    let interactor: PlacesInteractorProtocol
    
    var placesPerPage = 10
    
    var orderCriteria: OrderCriteria = .near
    
    @Published var FilterViewState: FilterView = .activities
    
    
    var nearbyPlaces = Set<Place>() {
        didSet {
            updateSortedPlaces()
        }
    }
    
    @Published var sortedPlaces: [Place] = []
    @Published var selectedTypes: Set<PlaceType> = []
    
    @Published var startTime: Date = Date()
    @Published var endTime: Date = Date()
    @Published var timeIntervale: (Int,Int) = (h:0,m:0)
    @Published var wantsBreakfast: Bool = false
    @Published var wantsBrunch: Bool = false
    @Published var wantsLunch: Bool = false
    @Published var wantsDinner: Bool = false
    
    @Published var radius: RangosMapa = .nivel0
    
    @Published var priceLevel: PriceLevel = .PRICE_LEVEL_UNSPECIFIED

    init(interactor: PlacesInteractorProtocol = PlacesInteractor.shared) {
        self.interactor = interactor
        locationManager.checkLocationAuthorization()
    }
    func fetchNearbyPlaces() async {
        do {
            print("Se llama en el VM")
            let places: [Place] = try await interactor.getNearbyPlaces(includedTypes: Array(selectedTypes),
                                                                       latitudeCenter: locationManager.lastKnownLocation?.latitude ?? .greatestFiniteMagnitude,
                                                                       longitudeCenter: locationManager.lastKnownLocation?.longitude ?? .greatestFiniteMagnitude,
                                                                       radius: Int(radius.metros), number: 5)
            await MainActor.run {
                self.nearbyPlaces.formUnion(places)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func containsType(type: PlaceType) -> Bool {
        selectedTypes.contains(type)
    }
    
    func addType(type: PlaceType) {
        selectedTypes.insert(type)
    }
    
    func quitType(type: PlaceType) {
        selectedTypes.remove(type)
    }
    
    func calculateTimeDifference() {
        let calendar = Calendar.current
        var adjustedEndTime = endTime
        if endTime < startTime {
            adjustedEndTime = calendar.date(byAdding: .day, value: 1, to: endTime) ?? endTime
        }
        let components = calendar.dateComponents([.hour, .minute], from: startTime, to: adjustedEndTime)
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        timeIntervale = (hours, minutes)
    }
    
    func isTimeInRange(startHour: Int, endHour: Int) -> Bool {
        let calendar = Calendar.current
        let rangeStart = calendar.date(bySettingHour: startHour, minute: 0, second: 0, of: startTime)!
        let rangeEnd = calendar.date(bySettingHour: endHour, minute: 0, second: 0, of: startTime)!
        var adjustedEndTime = endTime
        
        if endTime < startTime {
            adjustedEndTime = calendar.date(byAdding: .day, value: 1, to: endTime) ?? endTime
        }
        
        return (startTime...adjustedEndTime).overlaps(rangeStart...rangeEnd)
    }
    
    func isBreakfastTimeIncluded() -> Bool {
        return isTimeInRange(startHour: 7, endHour: 11)
    }
    
    func isBrunchTimeIncluded() -> Bool {
        return isTimeInRange(startHour: 10, endHour: 13)
    }
    
    func isLunchTimeIncluded() -> Bool {
        return isTimeInRange(startHour: 14, endHour: 16)
    }
    
    func isDinnerTimeIncluded() -> Bool {
        return isTimeInRange(startHour: 18, endHour: 22)
    }
    
    func conditionsToCall() -> Bool {
        return !selectedTypes.isEmpty && timeIntervale != (0,0) && radius != .nivel0 && priceLevel != .PRICE_LEVEL_UNSPECIFIED
    }
    
    
    
    func updateSortedPlaces() {
            switch orderCriteria {
            case .near:
                guard let userLocation = locationManager.lastKnownLocation else { return }
                sortedPlaces = nearbyPlaces.sorted {
                    let distance1 = $0.distanceFromUser(userLocation: userLocation)
                    let distance2 = $1.distanceFromUser(userLocation: userLocation)
                    return distance1 < distance2
                }
            case .rate:
                sortedPlaces = nearbyPlaces.sorted { $0.rating < $1.rating }
            }
        }
}
