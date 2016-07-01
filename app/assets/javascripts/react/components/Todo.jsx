import React, { PropTypes, Component } from "react";

const Todo = React.createClass({
  handleOnChange() {
    const { completeTask, todoId } = this.props;
    completeTask(todoId)
  },

  render() {
    const { todoId, todo, done, completeTask } = this.props;

    return (
      <div>
        <input 
          id={ todoId }
          type="checkbox"
          checked={ done }
          onChange={ this.handleOnChange }/>
        <label htmlFor={ todoId }>
          { todo }
        </label>
      </div>
    )
  }
})

export default Todo;

Todo.propTypes = {
  todo:         PropTypes.string.isRequired,
  todoId:       PropTypes.number.isRequired,
  done:         PropTypes.bool.isRequired,
  completeTask: PropTypes.func.isRequired
}
