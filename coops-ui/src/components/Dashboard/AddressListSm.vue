<template>
  <ul class="list">
    <v-expansion-panel
      :expand="true"
      :value=0>
      <v-expansion-panel-content>
        <div class="office-header" slot="header">Registered Office</div>
        <ul class="list">
          <li class="list-item" v-if="deliveryAddress">
            <v-avatar>
              <v-icon color="primary">local_shipping</v-icon>
            </v-avatar>
            <div class="address">
              <div class="list-item__title">Delivery</div>
              <div class="list-item__subtitle">
                <ul class="address-details">
                  <li>{{ deliveryAddress.streetAddress }}</li>
                  <li>{{ deliveryAddress.addressCity }}
                    {{ deliveryAddress.addressRegion }}
                    {{ deliveryAddress.postalCode}}</li>
                  <li>{{ deliveryAddress.addressCountry }}</li>
                </ul>
              </div>
            </div>
          </li>

          <li class="list-item" v-if="mailingAddress">
            <v-avatar>
              <v-icon color="primary">mail_outline</v-icon>
            </v-avatar>
            <div class="address">
              <div class="list-item__title">Mailing</div>
              <div class="list-item__subtitle">
                <ul class="address-details">
                  <li>{{ mailingAddress.streetAddress }}</li>
                  <li>{{ mailingAddress.addressCity }}
                    {{ mailingAddress.addressRegion }}
                    {{ mailingAddress.postalCode}}</li>
                  <li>{{ mailingAddress.addressCountry }}</li>
                </ul>
              </div>
            </div>
          </li>
        </ul>
      </v-expansion-panel-content>
    </v-expansion-panel>

    <v-expansion-panel class="record-office" :expand="true" v-if="entityFilter(EntityTypes.BCorp)">
      <v-expansion-panel-content>
        <div class="office-header" slot="header">Record Office</div>
        <ul class="list">
          <li class="list-item" v-if="deliveryAddress">
            <v-avatar>
              <v-icon color="primary">local_shipping</v-icon>
            </v-avatar>
            <div class="address">
              <div class="list-item__title">Delivery</div>
              <div class="list-item__subtitle">
                <ul class="address-details">
                  <li>{{ deliveryAddress.streetAddress }}</li>
                  <li>{{ deliveryAddress.addressCity }}
                    {{ deliveryAddress.addressRegion }}
                    {{ deliveryAddress.postalCode}}</li>
                  <li>{{ deliveryAddress.addressCountry }}</li>
                </ul>
              </div>
            </div>
          </li>

          <li class="list-item" v-if="mailingAddress">
            <v-avatar>
              <v-icon color="primary">mail_outline</v-icon>
            </v-avatar>
            <div class="address">
              <div class="list-item__title">Mailing</div>
              <div class="list-item__subtitle">
                <ul class="address-details">
                  <li>{{ mailingAddress.streetAddress }}</li>
                  <li>{{ mailingAddress.addressCity }}
                    {{ mailingAddress.addressRegion }}
                    {{ mailingAddress.postalCode}}</li>
                  <li>{{ mailingAddress.addressCountry }}</li>
                </ul>
              </div>
            </div>
          </li>
        </ul>
      </v-expansion-panel-content>
    </v-expansion-panel>
  </ul>
</template>

<script lang="ts">
// Vue libraries
import { Component } from 'vue-property-decorator'
import { mixins } from 'vue-class-component'
import { mapState } from 'vuex'

// Mixins
import EntityFilter from '@/mixins/entityFilter-mixin'

// TS
import { EntityTypes } from '@/enums'

@Component({
  computed: {
    ...mapState(['mailingAddress', 'deliveryAddress'])
  }
})
export default class AddressListSm extends mixins(EntityFilter) {
  // Local Properties
  readonly mailingAddress: object
  readonly deliveryAddress: object

  // EntityTypes Enum
  private EntityTypes: {} = EntityTypes
}
</script>

<style lang="stylus" scoped>

  .office-header
    font-weight: 500

  .record-office
    border-top: 1px solid rgba(0,0,0,.12)

  .address-details
    padding 0
    list-style-type none

  .list-item
    flex-direction row
    align-items flex-start
    border-top none
    padding: .325rem 0rem;

  .list-item__title
    font-weight: 500

  .v-icon
    margin-right 1.25rem
</style>
