import Vue from 'vue'
//import App from '../components/app.vue'
import StarRating from 'vue-star-rating'


document.addEventListener('DOMContentLoaded', () => {
  /*document.body.appendChild(document.createElement('app'))
  const app = new Vue({
    el: 'app',
    template: '<App/>',
    components: { App }
  })

  console.log(app)*/

  Vue.component('star-rating', StarRating);

  var i = 0
  while(i <= 5) {
    new Vue({
        el: 'star-rating[data-score="'+i+'"]',
        methods: {
            setRating: function(rating){
              this.rating= rating;
            }
        },
        data: {
            rating: i
        }
    });
    i++;
  }
})