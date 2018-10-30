import httpInterface from './httpInterface';
import Cookie from 'universal-cookie';

const cookie = new Cookie();

const userAuth = {
  isAuthenticated: false,
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
        cookie.set('_fo_active_user_', data, { path: '/' });
        cb();
      })
      .catch(error => console.log('Login error - ', error))
  },
  signOut(cb) {
    this.isAuthenticated = false;
    cookie.remove('_fo_');
    setTimeout(cb, 100);
  }
}

export default userAuth;