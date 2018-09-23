import { Component } from 'preact';
import Pixel from './pixel';
import styles from './style';

export default class Canvas extends Component {
	getRandomColor() {
		return this.getRandom() + ', ' + this.getRandom() + ', ' + this.getRandom();
	}

	getRandom() {
		return Math.floor(Math.random() * 256);
	}

	onPixelClick(_color) {
		let newColor = this.getRandomColor();
		let _colors = this.props.colors;
		for (let c in _colors) {
			if (_colors[c] === _color) {
				_colors[c] = newColor;
			}
		}
		this.setState({
			colors: _colors
		});
	}

	constructor() {
		super();
		this.onPixelClick = this.onPixelClick.bind(this);
	}

	render({ pixelData, colors, pixelSize, _background }) {
		const mainStyle = {
			background: _background
		};
		const rowStyle = {
			height: pixelSize
		};
		return (
			<div style={mainStyle} class={styles.canvas_main}>
				{pixelData.map(row => (
					<div style={rowStyle}>
						{row.map(col =>
							<Pixel color={colors[col]} size={pixelSize} handle={this.onPixelClick} />
						)}
					</div>
				))}
			</div>
		);
	}
}
