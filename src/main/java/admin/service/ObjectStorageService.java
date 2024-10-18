package admin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface ObjectStorageService {

	public String uploadFile(String bucketName, String directoryPath, MultipartFile img);

	public void deleteImageFile(String bucketName, String directoryPath, List<String> list);

	public void adminDeleteImageFile(String bucketName, String directoryPath, String imageFileName);

}
