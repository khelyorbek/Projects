/** Textual markov chain generator */


class MarkovMachine {

  /** build markov machine; read in text.*/

  constructor(text) {
    let words = text.split(/[ \r\n]+/);
    this.words = words.filter(c => c !== "");
    this.chains = {};
    this.makeChains();
    this.finalString = "";
  }

  /** set markov chains:
   *
   *  for text of "the cat in the hat", chains will be
   *  {"the": ["cat", "hat"], "cat": ["in"], "in": ["the"], "hat": [null]} */

  makeChains() {

    // Looping through each word in the array
    for (let i = 0; i < this.words.length; i++) {
      // if the dictionary key does not exist yet
      if (!this.chains[this.words[i]]) {
        // create the key and set it to an array
        this.chains[this.words[i]] = [];
      }

      // If the next word doesn't exist
      if (!this.words[i + 1]) {
        // set it to null to indicate the end of the sentence
        this.chains[this.words[i]].push(null);
      } else {
        // if the next work exists, push it to the array that belong to key of dictionary
        this.chains[this.words[i]].push(this.words[i + 1]);
      }
    }
  }


  /** return random text from chains */

  makeText(numWords = 100) {
    this.finalString = "";
    // figuring out the length of the chains dictionary
    const chainsLength = Object.keys(this.chains).length;
    let randomNextWord = ' ';

    for (let j = 0; randomNextWord !== null; j++) {
      if (j === 0) {
        let randomKeyId = this.genRandom(chainsLength);
        let randomKeyName = Object.keys(this.chains)[randomKeyId];

        // adding the key name to the finalSting
        this.finalString = this.finalString + " " + randomKeyName;

        // find all words that can come after that random word
        let randomKeyWords = Object.values(this.chains)[randomKeyId];

        // pick one of those next-words randomly
        randomNextWord = randomKeyWords[this.genRandom(randomKeyWords.length)];
      } 
      else {
        let randomKeyName = randomNextWord;
        let randomKeyId = Object.keys(this.chains).findIndex(key => key === randomKeyName);

        // adding the key name to the finalSting
        this.finalString = this.finalString + " " + randomKeyName;

        // find all words that can come after that random word
        let randomKeyWords = Object.values(this.chains)[randomKeyId];

        // pick one of those next-words randomly
        randomNextWord = randomKeyWords[this.genRandom(randomKeyWords.length)];
      }
    }
    console.log(this.finalString);
  }

  genRandom(max) {
    return Math.floor(Math.random() * max);
  }
}

module.exports = { MarkovMachine };