package topseller.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class GlobalVariables {
    @Bean
    public String fileSystemUploadPath(){
      return "c:/wamp64/www/fileupload/topseller/";
    }
    @Bean
    public String imagesServerURL(){ return "http://localhost/fileupload/topseller/"; }
}
