import { Component } from 'preact';

export default class Pixel extends Component {
	handleClick(e) {
		this.props.handle(this.props.color);
	}

	constructor() {
		super();
		this.handleClick = this.handleClick.bind(this);
	}

	render({ color, size }) {
		const cstyle = {
			'background-color': `rgb(${color})`,
			width: size,
			height: size,
			display: 'inline-block'
		};
		return <div style={cstyle} onClick={this.handleClick} />;
	}
}