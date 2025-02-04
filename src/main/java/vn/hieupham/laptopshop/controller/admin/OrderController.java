package vn.hieupham.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import vn.hieupham.laptopshop.domain.Order;
import vn.hieupham.laptopshop.service.OrderService;



@Controller
public class OrderController {
    //DI
    private final OrderService orderService;
    public OrderController(OrderService orderService){
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getOrders(Model model){
        List<Order> ors = this.orderService.fetchOrders();
        model.addAttribute("orders", ors);
        return "admin/order/show";
    }
    //View Detail
    @GetMapping("/admin/order/{id}")
    public String getDetailOrderPage( Model model, @PathVariable long id){
        Order order = this.orderService.fetchOrderById(id).get();
        model.addAttribute("order", order);
        model.addAttribute("id", id);
        model.addAttribute("orderDetails", order.getOrderDatails());
        return "admin/order/detail";
    }
    //Delete
    @GetMapping("admin/order/delete/{id}")
    public String getDeletePage(@PathVariable long id, Model model){
        model.addAttribute("id", id);
        model.addAttribute("newOrder", new Order());
        return "admin/order/delete";
    }
    @PostMapping("admin/order/delete")
    public String postDeletePage(@ModelAttribute("newOrder") Order order){
        this.orderService.deleteOrderById(order.getId());
        return "redirect:/admin/order";
    }
    //Update
    @GetMapping("admin/order/update/{id}")
    public String getUpdatePage(@PathVariable long id, Model model){
        Optional<Order> currentOrder = this.orderService.fetchOrderById(id);
        model.addAttribute("newOrder", currentOrder.get());
        return "admin/order/update";
    }
    @PostMapping("admin/order/update")
    public String handleUpdatePage(@ModelAttribute("newOrder") Order order){
        // this.orderService.updateOrder(order);
        Order orderOptional =  this.orderService.fetchOrderById(order.getId()).get();
        if(orderOptional != null){
            
            orderOptional.setStatus(order.getStatus());
            this.orderService.createOrder(orderOptional);
        }
        return "redirect:/admin/order";
    }
}
