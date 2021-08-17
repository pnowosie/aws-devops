import React from 'react';
import axios from "axios";
import styled from "styled-components";


const LastImagesWrapper = styled.div`
  display: grid;
  grid-template-columns: 1fr 1fr;
  column-gap: 48px;
  row-gap: 48px;
  justify-items: center;
  align-items:center;
  margin-bottom: 128px;

`
const LastImage = styled.img`
  width: 100%;
  background-position: center;
  background-size:cover;
  background-color: #ddd;
  background-repeat: no-repeat;
  min-height: 500px;
`

class Last10Mems extends React.Component  {

    constructor() {
        super();
        this.state = { last10Images: []}
    }

    componentDidMount() {

        axios.get(window.Configs.PhotosURL + 'memes?maxItems=10')
            .then(res => {
                let last10Images = [];
                res.data.forEach (x => {
                    last10Images.push({
                      id: x.id,
                      url: window.Configs.PhotosURL +"/download/"+ x.fileName
                    })
                } )
                this.setState({last10Images})
            })
    }

    render()
    {
        return (
            <LastImagesWrapper>
                {this.state.last10Images.map (image => (
                    <LastImage key={image.id} src={image.url}/>
                ))}

            </LastImagesWrapper>
        );
    }
}

export default Last10Mems;