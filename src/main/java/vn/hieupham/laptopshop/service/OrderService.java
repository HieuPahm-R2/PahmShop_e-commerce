package vn.hieupham.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.hieupham.laptopshop.domain.Order;
import vn.hieupham.laptopshop.domain.OrderDetail;

import vn.hieupham.laptopshop.repository.OrderDetailRepository;
import vn.hieupham.laptopshop.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository,  OrderDetailRepository orderDetailRepository){
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<Order> fetchOrders(){
        return this.orderRepository.findAll();
    }
    public Optional<Order> fetchOrderById(long id){
        return this.orderRepository.findById(id);
    }
    //remove
    public void deleteOrderById(long id){
        //delete order detail first
        Optional<Order> orderOptional = this.fetchOrderById(id);
        if(orderOptional.isPresent()){
            Order order = orderOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDatails();
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
        }
        this.orderRepository.deleteById(id);
    }
    //update
    // public void updateOrder(Order order){
    //     Order orderOptional =  this.fetchOrderById(order.getId()).get();
    //     if(orderOptional != null){
            
    //         orderOptional.setStatus(order.getStatus());
    //         this.orderRepository.save(orderOptional);
    //     }
    // }
    public Order createOrder(Order order){
        Order luu = this.orderRepository.save(order);
        return luu;
    }
}
