// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WGDDao {

    struct Proposal {
        string description;
        uint256 yesVotes;
        uint256 noVotes;
        bool executed;
    }

    address public owner;
    Proposal[] public proposals;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event ProposalCreated(uint256 id, string description);
    event Voted(uint256 id, address voter, bool vote);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function createProposal(string memory _description) external onlyOwner {
        proposals.push(Proposal(_description, 0, 0, false));
        emit ProposalCreated(proposals.length - 1, _description);
    }

    function vote(uint256 _proposalId, bool _vote) external {
        require(!hasVoted[_proposalId][msg.sender], "Already voted");

        if (_vote) {
            proposals[_proposalId].yesVotes++;
        } else {
            proposals[_proposalId].noVotes++;
        }

        hasVoted[_proposalId][msg.sender] = true;

        emit Voted(_proposalId, msg.sender, _vote);
    }

    function totalProposals() external view returns (uint256) {
        return proposals.length;
    }
}