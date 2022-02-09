"use strict";
let web3;
let referAddress;
const Web3Modal = window.Web3Modal.default;
const WalletConnectProvider = window.WalletConnectProvider.default;
const evmChains = window.evmChains;

// Web3modal instance
let web3Modal;

// Chosen wallet provider given by the dialog window
let provider;
let chainId;

// Address of the selected account
let selectedAccount;

/**
 * Setup the orchestra
 */
function init() {
  // console.log("WalletConnectProvider is", WalletConnectProvider);
  // console.log("window.web3 is", window.web3, "window.ethereum is", window.ethereum);

  // Check that the web page is run in a secure context,
  // as otherwise MetaMask won't be available
  if (location.protocol !== "https:") {
    // https://ethereum.stackexchange.com/a/62217/620
    // return;
  }

  // Tell Web3modal what providers we have available.
  // Built-in web browser provider (only one can exist as a time)
  // like MetaMask, Brave or Opera is added automatically by Web3modal
  const providerOptions = {
    walletconnect: {
      package: WalletConnectProvider,
      options: {
        rpc: {
          1: "https://mainnet.infura.io/v3/8b20961b973f495e9c7dc9b3906f5f7a",
          56: "https://bsc-dataseed1.ninicoin.io/",
        },
      },
    },
  };

  web3Modal = new Web3Modal({
    cacheProvider: true,
    providerOptions,
    disableInjectedProvider: false,
  });
}

/**
 * Connect wallet button pressed.
 */
async function onConnect() {
  console.log("Opening a dialog", web3Modal);
  try {
    provider = await web3Modal.connect();
    web3 = new Web3(provider);

    displayConnectedWallet();
  } catch (e) {
    console.log("Could not get a wallet connection", e);
    return;
  }

  // Subscribe to accounts change
  provider.on("accountsChanged", (accounts) => {
    fetchAccountData();
  });

  // Subscribe to chainId change
  provider.on("chainChanged", (chainId) => {
    fetchAccountData();
  });

  await refreshAccountData();
}

/**
 * Kick in the UI action after Web3modal dialog has chosen a provider
 */
async function fetchAccountData() {
  // Get connected chain id from Ethereum node
  chainId = await web3.eth.getChainId();
  // Load chain information over an HTTP API
  const chainData = evmChains.getChain(chainId);

  // Get list of accounts of the connected wallet
  const accounts = await web3.eth.getAccounts();

  // MetaMask does not give you all accounts, only the selected account
  selectedAccount = accounts[0];

  displayConnectedWallet();

  // Go through all accounts and get their ETH balance
  const rowResolvers = accounts.map(async (address) => {
    const balance = await web3.eth.getBalance(address);
    const ethBalance = web3.utils.fromWei(balance, "ether");
  });

  await Promise.all(rowResolvers);
}

/**
 * Fetch account data for UI when
 * - User switches accounts in wallet
 * - User switches networks in wallet
 * - User connects wallet initially
 */
async function refreshAccountData() {
  // Disable button while UI is loading.
  // fetchAccountData() will take a while as it communicates
  // with Ethereum node via JSON-RPC and loads chain data
  // over an API call.
  await fetchAccountData(provider);
}

/**
 * Disconnect wallet button pressed.
 */
async function onDisconnect() {
  if (provider != null) {
    await web3Modal.clearCachedProvider();
    provider = null;
  }

  selectedAccount = null;
  displayConnectedWallet();
}

/**
 * Main entry point.
 */
window.addEventListener("load", async () => {
  init();
  await onConnect();
  displayConnectedWallet();
});

$(document).ready(function () {
  $(".btn__connect_wallet").click(async function (event) {
    event.preventDefault();
    await onConnect();
  });

  $(".btn__disconnect_wallet").click(async function (event) {
    event.preventDefault();
    await onDisconnect();
  });
});

function displayConnectedWallet() {
  let listAddress = [
    "0x404e182bf03d39a40554985fa26026152243338c",
    "0xdf340c1f04abaa451baf77520f41687788543d5b",
    "0x7f13eaf8051007e92cf5d28a6eac061207d95714",
    "0x58ba9ff890f4cd7a4978a3726743d3b12f4e8b73",
    "0x923b0be7f28e44f48c0330ee15a3af59bca8ae0a",
    "0xed27b9d591aaee7cb1077f40ff1f7e5ac6db7554",
    "0x6bdf876cd8e1c43d4374aedc36f86ce24b229606",
    "0x83e494a3fbdc4f10989786cb0f501a81a817cebd",
    "0x3d105e6dffeac248297f37f29596557544fbe067",
    "0xc892428ce1afa9fcafa0a28f3d05a94ee2c07f00",
    "0xda0157ab4cfa1a5209154333d16bfb8e457c9ce5",
    "0xdedb72bde050e027ec0ed8b71ef7c10af4144489",
    "0x399f94d32378400e63f3ad41d6a05c0c20ebf7a7",
    "0xf765742e1e5fd3f1d83e91daec53b377462f1fad",
    "0xac3696acaddb90c27eec8417eb6a9effba91888d",
    "0x3a7210ee3bb3e5484570451b211e36fe8763e41c",
    "0x2a9ea2e1e0f472c6e925d640fc1ea9a235a18618",
    "0x8238ac8da4e4cbd4b4bff9d99db7074f44322998",
    "0x7608b1c5c97c698ca54e05f4a8e0242be7ac0ced",
    "0xf9197a2e38a9207c61fe48d1df77b7d951b9d3fc",
    "0x5f9809090e8ad2295bc0c0e6072b8d50ce6098a0",
    "0x040e41453c5b6fdc00f844a872d6233caa8e91bb",
    "0x2b5c90a5a75f69ff6b99d0a07a9fb97d44d7e6bd",
    "0x8a970a8381e624b0a235c96633f6f4e74045f348",
    "0xa18241e0b8faa9c7b940d06aa2d3b982907dec75",
    "0xe57686a00d2a77d60b5314b1970df3de5ef5be27",
    "0x15fb4d93f400b6a82192f85dc798046cc22e1314",
    "0xb8fe076b2e4e009096f55c767eb08e1c8f64aa54",
    "0x4b2ddc8685fa3cb22b67c291cb48f1cbb1f16a46",
    "0xe4f581abb3037e38218af3d6e8550246ccb8fac5",
  ];

  let listAmount = [
    2129632.0, 2351851.0, 5000000.0, 5000000.0, 5833333.0, 1111111.0, 1111111.0, 3222222.0, 2000000.0, 3240740.0, 1851851.0, 555555.0, 925925.0, 3000000.0,
    925925.0, 6000000.0, 6000000.0, 6000000.0, 6000000.0, 6000000.0, 5000000.0, 3000000.0, 6000000.0, 1000000.0, 500000.0, 2000000.0, 1000000.0, 2000000.0,
    240744.0, 1851851.0,
  ];

  if (selectedAccount != null && selectedAccount.length) {
    let lowerWallet = selectedAccount.toLowerCase();
    let indexAddress = listAddress.indexOf(lowerWallet);
    let amount = 0;
    if (indexAddress >= 0) {
      amount = numberFormat(listAmount[indexAddress], 2);
    }
    // connected
    $(".wallet-detail").show();
    $(".wallet-detail .address").text(truncate(selectedAccount));
    $(".btn__connect_wallet").hide();
    $(".btn__disconnect_wallet").show();
    $(".balance").text(amount);
  } else {
    // disconnect
    $(".wallet-detail .address").text("");
    $(".btn__connect_wallet").show();
    $(".btn__disconnect_wallet").hide();
    $(".wallet-detail").hide();
    $(".balance").text(0);
  }
}

let truncate = function (fullStr) {
  let separator = "...";
  let sepLen = separator.length,
    frontChars = 4,
    backChars = 4;

  return fullStr.substr(0, frontChars) + separator + fullStr.substr(fullStr.length - backChars);
};

function numberFormat(number, decimals, dec_point, thousands_sep) {
  // Strip all characters but numerical ones.
  number = (number + "").replace(/[^0-9+\-Ee.]/g, "");
  let n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = typeof thousands_sep === "undefined" ? "," : thousands_sep,
    dec = typeof dec_point === "undefined" ? "." : dec_point,
    s = "",
    toFixedFix = function (n, prec) {
      var k = Math.pow(10, prec);
      return "" + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : "" + Math.round(n)).split(".");
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || "").length < prec) {
    s[1] = s[1] || "";
    s[1] += new Array(prec - s[1].length + 1).join("0");
  }
  return s.join(dec);
}
