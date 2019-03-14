package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class FishingRiver extends FlxState
{

// // just a string and a weight
// class Pokemon {
//     string name;
//     float weight;
// }
// our potential encounter array

// public var arrayOfPondFish: FlxTypedGroup<PondFish>;
public var arrayOfPondFish: Array;

// Pokemon[] pokemans = new Pokemon[] {
//     Pokemon("Pikachu", 1.0),
//     Pokemon("Ratatta", 4.0),
//     Pokemon("Pidgey", 5.0)
// }

override public function create():Void
    {

        var arr : Array<Array<int>> = [[0, 0, 0], [0, 0, 0], [0, 0, 0]];
        //arrayOfPondFish = new Array();
        //add (arrayOfPondFish);

        //arrayOfPondFish.push(0, 0, "Guppy", 5);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}    

// string PickPokemonForEncounter () {

//     // add up all the weights we're considering
//     float totalWeight = 0;
//     for (int i = 0; i < pokemans.Length; i++) {
//         totalWeight += pokemans[i].weight;
//     }

//     // generate a random number between 1 and the total weight
//     float randomTest = rand(1, totalWeight);

//     // iterate over all the weights and subtract each from the random.
//     // if we hit zero, then return the item we hit zero at.
//     // the key here is that the more weight the item has, 
//     // the more likely it is to push the result beneath zero
//     for (int i = 0; i < pokemans.Length; i++) {
//         randomTest -= pokemans[i].weight;
//         if (randomTest <= 0) {
//             // we're done
//             return pokemans[i].name;
//         }
//     }
// }