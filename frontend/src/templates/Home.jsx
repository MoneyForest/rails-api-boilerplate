    import React, {useState, useCallback} from 'react';
import { PrimaryButton, FormDialog } from '../components/UIkits'

const Home = () => {
    const [open, setOpen] = useState(false);

    const handleOpen = useCallback(() => {
        setOpen(true);
    }, [setOpen]);

    const handleClose = useCallback(() => {
        setOpen(false);
    }, [setOpen]);
    
    return (
        <div className="c-section-container">
            <h1>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</h1>
            <br />
            <h3>sutra を使うリモートチームは、プロジェクトを整理し、変化する優先順位を管理し、仕事を処理できます。</h3>
            <br />
            <br />
            <br />
            <div className='center'>
                <PrimaryButton label={"無料で試してみる"} onClick={ handleOpen } />
            </div>
            <FormDialog open={open} handleOpen={handleOpen} handleClose={handleClose} />
        </div>
    );
};

export default Home;
