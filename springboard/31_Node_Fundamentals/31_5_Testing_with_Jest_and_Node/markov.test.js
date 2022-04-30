const { MarkovMachine } = require("./markov");

describe('markov tests', function(){
    test('make sure the words are being chained properly', function(){
        let mm = new MarkovMachine("the cat in the hat");
        expect(mm.chains).toEqual({ the: [ 'cat', 'hat' ], cat: [ 'in' ], in: [ 'the' ], hat: [ null ] });
    })

    test('make sure the final string is not empty', function(){
        let mm = new MarkovMachine("the cat in the hat");
        mm.makeText();

        expect(mm.finalString).toEqual(expect.any(String));
    })

    test('make sure the random generated numbers dont go above the max set value', function() {
        let mm = new MarkovMachine("the cat in the hat");

        max = 5;
        random =  mm.genRandom(max);
        expect(random).toBeLessThanOrEqual(max)
    })
})