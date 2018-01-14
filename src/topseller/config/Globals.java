package topseller.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class Globals {
    @Bean
    public String fileSystemUploadPath(){
      return "c:/wamp64/www/fileupload/topseller/";
    }
}
