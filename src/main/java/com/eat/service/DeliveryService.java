package com.eat.service;

import com.eat.dao.DeliveryDAO;
import com.eat.dao.DeliveryPersonDAO;
import com.eat.model.Delivery;
import com.eat.model.DeliveryPerson;

import java.util.List;

public class DeliveryService {
    private DeliveryDAO deliveryDAO;
    private DeliveryPersonDAO deliveryPersonDAO;

    public DeliveryService() {
        this.deliveryDAO = new DeliveryDAO();
        this.deliveryPersonDAO = new DeliveryPersonDAO();
    }

    public Delivery getDeliveryById(int deliveryId) {
        return deliveryDAO.findById(deliveryId);
    }

    public Delivery getDeliveryByOrderId(int orderId) {
        return deliveryDAO.findByOrderId(orderId);
    }

    public List<Delivery> getAllDeliveries() {
        return deliveryDAO.findAll();
    }

    public List<DeliveryPerson> getAllDeliveryPersons() {
        return deliveryPersonDAO.findAll();
    }

    public List<DeliveryPerson> getAvailableDeliveryPersons() {
        return deliveryPersonDAO.findAvailable();
    }

    public boolean createDeliveryPerson(DeliveryPerson deliveryPerson) {
        return deliveryPersonDAO.create(deliveryPerson);
    }

    public boolean updateDeliveryPerson(DeliveryPerson deliveryPerson) {
        return deliveryPersonDAO.update(deliveryPerson);
    }

    public boolean deleteDeliveryPerson(int deliveryPersonId) {
        return deliveryPersonDAO.delete(deliveryPersonId);
    }

    public boolean assignDeliveryPerson(int orderId, int deliveryPersonId) {
        Delivery delivery = deliveryDAO.findByOrderId(orderId);
        if (delivery == null) {
            delivery = new Delivery();
            delivery.setOrderId(orderId);
            if (!deliveryDAO.create(delivery)) {
                return false;
            }
        }
        return deliveryDAO.assignDeliveryPerson(delivery.getDeliveryId(), deliveryPersonId);
    }

    public boolean updateDeliveryStatus(int deliveryId, String status) {
        return deliveryDAO.updateStatus(deliveryId, status);
    }
}
