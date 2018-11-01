import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import './Auth.scss';
import Login from '../../components/Login';
import SignUp from '../../components/SignUp';

class Auth extends Component {
  constructor(props) {
    super(props)

    this.state = {}
  }

  render() {
    const { match } = this.props;
    const authState = match.params.authState;

    return (
      <div>
        <h2><Link to="/">forecast</Link></h2>
        
        {
          authState === 'login' ? (
            <Login {...this.props} />
          ) :  (
            <SignUp {...this.props} />
          )
        }
      </div>
    )
  }
}

export default Auth;
