//
//  TrainingsViewController.swift
//  Breeds
//
//  Created by Sergey on 11/14/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class TrainingsViewController: UIViewController {

    var trainings: [Training] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        trainings = createTrainingsArray()
    }
    
    func createTrainingsArray() -> [Training] {
        
        var tempTrainings: [Training] = []
        
        let firtText = """
        1. Have your dog on leash. Toss a treat out of his reach.
        2. Wait for your dog to stop pulling and straining towards the treat.
        3. When he does, give him a treat for looking at you.
        4. Only then can you walk towards the treat. Be sure to keep a loose leash while you do so.
        5. Repeat.
        As you go, you’ll start noticing that your dog automatically will not pull you towards tempting items on walks. Practice in a variety of locations with a variety of temptations to solidify the skill
        """
        
        let secondText = """
        1. Put some tasty treats in your hand and place your hand near your dog.
        2. Keep your hand closed as your dog sniffs, nibbles, or paws at your hand.
        3. Open your hand when your dog sits back to wait.
        4. Close your hand if your dog immediately dives back in for the goodies.
        5. When she stays away for a second or two, place 1 treat on the ground.
        6. Gradually build up time between opening your hand and delivering the treat so that your dog has to watch the open hand for longer.
        “Level up” this game by putting the food on the floor and covering it with your hand, then by covering it with your foot. You can add the cue “leave it” right before you open your hand if you want.
        """
        
        let thirdText = """
        1. Pick out a blanket, towel, or mat. This should not be a dog bed.
        2. Place the mat on the ground in front of your dog.
        3. Reward your dog for any interest in the mat – looking at it, moving towards it, sniffing, paws on it. Keep treating your dog if she stays on the mat.
        4. Gradually narrow your criteria. Work towards only rewarding your dog for lying down. It’s ok to just cut to the chase and cue your dog to lie down, if you’d like.
        5. Use Karen Overall’s Relaxation Protocol as a way to solidify mat training.
        6. Once you’re doing well, try new places and distractions!
        I absolutely swear by this training method. Thanks to Karen Overall’s relaxation protocol, I’ve taught my high-energy border collie to lie at my feet for up to 8 hours a day while at a busy coworking space. Don’t worry, we get up for plenty of walks and potty breaks!
        """
        
        let fourthText = """
        1. Give your dog something he likes. Try a stuffed Kong, chew toy, tug toy, pig’s ear, or ball.
        2. Approach your dog and click when he looks at you. Toss some awesome treats near him. He should drop it now! (If he doesn’t, you need better treats and a less exciting toy).
        3. Pick up the object he had as he eats the new goodies.
        4. Give him the object back.
        5. Repeat. The goal is that he gets excited for new goodies when you approach him.
        6. Repeat until your dog drops his toy when you come near. Now start offering your hand and saying “drop it.” You just added in a cue!
        """
        
        let fifthText = """
        1. Take treats on a walk with you.
        2. When you see the object of focus (a person, dog car, or squirrel), click or say “yes!” and feed your dog a treat when he looks back at you.
        3. If your dog doesn’t turn towards you because he’s too fixated on the object of focus, you’re too close or your treats aren’t good enough. Try again next time.
        4. Move away from the object of focus.

        """
        
        let sixthText = """
        1. Start with just one toy out. Tell your dog to “go get your X” or “go find X.” Whatever phrase you pick, be consistent. Reward your dog by grabbing the toy by playing with it. If you say your cue in an excited voice and point at the toy, most dogs will get this right away.
        2. Fade out pointing and just use the verbal cue. Continue to reward your dog by playing with the toy when they grab it.
        3. Introduce another toy to the picture. You might want to start with another toy that’s a bit less excited than the named toy. Now, only reward your dog when he grabs the correct toy.
        4. Start to name a second toy using steps one and two. This will be easiest if your dog loves both toys about the same. If your dog goes bonkers for the ball and is kind of “meh” about a squeaky toy, don’t try to use those two toys! That sets you up for failure.
        5. Repeat step three with the two named toys. Start to alternate which toy you ask for.
        6. Gradually build up the number of toys that your dog knows by name.

        """
        
        let training1 = Training(image: UIImage(named: "firstPhoto")!, title: "Best for Ignoring Stuff on Walks: Walking Leave It", text: firtText, url: "https://youtu.be/cxI09eGxSMU")
        let training2 = Training(image: UIImage(named: "secondPhoto")!, title: "Best for Stopping Food Theft: It’s Your Choice", text: secondText, url: "https://youtu.be/3knmE9vvhg8")
        let training3 = Training(image: UIImage(named: "thirdPhoto")!, title: "Best for Calm Out-and-About Behavior: Relax on Your Mat", text: thirdText, url: "https://youtu.be/BqRh8r6rHuc")
        let training4 = Training(image: UIImage(named: "fourthPhoto")!, title: "Best for Teaching Drop It: Exchange Games", text: fourthText, url: "https://youtu.be/Rbs0tCrxgYs")
        let training5 = Training(image: UIImage(named: "fifthPhoto")!, title: "Best for Nervous or Reactive Dogs: Look at That!", text: fifthText, url: "https://youtu.be/oor3OJaRevg")
        let training6 = Training(image: UIImage(named: "sixthPhoto")!, title: "Best for Rainy Days: Go Find It!", text: sixthText, url: "https://youtu.be/QMmHmacXvRs")
        
        tempTrainings.append(training1)
        tempTrainings.append(training2)
        tempTrainings.append(training3)
        tempTrainings.append(training4)
        tempTrainings.append(training5)
        tempTrainings.append(training6)
        
        return tempTrainings
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "ToDetailTraining" {
            let destVC = segue.destination as! TraiingsDetailScreenViewController
            destVC.object = sender as? Training
        }
    }


}

extension TrainingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        trainings.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrainingCell", for: indexPath) as! TrainingsTableViewCell
        let training = trainings[indexPath.section]
        cell.setTraining(training: training)
        cell.trainingimageView.layer.cornerRadius = cell.trainingimageView.frame.size.height / 2
        cell.backgroundColor = UIColor.systemGray5
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let object = trainings[indexPath.row]
        performSegue(withIdentifier: "ToDetailTraining", sender: object)
    }
    
}
