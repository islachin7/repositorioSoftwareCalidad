
package conexion;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;

public class Conexion {
    private static BasicDataSource datasource = null;
    
    private static DataSource getDataSource(){
        if(datasource == null){
            datasource = new BasicDataSource();
            datasource.setDriverClassName("com.mysql.cj.jdbc.Driver");
            datasource.setUsername("root");
            datasource.setPassword("NALfxn59540");
            datasource.setUrl("jdbc:mysql://node226551-colegionuevo.j.layershift.co.uk/colegio?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&autoReconnect=true&useSSL=false");
            datasource.setInitialSize(20);
            datasource.setMaxIdle(40);
            datasource.setMaxTotal(100);
            datasource.setMaxWaitMillis(5000);
        }
        return datasource;
    }
    
    public static Connection getConnection() throws SQLException{
        return getDataSource().getConnection();
    }
}
