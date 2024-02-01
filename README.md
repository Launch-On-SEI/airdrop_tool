# Introducing, Airdrop Tool by SEI Ducks!!
Airdrop tool developed by the SEI Ducks team to assist with distribution of NFTs across SEI addresses. This is a very rudimentary tool that I hope to update over time. But for now wanted this out there to help others who have a need to distribute hundreds or thousands of NFTs on SEI in an effective and easy to approach manner.

Requires seid to be installed to use.

### Install and config seid:
1. Follow steps here: https://docs.sei.io/develop/get-started/local-dependencies
2. Follow steps here: https://docs.sei.io/develop/get-started/seid
3. Run the following command:

<code>export ACCOUNT_NAME="<YOUR_ACCOUNT_NAME_HERE>" && seid keys add $ACCOUNT_NAME </code>

This will generate a new wallet and mnemonic. You can fund the address provided or import the mnemonic into compass if needed, too.

### Setup an airdrop
1. Mint tokens to airdrop to the wallet setup with seid 
2. In the script, set the following two fields:
   3. current_token_id should be set to the start of the range of tokens 
   4. account_name matching what was setup with seid in install/config section above
5. Setup airdrop.csv to contain the intended number of tokens to airdrop and the addresses to airdrop the tokens to

### Running an airdrop
To run an airdrop, simply run the following command:

```./airdrop.sh airdrop.csv```

Watch for any check_tokenId.txt files that may be generated - open them to see which address the token was being sent to. Sometimes these errors occur if no response is received. Other times it is due to an error.

The 2 second cooldown time is by design as too many requests from the same wallet in a short period of time can cause excessive errors and failed transfers. It is likely safe to drop this to 0.69 seconds or even 1 second, but retained 2 seconds for safety and reducing the number of fixes by hand.

It is helpful to have  compass wallet installed and configured with the airdrop mnemonic to help manage failed txs/missed NFTs during the airdrop.


### Closing remarks

If you wish to leave a tip, feel free to buy me a coffee by sending sei to:

`sei16xhszdw7j5vfesf83dcjufpwg8vh7a5t59tdns`

If you have any questions please ask @droptpackets on twitter or droptpackets.eth on discord.
