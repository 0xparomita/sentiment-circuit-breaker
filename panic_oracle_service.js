const { ethers } = require("ethers");
require("dotenv").config();

async function evaluatePanic(upvotes, downvotes, totalVoters) {
    const VETO_PERCENTAGE = 0.80; // 80% negative sentiment
    const MIN_PARTICIPATION = 100; // Minimum 100 voters

    if (totalVoters < MIN_PARTICIPATION) return false;

    const negativeRatio = downvotes / totalVoters;

    if (negativeRatio >= VETO_PERCENTAGE) {
        console.warn("🚨 VETO THRESHOLD REACHED! Triggering On-Chain Pause...");
        return true;
    }
    return false;
}

// Logic to call triggerPanicPause() if evaluatePanic returns true
