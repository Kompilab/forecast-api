import React, { Component } from 'react';
import './Home.scss';

class Home extends Component {
  constructor() {
    super()

    this.state = {
      logoText: 'forecast'
    }
  }

  render() {
    return (
      <div className="home-welcome">Welcome aboard</div>
    )
  }
}

export default Home;
