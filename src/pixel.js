import { Component } from 'preact';

export default class Pixel extends Component {
    constructor() {
        super();
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) {
        this.props.handle(this.props.color);
    }

    render({color, size}) {
        const cstyle = {
            "background-color": "rgb(" + color + ")",
            width: size,
            height: size,
            display: "inline-block"
        };
        return <div style={cstyle} onClick={this.handleClick}></div>
    }
}