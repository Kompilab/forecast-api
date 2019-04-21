import React, { Component } from 'react';
import './SignUp.scss';
import { Link, Redirect } from 'react-router-dom';
import userAuth from '../../utils/authenticate';
import Icon from 'react-web-vector-icons';

class SignUp extends Component {
  constructor(props) {
    super(props)

    this.state = {
      firstName: '',
      lastName: '',
      phoneNumber: '',
      email: '',
      password: '',
      confirmPassword: '',

      loading: false,
      errors: false,
      errorMsg: null
    }
  }

  render() {
    const { from } = this.props.location.state || { from: { pathname: "/" } };
    const { errors, errorMsg, loading } = this.state;
    const errorClass = null;

    if (userAuth.isAuthenticated) {
      return <Redirect to={from} />
    }

    return (
      <div className="auth-sign-up">
        <h2>Sign Up</h2>
        <p>Have an account? <Link to="/auth/login">Sign in</Link></p>

        <p>Take charge of your cash flow and better understand your spending habit.</p>

        <p>{errors && errorMsg.error}</p>

        <form className="auth-form">
          <div className="form-group">
            <label htmlFor="in-firstname">First Name</label>
            <div>
              <input id="in-firstname" type="text" name="firstName" className={`form-control ${errorClass}`} onChange={this.handleChange} />
            </div>
          </div>

          <div className="form-group">
            <label htmlFor="in-lastname">Last Name</label>
            <div>
              <input id="in-lastname" type="text" name="lastName" className={`form-control ${errorClass}`} onChange={this.handleChange} />
            </div>
          </div>

          <div className="form-group">
            <label htmlFor="in-phonenumber">Phone Number</label>
            <div>
              <input id="in-phonenumber" type="text" name="phoneNumber" className={`form-control ${errorClass}`} onChange={this.handleChange} />
            </div>
          </div>

          <div className="form-group">
            <label htmlFor="in-email">Email Address</label>
            <div>
              <input id="in-email" type="email" name="email" className={`form-control ${errorClass}`} onChange={this.handleChange} />
            </div>
          </div>

          <div className="form-group">
            <label htmlFor="in-password">Password</label>
            <div>
              <input id="in-password" type="password" name="password" className={`form-control ${errorClass}`} onChange={this.handleChange} />
            </div>
          </div>

          <div className="form-group">
            <label htmlFor="in-confirmpassword">Confirm Password</label>
            <div>
              <input id="in-confirmpassword" type="password" name="confirmPassword" className={`form-control ${errorClass}`} onChange={this.handleChange} />
            </div>
          </div>

          <div className="actions">
            <button onClick={this._login} className="btn btn-primary btn-fo-primary btn-block">
              {
                loading ? (
                  <div>
                    <Icon
                      font="EvilIcons"
                      name="spinner-2"
                      color='#ffffff'
                      size={18}
                    />
                    <span>Please wait</span>
                  </div>
                ) : (
                  <div>Sign Up</div>
                )
              }
            </button>
          </div>
        </form>

        <div className="terms-thingy">
          <p>By clicking Sign Up, you agree to our Terms of Service and have read and acknowledge our Privacy Statement</p>
        </div>

        <div className="forgot-password">
          <Link to="/">I forgot my password</Link>
        </div>
      </div>
    )
  }
}

export default SignUp;
