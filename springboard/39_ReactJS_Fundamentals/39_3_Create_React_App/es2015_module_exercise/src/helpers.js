function choice(items) {
    // returning an item from an array of items
    // picking an item randomly from 0 to the lenght of array
    return items[Math.floor(Math.random() * items.length)];
}

function remove(items, item) {
    const index = items.indexOf(item);
    if (index > -1) {
        // saving the removed item into a variable. 
        const ret = items.splice(index, 1);
        // returning an item. splice returns an array, so return 0th index which is the value of removed variable.
        return ret[0];
    }
    return undefined;
}

export {choice, remove}