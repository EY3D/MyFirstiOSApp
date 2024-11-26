//
//  Exercise.swift
//  MyFirstHIIT
//
//  Created by Esmond Yeo on 26/11/24.
//

struct Exercise {
    let exerciseName: String
    let videoName: String
    
    enum exerciseEnum: String {
        case squat = "Squat"
        case stepUp = "Step Up"
        case burpee = "Burpee"
        case sunSalute = "Sun Salute"
    }
}
extension Exercise {
    static let exercises = [
        Exercise(exerciseName: exerciseEnum.squat.rawValue, videoName:"squat"),
        Exercise(exerciseName: exerciseEnum.stepUp.rawValue, videoName:"step-up"),
        Exercise(exerciseName: exerciseEnum.burpee.rawValue, videoName:"burpee"),
        Exercise(exerciseName: exerciseEnum.sunSalute.rawValue, videoName:"sun-salute"),
    ]
}
