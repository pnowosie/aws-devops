import React from 'react';
import styled from "styled-components";
import axios from 'axios'

const MemImage = styled.img`
    max-height: 600px;
    max-width: 550px;
`

class CreateMem extends React.Component{

    constructor(props) {
        super(props);
        this.state = {memImage: null, memText: "Tu wpisz tekst mema"};
    }

    updateImage = (imageId) => {
        this.setState({memImage: window.Configs.PhotosURL+"/download/" + imageId})
    }
    handleInputChange = (event) => {
        this.setState({memText: event.target.value})

    }

    handleCreateMemButtonClick = () => {
        console.log(this.state)
        axios.post(window.Configs.ApiURL +  "memes", {text: this.state.memText})
            .then(res => {
                this.updateImage(res.data.fileName);
            })

    }


    render()
    {
        return (
            <div className="c-create-meme__wrapper">
                <div className="c-create-meme__form">
                    <div className="c-create-meme__form-wrapper">
                        <textarea rows={2} value={this.state.memText} defaultValue={this.state.memText} onChange={this.handleInputChange} />
                        <button className="c-create-meme__button" onClick={this.handleCreateMemButtonClick}>Utwórz</button>
                    </div>
                </div>
                <div className="c-create-meme__img-wrapper">
                    { this.state.memImage ? (
                      <MemImage src={this.state.memImage}/>
                    ) : (
                      <p>Tutaj pojawi się nowy mem</p>
                    )}
                </div>
            </div>
        );
    }
}

export default CreateMem;