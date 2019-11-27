/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React, {Component} from 'react';
import {AppNavigation, initAppNavigator} from '../RNDemo/basic/components/AppNavigation';

export default class App extends Component<Props>{

    constructor(props){
        super(props);
        initAppNavigator("Home");
    }

    render(){
        return <AppNavigation/>
    }
}
