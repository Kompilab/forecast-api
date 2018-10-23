import React, { Component } from 'react';
import './Navbar.scss';
import { Link } from 'react-router-dom';
import userAuth from '../../utils/authenticate';

class Navbar extends Component {
  constructor(props) {
    super(props)

    this.state = {
      titleOverride: 'forecasting'
    }
  }

  render() {
    const { titleOverride } = this.state;
    const { title, history } = this.props;

    return (
      <div>
        <div>{title || titleOverride}</div>
        <div>
          {
            userAuth.isAuthenticated ? (
              <div>
                <p>Welcome home!</p>
                <button onClick={() => {userAuth.signOut(() => history.push('/'))}}>
                  Sign Out
                </button>
              </div>
            ) : (
              <div>
                <Link to="/auth/login">
                  <button>Log In</button>
                </Link>
                <Link to="/auth/sign-up">
                  <button>Sign Up</button>
                </Link>
              </div>
            )
          }
        </div>
      </div>
    )
  }
}

export default Navbar;
