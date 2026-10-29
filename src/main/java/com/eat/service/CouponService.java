package com.eat.service;

import com.eat.dao.CouponDAO;
import com.eat.model.Coupon;

import java.util.List;

public class CouponService {
    private CouponDAO couponDAO;

    public CouponService() {
        this.couponDAO = new CouponDAO();
    }

    public boolean addCoupon(Coupon coupon) {
        return couponDAO.create(coupon);
    }

    public Coupon getCouponById(int couponId) {
        return couponDAO.findById(couponId);
    }

    public Coupon getCouponByCode(String code) {
        return couponDAO.findByCode(code);
    }

    public List<Coupon> getAllActiveCoupons() {
        return couponDAO.findAllActive();
    }

    public List<Coupon> getAllCoupons() {
        return couponDAO.findAll();
    }

    public boolean updateCoupon(Coupon coupon) {
        return couponDAO.update(coupon);
    }

    public boolean incrementCouponUsage(int couponId) {
        return couponDAO.incrementUsedCount(couponId);
    }

    public boolean deleteCoupon(int couponId) {
        return couponDAO.delete(couponId);
    }

    public double calculateDiscount(Coupon coupon, double orderAmount) {
        if (coupon == null || orderAmount < coupon.getMinimumOrderAmount()) {
            return 0.0;
        }

        double discount = 0.0;
        if ("percentage".equalsIgnoreCase(coupon.getDiscountType())) {
            discount = orderAmount * (coupon.getDiscountValue() / 100.0);
            if (coupon.getMaxDiscountAmount() != null && discount > coupon.getMaxDiscountAmount()) {
                discount = coupon.getMaxDiscountAmount();
            }
        } else if ("flat".equalsIgnoreCase(coupon.getDiscountType())) {
            discount = coupon.getDiscountValue();
        }

        return discount;
    }
}
