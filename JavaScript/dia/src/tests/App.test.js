import React from 'react'
import { mount } from 'enzyme'
import App from '../components/App'
import * as api from '../Api'

jest.mock('../Api')

describe('App', () => {
	let fetchedSources
	let fetchedArticles
	let sourcesPromise
	let articlesPromise

	const makeApp = () => {
		const component = mount(<App />)
		return Promise.all([sourcesPromise, articlesPromise]).then(() => component)
	}

  beforeEach(() => {
    fetchedSources = [
  		{
        "id":"abc-news",
        "name":"ABC News",
        "description":"Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
        "url":"http://abcnews.go.com",
        "category":"general",
        "language":"en",
        "country":"us"
      },
      {
        "id":"abc-news-au",
        "name":"ABC News (AU)",
        "description":"Australia's most trusted source of local, national and world news. Comprehensive, independent, in-depth analysis, the latest business, sport, weather and more.",
        "url":"http://www.abc.net.au/news",
        "category":"general",
        "language":"en",
        "country":"au"
      },
    ]
    fetchedArticles = [
	    {
	      "source":{
	        "id":"abc-news",
	        "name":"ABC News"
	      },
	      "author":"ABC News",
	      "title":"White House walks back Trump's call for US to leave Syria 'very soon'",
	      "description":"In a statement meant to clarify the U.S. presence in Syria, the White House did not announce an immediate withdrawal of U.S. forces, despite President Donald Trump's repeated calls in the past week to leave the country \"very soon.\"\n\"The military mission to er…",
	      "url":"http://abcnews.go.com/International/white-house-walks-back-trumps-call-us-leave/story?id=54231069",
	      "urlToImage":"https://s.abcnews.com/images/Politics/syria-ap-er-180403_hpMain_16x9_992.jpg",
	      "publishedAt":"2018-04-04T00:00:00Z"
	    },
	    {
	      "source":{
	        "id":"abc-news-au",
        	"name":"ABC News (AU)",
	      },
	      "author":"ABC News (AU)",
	      "title":"AU markets open sharply lower amid trade war fears with China",
	      "description":"The Dow Jones Industrial Average tumbled 500 points at today's open over concerns about a possible trade war with China.\nThe Nasdaq and S&P 500 also opened lower, and both the Dow and S&P are now in correction territory again.\nOn Tuesday, the Trump administra…",
	      "url":"http://abcnews.go.com/Business/us-markets-open-sharply-lower-amid-trade-war/story?id=54228498",
	      "urlToImage":null,
	      "publishedAt":"2018-04-04T00:00:00Z"
	    },
    ]

    sourcesPromise = Promise.resolve(fetchedSources)
    articlesPromise = Promise.resolve(fetchedArticles)

    api.fetchSources.mockReturnValue(sourcesPromise)
    api.fetchArticles.mockReturnValue(articlesPromise)
  })

  it('sets state to the fetched sources and articles', async function() {
    const wrapper = await makeApp()
    expect(wrapper.state('sources')).toEqual(fetchedSources)
    expect(wrapper.state('articles')).toEqual(fetchedArticles)
  })

  it('filters the list of Sources & Articles, based on the Search input', async function() {
  	const wrapper = await makeApp()
  	const fetchArticlesSpy = jest.spyOn(wrapper.instance(), 'fetchArticles')
  	fetchArticlesSpy.returnValue = fetchedArticles[1]

  	wrapper.instance().searchSources('au') // search input
  	expect(fetchArticlesSpy).toHaveBeenCalledWith(['abc-news-au']) // fetching new articles with list of filtered sources
  	expect(wrapper.state('sources')).toEqual([fetchedSources[1]])
  })
})





