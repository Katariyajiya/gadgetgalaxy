package com.example.gadgetgalaxy.services.impl;

import com.example.gadgetgalaxy.exception.BadApiRequest;
import com.example.gadgetgalaxy.services.FileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

@Service
public class FileServiceImpl implements FileService {
    Logger logger = LoggerFactory.getLogger(FileService.class);
    @Override
    public String uploadFile(MultipartFile file, String path) throws IOException {

        String originalFilename = file.getOriginalFilename();
        logger.info("Original file name {}",originalFilename);
        String filename = UUID.randomUUID().toString();
        String extension = originalFilename.substring(originalFilename.lastIndexOf(".")+1);
       String filenameWithExtension = filename+extension;

       String fullPathWithFileName = path+filenameWithExtension;

       logger.info("fullPath name : {}",fullPathWithFileName);
       if (extension.equalsIgnoreCase("png")||extension.equalsIgnoreCase("jpg")|| extension.equalsIgnoreCase("jpeg")){

           logger.info("file extension is {}",extension);
           //making folder that is creating a path is path is absent
           File folder = new File(path);
           if (!folder.exists()){
               folder.mkdirs();
           }
           Files.copy(file.getInputStream(), Paths.get(fullPathWithFileName));
        }
       else{
           throw new BadApiRequest("File with extension"+extension+"not allowed");
        }

        return filenameWithExtension;
    }

    @Override
    public InputStream getResource(String path, String name) throws FileNotFoundException {
       String fullPath = path+File.separator+name;

       InputStream inputStream = new FileInputStream(fullPath);

        return inputStream;
    }
}
