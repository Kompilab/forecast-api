import React, { Component } from 'react';
import './Login.scss';
import { Link, Redirect } from 'react-router-dom';
import userAuth from '../../utils/authenticate';

class Login extends Component {
  constructor(props) {
    super(props)

    this.state = {
      redirectToReferrer: false,
      email: '',
      password: '',
      error: ''
    }

    this.handleChange = this.handleChange.bind(this);
    this._login = this._login.bind(this);
  }

  handleChange(e) {
    this.setState({
      [e.target.name]: e.target.value
    })
  }

  _login(e) {
    e.preventDefault();
    userAuth.authenticate(this.state, (redirect, error='') => {
      this.setState({
        redirectToReferrer: redirect,
        error: error
      })
    })
  }

  render() {
    const { from } = this.props.location.state || { from: { pathname: "/" } };
    const { redirectToReferrer, error } = this.state;

    console.log(this.state)

    if (redirectToReferrer || userAuth.isAuthenticated) {
      return <Redirect to={from} />
    }

    return (
      <div className="auth-inner">
        <h2>Sign In</h2>
        <p>Don't have a forecast account? <Link to="/auth/sign-up">Sign up now</Link></p>

        {
          from.pathname === '/' ? null : (
            <p>You must log in</p>
          )
        }

        <p>{error && error.error}</p>

        <form>
          <div>
            <label>Email</label>
            <div>
              <input type="email" name="email" onChange={this.handleChange} />
            </div>
          </div>

          <div>
            <label>Password</label>
            <div>
              <input type="password" name="password" onChange={this.handleChange} />
            </div>
          </div>

          <div className="actions">
            <button onClick={this._login}>
              Login now
            </button>
          </div>
        </form>
      </div>
    )
  }
}

export default Login;
