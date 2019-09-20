<template>
  <v-card flat class="container">
    <div class="timeline">
        <span class="title">Annual Report Date</span>
        <span class="date ar-date">{{this.toReadableDate(this.nextARDate)}}</span>
        <span class="title">Filing Date</span>
        <span class="date file-date">Today ({{this.toReadableDate(new Date())}})</span>
      </div>
  </v-card>
</template>w
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

  .container
    background: #FFFFFF

    .timeline
      display: flex

      .title
        color: #262626
        font-size: 1rem
        font-weight: 500
        line-height: 1.2rem

      .date
        color: #262626
        font-family: "BC Sans"
        font-size: 0.875rem
        line-height: 1.125rem
        margin: 0 3.125rem 0

</style>
