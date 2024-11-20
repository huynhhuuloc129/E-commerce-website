<template>
    <div class="chatbot-container" style="z-index: 1;">
        <!-- Plus Icon Button -->
        <button @click="toggleChatbot" class="btn chatbot-btn"
            style="background-color: #d19b9c; color: white; width: 70px; height: 70px; box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;">
            <svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="currentColor" class="bi bi-robot"
                viewBox="0 0 16 16">
                <path
                    d="M6 12.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5M3 8.062C3 6.76 4.235 5.765 5.53 5.886a26.6 26.6 0 0 0 4.94 0C11.765 5.765 13 6.76 13 8.062v1.157a.93.93 0 0 1-.765.935c-.845.147-2.34.346-4.235.346s-3.39-.2-4.235-.346A.93.93 0 0 1 3 9.219zm4.542-.827a.25.25 0 0 0-.217.068l-.92.9a25 25 0 0 1-1.871-.183.25.25 0 0 0-.068.495c.55.076 1.232.149 2.02.193a.25.25 0 0 0 .189-.071l.754-.736.847 1.71a.25.25 0 0 0 .404.062l.932-.97a25 25 0 0 0 1.922-.188.25.25 0 0 0-.068-.495c-.538.074-1.207.145-1.98.189a.25.25 0 0 0-.166.076l-.754.785-.842-1.7a.25.25 0 0 0-.182-.135" />
                <path
                    d="M8.5 1.866a1 1 0 1 0-1 0V3h-2A4.5 4.5 0 0 0 1 7.5V8a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1v1a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-1a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1v-.5A4.5 4.5 0 0 0 10.5 3h-2zM14 7.5V13a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V7.5A3.5 3.5 0 0 1 5.5 4h5A3.5 3.5 0 0 1 14 7.5" />
            </svg>
        </button>

        <!-- Chatbot Pop-up -->
        <div v-if="showChatbot" class="chatbot-popup card mb-3">
            <div class="card-header d-flex justify-content-between">
                <h5 class="mb-0">Chatbot</h5>
                <button @click="toggleChatbot" class="btn-close"></button>
            </div>

            <div class="card-body chatbot-body" ref="chatBody">
                <!-- Conversation History -->
                <div v-for="(message, index) in messages" :key="index" class="chat-message">
                    <div :class="['d-flex', message.sender === 'bot' ? 'bot-message' : 'user-message']">
                        <!-- Avatar -->

                        <img v-if="message.sender === 'bot'" src="@/assets/chatbot-avatar.jpg" class="avatar"
                            alt="avatar" />
                        <img v-else :src="userAvatar" class="avatar" alt="avatar">
                        <pre class="message-text">{{ message.text }}</pre>
                    </div>
                </div>
            </div>

            <!-- Chat Input -->
            <div class="card-footer d-flex">
                <input v-model="userInput" @keyup.enter="sendMessage" class="form-control me-2" type="text"
                    placeholder="Nhập tin nhắn..." />
                <button @click="sendMessage" class="btn btn-primary"
                    style="border-radius: 0; background-color: #fbbfc0; border: 0px;">Gửi</button>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { onMounted, ref, watch } from 'vue';
import { useCookies } from 'vue3-cookies';
import { checkLogin } from '@/utilities/utilities';
import accountServices from '@/services/account.services';
import chatbotServices from '@/services/chatbot.services';

const cookies = useCookies();
const token = cookies.cookies.get("Token");
const chatBody = ref<HTMLElement | null>(null);

const currentUser = ref({
    accountId: 0,
    username: "",
    password: "",
    email: "",
    name: "",
    phone: "",
    birthDate: null,
    avatar: "",
    billingAddress: "",
    created_at: null,
    updated_at: null,
});

const userAvatar = ref("");

const messages = ref([
    { sender: 'bot', text: 'Xin chào! Tôi có thể trợ giúp bạn những gì?' },
]);

const userInput = ref('');
const showChatbot = ref(false);
function toggleChatbot() {
    showChatbot.value = !showChatbot.value;
}
async function sendMessage() {
    if (userInput.value.trim() !== '') {
        let query = userInput.value
        userInput.value = '';

        messages.value.push({ sender: 'user', text: query });

        let resp = await chatbotServices.ask({ query: query })

        console.log(resp.data.message)

        messages.value.push({ sender: 'bot', text: resp.data.message });
        if (chatBody.value) {
            chatBody.value.scrollTop = chatBody.value.scrollHeight;
        }

    }
}
// Watch for changes in messages and scroll down when a new message is added
watch(messages, () => {
    if (chatBody.value) {
        chatBody.value.scrollTop = chatBody.value.scrollHeight;
    }
});
onMounted(async () => {
    if (checkLogin()) {
        let resp = await accountServices.getMe(token);
        currentUser.value = resp.data.account[0];

        userAvatar.value = currentUser.value.avatar
    }
})
</script>

<style scoped>
.chatbot-container {
    position: fixed;
    bottom: 20px;
    right: 20px;
}

.chatbot-btn {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    font-size: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.chatbot-popup {
    position: fixed;
    bottom: 80px;
    right: 20px;
    width: 400px;
    border-radius: 10px;
    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
}

.chatbot-body {
    max-height: 300px;
    overflow-y: auto;
    padding: 10px;
}

.chat-message {
    margin-bottom: 10px;
}

.bot-message {
    justify-content: flex-start;
}

.user-message {
    justify-content: flex-end;
}

.avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 10px;
}

.message-text {
    font-family: "Archivo", sans-serif;
    white-space: pre-wrap;
    /* Since CSS 2.1 */
    white-space: -moz-pre-wrap;
    /* Mozilla, since 1999 */
    white-space: -pre-wrap;
    /* Opera 4-6 */
    white-space: -o-pre-wrap;
    /* Opera 7 */
    word-wrap: break-word;
    background-color: #f1f1f1;
    padding: 10px;
    border-radius: 8px;
    max-width: 200px;
    word-break: break-word;
    overflow-x: auto;
}

.card-footer {
    background-color: #fff;
}
</style>