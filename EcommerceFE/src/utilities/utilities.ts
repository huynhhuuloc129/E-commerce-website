import { useCookies } from "vue3-cookies";

const cookies = useCookies();

export default function checkLogin() {
    const tokenBearer = cookies.cookies.get('Token');
    if (tokenBearer == null || tokenBearer == '') return false;
    return true
}