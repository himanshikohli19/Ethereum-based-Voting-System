pragma solidity >=0.4.11;
contract Election
{	//Model a Candidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}

	//store candidates

	//Fetch candidate
	mapping(uint => Candidate) public candidates;
	
	//store candidates count
	uint public candidatesCount;


	constructor() public
	{
		addCandidate('Candidate-1');
		addCandidate('Candidate-2');
	}

	function addCandidate (string memory _name) private {
		candidatesCount ++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}
}