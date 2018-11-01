import React, { Component } from 'react';
import './Login.scss';
import { Link, Redirect } from 'react-router-dom';
import userAuth from '../../utils/authenticate';

class Login extends Component {
  constructor(props) {
    super(props)

    this.state = {
      redirectToReferrer: false
    }

    this._login = this._login.bind(this);
  }

  _login() {
    userAuth.authenticate(() => {
      this.setState({ redirectToReferrer: true })
    })
  }

  render() {
    const { from } = this.props.location.state || { from: { pathname: "/" } };
    const { redirectToReferrer } = this.state;

    if (redirectToReferrer || userAuth.isAuthenticated) {
      return <Redirect to={from} />
    }

    return (
      <div>
        <div className="home-welcome">Login {from.pathname}</div>
        {
          from.pathname === '/' ? null : (
            <p>You must log in</p>
          )
        }

        <button onClick={this._login}>
          Login now
        </button>
        <Link to="/auth/sign-up">Sign up</Link>
      </div>
    )
  }
}

export default Login;
