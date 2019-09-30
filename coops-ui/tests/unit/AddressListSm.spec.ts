import Vue from 'vue'
import Vuetify from 'vuetify'
import Vuelidate from 'vuelidate'
import { mount } from '@vue/test-utils'

import store from '@/store/store'
import AddressListSm from '@/components/Dashboard/AddressListSm.vue'
import { EntityTypes } from '@/enums'

Vue.use(Vuetify)
Vue.use(Vuelidate)

describe('AddressListSm as a COOP', () => {
  it('handles empty data', async done => {
    // init store
    store.state.entityType = EntityTypes.Coop
    store.state.mailingAddress = null
    store.state.deliveryAddress = null

    const wrapper = mount(AddressListSm, { store })
    const vm = wrapper.vm as any
    await wrapper.vm.$nextTick()

    expect(vm.mailingAddress).toBeNull()
    expect(vm.deliveryAddress).toBeNull()
    expect(vm.$el.querySelectorAll('.list-item').length).toEqual(0)

    wrapper.destroy()
    done()
  })

  it('displays the mailing address', async done => {
    // init store
    store.state.entityType = EntityTypes.Coop
    store.state.mailingAddress = {
      'streetAddress': '1012 Douglas St',
      'addressCity': 'Victoria',
      'addressRegion': 'BC',
      'postalCode': 'V8W 2C3',
      'addressCountry': 'CA'
    }
    store.state.deliveryAddress = null

    const wrapper = mount(AddressListSm, { store })
    const vm = wrapper.vm as any
    await wrapper.vm.$nextTick()

    expect(vm.mailingAddress).not.toBeNull()
    expect(vm.deliveryAddress).toBeNull()
    expect(vm.$el.querySelectorAll('.list-item').length).toEqual(1)
    expect(vm.$el.querySelector('.office-header').textContent).toBe('Registered Office')
    expect(vm.$el.querySelector('.list-item__title').textContent).toBe('Mailing Address')
    expect(vm.$el.querySelector('.address-details').textContent).toContain('1012 Douglas St')

    wrapper.destroy()
    done()
  })

  it('displays the delivery address', async done => {
    // init store
    store.state.entityType = EntityTypes.Coop
    store.state.mailingAddress = null
    store.state.deliveryAddress = {
      'streetAddress': '220 Buchanan St',
      'addressCity': 'Glasgow',
      'addressRegion': 'Scotland',
      'postalCode': 'G1 2FFF',
      'addressCountry': 'UK'
    }

    const wrapper = mount(AddressListSm, { store })
    const vm = wrapper.vm as any
    await wrapper.vm.$nextTick()

    expect(vm.mailingAddress).toBeNull()
    expect(vm.deliveryAddress).not.toBeNull()
    expect(vm.$el.querySelectorAll('.list-item').length).toEqual(1)
    expect(vm.$el.querySelector('.office-header').textContent).toBe('Registered Office')
    expect(vm.$el.querySelector('.list-item__title').textContent).toBe('Delivery Address')
    expect(vm.$el.querySelector('.address-details').textContent).toContain('220 Buchanan St')

    wrapper.destroy()
    done()
  })

  it('displays the delivery address & mailing address', async done => {
    // init store
    store.state.entityType = EntityTypes.Coop
    store.state.mailingAddress = {
      'streetAddress': '2909 Burrard St',
      'addressCity': 'Vancouver',
      'addressRegion': 'BC',
      'postalCode': 'V8T 1N4',
      'addressCountry': 'CA'
    }
    store.state.deliveryAddress = {
      'streetAddress': '220 Buchanan St',
      'addressCity': 'Glasgow',
      'addressRegion': 'Scotland',
      'postalCode': 'G1 2FFF',
      'addressCountry': 'UK'
    }

    const wrapper = mount(AddressListSm, { store })
    const vm = wrapper.vm as any
    await wrapper.vm.$nextTick()

    expect(vm.deliveryAddress).not.toBeNull()
    expect(vm.mailingAddress).not.toBeNull()
    expect(vm.$el.querySelectorAll('.list-item').length).toEqual(2)
    expect(vm.$el.querySelector('.office-header').textContent).toBe('Registered Office')
    expect(vm.$el.querySelector('.list-item .list-item__title').textContent).toContain('Delivery Address')
    expect(vm.$el.querySelector('.list-item:nth-child(2) .list-item__title').textContent).toContain('Mailing Address')
    expect(vm.$el.querySelector('li .address-details').textContent).toContain('220 Buchanan St')
    expect(vm.$el.querySelector('li:nth-child(2) .address-details').textContent).toContain('2909 Burrard St')

    wrapper.destroy()
    done()
  })
})

describe('AddressListSm as a BCORP', () => {
  it('handles empty data', async done => {
    // init store
    store.state.entityType = EntityTypes.BCorp
    store.state.mailingAddress = null
    store.state.deliveryAddress = null

    const wrapper = mount(AddressListSm, { store })
    const vm = wrapper.vm as any
    await wrapper.vm.$nextTick()

    expect(vm.mailingAddress).toBeNull()
    expect(vm.deliveryAddress).toBeNull()
    expect(vm.$el.querySelectorAll('.list-item').length).toEqual(0)

    wrapper.destroy()
    done()
  })

  it('displays the mailing address', async done => {
    // init store
    store.state.entityType = EntityTypes.BCorp
    store.state.mailingAddress = {
      'streetAddress': '1012 Douglas St',
      'addressCity': 'Victoria',
      'addressRegion': 'BC',
      'postalCode': 'V8W 2C3',
      'addressCountry': 'CA'
    }
    store.state.deliveryAddress = null

    const wrapper = mount(AddressListSm, { store })
    const vm = wrapper.vm as any
    await wrapper.vm.$nextTick()

    expect(vm.mailingAddress).not.toBeNull()
    expect(vm.deliveryAddress).toBeNull()
    expect(vm.$el.querySelectorAll('.list-item').length).toEqual(2)
    expect(vm.$el.querySelector('.office-header').textContent).toBe('Registered Office')
    expect(vm.$el.querySelector('.list-item__title').textContent).toBe('Mailing Address')
    expect(vm.$el.querySelector('.address-details').textContent).toContain('1012 Douglas St')

    wrapper.destroy()
    done()
  })

  it('displays the delivery address', async done => {
    // init store
    store.state.entityType = EntityTypes.BCorp
    store.state.mailingAddress = null
    store.state.deliveryAddress = {
      'streetAddress': '220 Buchanan St',
      'addressCity': 'Glasgow',
      'addressRegion': 'Scotland',
      'postalCode': 'G1 2FFF',
      'addressCountry': 'UK'
    }

    const wrapper = mount(AddressListSm, { store })
    const vm = wrapper.vm as any
    await wrapper.vm.$nextTick()

    expect(vm.mailingAddress).toBeNull()
    expect(vm.deliveryAddress).not.toBeNull()
    expect(vm.$el.querySelectorAll('.list-item').length).toEqual(2)
    expect(vm.$el.querySelector('.office-header').textContent).toBe('Registered Office')
    expect(vm.$el.querySelector('.list-item__title').textContent).toBe('Delivery Address')
    expect(vm.$el.querySelector('.address-details').textContent).toContain('220 Buchanan St')

    wrapper.destroy()
    done()
  })

  it('displays the delivery address & mailing address', async done => {
    // init store
    store.state.entityType = EntityTypes.BCorp
    store.state.mailingAddress = {
      'streetAddress': '2909 Burrard St',
      'addressCity': 'Vancouver',
      'addressRegion': 'BC',
      'postalCode': 'V8T 1N4',
      'addressCountry': 'CA'
    }
    store.state.deliveryAddress = {
      'streetAddress': '220 Buchanan St',
      'addressCity': 'Glasgow',
      'addressRegion': 'Scotland',
      'postalCode': 'G1 2FFF',
      'addressCountry': 'UK'
    }

    const wrapper = mount(AddressListSm, { store })
    const vm = wrapper.vm as any
    await wrapper.vm.$nextTick()

    expect(vm.deliveryAddress).not.toBeNull()
    expect(vm.mailingAddress).not.toBeNull()
    expect(vm.$el.querySelectorAll('.list-item').length).toEqual(4)
    expect(vm.$el.querySelector('.office-header').textContent).toBe('Registered Office')
    expect(vm.$el.querySelector('.list-item .list-item__title').textContent).toContain('Delivery Address')
    expect(vm.$el.querySelector('.list-item:nth-child(2) .list-item__title').textContent).toContain('Mailing Address')
    expect(vm.$el.querySelector('li .address-details').textContent).toContain('220 Buchanan St')
    expect(vm.$el.querySelector('li:nth-child(2) .address-details').textContent).toContain('2909 Burrard St')

    wrapper.destroy()
    done()
  })
})
