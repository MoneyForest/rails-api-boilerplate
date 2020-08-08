import { signUpAction } from "./actions";
import {push, goBack} from 'connected-react-router'
import Axios from 'axios';

export const signUp = (email, password) => {
    return async (dispatch) => {
        return Axios.post(
            'http://localhost:3001/api/v1/users',
            {email: email, password: password}
            ).then((res) => {
                alert(res)
            }).catch((error) => {
                alert('アカウント登録に失敗しました。もう1度お試しください。')
                throw new Error(error)
            }
        )
    }
};