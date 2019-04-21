const apiRoutes = {
  login: () => {
    return {
      method: 'POST',
      path: '/api/auth/sign_in'
    }
  },
  signup: () => {
    return {
      method: 'POST',
      path: '/api/auth/register'
    }
  },
  signout: () => {
    return {
      method: 'DELETE',
      path: '/api/auth/sign_out'
    }
  }
}

export default apiRoutes
