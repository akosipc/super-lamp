import React, { PropTypes, Component } from "react";
import { filter } from "lodash";

import Todo from "../components/Todo";
import TodoForm from "../components/TodoForm";

const TodoContainer = React.createClass({
  getInitialState() {
    return this.props;
  },

  completeTask(todoId) {
    const { todos } = this.state;

    const newTodos = todos.map( (todo) => {
      if (todo.id === todoId) { todo.done = !todo.done } 
      return todo;
    });

    this.setState({todos: newTodos});
  },

  submitTask(value) {
    const { todos } = this.state;
    const newTodos = todos.concat(
      { id: todos.length + 1,
        todo: value,
        done: false });

    this.setState({todos: newTodos});
  },

  renderCompletedTasks() {
    const { todos } = this.state;
    const finishedTodos = filter(todos, (todo) => {
      return todo.done
    })

    return `${finishedTodos.length} Finished Tasks`;
  },

  renderTodos() {
    const { todos } = this.state;
    let items = [];

    todos.map( (todo, index) => {
      items.push(
        <Todo 
          key={ todo.id }
          todoId={ todo.id }
          todo={ todo.todo }
          done={ todo.done }
          completeTask={ this.completeTask } />
      )   
    });

    return items;
  },

  render() {
    return (
      <div className="container">
        { this.renderCompletedTasks() }
        { this.renderTodos() }
        <TodoForm
          onSubmit={ this.submitTask }/>
      </div>
    )
  }
})

export default TodoContainer;
