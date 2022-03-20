import React from "react";

export class Counters extends React.Component {
  constructor(props) {
    super(props);
    this.state = { clientCounter: 0 };
  }

  componentDidMount() {
    this.timerID = setInterval(() => this.tick(), 500);
  }

  componentWillUnmount() {
    clearInterval(this.timerID);
  }

  tick() {
    this.setState({
      clientCounter: this.state.clientCounter + 1,
    });
  }

  render() {
    return (
      <div>
        <h2>One React component, two counters:</h2>
        <ul>
          <li>this one comes from the server: {this.props.serverCounter},</li>
          <li>and that one from the client: {this.state.clientCounter}.</li>
        </ul>
      </div>
    );
  }
}
