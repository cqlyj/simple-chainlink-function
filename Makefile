-include .env

install:
	@forge install smartcontractkit/chainlink-brownie-contracts --no-commit && forge install cyfrin/foundry-devops --no-commit

deploy-simpleBalance:
	@forge script script/DeploySimpleBalance.s.sol:DeploySimpleBalance --rpc-url $(SEPOLIA_RPC_URL) --account burner --sender 0xFB6a372F2F51a002b390D18693075157A459641F --broadcast --verify --verifier blockscout --verifier-url https://eth-sepolia.blockscout.com/api/ -vvvv

send-request:
	@forge script script/Interactions.s.sol:SendRequest --rpc-url $(SEPOLIA_RPC_URL) --account burner --sender 0xFB6a372F2F51a002b390D18693075157A459641F --broadcast -vvvvv

get-balance:
	@forge script script/Interactions.s.sol:GetBalance --rpc-url $(SEPOLIA_RPC_URL) --account burner --sender 0xFB6a372F2F51a002b390D18693075157A459641F --broadcast -vvvvv

# send:
# 	@cast send 0x6a336bEd5B211A382F9FdFf288b868e96fffB927 "sendRequest(uint64,string[])" 3995 "[]" --account burner --rpc-url ${SEPOLIA_RPC_URL}