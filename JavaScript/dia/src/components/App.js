import React, { Component } from 'react'

import {fetchSources, fetchArticles} from '../Api.js'
import Search from './Search.js'
import Sources from './Sources.js'
import Articles from './Articles.js'
import '../styles/App.css';

export default class App extends Component { 
  constructor(props) {
    super(props)

    this.state = {
      sources: [],
      articles: [],
    }
  }

  resetSources = () => {
    const sources = this.apiSources.slice(0)
    this.setState({sources: sources})
  }

  fetchSources = () => {
    fetchSources()
      .then((res) => {
        const sources = res.length > 0 ? res : []
        this.apiSources = sources
        this.setState({
          sources: sources
        })
      })
      .catch((error) => {
        console.log(`error ${error}`)
      })
  }

  fetchArticles = (sources) => {
    fetchArticles(sources)
      .then((res) => {
        const articles = res.length > 0 ? res : []

        this.setState({
          articles: articles
        })
      })
      .catch((error) => {
        console.log(error)
      })
  }

  searchSources = (filter) => {
    if(filter === '') {
      this.resetSources()
      this.fetchArticles()
      return false
    }

    filter = filter.toLowerCase()
    let filteredSources = []
    let filteredArticles = []

    for(let i = 0; i < this.apiSources.length; i++) {
      const srcName = this.apiSources[i].name.toLowerCase()
      if(srcName.includes(filter)) {
        filteredSources.push(this.apiSources[i])
        filteredArticles.push(this.apiSources[i].id)
      }
    }

    if(filteredSources.length > 0) {
      this.setState({sources: filteredSources})
      this.fetchArticles(filteredArticles)
    } else {
      this.setState({
        sources: [],
        articles: []
      })
    }
  }

  componentDidMount(){
    this.fetchSources()
    this.fetchArticles()
  }

  render() { 
    return (
      <div className="App container" >
        <div className='row'>
          <Search onKeyUp={this.searchSources} />
        </div>
        <div className='row'>
          <Sources  sources={this.state.sources} onClick={this.fetchArticles} />
          <Articles articles={this.state.articles} />
        </div>
      </div>
    );
  }
}