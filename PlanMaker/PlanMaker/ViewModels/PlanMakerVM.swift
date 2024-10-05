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
    
    @Published var nearbyPlaces: [Place] = []
    @Published var radius: Int = 200
    @Published var Coordenades: (latitude: Double, longitude: Double) = (40.4273,-3.6692)
    @Published var selectedTypes: Set<PlaceType> = []
    init(interactor: PlacesInteractorProtocol = PlacesInteractor.shared) {
        self.interactor = interactor
    }
    
    func fetchNearbyPlaces() async {
        do {
            let places = try await interactor.getNearbyPlaces(includedTypes: Array(selectedTypes), latitudeCenter: Coordenades.latitude, longitudeCenter: Coordenades.longitude, radius: radius)
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
}
