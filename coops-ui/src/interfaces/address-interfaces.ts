import Vue from 'vue'

export interface BaseAddressType extends Vue {
  $refs: any
}

// Base address Interface to match the address.json schema and it's optional fields.
export interface AddressIF extends Vue {
  addressCity: string
  addressCountry: string
  addressRegion: string
  deliveryInstructions?: string
  postalCode: string
  streetAddress: string
  streetAddressAdditional?: string
}

// Interface to define the joint base address response
export interface BaseAddressObjIF extends Vue {
  deliveryAddress: AddressIF,
  mailingAddress: AddressIF
}
