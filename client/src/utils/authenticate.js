import httpInterface from './httpInterface';
import Cookie from 'universal-cookie';

const cookie = new Cookie();

const userAuth = {
  isAuthenticated: cookie.get('_fo_') && cookie.get('_fo_active_user_'),
  async authenticate(data, cb) {
    try {
      const payload = {
        user: {
          email: data.email,
          password: data.password
        }
      }

      const response = await httpInterface.postData('/api/auth/sign_in', 'POST', payload);
      const resData = await response.json();

      if (response.ok) {
        cookie.set('_fo_', response.headers.get('authorization'), { path: '/' });
        cookie.set('_fo_active_user_', {
          id: resData.id,
          email: resData.email,
          first_name: resData.first_name,
          last_name: resData.last_name,
          avatar: resData.avatar
        }, { path: '/' });

        this.isAuthenticated = true;
        cb(true);
      } else {
        cb(false, resData)
      }
    } catch (error) {
      console.log('ERROR:Login - ', error)
    }
  },
  async signOut(cb) {
    try {
      const response = await httpInterface.postData('/api/auth/sign_out', 'DELETE');

      if (response.ok) {
        cookie.remove('_fo_');
        cookie.remove('_fo_active_user_');
        this.isAuthenticated = false;
        cb()
      } else {
        throw new Error('Failed to sign out!')
      }
    } catch (error) {
      console.log('ERROR:LogOut - ', error)
    }
  }
}

export default userAuth;
