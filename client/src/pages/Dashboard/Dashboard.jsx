import React, { Component } from 'react';
import './Dashboard.scss';
import Navbar from '../../components/Navbar';

class Dashboard extends Component {
  constructor(props) {
    super(props)

    this.state = {}
  }

  render() {
    return (
      <div>
        <Navbar {...this.props} />

        <h2>My Dashboard</h2>
      </div>
    )
  }
}

export default Dashboard;
