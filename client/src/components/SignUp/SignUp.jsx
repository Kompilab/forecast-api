import React, { Component } from 'react';
import './SignUp.scss';
import { Link } from 'react-router-dom';

class SignUp extends Component {
  constructor(props) {
    super(props)

    this.state = {}
  }

  render() {
    return (
      <div>
        <div className="home-welcome">Sign Up</div>
        <Link to="/auth/login">login</Link>
      </div>
    )
  }
}

export default SignUp;
