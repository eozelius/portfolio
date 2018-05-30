import axios from 'axios'

export function fetchSources(){
  const url = 'https://newsapi.org/v2/sources'
  return axios.get(url, { headers: { 'X-Api-Key': '29b629b0b9e94344a9e08037a0a7dc3b'}}) 
    .then((res) => {
      const sources = res.data.sources
      return sources
    })
    .catch((error) => {
      console.log(error)
      return []
    })
}

export function fetchArticles(sources = ['abc-news']) {
  let url = 'https://newsapi.org/v2/top-headlines?sources='
  const apiKey = `&apiKey=${process.env.REACT_APP_NEWSAPI_KEY}`

  for(let i = 0; i < sources.length; i++){
    url += sources[i]

    if(sources[i + 1] !== undefined) {
      url += ','
    }
  }
  url += apiKey

  return axios.get(url, { headers: { 'X-Api-Key': '29b629b0b9e94344a9e08037a0a7dc3b' }})
    .then((res) => {
      const articles = res.data.articles
      return articles
    })
    .catch((error) => {
      console.log(error)
      return []
    })
}