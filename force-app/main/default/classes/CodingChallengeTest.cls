@IsTest
public with sharing class CodingChallengeTest {
    @isTest
    static void testCodingChallenge() {
        CodingChallenge program = new CodingChallenge();
        List<Boolean> isConnected = new List<Boolean>  ();

        Test.startTest();
        program.connect(1, 2);
        program.connect(20, 3);
        program.connect(1, 8);
        program.connect(9, 8);
        program.connect(10, 8);

        program.connect(2, 6);
        program.connect(6, 9);
        program.connect(10, 12);

        program.connect(10,109);

        isConnected.add(program.isConnected(2, 8));
        isConnected.add(program.isConnected(10, 9));
        isConnected.add(program.isConnected(1, 12));
        isConnected.add(program.isConnected(3, 12));
        
        Test.stopTest();
        System.assertEquals(true, isConnected[0]);
        System.assertEquals(true, isConnected[1]);
        System.assertEquals(true, isConnected[2]);
        System.assertEquals(false, isConnected[3]);
    }
}