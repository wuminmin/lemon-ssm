package com.lssm.controller;

import com.lssm.model.LemonCustomer;
import com.lssm.service.LemonCustomerService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import static java.lang.System.out;

/**
 * Created by Administrator on 2016/6/8.
 */
@Controller
@RequestMapping("/customer")
public class LemonCustomerController {
    @Resource
    LemonCustomerService lemonCustomerService;

    @RequestMapping("index")
    public ModelAndView index(ModelAndView modelAndView, HttpServletRequest request) throws Exception {
        HashMap<String, Object> hashMap = new HashMap<String, Object>();

        String _page = request.getParameter("page");
        String customerName = request.getParameter("customerName");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        String bankCard = request.getParameter("bankCard");
        String idcardNum = request.getParameter("idcardNum");
        String submitTime = request.getParameter("submitTime");

        out.println("电信号码request.getParameter---"+request.getParameter("mobile"));
        out.println("其他号码request.getParameter---"+request.getParameter("password"));

        int page = 1;
        int pageSize = 10;

        if ("".equals(_page) || null == _page)
        {
            _page = "1";
        }

        page = Integer.parseInt(_page);

        hashMap.put("customerName", customerName);
        hashMap.put("mobile", mobile);
        hashMap.put("password",password);
        hashMap.put("bankCard",bankCard);
        hashMap.put("idcardNum",idcardNum);
        hashMap.put("submitTime",submitTime);

        int count = lemonCustomerService.count(hashMap);

        int pages = count%pageSize == 0 ? count/pageSize : count/pageSize + 1;

        if (page >= pages)
        {
            page = pages;
        }

        if (page <= 0)
        {
            page = 1;
        }

        hashMap.put("offset", (page - 1) * pageSize);
        hashMap.put("pageSize", pageSize);


        modelAndView.addObject("customerName", customerName);
        modelAndView.addObject("mobile", mobile);
        modelAndView.addObject("password",password);
        modelAndView.addObject("bankCard",bankCard);
        modelAndView.addObject("idcardNum",idcardNum);
        modelAndView.addObject("submitTime",submitTime);
        modelAndView.addObject("page", page);
        modelAndView.addObject("pages", pages);
        modelAndView.addObject("pageSize", pageSize);

        List<LemonCustomer> customers = lemonCustomerService.findCustomers(hashMap);
        modelAndView.addObject("customers", customers);
        return modelAndView;
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public ModelAndView add(ModelAndView modelAndView)
    {
        return  modelAndView;
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ModelAndView add(ModelAndView modelAndView, LemonCustomer request)
    {
        LemonCustomer record = request;

        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
        Date date = new Date(System.currentTimeMillis());
        String time = format.format(date);
        record.setSubmitTime(time);

        out.println(record.getIdcardNum()+"身份证"+record.getBankCard()+"发展人号码");

        String msg = this.validate(record);
        modelAndView.addObject("customer", record);

        if (msg != null && msg.length() > 0)
        {
            modelAndView.addObject("error", msg);
            return modelAndView;
        }
        int id = lemonCustomerService.add(record);
        return new ModelAndView("redirect: /customer/add");
    }

    @RequestMapping(value = "delete",method = RequestMethod.GET)
    public ModelAndView delete(@Param("id") Integer id,ModelAndView modelAndView){
        LemonCustomer lemonCustomer = new LemonCustomer();
        lemonCustomer.setId(id);
        lemonCustomerService.delete(lemonCustomer);
        return new ModelAndView("redirect:/customer/index");
    }

    @RequestMapping(value = "update", method = RequestMethod.GET)
    public  ModelAndView update(@Param("id") Integer id, ModelAndView modelAndView)
    {
        LemonCustomer customer = lemonCustomerService.findOne(id);
        modelAndView.addObject("customer", customer);
        return  modelAndView;
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public  ModelAndView update(ModelAndView modelAndView, LemonCustomer request)
    {
        LemonCustomer record = request;

        String msg = this.validate(record);
        modelAndView.addObject("customer", record);

        if (msg != null && msg.length() > 0)
        {
            modelAndView.addObject("error", msg);
            return modelAndView;
        }

        int id = lemonCustomerService.update(record);

        return new ModelAndView("redirect: /customer/index");
    }

    private LemonCustomer getRecord(HttpServletRequest request)
    {
        LemonCustomer record = new LemonCustomer();

        String customerName = request.getParameter("customerName");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        int effective = Integer.parseInt(request.getParameter("effective"));
        String id = request.getParameter("id");

        record.setCustomerName(customerName);
        record.setMobile(mobile);
        record.setPassword(password);
        record.setEffective(effective);

        if (id != null)record.setId(Integer.parseInt(id));


        return  record;
    }

    private String validate(LemonCustomer customer)
    {
        String customerName = customer.getCustomerName();
        String mobile = customer.getMobile();
        String password = customer.getPassword();
        String msg = "";
        if (customerName == null || "".equals(customerName))
        {
            msg = "Customer ";
        }

        if (mobile == null || "".equals(mobile))
        {
            msg += "Mobile ";
        }

        if (password == null || "".equals(password))
        {
            msg += "Password ";
        }

        if (msg != "")
        {
            return msg + "can't be null!";
        } else
        {
            return msg;
        }
    }

    @RequestMapping("changeStatus")
    @ResponseBody
    public HashMap<String, Object> changeStatus(HttpServletRequest request)
    {
        int id = Integer.parseInt(request.getParameter("id"));
        int effective = Integer.parseInt(request.getParameter("effective"));

        LemonCustomer customer = new LemonCustomer();

        customer.setId(id);
        customer.setEffective(effective);

        lemonCustomerService.update(customer);

        HashMap<String, Object> hashMap = new HashMap();
        hashMap.put("status", 1);

        return  hashMap;
    }
}
