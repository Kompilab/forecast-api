import httpInterface from './httpInterface';
import Cookie from 'universal-cookie';

const cookie = new Cookie();

const userAuth = {
  isAuthenticated: cookie.get('_fo_') && cookie.get('_fo_active_user_'),
  authenticate(cb) {
    const payload = {
      user: {
        email: "user+936@forecast.com",
        password: "password$123"
      }
    }

    httpInterface.postData('/api/auth/sign_in', 'POST', payload)
      .then(response => {
        cookie.set('_fo_', response.headers.get('authorization'), { path: '/' })
        return response.json()
      })
      .then(data => {
        cookie.set('_fo_active_user_', {
          id: data.id,
          email: data.email,
          first_name: data.first_name,
          last_name: data.last_name,
          avatar: data.avatar
        }, { path: '/' });
        this.isAuthenticated = true
        cb();
      })
      .catch(error => console.log('ERROR:Login - ', error))
  },
  signOut(cb) {
    httpInterface.postData('/api/auth/sign_out', 'DELETE')
      .then(response => {
        if (response.ok) {
          console.log(response)
          cookie.remove('_fo_');
          cookie.remove('_fo_active_user_');
          this.isAuthenticated = false;
          cb()
        }
        else {
          throw new Error('Failed to sign out!')
        }
      })
      .catch(error => console.log('ERROR:LogOut - ', error))
  }
}

export default userAuth;
