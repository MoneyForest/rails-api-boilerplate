import React, {useState, useCallback} from 'react';
import {useDispatch} from "react-redux";
import {push} from "connected-react-router"
import { PrimaryButton } from '../components/UIkits'

const Home = () => {
    const dispatch = useDispatch();
    
    
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")
    
    const inputEmail = useCallback((e) => {
        setEmail(e.target.value)
    },[]);
    
    const inputPassword = useCallback((e) => {
        setPassword(e.target.value)
    },[]);
    
    return (
        <div className="c-section-container">
            <h1>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</h1>
            <br />
            <h3>sutra を使うリモートチームは、プロジェクトを整理し、変化する優先順位を管理し、仕事を処理できます。</h3>
            <br />
            <br />
            <br />
            <div className='center'>
                <PrimaryButton label={"無料で試してみる"} onClick={() => dispatch(push('/hoge'))} />
            </div>
        </div>
    );
};

export default Home;
