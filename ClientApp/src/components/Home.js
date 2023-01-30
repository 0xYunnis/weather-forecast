import React, { Component } from 'react';

export class Home extends Component {
  static displayName = Home.name;

  render() {
    return (
      <div>
        <h1>欢迎来到ocona</h1>
        <p>提供精准的天气预报服务</p>
            <a href="https://localhost:44443/fetch-data">
                <button>GetStart</button>
            </a>
            
        </div>
        
    );
    }
}
