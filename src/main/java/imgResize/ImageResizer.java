package imgResize;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class ImageResizer {//TDD
	
	public ImageResizer(String dirPath, File originalImage,int resizeWidth ,int resizeHeight) throws IOException {
		// TODO Auto-generated constructor stub
		try {
		BufferedImage inputImage = ImageIO.read(originalImage); // input
		
		BufferedImage outputImage = new BufferedImage(resizeWidth, resizeHeight, inputImage.getType());
		
		
		//thumbnail
		
		Graphics2D g2d = outputImage.createGraphics();
		g2d.drawImage(inputImage, 0, 0, resizeWidth, resizeHeight, null);
		g2d.dispose();
		
		ImageIO.write(outputImage, "png", new File(dirPath+"Thumbnail.png"));
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
