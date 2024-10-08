//
//  PlanMakerVM.swift
//  PlanMaker
//
//  Created by Fran Malo on 4/10/24.
//

import Foundation


final class PlanMakerVM: ObservableObject {
    let interactor: PlacesInteractorProtocol
    
    var placesPerPage = 10
    
    @Published var FilterViewState: FilterView = .activities

    
    @Published var nearbyPlaces: [Place] = []
    @Published var selectedTypes: Set<PlaceType> = []
    
    @Published var startTime: Date = Date()
    @Published var endTime: Date = Date()
    @Published var timeIntervale: (Int,Int) = (h:0,m:0)
    @Published var wantsBreakfast: Bool = false
    @Published var wantsBrunch: Bool = false
    @Published var wantsLunch: Bool = false
    @Published var wantsDinner: Bool = false
    
    @Published var radius: RangosMapa = .nivel0
    @Published var Coordenades: (latitude: Double, longitude: Double) = (40.4273,-3.6692)
    
    @Published var priceLevel: PriceLevel = .PRICE_LEVEL_UNSPECIFIED

    init(interactor: PlacesInteractorProtocol = PlacesInteractor.shared) {
        self.interactor = interactor
    }
    func fetchNearbyPlaces() async {
        do {
            let places = try await interactor.getNearbyPlaces(includedTypes: Array(selectedTypes), latitudeCenter: Coordenades.latitude, longitudeCenter: Coordenades.longitude, radius: Int(radius.metros))
            await MainActor.run {
                self.nearbyPlaces += places
            }
        } catch {
            
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
        print("Se uso")
        return !selectedTypes.isEmpty && timeIntervale != (0,0) && radius != .nivel0 && priceLevel != .PRICE_LEVEL_UNSPECIFIED
    }
}
