import React from 'react'
import { shallow, mount } from 'enzyme'
import Search from '../components/Search'

describe('Search', () => {
  it('renders a text input', () => {
    const wrapper = shallow(<Search onKeyUp={() => {}} />)    
    const searchInput = wrapper.find('.search input[type="text"]')
    expect(searchInput).toHaveLength(1)
    expect(searchInput.prop('name')).toEqual('source')
  })

  it('recieves a keyUp callback in props', () => {
    const keyUpSpy = jest.fn()
    const wrapper = mount(<Search onKeyUp={keyUpSpy} />)
    const searchInput = wrapper.find('.search input[type="text"]')
    searchInput.simulate('keyUp', { target: { value: 'a' } } ) // 'a' key
    expect(keyUpSpy).toHaveBeenCalledWith('a')
  })
})