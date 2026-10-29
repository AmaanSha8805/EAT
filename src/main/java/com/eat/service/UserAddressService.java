package com.eat.service;

import com.eat.dao.UserAddressDAO;
import com.eat.model.UserAddress;

import java.util.List;

public class UserAddressService {
    private UserAddressDAO userAddressDAO;

    public UserAddressService() {
        this.userAddressDAO = new UserAddressDAO();
    }

    public boolean addAddress(UserAddress address) {
        return userAddressDAO.create(address);
    }

    public UserAddress getAddressById(int addressId) {
        return userAddressDAO.findById(addressId);
    }

    public List<UserAddress> getUserAddresses(int userId) {
        return userAddressDAO.findByUserId(userId);
    }

    public UserAddress getDefaultAddress(int userId) {
        return userAddressDAO.findDefaultByUserId(userId);
    }

    public boolean updateAddress(UserAddress address) {
        return userAddressDAO.update(address);
    }

    public boolean setDefaultAddress(int userId, int addressId) {
        return userAddressDAO.setDefault(userId, addressId);
    }

    public boolean deleteAddress(int addressId) {
        return userAddressDAO.delete(addressId);
    }
}
