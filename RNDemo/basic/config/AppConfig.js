//zawgyi : my-MM
//mm3 : my
import {isEmpty} from "../utils/StringUtil";
import {LANG_CHINESE, LANG_ZAWGYI} from '../utils/LauguageUtils';

let DEBUG = true;

//当前语言
let language = null;

//当前用户信息
let currentUserInfo = null;

//店铺id
let zegoMartShopId = null;

//域名
let zegoMartDomain = null;


export const setDebug=(debug)=>{
    DEBUG = debug
};

export const isDebug=()=>{
    return DEBUG
};

/**
 * 更新语言
 * @param lang
 */
export const updateLanguage=(lang)=>{
    if(lang == null){
        lang = LANG_ZAWGYI;
    }
    if(lang === "zh"){
        lang = LANG_CHINESE;
    }
    language = lang
};

export const getLanguage=()=>{
    if(language){
        return language;
    }
    return LANG_ZAWGYI;
};

export function updateCurrentUserInfo(userInfo){
    currentUserInfo = userInfo;
}

export function getCurrentUserInfo(){
    // if(__DEV__){
    //     return {
    //         token: "2c569f7a8a844c5da73ff26ad10de663"
    //     };
    // }
    return currentUserInfo;
}

export function getZegoMartShopId() {
    if(zegoMartShopId && zegoMartShopId > 0){
        return zegoMartShopId;
    }else {
        return 3;
    }
}

export function updateZegoMartShopId(shopId) {
    zegoMartShopId = shopId;
}

export function getZegoMartDomain() {
    if(isEmpty(zegoMartDomain)){
        return "http://192.168.50.71:8888";
    }
    return zegoMartDomain;
}

export function updateZegoMartDomain(domain) {
    zegoMartDomain = domain;
}
