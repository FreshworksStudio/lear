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
sessionStorage.setItem('KEYCLOAK_TOKEN', 'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJUbWdtZUk0MnVsdUZ0N3FQbmUtcTEzdDUwa0JDbjF3bHF6dHN0UGdUM1dFIn0.eyJqdGkiOiI3NjJlZGI1Zi0yYWZlLTQzNDctODVmMi05NGM0NzQ2NDhiMzAiLCJleHAiOjE1Njk5NTEzODUsIm5iZiI6MCwiaWF0IjoxNTY5ODY0OTg1LCJpc3MiOiJodHRwczovL3Nzby1kZXYucGF0aGZpbmRlci5nb3YuYmMuY2EvYXV0aC9yZWFsbXMvZmNmMGtwcXIiLCJhdWQiOlsic2JjLWF1dGgtd2ViIiwiYWNjb3VudCJdLCJzdWIiOiJjM2Y0YWYxMS1hMjVlLTQ2YjEtOGJhNi1kOGZkNjMwZmY0NzUiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJzYmMtYXV0aC13ZWIiLCJhdXRoX3RpbWUiOjAsInNlc3Npb25fc3RhdGUiOiJlNWNkODg4Yi0xNmNjLTQ2YmYtODIxMy1mNGRkMjY3YjY3MjYiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbImh0dHA6Ly8xOTIuMTY4LjAuMTM6ODA4MC8iLCIxOTIuMTY4LjAuMTMiLCIqIiwiaHR0cDovLzE5Mi4xNjguMC4xMzo4MDgwIl0sInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJlZGl0Iiwib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiIsImJhc2ljIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiIiLCJyb2xlcyI6WyJlZGl0Iiwib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiIsImJhc2ljIl0sInByZWZlcnJlZF91c2VybmFtZSI6ImNwMDAwMTMyNyIsImxvZ2luU291cmNlIjoiUEFTU0NPREUiLCJ1c2VybmFtZSI6ImNwMDAwMTMyNyJ9.AeiIWO5-t3bx2Kqqk69BwvjLWEyypHT58IRnatLPy5sAQ7h83yfrglz36J39fSf7gDe8L-AmOMyBwsP8xYb8LQ78HQjrSCMa1LbO7t4U-NFKpRTBzy6QgrvSRzfBkv1R3SAppzkZ8y3vo5ImSeZIbrYVaRSbcddNw5JoKy99zYfqRb5wIJ9lmpHHTfYBNQft4eOPY0zBJiEcWfjNJao3UbGA8GHDqtAwwvnxfEOwf-UmlqRgjW5GZCjWuK_O7qOFDelZrpNQWa494tFvvC0Y_AVSySgfQ0hmPM_IwgZwA553AGqt2QsQ6jDfaVB5WtT-f11OsNjRAOuyebdFUzuOxg')     // <<< paste in JWT
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
