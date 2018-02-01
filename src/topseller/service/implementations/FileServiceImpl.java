package topseller.service.implementations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import topseller.service.FileService;

import java.io.File;
import java.io.FileOutputStream;
@Service
public class FileServiceImpl implements FileService {
    @Autowired
    String fileSystemUploadPath;

    public FileServiceImpl() {
    }

    @Override
    public String writeFile(byte[] data, String filename) throws Exception {
        String fullPath=fileSystemUploadPath+filename;
        File out = new File(fullPath);
        FileOutputStream fos = null;
        try{
            fos = new FileOutputStream(out);
            fos.write(data);
            fos.flush();
            fos.close();
        }
        catch (Exception e){
            Exception exception = new Exception("FileService : Couldn't write file",e);
            throw exception;
        }finally {
            if(fos!=null)try{}catch(Exception e){throw new Exception("FileService : Couldn't close FileOutputStream",e);}
        }
        return filename;
    }
}
