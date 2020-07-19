import React, { useState, useCallback } from 'react';
import axios from 'axios';
import Button from '@material-ui/core/Button';
import { TextInput } from './Forms/index';

const LoginContainer = (props) => {
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

    axios.post('api/v1/auth/sign_in', payload
    ).then(() => {
      alert('ログインが成功しました');
      setEmail('');
      setPassword('');
      props.signIn();
    }).catch(() => {
      alert('ログインに失敗しました');
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

export default LoginContainer;
