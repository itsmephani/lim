import React, { Component } from 'react';

import History from './components/history/History';
import Results from './components/results/Results';
import './App.css';

class App extends Component {

  constructor() {
    super();
    this.state = {id: ''};
  }

  onHistorySelected(id) {
    this.setState({id: id})
  }

  render() {
    return (
      <div className="App">
        <div className="App-header">
          Lim
        </div>
        <div className="PageContent">
          <History onHistorySelected={this.onHistorySelected.bind(this)} />
          <Results id={this.state.id} />
        </div>
      </div>
    );
  }
}

export default App;
