import {createStore} from 'vuex'
// 创建一个新的 store 实例
const store = createStore({
    state () {
      return {
        username : 'kevin',
        count: 0
      }
    },
    mutations: {
      increment (state) {
        state.count++
      }
    },
    getters:{
      getCount(state){
        
      }
    }
    
  })


  export default store