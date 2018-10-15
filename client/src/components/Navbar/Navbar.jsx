import React, { Component } from 'react';
import './Navbar.scss';

class Navbar extends Component {
  constructor() {
    super()

    this.state = {
      titleOverride: 'forecasting'
    }
  }

  render() {
    const { titleOverride } = this.state;
    const { title } = this.props;

    return (
      <div>
        <div>{title || titleOverride}</div>
        <div>
          <button>Log In</button>
          <button>Sign Up</button>
        </div>
      </div>
    )
  }
}

export default Navbar;
