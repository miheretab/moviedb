<template>
  <star-rating v-bind:rating="5"></star-rating>
</template>

<script>

  export default {
    data: function () {
      return {
        message: "Welcome to Cinematronix!"
      }
    }
  }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>