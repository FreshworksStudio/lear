<template>
  <v-card flat class="container">
    <div class="timeline">
        <label>Annual Report Date</label>
        <span class="date">Sept 01, 2019</span>
        <label>Filing Date</label>
        <span class="date">Today (Sept 16, 2019)</span>
      </div>
  </v-card>
</template>w
<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'

@Component
export default class ARDate extends Vue {
  // TODO: Retrieve Dates Data Dynamically.
}
</script>
<style lang="stylus" scoped>
  @import '../../../assets/styles/theme.styl'

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
