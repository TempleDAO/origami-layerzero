# Origami LayerZero Fork

Origami uses LayerZero for Omnichain Fungible Tokens (OFT), with a few differences:

- Use Origami's auth model (`OrigamiElevatedAccess`) rather than OpenZeppelin's Ownable
- Use OpenZeppelin 4.*
- Changes to help get around stack-too-deep (for testing only)

The `main` branch represents the original contracts pulled in. It is intentionally pulled into the single repo -- but not an entire fork of the full upstream github from LayerZeroLabs as that is very bloated. See version information of that below.

The `origami-diffs` branch is then the extra delta for Origami required changes outlined below.

## Base Versions

1. [./src/lz-evm-messagelib-v2](https://github.com/LayerZero-Labs/LayerZero-v2/tree/943ce4a2bbac070f838e12c7fd034bca6a281ccf/packages/layerzero-v2/evm/messagelib/contracts)
1. [./src/lz-evm-protocol-v2](https://github.com/LayerZero-Labs/LayerZero-v2/tree/943ce4a2bbac070f838e12c7fd034bca6a281ccf/packages/layerzero-v2/evm/protocol/contracts)
1. [./src/lz-evm-oapp-v2](https://github.com/LayerZero-Labs/LayerZero-v2/tree/943ce4a2bbac070f838e12c7fd034bca6a281ccf/packages/layerzero-v2/evm/oapp/contracts)
1. [./src/test-devtools-evm-foundry](https://github.com/LayerZero-Labs/devtools/tree/%40layerzerolabs/devtools-evm%401.0.2/packages/test-devtools-evm-foundry/contracts)
1. [./src/lz-evm-v1-0.7](https://www.npmjs.com/package/@layerzerolabs/lz-evm-v1-0.7?activeTab=code)

## Modifications

1. Use `OpenZeppelin v4.*` rather than `v5.*`. Origami will also update to v5 at some point, but as of now it has breaking interface changes.
1. Avoid stack-too-deep:
   1. Pull out OFT constructor parameters into a struct
   2. Comment out a public function which has many args. Origami doesn't depend on this in prod contracts or testing - it only impacts the LZ deployed `EndPointV2`
1. Add a BYO model for Ownership of the OFT and OFTAdapter contract, rather than forcing the use of OpenZeppelin's `Ownable`. In Origami's case, we use OrigamiElevatedAccess.
   1. This model allows the implementation to define the `onlyOFTOwner()` modifier.

## Remappings

In order to keep most files the same even though we use different paths here, [./remappings.txt](./remappings.txt) was used.

### Build

```shell
$ forge build
```

### Test

No extra tests deployed here - the client code (eg Origami) has tests for these.


```shell
$ forge test
```
