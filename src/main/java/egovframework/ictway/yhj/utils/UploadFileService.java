package egovframework.ictway.yhj.utils;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadFileService {
	
	public final static String saveFilePathGMA = "D:\\ictwayEdu\\images";
	
	public String uploadFile(MultipartFile image) {
		
		UUID uuid = UUID.randomUUID();
		String fileName = uuid + "_" + image.getOriginalFilename();
		
		File saveFile = new File(saveFilePathGMA, fileName);
		try {
			image.transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return fileName;
	}

}
