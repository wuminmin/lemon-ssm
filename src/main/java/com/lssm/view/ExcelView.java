package com.lssm.view;

import com.lssm.model.LemonCustomer;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

/**
 * Created by wuminmin on 2017/5/10.
 */
public class ExcelView extends AbstractExcelView {
    @Override
    protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook hssfWorkbook, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {

        List<LemonCustomer> list = (List<LemonCustomer>) map.get("infoList");
        if(list != null && list.size() != 0){
            int len = list.size();
            Sheet sheet = hssfWorkbook.createSheet();
            Row row = sheet.createRow(0);
            Cell cell = row.createCell(0,Cell.CELL_TYPE_STRING);
            cell.setCellValue("客户名字");
            cell = row.createCell(1,Cell.CELL_TYPE_STRING);
            cell.setCellValue("电信号码");
            cell = row.createCell(2,Cell.CELL_TYPE_STRING);
            cell.setCellValue("其他号码");
            cell = row.createCell(3,Cell.CELL_TYPE_STRING);
            cell.setCellValue("身份证号");
            cell = row.createCell(4,Cell.CELL_TYPE_STRING);
            cell.setCellValue("登记人号码");
            cell = row.createCell(5,Cell.CELL_TYPE_STRING);
            cell.setCellValue("操作时间");

            for(int i=0 ;i<len;i++){
                row = sheet.createRow(i+1);
                cell = row.createCell(0,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getCustomerName());
                cell = row.createCell(1,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getMobile());
                cell = row.createCell(2,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getPassword());
                cell = row.createCell(3,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getIdcardNum());
                cell = row.createCell(4,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getBankCard());
                cell = row.createCell(5,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getSubmitTime());
            }
        }

        httpServletResponse.setContentType("application/vnd.ms-excel");
        httpServletResponse.setCharacterEncoding("utf-8");
        String filename = URLEncoder.encode("客户资料.xls","utf-8");
        httpServletResponse.setHeader("Content-disposition","attachment;filename=" +filename);
        OutputStream outputStream = httpServletResponse.getOutputStream();
        hssfWorkbook.write(outputStream);
        outputStream.flush();
        outputStream.close();
    }
}
