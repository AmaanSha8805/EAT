package com.eat.servlet.admin;

import com.eat.model.Delivery;
import com.eat.model.DeliveryPerson;
import com.eat.service.DeliveryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/delivery")
public class AdminDeliveryServlet extends HttpServlet {
    private DeliveryService deliveryService;

    @Override
    public void init() {
        deliveryService = new DeliveryService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<DeliveryPerson> deliveryPersons = deliveryService.getAllDeliveryPersons();
        List<Delivery> deliveries = deliveryService.getAllDeliveries();
        
        request.setAttribute("deliveryPersons", deliveryPersons);
        request.setAttribute("deliveries", deliveries);
        request.getRequestDispatcher("/WEB-INF/jsp/admin/delivery.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("addPerson".equals(action)) {
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String vehicleNumber = request.getParameter("vehicleNumber");
            
            DeliveryPerson deliveryPerson = new DeliveryPerson();
            deliveryPerson.setName(name);
            deliveryPerson.setPhone(phone);
            deliveryPerson.setVehicleNumber(vehicleNumber);
            deliveryPerson.setAvailable(true);
            
            deliveryService.createDeliveryPerson(deliveryPerson);
        } else if ("assign".equals(action)) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            int deliveryPersonId = Integer.parseInt(request.getParameter("deliveryPersonId"));
            
            deliveryService.assignDeliveryPerson(orderId, deliveryPersonId);
        } else if ("updateStatus".equals(action)) {
            int deliveryId = Integer.parseInt(request.getParameter("deliveryId"));
            String status = request.getParameter("status");
            
            deliveryService.updateDeliveryStatus(deliveryId, status);
        }
        
        response.sendRedirect(request.getContextPath() + "/admin/delivery");
    }
}
