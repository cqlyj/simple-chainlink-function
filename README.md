# Simple Chainlink Function

This just a simple chainlink function that returns balance of an address by calling the [blockscout](https://docs.blockscout.com/devs/apis/rpc/account) API.

# Getting Started

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

## Quickstart

```
git clone https://github.com/cqlyj/simple-chainlink-function.git
cd simple-chainlink-function
make
```

# Usage

1. Set up your environment variables:

```bash
cp .env.example .env
```

2. Fill in the `.env` file with your own values. And also replace the address anywhere you see in files with your own address.
3. Deploy the `SimpleBalance` contract:

```bash
make deploy-simpleBalance
```

4. Grab the address of your deployed contract and go to the [chainlink function subscription page](https://functions.chain.link/). Create your subscription, add funds, and add the contract address as consumer address.

5. As you get the subscription ID, go to the `./script/Interactions.s.sol` file and update with yopur subscription ID.

```diff
contract SendRequest is Script {
    SimpleBalance simpleBalance;
-   uint64 subscriptionId = 3995;
+   uint64 subscriptionId = YOUR_SUBSCRIPTION_ID;
    string[] args = new string[](0);

    function sendRequestToGetBalance(address mostRecentlyDeployed) public {
        simpleBalance = SimpleBalance(mostRecentlyDeployed);
-       vm.startBroadcast(0xFB6a372F2F51a002b390D18693075157A459641F);
+       vm.startBroadcast(YOUR_ADDRESS); // Don't forget to replace with your address
        simpleBalance.sendRequest(subscriptionId, args);
        vm.stopBroadcast();
    }
    .
    .
    .
```

6. Run the script:

```bash
make send-request
```

7. Check in the chainlink function page for the pending request and once it's done, you can check the balance of the address by running:

```bash
make get-balance
```

That's it! You should see the balance of the address!

## Contact

Luo Yingjie - [luoyingjie0721@gmail.com](luoyingjie0721@gmail.com)
