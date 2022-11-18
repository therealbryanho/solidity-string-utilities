pragma solidity >=0.8.4;

library StringUtils {
    /**
     * @dev Returns the length of a given string
     *
     * @param s The string to measure the length of
     * @return The length of the input string
     */
    function strLen(string memory s) public pure returns (uint256) {
        uint256 len;
        uint256 i = 0;
        uint256 bytelength = bytes(s).length;
        for (len = 0; i < bytelength; len++) {
            bytes1 b = bytes(s)[i];
            if (b < 0x80) {
                i += 1;
            } else if (b < 0xE0) {
                i += 2;
            } else if (b < 0xF0) {
                i += 3;
            } else if (b < 0xF8) {
                i += 4;
            } else if (b < 0xFC) {
                i += 5;
            } else {
                i += 6;
            }
        }
        return len;
    }

    /**
     * @dev Returns the appended string 
     *
     * @param strA First string
     * @param strA Second string
     * @return The appended string based on concatenating strA and strB
     */
    function strJoin(string memory strA,string memory strB) public pure returns (string memory) {
         return string.concat(strA,strB);
    }

    /**
     * @dev Returns the uint value 
     *
     * @param s The string to convert. This should be a number in string format
     * @return The converted uint based on the input string
     */
    function strToUint(string memory s) public pure returns (uint) {
        bytes memory b = bytes(s);
        uint result = 0;
        for (uint256 i = 0; i < b.length; i++) {
            uint256 c = uint256(uint8(b[i]));
            if (c >= 48 && c <= 57) {
                result = result * 10 + (c - 48);
            }
        }
        return result;
    }

    /**
     * @dev Returns the substring value 
     *
     * @param str The original string
     * @param startIndex Start index - this begins from 0 (this char is not included in the output)
     * @param endIndex End index - index of final char (included in the output)
     * @return The substring value
     */
    function subStr(string memory str, uint startIndex, uint endIndex) public pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(endIndex-startIndex);
        for(uint i = startIndex; i < endIndex; i++) {
            result[i-startIndex] = strBytes[i];
        }
        return string(result);
    }


}
