import React from "react";
import { render } from "react-dom";

import TodoContainer from "./containers/TodoContainer";

const App = {};

App.mountTodo = () => {
  render(
    <TodoContainer
      todos={
        [
          { id: 1, todo: "Sibakin sa pwesto si Mar", done: false },
          { id: 2, todo: "Sibakin sa pwet si Noynoy", done: false },
          { id: 3, todo: "Mabuhay ang NPA", done: true }
        ]
      }
    />,
    document.getElementById("todo-mount")
  );
}

export default App;


