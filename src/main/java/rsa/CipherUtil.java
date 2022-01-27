package rsa;
import java.io.UnsupportedEncodingException; 
import java.security.InvalidKeyException; 
import java.security.KeyPair; 
import java.security.KeyPairGenerator; 
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom; 
import java.util.Base64; 
import javax.crypto.BadPaddingException; 
import javax.crypto.Cipher; 
import javax.crypto.IllegalBlockSizeException; 
import javax.crypto.NoSuchPaddingException;

public class CipherUtil {
	
	// 키쌍생성
	public static KeyPair genRSAKeyPair() throws NoSuchAlgorithmException{
		
		SecureRandom secureRandom = new SecureRandom();
		KeyPairGenerator gen;
		gen = KeyPairGenerator.getInstance("RSA");
		gen.initialize(1024,secureRandom);
		KeyPair keyPair = gen.generateKeyPair();
		return keyPair;
	}
	
	// 공개키 암호화수행

	public static String encryptRSA(String plainText, PublicKey publickey)
			throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, 
			BadPaddingException, IllegalBlockSizeException {
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.ENCRYPT_MODE,publickey);
		byte[] bytePlain = cipher.doFinal(plainText.getBytes());
		String encrypted = Base64.getEncoder().encodeToString(bytePlain);
		return encrypted;
	}
	// 개인키 복호화수행
	
	public static String decryptRSA(String encrypted,PrivateKey privatekey)
			throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, 
	BadPaddingException, IllegalBlockSizeException, UnsupportedEncodingException{
		
		Cipher cipher = Cipher.getInstance("RSA");
		byte[] byteEncrypted = Base64.getDecoder().decode(encrypted.getBytes());
		cipher.init(Cipher.DECRYPT_MODE,privatekey);
		byte[] bytePlain = cipher.doFinal(byteEncrypted);
		String decrypted = new String(bytePlain,"utf-8");
		return decrypted;	
	}
	
}
