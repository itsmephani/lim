import React, { Component } from 'react';
import Constants from '../../Constants';
import $ from 'jquery';
import './Results.css';
import '../../style.css';

class Results extends Component {

  constructor() {
    super();

    this.state = {
      results: []
    };
  }

  componentWillReceiveProps(nextProps) {
    let id = nextProps.id;
    $.get(Constants.BASE_URL + 'histories/' + id + '/results', function(response) {
      this.setState({results: response.data});
    }.bind(this));
  }

  render() {
    let results = this.state.results;
    let resultItems = results.map(result => {
      let CustomTag = `${result.tag_name}`;
      let OpenTag = `${result.tag_name} name="a"`;
      let attributes = {};
      if (result.tag_attributes) {
        Object.keys(result.tag_attributes).forEach(attribute => {
          attributes[attribute] = result.tag_attributes[attribute];
        });
        console.log(attributes)
      }
      return <li key={result.id}>
        <CustomTag {...attributes}>{result.content}</CustomTag>
      </li> 
    });
    return (
      <div className={resultItems.length > 0 ? 'Results hasResults' : 'Results'}>
        {resultItems.length > 0 ? 'Results' : ''}
        <ul>
          {resultItems}
        </ul>
      </div>
    );
  }

}

export default Results;
