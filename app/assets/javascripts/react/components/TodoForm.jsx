import React, { PropTypes, Component } from "react";

const TodoForm = React.createClass({
  handleOnSubmit(event, input) {
    const { onSubmit } = this.props;
    event.preventDefault();

    if (!input.value.trim()) {
      return false;
    } else {
      onSubmit(input.value);
      input.value = "";
    }

  },

  render() {
    let input;

    return (
      <form onSubmit={ (event) => this.handleOnSubmit(event, input) } >
        <input type="text" ref={ (el) => { input = el } }/>
      </form>
    )
  }
})

export default TodoForm;

