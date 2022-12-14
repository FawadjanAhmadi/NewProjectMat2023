package api.test;

import com.intuit.karate.junit5.Karate;

public class testRunner {

	@Karate.Test
	public Karate runTest() {
		
		return Karate.run
	("classpath:features").tags("@Faker");
		
	}
}
