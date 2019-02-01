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
      <div className="auth container-fluid">
        <div className="auth-header">
          <h2><Link to="/">forecast</Link></h2>
        </div>
        
        <div className="row justify-content-center">
          <div className="auth-inner col-10 col-sm-7 col-md-6 col-lg-5 col-xl-4">
            {
              authState === 'login' ? (
                <Login {...this.props} />
              ) :  (
                <SignUp {...this.props} />
              )
            }
          </div>
        </div>

        <div className="footer">
          <p>&copy; 2019 Kompilab. All rights reserved.</p>
        </div>
      </div>
    )
  }
}

export default Auth;
