import Vue from 'vue'

export interface BaseAddressType extends Vue {
  $refs: any
}

export interface AddressObjectIF extends Vue {
  actions?: string[]
}

export interface AddressIF extends Vue {
  actions?: string[],
  addressCity: string
  addressCountry: string
  addressRegion: string
  deliveryInstructions?: string
  postalCode: string
  streetAddress: string
  streetAddressAdditional?: string
}

export interface BaseAddressObjIF extends Vue {
  deliveryAddress: AddressIF,
  mailingAddress: AddressIF
}

export interface BcorpAddressIf extends Vue {
  registeredOffice: BaseAddressObjIF,
  recordsOffice: BaseAddressObjIF
}
