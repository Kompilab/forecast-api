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
    console.log("Auth props: ", authState);

    return (
      <div>
        <h2><Link to="/">forecast</Link></h2>
        
        {
          authState == 'login' ? (
            <Login />
          ) :  (
            <SignUp />
          )
        }
      </div>
    )
  }
}

export default Auth;
