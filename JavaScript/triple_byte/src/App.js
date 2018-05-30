import React, { Component } from 'react';
import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">
        <Trello />
      </div>
    );
  }
}

class Trello extends Component {
  render (){
    return (
      <div id='trello'>
        <Column title="Column 1"/>
        <Column title="Column 2"/>
        <Column title="Column 3"/>
        <Column title="Column 4"/>
      </div>
    )
  }
}

class Column extends Component {
  constructor(props) {
    super(props)
    this.state = {
      cards: [],
    }
  }

  onClick = () => {
    let newCard = window.prompt('Create a new card please!')
    let newCards = this.state.cards
    newCards.push(newCard)

    this.setState(newCards)
  }


  render() {

    const cards = this.state.cards.map( title => <Card key={parseInt((Math.random() * 537990), 10 ) } title={title} /> )

    return (
      <div className='column'>
        <h4>{this.props.title}</h4>
        { cards }
        <button onClick={this.onClick} >+ add card</button>
      </div>
    )
  }
}

class Card extends Component {
  render() {
    return (
      <div className='card'>
        <p>{this.props.title}</p>
      </div>
    )
  }
}

export default App;
