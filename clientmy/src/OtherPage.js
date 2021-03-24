import React from 'react';
import { Link } from 'react-router-dom';

function default_own() {
    return (
        <div>
            Im some other page!
            <Link to="/">Go back home</Link>
        </div>
    );
}

export default default_own;
