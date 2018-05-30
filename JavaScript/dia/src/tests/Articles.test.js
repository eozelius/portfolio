import React from 'react'
import { shallow } from 'enzyme'
import Articles from '../components/Articles'

describe('Articles', () => {
  let articles

	beforeEach(() => {
    articles = [
      {
        title: 'title - asdf',
        description: 'description - asdf',
        url: 'https://www.asdf.com/asdf'
      },
      {
        title: 'title - qwer',
        description: 'description - qwer',
        url: 'https://www.qwer.com/qwer'
      }
    ]
  })

  it('renders the title and description', () => {
    const wrapper = shallow(<Articles articles={articles} />)
    expect(wrapper.find('.article')).toHaveLength(2)
    expect(wrapper.text()).toContain(articles[0].title)
    expect(wrapper.text()).toContain(articles[1].description)
  })

  it('provides a link to the full article', () => {
    const wrapper = shallow(<Articles articles={articles} />)
    const link = wrapper.find('.article a').first()
    expect(link.prop('href')).toEqual(articles[0].url)
  })

  it('updates state.articles & dom, when new props are received', () => {
    const wrapper = shallow(<Articles articles={[]} />)
    expect(wrapper.state('articles')).toEqual([])
    expect(wrapper.text()).not.toContain(articles[0].title)
    
    wrapper.setProps({articles: articles})
    expect(wrapper.state('articles')).toEqual(articles)
    expect(wrapper.text()).toContain(articles[0].title)
  })

  it('sorts articles by published date, and rerenders the articles', () => {
    let latestArticle = articles[0]
    let oldestArticle = articles[1]
    latestArticle.date = new Date()
    oldestArticle.date = new Date(2000, 1, 1)
    
    const wrapper = shallow(<Articles articles={articles} />)
    const firstRenderedArticle = wrapper.find('.article').first()
    const sortLink = wrapper.find('.sort-articles')

    expect(firstRenderedArticle.text()).toContain(latestArticle.title)
    sortLink.simulate('click')
    expect(wrapper.find('.article').first().text()).toContain(oldestArticle.title)
  })

  it('sorts articles descending by published date, and updates the state', () => {
    let latestArticle = articles[0]
    let oldestArticle = articles[1]
    latestArticle.date = new Date()
    oldestArticle.date = new Date(2000, 1, 1)

    const wrapper = shallow(<Articles articles={articles} />)
    const sortLink = wrapper.find('.sort-articles')

    expect(wrapper.state('articles')[0]).toEqual(latestArticle)
    sortLink.simulate('click')
    expect(wrapper.state('articles')[0]).toEqual(oldestArticle)
  })
})