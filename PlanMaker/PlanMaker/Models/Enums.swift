//
//  Enums.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

import Foundation


enum PlaceType: String, CaseIterable, Hashable, Codable {
    // Automotive
    case carDealer = "car_dealer"
    case carRental = "car_rental"
    case carRepair = "car_repair"
    case carWash = "car_wash"
    case electricVehicleChargingStation = "electric_vehicle_charging_station"
    case gasStation = "gas_station"
    case parking = "parking"
    case restStop = "rest_stop"

    // Business
    case farm = "farm"

    // Culture
    case artGallery = "art_gallery"
    case museum = "museum"
    case performingArtsTheater = "performing_arts_theater"

    // Education
    case library = "library"
    case preschool = "preschool"
    case primarySchool = "primary_school"
    case secondarySchool = "secondary_school"
    case university = "university"

    // Entertainment and Recreation
    case amusementCenter = "amusement_center"
    case amusementPark = "amusement_park"
    case aquarium = "aquarium"
    case banquetHall = "banquet_hall"
    case bowlingAlley = "bowling_alley"
    case casino = "casino"
    case communityCenter = "community_center"
    case conventionCenter = "convention_center"
    case culturalCenter = "cultural_center"
    case dogPark = "dog_park"
    case eventVenue = "event_venue"
    case hikingArea = "hiking_area"
    case historicalLandmark = "historical_landmark"
    case marina = "marina"
    case movieRental = "movie_rental"
    case movieTheater = "movie_theater"
    case nationalPark = "national_park"
    case nightClub = "night_club"
    case park = "park"
    case touristAttraction = "tourist_attraction"
    case visitorCenter = "visitor_center"
    case weddingVenue = "wedding_venue"
    case zoo = "zoo"

    // Finance
    case accounting = "accounting"
    case atm = "atm"
    case bank = "bank"

    // Food and Drink
    case americanRestaurant = "american_restaurant"
    case bakery = "bakery"
    case bar = "bar"
    case barbecueRestaurant = "barbecue_restaurant"
    case brazilianRestaurant = "brazilian_restaurant"
    case breakfastRestaurant = "breakfast_restaurant"
    case brunchRestaurant = "brunch_restaurant"
    case cafe = "cafe"
    case chineseRestaurant = "chinese_restaurant"
    case coffeeShop = "coffee_shop"
    case fastFoodRestaurant = "fast_food_restaurant"
    case frenchRestaurant = "french_restaurant"
    case greekRestaurant = "greek_restaurant"
    case hamburgerRestaurant = "hamburger_restaurant"
    case iceCreamShop = "ice_cream_shop"
    case indianRestaurant = "indian_restaurant"
    case indonesianRestaurant = "indonesian_restaurant"
    case italianRestaurant = "italian_restaurant"
    case japaneseRestaurant = "japanese_restaurant"
    case koreanRestaurant = "korean_restaurant"
    case lebaneseRestaurant = "lebanese_restaurant"
    case mealDelivery = "meal_delivery"
    case mealTakeaway = "meal_takeaway"
    case mediterraneanRestaurant = "mediterranean_restaurant"
    case mexicanRestaurant = "mexican_restaurant"
    case middleEasternRestaurant = "middle_eastern_restaurant"
    case pizzaRestaurant = "pizza_restaurant"
    case ramenRestaurant = "ramen_restaurant"
    case restaurant = "restaurant"
    case sandwichShop = "sandwich_shop"
    case seafoodRestaurant = "seafood_restaurant"
    case spanishRestaurant = "spanish_restaurant"
    case steakHouse = "steak_house"
    case sushiRestaurant = "sushi_restaurant"
    case thaiRestaurant = "thai_restaurant"
    case turkishRestaurant = "turkish_restaurant"
    case veganRestaurant = "vegan_restaurant"
    case vegetarianRestaurant = "vegetarian_restaurant"
    case vietnameseRestaurant = "vietnamese_restaurant"

    // Geographical Areas
    case administrativeAreaLevel1 = "administrative_area_level_1"
    case administrativeAreaLevel2 = "administrative_area_level_2"
    case country = "country"
    case locality = "locality"
    case postalCode = "postal_code"
    case schoolDistrict = "school_district"

    // Government
    case cityHall = "city_hall"
    case courthouse = "courthouse"
    case embassy = "embassy"
    case fireStation = "fire_station"
    case localGovernmentOffice = "local_government_office"
    case police = "police"
    case postOffice = "post_office"

    // Health and Wellness
    case dentalClinic = "dental_clinic"
    case dentist = "dentist"
    case doctor = "doctor"
    case drugstore = "drugstore"
    case hospital = "hospital"
    case medicalLab = "medical_lab"
    case pharmacy = "pharmacy"
    case physiotherapist = "physiotherapist"
    case spa = "spa"

    // Lodging
    case bedAndBreakfast = "bed_and_breakfast"
    case campground = "campground"
    case campingCabin = "camping_cabin"
    case cottage = "cottage"
    case extendedStayHotel = "extended_stay_hotel"
    case farmstay = "farmstay"
    case guestHouse = "guest_house"
    case hostel = "hostel"
    case hotel = "hotel"
    case lodging = "lodging"
    case motel = "motel"
    case privateGuestRoom = "private_guest_room"
    case resortHotel = "resort_hotel"
    case rvPark = "rv_park"

    // Places of Worship
    case church = "church"
    case hinduTemple = "hindu_temple"
    case mosque = "mosque"
    case synagogue = "synagogue"

    // Services
    case barberShop = "barber_shop"
    case beautySalon = "beauty_salon"
    case cemetery = "cemetery"
    case childCareAgency = "child_care_agency"
    case consultant = "consultant"
    case courierService = "courier_service"
    case electrician = "electrician"
    case florist = "florist"
    case funeralHome = "funeral_home"
    case hairCare = "hair_care"
    case hairSalon = "hair_salon"
    case insuranceAgency = "insurance_agency"
    case laundry = "laundry"
    case lawyer = "lawyer"
    case locksmith = "locksmith"
    case movingCompany = "moving_company"
    case painter = "painter"
    case plumber = "plumber"
    case realEstateAgency = "real_estate_agency"
    case roofingContractor = "roofing_contractor"
    case storage = "storage"
    case tailor = "tailor"
    case telecommunicationsServiceProvider = "telecommunications_service_provider"
    case travelAgency = "travel_agency"
    case veterinaryCare = "veterinary_care"

    // Shopping
    case autoPartsStore = "auto_parts_store"
    case bicycleStore = "bicycle_store"
    case bookStore = "book_store"
    case cellPhoneStore = "cell_phone_store"
    case clothingStore = "clothing_store"
    case convenienceStore = "convenience_store"
    case departmentStore = "department_store"
    case discountStore = "discount_store"
    case electronicsStore = "electronics_store"
    case furnitureStore = "furniture_store"
    case giftShop = "gift_shop"
    case groceryStore = "grocery_store"
    case hardwareStore = "hardware_store"
    case homeGoodsStore = "home_goods_store"
    case homeImprovementStore = "home_improvement_store"
    case jewelryStore = "jewelry_store"
    case liquorStore = "liquor_store"
    case market = "market"
    case petStore = "pet_store"
    case shoeStore = "shoe_store"
    case shoppingMall = "shopping_mall"
    case sportingGoodsStore = "sporting_goods_store"
    case store = "store"
    case supermarket = "supermarket"
    case wholesaler = "wholesaler"

    // Sports
    case athleticField = "athletic_field"
    case fitnessCenter = "fitness_center"
    case golfCourse = "golf_course"
    case gym = "gym"
    case playground = "playground"
    case skiResort = "ski_resort"
    case sportsClub = "sports_club"
    case sportsComplex = "sports_complex"
    case stadium = "stadium"
    case swimmingPool = "swimming_pool"

    // Transportation
    case airport = "airport"
    case busStation = "bus_station"
    case busStop = "bus_stop"
    case ferryTerminal = "ferry_terminal"
    case heliport = "heliport"
    case lightRailStation = "light_rail_station"
    case parkAndRide = "park_and_ride"
    case subwayStation = "subway_station"
    case taxiStand = "taxi_stand"
    case trainStation = "train_station"
    case transitDepot = "transit_depot"
    case transitStation = "transit_station"
    case truckStop = "truck_stop"
    
    static func alfaVersion() -> [Self] {
        [.restaurant,.cafe, .bar, .nightClub, .movieTheater, .amusementPark, .touristAttraction, .museum, .artGallery, .bowlingAlley, .park, .zoo, .aquarium, .casino, .eventVenue, .shoppingMall, .iceCreamShop, .sushiRestaurant, .fastFoodRestaurant]
    }
    
    static func entertainmentAndRecreation() -> [PlaceType] {
        [.nightClub, .movieTheater, .amusementPark, .touristAttraction, .museum, .artGallery, .bowlingAlley, .park, .zoo, .aquarium, .casino]
    }
    
    static func foodAndDrink() -> [PlaceType] {
        [.restaurant, .cafe, .bar, .iceCreamShop, .sushiRestaurant, .fastFoodRestaurant]
    }
    
    static func shopping() -> [PlaceType] {
        [.shoppingMall]
    }
    
}

extension PlaceType {
    func displayText() -> String {
        switch self {
        case .restaurant:
            return "Restaurante"
        case .cafe:
            return "Café"
        case .bar:
            return "Bar"
        case .nightClub:
            return "Discoteca"
        case .movieTheater:
            return "Cine"
        case .amusementPark:
            return "Parque de Atracciones"
        case .touristAttraction:
            return "Atracción Turística"
        case .museum:
            return "Museo"
        case .artGallery:
            return "Galería de Arte"
        case .bowlingAlley:
            return "Bolera"
        case .park:
            return "Parque"
        case .zoo:
            return "Zoológico"
        case .aquarium:
            return "Acuario"
        case .casino:
            return "Casino"
        case .eventVenue:
            return "Lugar de Eventos"
        case .shoppingMall:
            return "Centro Comercial"
        case .iceCreamShop:
            return "Heladería"
        case .sushiRestaurant:
            return "Sushi"
        case .fastFoodRestaurant:
            return "Comida Rápida"
        default:
            return ""
        }
    }
}
enum CategoryTypes {
    case automotive
    case business
    case culture
    case education
    case entertainmentAndRecreation
    case finance
    case foodAndDrink
    case geographicalAreas
    case government
    case healthAndWellness
    case lodging
    case placesOfWorship
    case services
    case shopping
    case sports
    case transportation
    
    func getTypes() -> [PlaceType] {
            switch self {
            case .automotive:
                return [.gasStation, .carRepair, .carRental, .carWash, .electricVehicleChargingStation, .parking, .carDealer, .restStop]
            case .business:
                return [.farm]
            case .culture:
                return [.museum, .artGallery, .performingArtsTheater]
            case .education:
                return [.university, .secondarySchool, .primarySchool, .preschool, .library]
            case .entertainmentAndRecreation:
                return [.touristAttraction, .amusementPark, .nightClub, .movieTheater, .zoo, .nationalPark, .park, .casino, .eventVenue, .bowlingAlley, .aquarium, .hikingArea, .communityCenter, .weddingVenue, .historicalLandmark, .amusementCenter, .dogPark, .marina, .culturalCenter, .visitorCenter, .banquetHall, .conventionCenter, .movieRental]
            case .finance:
                return [.atm, .bank, .accounting]
            case .foodAndDrink:
                return [.restaurant, .bar, .cafe, .bakery, .coffeeShop, .pizzaRestaurant, .fastFoodRestaurant, .iceCreamShop, .sushiRestaurant, .steakHouse, .seafoodRestaurant, .mexicanRestaurant, .spanishRestaurant, .italianRestaurant, .frenchRestaurant, .chineseRestaurant, .indianRestaurant, .thaiRestaurant, .turkishRestaurant, .vegetarianRestaurant, .veganRestaurant, .lebaneseRestaurant, .greekRestaurant, .brunchRestaurant, .ramenRestaurant, .hamburgerRestaurant, .mediterraneanRestaurant, .mealTakeaway, .mealDelivery]
            case .geographicalAreas:
                return [.locality, .administrativeAreaLevel1, .administrativeAreaLevel2, .country, .postalCode, .schoolDistrict]
            case .government:
                return [.cityHall, .police, .fireStation, .postOffice, .embassy, .courthouse, .localGovernmentOffice]
            case .healthAndWellness:
                return [.hospital, .pharmacy, .doctor, .dentist, .drugstore, .spa, .physiotherapist, .medicalLab, .dentalClinic]
            case .lodging:
                return [.hotel, .bedAndBreakfast, .hostel, .motel, .guestHouse, .resortHotel, .extendedStayHotel, .rvPark, .campground, .farmstay, .campingCabin, .privateGuestRoom, .cottage, .lodging]
            case .placesOfWorship:
                return [.church, .mosque, .hinduTemple, .synagogue]
            case .services:
                return [.laundry, .realEstateAgency, .barberShop, .beautySalon, .hairSalon, .hairCare, .florist, .funeralHome, .insuranceAgency, .lawyer, .plumber, .electrician, .childCareAgency, .movingCompany, .travelAgency, .veterinaryCare, .consultant, .tailor, .courierService, .locksmith, .painter, .roofingContractor, .storage, .telecommunicationsServiceProvider, .cemetery]
            case .shopping:
                return [.groceryStore, .supermarket, .shoppingMall, .convenienceStore, .liquorStore, .clothingStore, .departmentStore, .electronicsStore, .bookStore, .furnitureStore, .hardwareStore, .jewelryStore, .petStore, .autoPartsStore, .shoeStore, .bicycleStore, .giftShop, .discountStore, .sportingGoodsStore, .cellPhoneStore, .market, .homeGoodsStore, .homeImprovementStore, .store, .wholesaler]
            case .sports:
                return [.fitnessCenter, .gym, .stadium, .swimmingPool, .golfCourse, .sportsComplex, .playground, .sportsClub, .skiResort, .athleticField]
            case .transportation:
                return [.subwayStation, .trainStation, .busStop, .busStation, .airport, .taxiStand, .transitStation, .lightRailStation, .ferryTerminal, .transitDepot, .parkAndRide, .truckStop, .heliport]
            }
        }
}


