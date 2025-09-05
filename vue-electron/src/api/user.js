import request from '@/utils/request'

export const userRegisterService = ({
  nickname,
  introduction,
  sex,
  year,
  month,
  date,
  province,
  city
}) => {
  return request.post(
    '/api/userinfo',
    {
      nickname,
      introduction,
      sex,
      year,
      month,
      date,
      province,
      city
    },
    {
      headers: {
        'Content-Type': 'application/json'
      }
    }
  )
}

export const userLoginService = () => {
  return request.get('/api/userinfo')
}

export const userFormService = (count, size, weight, num, strength, position, parameter) => {
  return request.post(
    '/api/form',
    {
      count,
      size,
      weight,
      num,
      strength,
      position,
      parameter
    },
    {
      headers: {
        'Content-Type': 'application/json'
      }
    }
  )
}

export const userGetFormService = () => {
  return request.get('/api/form')
}

export const deleteUserFormService = (info) => {
  return request.delete(`/api/form/${info}`)
}

export const userUpdateFormService = (info) => {
  return request.post('/api/update', info, {
    headers: {
      'Content-Type': 'application/json'
    }
  })
}

export const userWebapiService = (info) => {
  return request.post('/api/web', info, {
    headers: {
      'Content-Type': 'application/json'
    }
  })
}

// 新增图片上传方法
export const uploadImageService = (file) => {
  const formData = new FormData()
  formData.append('image', file)

  return request.post('/api/upload', formData)
}

export const submitComparisonService = (data) => {
  return request.post('/api/submit-comparison', data)
}

export const generate_testcasesService = (data) => {
  // 改为接收对象参数
  return request.post(
    '/api/generate_testcases',
    {
      strength: data.strength,
      paramCount: data.paramCount,
      paramValues: data.paramValues
    },
    {
      headers: {
        'Content-Type': 'application/json'
      }
    }
  )
}

export const update_testcasesService = (info) => {
  return request.post('/api/update_testcases', info, {
    headers: {
      'Content-Type': 'application/json'
    }
  })
}

export const getGeneratedTestcasesService = () => {
  return request.get('/api/generated_testcases')
}

export const generateSemanticTestcasesService = (data) => {
  return request.post(
    '/api/generate_semantic_testcases',
    {
      sentence: data.sentence,
      dimensions: data.dimensions
    },
    {
      headers: {
        'Content-Type': 'application/json'
      }
    }
  )
}

export const delete_testcasesService = (info) => {
  return request.delete(`/api/testcases/${info}`)
}
export const SafetyService = (data) => {
  return request.post(
    '/api/generate-jailbreaks',
    {
      strategies: data.strategies,
      strength: data.strength
    },
    {
      headers: {
        'Content-Type': 'application/json'
      }
    }
  )
}

export const createIqpsoService = (t_way, parameters) => {
  // 将字符串参数转换为数组
  const processedParams =
    typeof parameters === 'string'
      ? parameters.split(',').map((item) => Number(item.trim()))
      : parameters

  return request.post(
    '/api/iqpso',
    {
      t_way,
      parameters: processedParams
    },
    {
      headers: {
        'Content-Type': 'application/json'
      }
    }
  )
}

export const getIqpsoService = (id) => {
  return request.get('/api/iqpso', {
    params: { id } // 添加查询参数
  })
}

export const deleteIqpsoService = (id) => {
  return request.delete(`/api/iqpso/${id}`)
}

export const updateIqpsoService = (id, t_way, parameters) => {
  return request.put(
    `/api/update/${id}`,
    {
      t_way,
      parameters
    },
    {
      headers: {
        'Content-Type': 'application/json'
      }
    }
  )
}
