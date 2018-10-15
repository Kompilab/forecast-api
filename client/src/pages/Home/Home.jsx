import React, { Component } from 'react';
import './Home.scss';
import Navbar from '../../components/Navbar';

class Home extends Component {
  constructor() {
    super()

    this.state = {
      logoText: 'forecast',
      features: [
        {
          name: 'Stay Organized',
          summary: 'Monitor cash flow and stay on top of your finances'
        },
        {
          name: 'Stay Organized',
          summary: 'Monitor cash flow and stay on top of your finances'
        }
      ]
    }
  }

  render() {
    const { logoText, features } = this.state;

    return (
      <div>
        <Navbar title={logoText} />

        <header>
          <div>
            <div>
              <p>How much have I spend this month?</p>
            </div>

            <div>
              <p>"The pessimist complains about the wind; the optimist expects it to change; the realist adjusts the sails."</p>
              <p>- William Arthur Ward</p>
            </div>
          </div>

          <button>Get Started</button>
        </header>

        <div>
          floating image
        </div>

        {
          !!features.length && features.map((feature, $i) => {
            return (
              <div key={$i}>
                <h4>{feature.name}</h4>
                <p>{feature.summary}</p>
              </div>
            )
          })
        }

        <div>
          <h3>Are you tired of running out of funds before the next paycheck?</h3>
          <p>Take charge of your cash flow and better understand your spending habit</p>
          <button>Get Started Now</button>
        </div>

        <footer>
          <p>{logoText}</p>
          <p>&copy; 2018 Kompilab. All rights reserved.</p>
        </footer>
      </div>
    )
  }
}

export default Home;
