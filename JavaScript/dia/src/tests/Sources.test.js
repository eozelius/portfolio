import React from 'react'
import { shallow } from 'enzyme'

import Sources from '../components/Sources'

describe('Sources', () => {
  it('renders a list of sources', () => {
    const sources = [{name: 'BBC'}, {name: 'Google'}]
    const wrapper = shallow(<Sources sources={sources} onClick={()=>{}} />)
    
    expect(wrapper.find('.source')).toHaveLength(2)
    expect(wrapper.text()).toContain('BBC')
    expect(wrapper.text()).toContain('Google')
  })

  it('sets the first source as active', () => {
    const sources = [{name: 'BBC'}, {name: 'Google'}]
    const wrapper = shallow(<Sources sources={sources} onClick={()=>{}} />)
    const activeSource = wrapper.find('.active')
    
    expect(activeSource).toHaveLength(1)
    expect(activeSource.text()).toEqual('BBC')
  })

  it('updates the activeSource when a source is clicked', () => {
    const sources = [{name: 'BBC'}, {name: 'Google'}]
    const wrapper = shallow(<Sources sources={sources} onClick={()=>{}} />)

    let google = wrapper.find('.source').last()
    expect(wrapper.state('activeSource')).toEqual(0)
    google.simulate('click')
    expect(wrapper.state('activeSource')).toEqual(1)

    google = wrapper.find('.source').last()
    const bbc = wrapper.find('.source').first()
    expect(google.hasClass('active')).toEqual(true)
    expect(bbc.hasClass('active')).toEqual(false)
  })

  it('updates the activeSource when a source is clicked', () => {
    const onClickSpy = jest.fn()
    const sources = [{name: 'BBC', id: 'bbc_news'}, {name: 'Google', id: 'goo_news'}]
    const wrapper = shallow(<Sources sources={sources} onClick={onClickSpy} />)
    
    const google = wrapper.find('.source').last()
    google.simulate('click')
    expect(onClickSpy).toHaveBeenCalledWith(['goo_news'])
    expect(wrapper.state('activeSource')).toEqual(1)
  })
})