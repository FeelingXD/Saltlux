package imgResize;
import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
public class ResizerTest {

	public static void ResizeImageExample(String imagePath,String imageToWrite , int width, int height) throws IOException {
		
		File fileToRead= new File(imagePath);
		BufferedImage image = ImageIO.read(fileToRead);
		
		BufferedImage newimage = new BufferedImage(width, height, image.getType());
		
		Graphics2D g2d = newimage.createGraphics();
		g2d.drawImage(image, 0, 0, width, height, null);
		g2d.dispose();
		
		String formatName = imagePath.substring(imagePath.lastIndexOf(".")+1);
		
		ImageIO.write(newimage , formatName, new File(imageToWrite));
		
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			ResizeImageExample("C:\\Users\\지민\\Desktop\\image\\test.jpg","C:\\Users\\지민\\Desktop\\image\\thumbnail.jpg",500,500);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
