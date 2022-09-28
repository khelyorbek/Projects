import fruitsArr from "./foods";
import {choice, remove} from './helpers';

const randomFruit = choice(fruitsArr);
console.log(`I’d like one ${randomFruit}, please.`);
console.log(`Here you go: ${randomFruit}`);
console.log(`Delicious! May I have another?`);
remove(fruitsArr, randomFruit);
console.log(`I’m sorry, we’re all out. We have ${fruitsArr.length} left.`);

// >>> Test <<<
// I’d like one 🍒, please.
// Here you go: 🍒
// Delicious! May I have another?
// I’m sorry, we’re all out. We have 14 left.