// users.test.js
import axios from 'axios';
import {fetchSources, fetchArticles} from '../Api';

jest.mock('axios')

describe('Api', () => {
  test('should fetch articles', () => {
    const fetchedArticles = {
      data: {
        articles: [
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
              "id":"abc-news",
              "name":"ABC News"
            },
            "author":"ABC News",
            "title":"US markets open sharply lower amid trade war fears with China",
            "description":"The Dow Jones Industrial Average tumbled 500 points at today's open over concerns about a possible trade war with China.\nThe Nasdaq and S&P 500 also opened lower, and both the Dow and S&P are now in correction territory again.\nOn Tuesday, the Trump administra…",
            "url":"http://abcnews.go.com/Business/us-markets-open-sharply-lower-amid-trade-war/story?id=54228498",
            "urlToImage":null,
            "publishedAt":"2018-04-04T00:00:00Z"
          }
        ]
      }
    }
    axios.get.mockImplementation(() => {
      return Promise.resolve(fetchedArticles)
    })

    fetchArticles().then((articles) => {
      expect(articles[0]).toEqual(fetchedArticles.data.articles[0])
      expect(articles[1]).toEqual(fetchedArticles.data.articles[1])
    })
  })  

  it('should fetch sources', () => {
    const fetchedSources = {
      data: {
        sources: [{
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
        }]
      }
    }

    axios.get.mockImplementation(() => {
      return Promise.resolve(fetchedSources)
    })

    fetchSources().then((sources) => {
      expect(sources[0]).toEqual(fetchedSources.data.sources[0])
      expect(sources[1]).toEqual(fetchedSources.data.sources[1])
    })
  })
})