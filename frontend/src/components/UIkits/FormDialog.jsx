import React, { useState, useEffect, useCallback } from 'react';
import {useDispatch} from "react-redux";
import Button from '@material-ui/core/Button';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogTitle from '@material-ui/core/DialogTitle';
import TextInput from './TextInput';
import {signUp} from "../../reducks/users/operations";

const FormDialog = (props) => {
    const dispatch = useDispatch();

    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');

    const inputEmail = useCallback((event) => {
        setEmail(event.target.value);
    }, [setEmail]);

    const inputPassword = useCallback((event) => {
        setPassword(event.target.value);
    }, [setPassword]);

    const submitForm = () => {
        dispatch(signUp(email, password));
    };

    return (
        <Dialog
            open={props.open}
            onClose={props.handleClose}
            aria-labelledby="alert-dialog-title"
            aria-describedby="alert-dialog-description"
        >
            <DialogTitle id="alert-dialog-title">無料で試してみる</DialogTitle>
            <DialogContent>
                <TextInput
                    label="メールアドレス"
                    multiline={false}
                    rows={1}
                    value={email}
                    type='email'
                    onChange={inputEmail}
                />
                <TextInput
                    label="パスワード"
                    multiline={false}
                    rows={1}
                    value={password}
                    type='password'
                    onChange={inputPassword}
                />
            </DialogContent>
            <DialogActions>
                <Button onClick={props.handleClose} color="primary">
                    キャンセル
                </Button>
                <Button onClick={ submitForm } color="primary" autoFocus>
                    送信する
                </Button>
            </DialogActions>
        </Dialog>
    );
};

export default FormDialog;
