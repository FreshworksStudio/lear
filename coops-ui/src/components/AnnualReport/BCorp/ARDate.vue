<template>
  <section>
    <header>
      <h2 class="AR-step-header">1. Dates</h2>
      <p>Your Annual Report Date is the anniversary of the date your corporation was started.<br>
        The information displayed on this form reflects the state of your corporation on this date each year.
      </p>
    </header>
    <v-card flat class="container">
      <div class="timeline">
          <label>Annual Report Date</label>
          <span class="date ar-date">{{this.toReadableDate(this.nextARDate)}}</span>
          <label>Filing Date</label>
          <span class="date file-date">Today ({{this.toReadableDate(new Date())}})</span>
        </div>
    </v-card>
  </section>
</template>

<script lang="ts">
import { Component } from 'vue-property-decorator'
import { mapState } from 'vuex'
import DateMixin from '@/mixins/date-mixin'

@Component({
  computed: {
    ...mapState(['nextARDate'])
  }
})
export default class ARDate extends DateMixin {
    readonly nextARDate: string
}
</script>
<style lang="stylus" scoped>
  @import '../../../assets/styles/theme.styl'

  section p
    color: $gray6;

  section + section
    margin-top: 3rem;

  h2
    margin-bottom: 0.25rem;

  .container
    background: #FFFFFF

    .timeline
      display: flex
      justify-content space-between

      label
        font-weight: 500

      .date
        font-family: "BC Sans"
        margin-right: 4.5rem
</style>
