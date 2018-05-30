import React, { Component } from 'react'
import PropTypes from 'prop-types'

export default class Search extends Component {
  handleKeyUp = (e) => {
    e.preventDefault()
    const query = e.target.value
    this.props.onKeyUp(query)
  }

  render() {
    return (
      <div className="search col-12">
        <h1 className='title'>Search News Sources</h1>
        <input onKeyUp={this.handleKeyUp} type='text' name='source' placeholder='example: CNN, ABC...' />
      </div>
    );
  }
}

Search.propTypes = { 
  onKeyUp: PropTypes.func.isRequired
}
