
import React from 'react';
import {View, Text, FlatList} from 'react-native';
import BasePageComponent, {STATUS_FAIL, STATUS_LOADING} from '../basic/components/BasePageComponent';

export default class Home extends BasePageComponent{

    constructor(props){
        super(props);

        Object.assign(this.state, {
            refreshing: false
        });
        let data = [];
        for(let i = 0;i < 20;i ++) {
            data.push(i);
        }
        this.data = data;
        console.log("开始");
    }

    componentDidMount(): void {
        // this.setPageStatus(STATUS_FAIL)
    }

    _onRefresh(){
        this.setState({
            refreshing: true
        });

        setTimeout(() => {
            console.log("结束下拉刷新");
            this.setState({
                refreshing: false,
            })
        }, 2000);
    }

    getContent(){
        return<FlatList style={{flex: 1}} data={this.data}
                        keyExtractor={(item, index) => index.toString()}
                        refreshEnable={true}
                        refreshing={this.state.refreshing}
                        onRefreshCallback={() => {
                            this._onRefresh();
                        }}
                        renderItem={({item}) => {
                            return <View style={{height: 50, backgroundColor: 'white'}}>
                            <Text style={{fontSize: 30, fontWeight: 'bold', padding: 15}}>{item}</Text>
                                </View>
                        }
                        }/>
    }



    getIPhoneXTopStyle(){
        return {backgroundColor: 'cyan'};
    }

    getHeader() {
        return <View style={{backgroundColor: 'cyan', width: '100%', height: 40, justifyContent: 'center', alignItems: 'center'}}>
            <Text>这是一个头部</Text>
        </View>
    }

    getIPhoneXBottomStyle() {
        return {backgroundColor: 'red'};
    }

    getFooter() {
        return <View style={{backgroundColor: 'red', width: '100%', height: 40, justifyContent: 'center', alignItems: 'center'}}>
            <Text>这是一个底部</Text>
        </View>
    }
}
