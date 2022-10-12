import React, { useState, useEffect } from "react";
import axios from "axios";
import uuid from "uuid";

const useAxios = (url) => {
    const [cards, setCards] = useState([]);

    const addCard = async (restOfUrl) => {
        const response = await axios.get(`${url}${restOfUrl}`);
        setCards(cards => [...cards, { ...response.data, id: uuid() }]);
    };

    return [cards, addCard];

}

export default useAxios;