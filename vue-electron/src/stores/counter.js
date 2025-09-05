import { ref } from 'vue'
import { defineStore } from 'pinia'
export const useCounterStore = defineStore(
  'counter',
  () => {
    const info = ref({
      nickname: '北极涛_gLH',
      short: '',
      sex: '',
      year: '',
      month: '',
      dath: '',
      province: '',
      city: '',
      introduction: ''
    })
    const removeinfo = () => {
      info.value = {
        nickname: '',
        short: '',
        sex: '',
        year: '',
        month: '',
        dath: '',
        province: '',
        city: ''
      }
    }
    const setinfo = (nickname, short, sex, year, month, dath, province, city, introduction) => {
      info.value.nickname = nickname
      info.value.short = short
      info.value.sex = sex
      info.value.year = year
      info.value.month = month
      info.value.dath = dath
      info.value.province = province
      info.value.city = city
      info.value.introduction = introduction
    }
    const id = ref()
    const result = ref()
    const setid = (id) => {
      id.value = id
    }
    const setresult = (result) => {
      result.value = result
    }
    return { info, removeinfo, setinfo, id, setid, result, setresult }
  },
  {
    persist: true
  }
)
