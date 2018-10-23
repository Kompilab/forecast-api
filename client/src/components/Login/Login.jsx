import React, { Component } from 'react';
import './Login.scss';
import { Link } from 'react-router-dom';

class Login extends Component {
  constructor(props) {
    super(props)

    this.state = {}
  }

  render() {
    return (
      <div>
        <div className="home-welcome">Login</div>
        <Link to="/auth/sign-up">Sign up</Link>
      </div>
    )
  }
}

export default Login;
