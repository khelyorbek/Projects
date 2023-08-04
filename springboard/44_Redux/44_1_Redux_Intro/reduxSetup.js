const INITIAL_STATE = { mood: "(￣ー￣)" };

const moodReducer = (state = INITIAL_STATE, action) => {
    switch (action.type) {
        case "CHANGE_MOOD": return { ...state, mood: action.payload };
        case "RESET": return INITIAL_STATE;
        default: return state;
    }
}

const store = Redux.createStore(moodReducer);