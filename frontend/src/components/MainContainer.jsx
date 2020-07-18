import React, { useState, useCallback } from 'react';
import axios from 'axios';
import Button from '@material-ui/core/Button';
import { TextInput } from './Forms/index';

const MainContainer = (props) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const inputEmail = useCallback((event) => {
    setEmail(event.target.value);
  }, [setEmail]);

  const inputPassword = useCallback((event) => {
    setPassword(event.target.value);
  }, [setPassword]);

  const submitForm = () => {
    const payload = {
      email: email,
      password: password,
    };
    console.log(payload);

    axios.post('http://localhost:3001/api/v1/auth/sign_in', payload
    ).then(() => {
      alert('送信が完了しました');
      setEmail('');
      setPassword('');
    });
  };

  return (
    <div className='main-container'>
      <TextInput
        label="メールアドレス"
        multiline={false}
        rows={1}
        value={email}
        type="email"
        onChange={inputEmail}
      />
      <TextInput
        label="パスワード"
        multiline={false}
        rows={1}
        value={password}
        type="text"
        onChange={inputPassword}
      />
      <Button onClick={submitForm} color="primary" autoFocus>
        ログイン
      </Button>
    </div>
  );
};

export default MainContainer;
