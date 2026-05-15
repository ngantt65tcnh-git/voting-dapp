// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {

    struct Candidate {
        string name;
        uint voteCount;
    }

    // Kiểm tra địa chỉ ví đã bỏ phiếu chưa
    mapping(address => bool) public hasVoted;

    // Danh sách ứng viên
    Candidate[] public candidates;

    // Khởi tạo ứng viên ban đầu
    constructor() {
        candidates.push(Candidate("THU PHONG", 0));
        candidates.push(Candidate("BICH TRAN", 0));
    }

    // Hàm bỏ phiếu
    function vote(uint index) public {

        // Kiểm tra đã vote chưa
        require(!hasVoted[msg.sender], "Already voted");

        // Kiểm tra ứng viên hợp lệ
        require(index < candidates.length, "Invalid candidate");

        // Đánh dấu đã bỏ phiếu
        hasVoted[msg.sender] = true;

        // Tăng số phiếu
        candidates[index].voteCount++;
    }

    // Lấy thông tin ứng viên
    function getCandidate(uint index)
        public
        view
        returns(string memory, uint)
    {
        return (
            candidates[index].name,
            candidates[index].voteCount
        );
    }

    // Lấy tổng số ứng viên
    function getTotalCandidates()
        public
        view
        returns(uint)
    {
        return candidates.length;
    }
}
