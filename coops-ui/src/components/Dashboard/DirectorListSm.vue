<template>
  <ul class="list">
    <v-expansion-panel :expand="true">
      <v-expansion-panel-content v-for="director in directors" v-bind:key="director.id">
        <div class="header" slot="header">
          <v-avatar color="primary" size="25">
            <span class="white--text small">{{ director.officer.firstName.substring(0,1)}}</span>
          </v-avatar>
          <div class="list-item__title">{{ director.officer.firstName }} {{ director.officer.lastName }}</div>
        </div>
        <li class="list-item" >
          <div class="director-info">
            <div class="address-title">Delivery Address</div>
            <div class="list-item__subtitle">
              <ul class="address-details">
                <li>{{ director.deliveryAddress.streetAddress }}</li>
                <li>{{ director.deliveryAddress.addressCity }} {{ director.deliveryAddress.addressRegion }}
                  &nbsp;&nbsp;{{ director.postalCode}}</li>
                <li>{{ director.deliveryAddress.addressCountry }}</li>
              </ul>
            </div>
          </div>
        </li>
        <li class="list-item" v-if="entityFilter(EntityTypes.BCorp)">
          <div class="director-info">
            <div class="address-title">Mailing Address</div>
            <div class="list-item__subtitle">
              <ul class="address-details">
                <li>{{ director.deliveryAddress.streetAddress }}</li>
                <li>{{ director.deliveryAddress.addressCity }} {{ director.deliveryAddress.addressRegion }}
                  &nbsp;&nbsp;{{ director.postalCode}}</li>
                <li>{{ director.deliveryAddress.addressCountry }}</li>
              </ul>
            </div>
          </div>
        </li>
      </v-expansion-panel-content>
    </v-expansion-panel>
  </ul>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import { mixins } from 'vue-class-component'
import { mapState } from 'vuex'
import EntityFilter from '@/mixins/entityFilter-mixin'
import { EntityTypes } from '@/enums'

@Component({
  computed: {
    ...mapState(['directors'])
  }
})
export default class DirectorListSm extends mixins(EntityFilter) {
  readonly directors: Array<object>

  // EntityTypes Enum
  private EntityTypes: {} = EntityTypes
}
</script>

<style lang="stylus" scoped>

  .header
    display: flex

  .list-item
    flex-direction row
    background #ffffff
    border-top none
    padding: .25rem 1.25rem

  .director-info
    line-height 1.325rem

  .list-item__title
    font-weight: 500

  .address-title
    margin-left 1.5rem

  .address-details
    list-style-type none

  .v-icon
    margin-right 1rem

  .v-avatar
    flex 0 0 auto
    margin-right 1.25rem

  .card
    display flex
    flex-wrap wrap
    align-items flex-start

  .card .list-item
    flex 0 0 33.333333%
    border none
</style>
