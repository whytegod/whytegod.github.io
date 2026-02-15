// Wallet Connect
async function connectWallet() {
    if (window.ethereum) {
        try {
            const accounts = await window.ethereum.request({
                method: "eth_requestAccounts"
            });
            document.getElementById("walletAddress").innerText =
                "Connected: " + accounts[0];
        } catch (error) {
            alert("Connection Failed");
        }
    } else {
        alert("MetaMask not installed");
    }
}

// Animated Counter
function animateValue(id, start, end, duration) {
    let range = end - start;
    let current = start;
    let increment = end > start ? 1 : -1;
    let stepTime = Math.abs(Math.floor(duration / range));
    let obj = document.getElementById(id);

    let timer = setInterval(function () {
        current += increment;
        obj.innerText = current.toLocaleString();
        if (current == end) {
            clearInterval(timer);
        }
    }, stepTime);
}

window.onload = function () {
    animateValue("totalSupply", 0, 1000000000, 2000);
    animateValue("validators", 0, 250, 2000);
};

// Countdown Timer
function countdown() {
    const launchDate = new Date("Dec 31, 2026 00:00:00").getTime();
    const now = new Date().getTime();
    const gap = launchDate - now;

    const days = Math.floor(gap / (1000 * 60 * 60 * 24));
    document.getElementById("countdown").innerText =
        days + " Days Until Launch";
}

setInterval(countdown, 1000);