import 'core-js/stable' // to polyfill ECMAScript features
import 'regenerator-runtime/runtime' // to use transpiled generator functions
import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import App from '@/App.vue'
import Vuelidate from 'vuelidate'
import Affix from 'vue-affix'
import router from '@/router'
import store from '@/store/store'
import configHelper from '@/utils/config-helper'
import '@/registerServiceWorker'

Vue.use(Vuetify, { iconfont: 'md' })
Vue.use(Vuelidate)
Vue.use(Affix)
Vue.config.productionTip = false
// CP0001327/874702467
// eslint-disable-next-line
sessionStorage.setItem('KEYCLOAK_TOKEN', 'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJUbWdtZUk0MnVsdUZ0N3FQbmUtcTEzdDUwa0JDbjF3bHF6dHN0UGdUM1dFIn0.eyJqdGkiOiIzMDczZDAxNC02MjEyLTQ1MjktODJhNC04OWUzZWJiNGQ3MzkiLCJleHAiOjE1NjkzMzc5ODksIm5iZiI6MCwiaWF0IjoxNTY5MjUxNTg5LCJpc3MiOiJodHRwczovL3Nzby1kZXYucGF0aGZpbmRlci5nb3YuYmMuY2EvYXV0aC9yZWFsbXMvZmNmMGtwcXIiLCJhdWQiOlsic2JjLWF1dGgtd2ViIiwiYWNjb3VudCJdLCJzdWIiOiJjM2Y0YWYxMS1hMjVlLTQ2YjEtOGJhNi1kOGZkNjMwZmY0NzUiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJzYmMtYXV0aC13ZWIiLCJhdXRoX3RpbWUiOjAsInNlc3Npb25fc3RhdGUiOiJlNDk0NDI2Zi1mNTBmLTRlNDAtOWJkZC1lNDRjMDRlZTE1ZTQiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbImh0dHA6Ly8xOTIuMTY4LjAuMTM6ODA4MC8iLCIxOTIuMTY4LjAuMTMiLCIqIiwiaHR0cDovLzE5Mi4xNjguMC4xMzo4MDgwIl0sInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJlZGl0Iiwib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiIsImJhc2ljIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiIiLCJyb2xlcyI6WyJlZGl0Iiwib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiIsImJhc2ljIl0sInByZWZlcnJlZF91c2VybmFtZSI6ImNwMDAwMTMyNyIsImxvZ2luU291cmNlIjoiUEFTU0NPREUiLCJ1c2VybmFtZSI6ImNwMDAwMTMyNyJ9.FrqOL3RPjUJFtwUD8on1eLApeaHNsRIqyNlx2RwG2gUjjlQ6ayVjandCl227_zdCcEwtGNRZjtcbPNRbpdG1Wnqr1A_6pl5ChZdfHPxZojlEbvIb9sFEDLY9sktavmucZ_4v2w-A0mbm6vya472giaWPoYALPwatxXENZ5qGGGVuydpAnBI_lQAzr7HIR0YvtLC0YsFHrPWT08vhjWjXhb8HR79aPLnLU3AX8O_ntpyYhCE-j4bAxA7GF5nxHw5trsTWmLu1VFFAjWFQpTbzU2lMXRMS4dqVCYOHawvOajp11863RvkHy6wtZlX5COMeIZb-P_SCPvhLGXC7Arovjg')     // <<< paste in JWT
sessionStorage.setItem('BUSINESS_IDENTIFIER', 'CP0001327')

/**
 * first fetch config from server, then load Vue
 */
configHelper.fetchConfig()
  .then(() => {
    new Vue({
      router,
      store,
      render: h => h(App)
    }).$mount('#app')
  })
  .catch(error => {
    console.error('error fetching config -', error)
    alert('Fatal error loading app')
  })
