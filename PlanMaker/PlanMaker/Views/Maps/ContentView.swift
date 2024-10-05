//
//  ContentView.swift
//  PlanMaker
//
//  Created by Fran Malo on 1/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue: Double = 0

    // Los valores reales de las distancias
    let distancias: [Double] = [200, 300, 400,  500, 600, 700, 800, 900, 1000, 1500, 2000, 2500]

    var body: some View {
        VStack {
            // Mostrar la distancia seleccionada, calculada a partir del sliderValue
            Text("Explora planes en un radio de \(Int(distanciaSeleccionada())) m")
            Text("Explora planes en un radio de… \(Int(distanciaSeleccionada())) m")
            
            Slider(value: $sliderValue, in: 0...(Double(distancias.count - 1)), step: 1)
                .padding(.horizontal, 50)
        }
    }

    // Función para obtener la distancia correspondiente al valor del slider
    func distanciaSeleccionada() -> Double {
        let index = Int(sliderValue)
        return distancias[index]
    }
    
    
}


#Preview {
    ContentView()
}
