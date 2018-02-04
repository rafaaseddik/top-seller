package topseller.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class GlobalVariables {
    @Bean
    public String fileSystemUploadPath(){
      return "/Applications/MAMP/htdocs/fileupload/topseller/";
    }
    @Bean
    public static String imagesServerURL(){ return "http://localhost/fileupload/topseller/"; }
    @Bean
    public static int getMaxPrice(){ return 50000; }
}
