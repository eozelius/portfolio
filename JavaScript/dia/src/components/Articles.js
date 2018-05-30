import React, { Component } from 'react'
import PropTypes from 'prop-types'

export default class Articles extends Component {
  constructor(props) {
    super(props)
    this.state = {
      articles: props.articles,
      ascending: true
    }
  }

  static getDerivedStateFromProps(nextProps, prevState) {
    return {
      articles: nextProps.articles
    }
  }

  sortAscending = () => {
    const articles = this.state.articles.slice(0)

    articles.sort((a,b) => {
      return new Date(a.publishedAt) - new Date(b.publishedAt)
    })

    if(this.state.ascending){
      articles.reverse()
    }

    this.setState({
      articles: articles,
      ascending: !this.state.ascending
    })
  }
  
  renderArticle(article, index) {
    return (

      <div className='article card' key={index} >
        <div className='card-header'>
          <h6>{article.title}</h6>
        </div>

        <div className='card-body'>
          <p className='card-text'> 
            {article.description}
          </p>
          <a href={article.url} target="_blank">
            <button type="button" className="btn btn-outline-info">read more</button>
          </a>
        </div>
      </div>
    )
  }

  render() {
    const articles  = this.state.articles.map((article, index) => this.renderArticle(article, index))
    const ascClassName = this.state.ascending ? 'active' : ''
    const dscClassName = this.state.ascending ? '' : 'active'

    return (
      <div className='articles col-6'>
        <h3 className='title'>Articles</h3>
        <div onClick={this.sortAscending} className='sort-articles'>
          <p className={ascClassName}>latest</p>
          <p> | </p>
          <p className={dscClassName} >oldest</p>
        </div>
        {articles}
      </div>
    )
  }
}

Articles.propTypes = { 
  articles: PropTypes.array.isRequired
}