pragma solidity >=0.4.11;
contract Election
{	//Model a Candidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}
	//store accounts that have already voted
	mapping(address => bool) public voters;
	//store candidates

	//Fetch candidate
	mapping(uint => Candidate) public candidates;
	
	//store candidates count
	uint public candidatesCount;


	constructor() public
	{
		addCandidate('Bhartiya Janta Party (BJP)');
		addCandidate('Aam Admi Party (AAP)');
	}

	function addCandidate (string memory _name) private {
		candidatesCount ++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}
	function vote (uint _candidateId) public {
		//require that they haven't voted before - trace
		require(!voters[msg.sender]);

		//require a valid candidate -check
		require(_candidateId>0 && _candidateId<=candidatesCount);

		//record that voter has voted
		voters[msg.sender] = true;

		//update candidate vote account
		candidates[_candidateId].voteCount++;

	}
}