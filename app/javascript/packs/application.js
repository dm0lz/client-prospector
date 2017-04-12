import _ from "lodash";

import {
  default as React,
  Component,
} from "react";

import Helmet from "react-helmet";
import ReactDOM from 'react-dom';
import {
  withGoogleMap,
  GoogleMap,
  Marker,
  InfoWindow
} from "react-google-maps";
import update from 'react-addons-update';
const GettingStartedGoogleMap = withGoogleMap(props => (
  <GoogleMap
    ref={props.onMapLoad}
    defaultZoom={6}
    defaultCenter={{ lat: 43.3, lng: 2.065822 }}
    onClick={props.onMapClick}
  >
    {props.markers.map(marker => (
      <Marker
        {...marker}
        onRightClick={() => props.onMarkerRightClick(marker)}
        onClick={() => props.onMarkerLeftClick(marker)}
      >
      {marker.showInfo && (
        <InfoWindow onCloseClick={() => props.onMarkerClose(marker)}>
          <div dangerouslySetInnerHTML={{__html: marker.infoContent}}></div>
        </InfoWindow>
      )}
      </Marker>
    ))}
  </GoogleMap>
));

class GettingStartedExample extends Component {

  constructor(props){
    super(props);
    this.state = {
      markers: [{
        "position": {
          "name": "2CA",
          "lat": 45.414407,
          "lng": 3.724669
        },
        "key": 47,
        showInfo: false
      },
      {
        "position": {
          "name": "LEDA SAS",
          "lat": 48.426082,
          "lng": 2.743449
        },
        "key": 48,
        showInfo: false
      }]
    };
    this.handleMapLoad = this.handleMapLoad.bind(this);
    this.handleMapClick = this.handleMapClick.bind(this);
    this.handleMarkerRightClick = this.handleMarkerRightClick.bind(this);
    this.handleMarkerLeftClick = this.handleMarkerLeftClick.bind(this);
    this.handleMarkerClose = this.handleMarkerClose.bind(this);
  }

  componentDidMount(){
    let that = this;
    return fetch('https://client-prospector.herokuapp.com/api/v1/maps/getAll').then(
      function(response) {
        if (response.type === 'opaque') {
          console.log('Received a response, but it\'s opaque so can\'t examine it');
          return;
        }
        if (response.status !== 200) {
          console.log('Looks like there was a problem. Status Code: '  + response.status);
          return;
        }
        response.text().then(function(responseText) {
          var res = JSON.parse(responseText);
          let pos = JSON.stringify(res.data.positions);
          var a = JSON.parse(pos);
          console.log(JSON.stringify(a));
          that.setState({markers: a});
        });
      }
    ).catch(function(err) {
      console.log('Fetch Error :-S', err);
    });
  }

  handleMapLoad(map) {
    this._mapComponent = map;
    if (map) {
      console.log(map.getZoom());
    }
  }

  handleMapClick(event) {
    /*const nextMarkers = [
      ...this.state.markers,
      {
        position: event.latLng,
        defaultAnimation: 2,
        key: Date.now(),
      },
    ];
    this.setState({
      markers: nextMarkers,
    });*/
  }

  handleMarkerRightClick(targetMarker) {
    /*const nextMarkers = this.state.markers.filter(marker => marker !== targetMarker);
    this.setState({
      markers: nextMarkers,
    });*/
    console.log(targetMarker.position.name);
  }

  handleMarkerLeftClick(targetMarker) {
    //const nextMarkers = this.state.markers.filter(marker => marker !== targetMarker);
    this.setState({
      markers: this.state.markers.map(marker => {
        if (marker === targetMarker) {
          return {
            ...marker,
            showInfo: true,
          };
        }
        return marker;
      }),
    });
  }

  handleMarkerClose(targetMarker) {
    //console.log("closing marker");
  }

  render() {
    return (
      <div>
        <Helmet
          title="Getting Started"
        />
        <GettingStartedGoogleMap
          containerElement={
            <div style={{ height: 800}} />
          }
          mapElement={
            <div style={{ height: 800}} />
          }
          onMapLoad={this.handleMapLoad}
          onMapClick={this.handleMapClick}
          markers={this.state.markers}
          onMarkerRightClick={this.handleMarkerRightClick}
          onMarkerLeftClick={this.handleMarkerLeftClick}
          onMarkerClose={this.handleMarkerClose}
        />
      </div>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <GettingStartedExample />,
    document.getElementById('root')
  )
})
