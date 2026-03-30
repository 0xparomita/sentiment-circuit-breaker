# Sentiment Circuit Breaker

The "Sentiment Circuit Breaker" is a safety layer designed to prevent "Governance Attacks" or catastrophic treasury errors. It allows the community to act as a decentralized "Panic Button."

## How it Works
1. **Threshold**: The DAO sets a "Veto Threshold" (e.g., 500 unique 👎 reactions within 4 hours).
2. **Oracle Push**: A trusted "Oracle Bot" (or a decentralized relayer) monitors Discord.
3. **Trigger**: If the threshold is hit, the bot calls `triggerPanicPause()` on-chain.
4. **Resolution**: The Treasury is frozen. Only a successful DAO proposal can "Unpause" the system after a full review.

## Security
* **Sybil Resistance**: The Oracle only counts reactions from Discord accounts linked to addresses with a minimum token balance.
* **One-Way Switch**: The bot can only **Pause** the contract; it can never **Unpause** it.
* **Timelock**: The unpausing process requires a 48-hour delay to ensure community alignment.
