// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract Score{

mapping(address=> uint) public scores;

address private teacherAddress;

function setTeacher(address teacher) public{
    teacherAddress = teacher;
}


modifier onlyTeacher() {
    require(msg.sender==teacherAddress,"only teacher address allowed");
    _;

}

function updateScore(address student, uint studentScore) external onlyTeacher{
    
    require(studentScore<=100,"failed, score>100");
    scores[student] =  studentScore;


}

}

interface iGiveScore {
    function updateScore(address, uint) external;
    
}

contract Teacher{
    
    iGiveScore score;

    constructor(address s)
    {
        score = iGiveScore(s);
    }

    /* function createScore() public returns(address){
        Score s =  new Score(msg.sender); 
        return address(s);

    }
 */


    function giveScore(address student, uint stuentScore) external{
        score.updateScore(student, stuentScore);
    }
}