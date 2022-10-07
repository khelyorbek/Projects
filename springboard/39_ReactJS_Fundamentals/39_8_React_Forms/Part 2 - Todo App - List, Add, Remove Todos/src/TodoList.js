import React, {useState} from 'react';
import NewTodoForm from './NewTodoForm';
import Todo from './Todo';

const TodoList = () => {
    const INITIAL_STATE = [
        { todoTitle: 'Sample task' }
    ]

    // Place your state that contains all of the todos here.
    const [allTodos, setAllTodos] = useState(INITIAL_STATE);

    // custom method to handle additions to our allTodos state
    const addTodo = (newTodo) => {
        setAllTodos(items => [...allTodos, newTodo]);
    }

    // custom method to handle removal of an item from the allTodos state
    const removeTodo = (TodoToRemove) => {
        setAllTodos(allTodos.filter(obj => obj.todoTitle !== TodoToRemove));
    }

    return (
    <>
    <NewTodoForm addTodo={addTodo}/>
    
    <ul>
        {allTodos.map(({todoTitle}) => <Todo todoTitle={todoTitle} key={todoTitle} removeTodo={removeTodo} />)}
    </ul>
    
    </>
        )
}

export default TodoList;