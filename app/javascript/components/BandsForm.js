import React, { Component } from 'react';
import {SortableContainer, SortableElement, SortableHandle, arrayMove} from 'react-sortable-hoc';
import BandLocationSelect from './bandLocationSelect.js';
import 'react-select/dist/react-select.css';
import '../src/Bands.css';

const LOCATIONS = require('./data/locations');

const DragHandle = SortableHandle(() => <div className="drag-handle-container"><div className="drag-handle"></div></div>);

const Header = ({number}) => {
  let title = null;
  if (number===0) {
    title = <h4> Headliner </h4>;
  }else{
    title = <h4>Band #{number+1}</h4>;
  }
  return(
      <div className="Header">{title}</div>
  );

};

const HiddenInput =  ({number, band}) => {
  var country;
  var state;
  if(band.state.length===2){
    state = band.state;
    country = "USA";
  }else{
    state = "";
    country = band.state
  }

  return(
    <div>
      <input type="hidden" name={`show[bands_attributes][${number}][name]`} id={`show_bands_attributes_${number}_name`} value={band.name} />
      <input type="hidden" name={`show[bands_attributes][${number}][state]`} id={`show_bands_attributes_${number}_state`} value={state} />
      <input type="hidden" name={`show[bands_attributes][${number}][country]`} id={`show_bands_attributes_${number}_country`} value={country} />
      <input type="hidden" name={`show[bands_attributes][${number}][bandcamp]`} id={`show_bands_attributes_${number}_bandcamp`} value={band.bandcamp} />
      <input type="hidden" name={`show[bands_attributes][${number}][soundcloud]`} id={`show_bands_attributes_${number}_soundcloud`} value={band.soundcloud} />
    </div> 
  )
};

const Bandcamp = ({bandcamp}) => {
  if (bandcamp) {
    return <li><a target="_blank" href={`https://${bandcamp}.bandcamp.com`}>{`${bandcamp}.bandcamp.com`}</a></li>;
  }
  return <li></li>;
};


const Soundcloud = ({soundcloud}) => {
  if (soundcloud) {
    return <li><a target="_blank" href={`https://soundcloud.com/${soundcloud}`}>{`soundcloud.com/${soundcloud}`}</a></li>;
  }
  return <li></li>;
};


const Band = SortableElement(({band, onRemove, value}) => {
  return (
      <div className="Band">
        <div><button className="Remove" onClick={() => onRemove(value)}>x</button></div>
        <DragHandle />
        <ul className="band-content">
          <li className="band-name">{band.name}</li>
          <li>{locationName(band.state)}</li>
          <Bandcamp bandcamp={band.bandcamp}/>
          <Soundcloud soundcloud={band.soundcloud}/>
        </ul>
      </div>
  );
});


const BandList = SortableContainer(({bands, onRemove}) => {
  const bandListNode =  bands.map((band, i) => {
    return ([<Header key={`header-${i}`} number={i} />, <Band index={i} key={`band-${i}`} value={i} band={band} onRemove={onRemove}/>, <HiddenInput key={`input-${i}`} number={i} band={band} />])
  });
  return (<div className="BandList">{bandListNode}</div>);
});

function validationClasses(error){
  var className = 'form-group';
  if (error){
    className = className.concat(" has-error");
  }
  return className;
}

function locationName(loc){
  if(loc.length > 2){
    return LOCATIONS["INTL"].find(x => x.value === loc).label;
  }else{
    return LOCATIONS["US"].find(x => x.value === loc).label;
  }
}

function truncate(str, max) {
    return str.length > max ? str.substr(0, max-1) + '…' : str;
}

function validBandcamp(value){
    const re = /(([A-Za-z0-9-]+)\.bandcamp\.com)/;
    const match = value.match(re);
    if(match){
      return match[2];
    }else{
      return '';
    }
}

function validSoundcloud(value){
    const re = /(soundcloud\.com)\/([A-Za-z0-9-]+)/;
    const match = value.match(re);
    if(match){
      return match[2];
    }else{
      return '';
    }
}

class BandsForm extends Component {
  constructor(props){
    super(props);
    this.state = {
      name: '',
      state: '',
      bandcamp: '',
      soundcloud: '',
      data: [{name: 'Pile', state: 'NJ', bandcamp: 'pile', soundcloud: 'explodinginsoundrecords/pile-texas'}],
      errors: {name: false, state: false, bandcamp: false, soundcloud: false}
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleRemove = this.handleRemove.bind(this);
    this.handleLocation = this.handleLocation.bind(this);
  }

  handleChange(event){
    const key = event.target.id;
    this.setState({
      [key]: event.target.value
    });
  }

   onSortEnd = ({oldIndex, newIndex}) => {
    this.setState({
            data: arrayMove(this.state.data, oldIndex, newIndex),
    });
   };
  
  valid(){
    let errors = this.state.errors;
    let valid = true;
    if (!this.state.name){
      errors.name = true;
      valid = false;
    }else{
      errors.name = false;
    }

    if (!this.state.state){
      errors.state = true;
      valid = false;
    }else{
      errors.state = false;
    }

    if (this.state.bandcamp && !validBandcamp(this.state.bandcamp)){
      errors.bandcamp = true;
      valid = false;
    }else{
      errors.bandcamp = false;
    }
    
    if (this.state.soundcloud && !validSoundcloud(this.state.soundcloud)){
      errors.soundcloud = true;
      valid = false;
    }else{
      errors.soundcloud = false;
    }
  
    this.setState({errors: errors});
    return valid;
  }


  handleSubmit(event){
    if (this.valid()) {
      let data = this.state.data;
      data.push({
        name: this.state.name,
        state: this.state.state,
        bandcamp: validBandcamp(this.state.bandcamp), 
        soundcloud: validSoundcloud(this.state.soundcloud)
      });
      this.setState({data: data});
      this.clearInput();
    }
    event.preventDefault();
  }

  clearInput(){
    this.setState({
      name: '',
      state: '',
      bandcamp: '',
      soundcloud: ''
    });
  }


  handleRemove(index){
    const key = index;
    let data = this.state.data;
    data.splice(key,1);
    this.setState({data: data});
  }
 
  handleLocation(loc) {
      
      this.setState({state: loc});
  }

    render() {
    return (
      <div className="Bands">
          <BandList bands={this.state.data} onSortEnd={this.onSortEnd} onRemove={this.handleRemove} useDragHandle={true}/>
          <div className={validationClasses(this.state.errors["name"])}>
            <label htmlFor="name" className="control sr-only sr-only"> Band Name:</label>
            <input type="text" className="form-control" placeholder="Band Name" id="name" value={this.state.name} onChange={this.handleChange} />
            <small className="input-error">{(this.state.errors["name"]) ? "Name cannot be blank" : ''}</small>
          </div>
          <div className={validationClasses(this.state.errors["state"])}>
            <label htmlFor="state" className="control sr-only">State:</label>
            <BandLocationSelect
              value={this.state.state}
              onLocationChange={this.handleLocation}
            />
            <small className="input-error">{(this.state.errors["state"]) ? "State/Country cannot be blank" : ''}</small>
          </div>
          <div className={validationClasses(this.state.errors["bandcamp"])}>
            <label htmlFor="bandcamp" className="control sr-only"> Bandcamp:</label>
            <input type="text" className="form-control" placeholder="Bandcamp (optional)" id="bandcamp" value={this.state.bandcamp} onChange={this.handleChange} />
            <small className="input-error">{(this.state.errors["bandcamp"]) ? "Not a valid bandcamp link" : ''}</small>
          </div>
          <div className={validationClasses(this.state.errors["soundcloud"])}>
            <label htmlFor="soundcloud" className="control sr-only"> Soundcloud:</label>
            <input type="text" className="form-control" placeholder="Soundcloud (optional)" id="soundcloud" value={this.state.soundcloud} onChange={this.handleChange} />
            <small className="input-error">{(this.state.errors["soundcloud"]) ? "Not a valid soundcloud link" : ''}</small>
          </div>
          <div className="form-group">
            <input className="btn btn-default" onClick={this.handleSubmit}  type="submit" value="Add" />
          </div>
      </div>
    );
  }
}

export default BandsForm;
