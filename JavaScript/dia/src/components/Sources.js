import React, { Component } from 'react'
import PropTypes from 'prop-types'  

export default class Sources extends Component {
  constructor(props) {
    super(props)

    this.state = {
      activeSource: 0
    }
  }

  handleClick = (source_id, index) => {
    this.setState({
      activeSource: index
    })

    this.props.onClick([source_id])
  }

  renderSource(source, index) {
    let classNames = `source ${source.id}`

    if(this.state.activeSource === index) {
      classNames += ' active'
    }

    return (
      <div onClick={() => this.handleClick(source.id, index)} className={classNames} key={index} >
        <p>{source.name}</p>
      </div>
    )
  }

  render() {
    const sources = this.props.sources.map((source, index) => this.renderSource(source, index))
    
    return (
      <div className='sources col-6'>
        <h3 className='title'>Sources</h3>
        {sources}
      </div>
    )
  }
}

Sources.propTypes = { 
  sources: PropTypes.array.isRequired,
  onClick: PropTypes.func.isRequired
}
