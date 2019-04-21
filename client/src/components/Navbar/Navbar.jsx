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
      <nav className="navbar navbar-expand-lg navbar-light bg-light">
        <Link to="/" id="logo-title" className="navbar-brand">
          {title || titleOverride}
        </Link>

        <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span className="navbar-toggler-icon"></span>
        </button>

        <div className="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div className="navbar-nav mr-auto"></div>
          <div>
          {
            userAuth.isAuthenticated ? (
              <div>
                <span className="navbar-text">
                  Welcome home!
                </span>
                <button onClick={() => {userAuth.signOut(() => history.push('/'))}} className="btn btn-outline-danger my-2 my-sm-0 ml-2">
                  Sign Out
                </button>
              </div>
            ) : (
              <div>
                <Link to="/auth/login">
                  <button className="btn btn-light my-2 my-sm-0">Log In</button>
                </Link>
                <Link to="/auth/sign-up">
                  <button className="btn btn-primary btn-fo-primary my-2 my-sm-0 ml-2">Sign Up</button>
                </Link>
              </div>
            )
          }
          </div>
        </div>
      </nav>
    )
  }
}

export default Navbar;
