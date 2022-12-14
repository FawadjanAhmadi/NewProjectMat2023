package api.test;



import java.text.SimpleDateFormat;
import java.util.Date;

import com.github.javafaker.Faker;


public class DataGenerator {

	public static String getEmail() {
		Faker faker = new Faker();
		String email = faker.name().firstName()+faker.name().lastName()+"@gmail.com";
		return email;
	}
	public static void main(String arg []) {
		System.out.println(getEmail());
	}
	
	public static String getFirstname() {
		Faker faker = new Faker();
		String firstname = faker.name().firstName();
		return firstname;
	}
	public static String getlasttname() {
		Faker faker = new Faker();
		String lastname = faker.name().lastName();
		return lastname;
	}
	public static String getDob() {
		Faker faker = new Faker();
		Date date = faker.date().birthday();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(date);
	}
	
	
	
}
