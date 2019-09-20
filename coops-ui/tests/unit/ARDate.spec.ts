import Vue from 'vue'
import Vuetify from 'vuetify'
import Vuelidate from 'vuelidate'
import ARDate from '@/components/AnnualReport/BCorp/ARDate.vue'
import DateMixin from '@/mixins/date-mixin'
import store from '@/store/store'
import { createLocalVue } from '@vue/test-utils'
import { mixins } from 'vue-class-component'

Vue.use(Vuetify)
Vue.use(Vuelidate)

// Boilerplate to prevent the complaint "[Vuetify] Unable to locate target [data-app]"
const app: HTMLDivElement = document.createElement('div')
app.setAttribute('data-app', 'true')
document.body.append(app)

describe('ARDate', () => {
  let vm

  beforeEach(done => {
    const Constructor = Vue.extend(ARDate)
    const instance = new Constructor({ store: store })
    vm = instance.$mount()

    Vue.nextTick(() => {
      done()
    })
  })

  it('displays ARDate component properly', async done => {
     vm.$store.state.nextARDate = '2019-09-16'

    Vue.nextTick(() => {
      expect(vm.$el.querySelector('.ar-date').textContent).toEqual('Sept 16 2019')
      expect(vm.$el.querySelector('.file-date').textContent).toEqual('Today ()')
      done()
    })
  })
})
