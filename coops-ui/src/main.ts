import 'core-js/stable' // to polyfill ECMAScript features
import 'regenerator-runtime/runtime' // to use transpiled generator functions
import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import App from '@/App.vue'
import Vuelidate from 'vuelidate'
import Vue2Filters from 'vue2-filters'
import Affix from 'vue-affix'
import router from '@/router'
import store from '@/store/store'
import configHelper from '@/utils/config-helper'
import '@/registerServiceWorker'

Vue.use(Vuetify, { iconfont: 'md' })
Vue.use(Vuelidate)
Vue.use(Vue2Filters)
Vue.use(Affix)
Vue.config.productionTip = false

// eslint-disable-next-line
sessionStorage.setItem('KEYCLOAK_TOKEN', 'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJUbWdtZUk0MnVsdUZ0N3FQbmUtcTEzdDUwa0JDbjF3bHF6dHN0UGdUM1dFIn0.eyJqdGkiOiJhNTRlOTFjOC1mZmFlLTQ5ZjgtYmI1NS00NDQxMGVkNDAwNzgiLCJleHAiOjE1NzAwMzE0NDIsIm5iZiI6MCwiaWF0IjoxNTY5OTQ1MDQyLCJpc3MiOiJodHRwczovL3Nzby1kZXYucGF0aGZpbmRlci5nb3YuYmMuY2EvYXV0aC9yZWFsbXMvZmNmMGtwcXIiLCJhdWQiOlsic2JjLWF1dGgtd2ViIiwiYWNjb3VudCJdLCJzdWIiOiJjM2Y0YWYxMS1hMjVlLTQ2YjEtOGJhNi1kOGZkNjMwZmY0NzUiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJzYmMtYXV0aC13ZWIiLCJhdXRoX3RpbWUiOjAsInNlc3Npb25fc3RhdGUiOiI5YTU3NTVjMy0yZmQ0LTQ3ZDYtODAzYi1lZGIyZDk1ZjcxYjciLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbImh0dHA6Ly8xOTIuMTY4LjAuMTM6ODA4MC8iLCIxOTIuMTY4LjAuMTMiLCIqIiwiaHR0cDovLzE5Mi4xNjguMC4xMzo4MDgwIl0sInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJlZGl0Iiwib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiIsImJhc2ljIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiIiLCJyb2xlcyI6WyJlZGl0Iiwib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiIsImJhc2ljIl0sInByZWZlcnJlZF91c2VybmFtZSI6ImNwMDAwMTMyNyIsImxvZ2luU291cmNlIjoiUEFTU0NPREUiLCJ1c2VybmFtZSI6ImNwMDAwMTMyNyJ9.UHXPuHUZLh8PgKTqoOBCi6wxdvP6_AyLgamOFqVYFLAdJrCmcxggw_L5XFbUlLH-i7XqfjZcrwCIw6zbUNE3Gy-kNJVJ6TA8IKsBquinc8RB4ajlpGxDWsI1G2ocACyTzHeZZZ4fs95ZKLL-XfXFbJCugMTE8HK0RaVPqvr00h0eNU4dba6l_LE-T7Ju-mxJUSMzqv49aiwwuhAHKaLQR6921DOJWZXGLDAGMg6TxSb1Z2Vh0OOuTb6rH1OKqwa75MIhuL4w3e7vvjvRF6w6276WykDGCdd9TqgbNX2yG-Y9p9SA7rK1zdZNlwew8yOuIZl3UqDQfY1LJ5sHOw4aZw')     // <<< paste in JWT
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
