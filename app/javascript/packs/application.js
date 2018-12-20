import Vue from 'vue/dist/vue.js'
import StarRating from 'vue-star-rating'
import VueResource from 'vue-resource'


document.addEventListener('turbolinks:load', () => {

  Vue.component('star-rating', StarRating);
  Vue.use(VueResource);

    new Vue({
        el: '#content',
        methods: {
            setRating: function(rating, id){
                this.rating= rating;
                this.$http.get('/movies/'+id+'/rate.json?rate='+rating).then(response => {
                    Turbolinks.visit(window.location.toString(), {action: 'replace'})
                });
            }
        },
    });
})