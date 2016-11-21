import React, { Component } from 'react';

import Constants from '../../Constants';
import $ from 'jquery';
import './Histories.css';
import '../../style.css';

class Histories extends Component {

  constructor() {
    super();

    this.state = {
      currentHistoryId: 0,
      histories: []
    };
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.history){
      let histories = this.state.histories;
      histories.push(nextProps.history);
      this.setState({histories: histories});
    }
  }

  handleClick(id, event) {
    this.setState({currentHistoryId: id});
    this.props.onHistorySelected(id);
  }

  componentDidMount() {
    $.get(Constants.BASE_URL + 'histories', function(response) {
      this.setState({histories: response.data});
    }.bind(this));
  }

  render() {
    let histories = this.state.histories;
    let historyItems = histories.map(history => 
      <li key={history.id} 
          className={this.state.currentHistoryId === history.id ? 'active' : ''}
          onClick={this.handleClick.bind(this, history.id)}>
          {history.url}
      </li>);

    return (
      <div className="Histories">
        <ul>
          {historyItems}
        </ul>
      </div>
    );
  }

}

export default Histories;
