import React, { Component } from 'react';
import './SignUp.scss';
import { Link, Redirect } from 'react-router-dom';
import userAuth from '../../utils/authenticate';

class SignUp extends Component {
  constructor(props) {
    super(props)

    this.state = {}
  }

  render() {
    const { from } = this.props.location.state || { from: { pathname: "/" } };

    if (userAuth.isAuthenticated) {
      return <Redirect to={from} />
    }

    return (
      <div>
        <div className="home-welcome">Sign Up</div>
        <Link to="/auth/login">login</Link>
      </div>
    )
  }
}

export default SignUp;
