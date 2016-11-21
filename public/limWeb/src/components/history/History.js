import React, { Component } from 'react';

import Histories from '../histories/Histories';
import Constants from '../../Constants';
import $ from 'jquery';
import './History.css';
import '../../style.css';

class History extends Component {
  constructor() {
    super();
    this.state = {history: null};
  }
  onHistorySelected(id) {
    this.props.onHistorySelected(id);
  }

  handleHistoryCreated(data) {
    this.setState({history: data});
  }

  render() {
    return (
      <div className="History">
        <div>
          <input type="url" ref="url" placeholder="Add url to be scraped" />
          <button onClick={this.handleSubmit.bind(this)}>Scrape</button>
        </div>
        <Histories history={this.state.history}
                   onHistorySelected={this.onHistorySelected.bind(this)}/>
      </div>
    );
  }

  handleSubmit() {
    if(this.refs.url.value) {
      let data = {history: {url: this.refs.url.value}};
      $.post( Constants.BASE_URL + 'histories', data, function( response ) {
        this.refs.url.value = null;
        this.handleHistoryCreated(response.data);
      }.bind(this));
    }
  }
}

export default History;
