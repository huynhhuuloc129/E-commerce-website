import { useCookies } from "vue3-cookies";

const cookies = useCookies();

export function checkLogin() {
    const tokenBearer = cookies.cookies.get('Token');
    if (tokenBearer == null || tokenBearer == '') return false;
    return true
};

export function calculateTimeElapse(t: string): string {


    const timeElapsed = Date.now() - Date.parse(t);

    const minutesElapsed = Math.floor(timeElapsed / (1000 * 60));
    const hoursElapsed = Math.floor(timeElapsed / (1000 * 60 * 60));
    const daysElapsed = Math.floor(timeElapsed / (1000 * 60 * 60 * 24));

    let content = minutesElapsed + ' phút trước'
    if (minutesElapsed > 60) content = hoursElapsed + ' giờ trước'
    if (hoursElapsed > 24) content = daysElapsed + ' ngày trước'

    return content
}
