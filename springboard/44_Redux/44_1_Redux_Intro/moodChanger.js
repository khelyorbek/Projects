const moodText = document.querySelector("#moodText");

const btnJoy = document.querySelector("#joy");
const btnConfused = document.querySelector("#confused");
const btnNervous = document.querySelector("#nervous");
const btnReset = document.querySelector("#reset");

btnJoy.addEventListener("click", () => {
    store.dispatch({ type: "CHANGE_MOOD", payload: "(◕‿◕)" });
    const state = store.getState();
    moodText.innerHTML = state.mood;
})

btnConfused.addEventListener("click", () => {
    store.dispatch({ type: "CHANGE_MOOD", payload: "●.◉" });
    const state = store.getState();
    moodText.innerHTML = state.mood;
})

btnNervous.addEventListener("click", () => {
    store.dispatch({ type: "CHANGE_MOOD", payload: "●﹏●" });
    const state = store.getState();
    moodText.innerHTML = state.mood;
})

btnReset.addEventListener("click", () => {
    store.dispatch({ type: "RESET" });
    const state = store.getState();
    moodText.innerHTML = state.mood;
})