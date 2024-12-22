package vn.hieupham.laptopshop.service.validator;

import org.springframework.stereotype.Service;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import vn.hieupham.laptopshop.domain.dto.RegisterDTO;
import vn.hieupham.laptopshop.service.UserService;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {
    private final UserService userService;

    public RegisterValidator(UserService userService){
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context){
        boolean valid = true;
        //check if password matches
        if(!user.getPassword().equals(user.getConfirmPassword())){
            context.buildConstraintViolationWithTemplate("ERROR, Not matches").addPropertyNode("confirmPassword")
            .addConstraintViolation().disableDefaultConstraintViolation();
            valid = false;
        }
        //check email if if exist ..
        if(this.userService.checkEmailExist(user.getEmail())){
            context.buildConstraintViolationWithTemplate("Email has existed, try another").addPropertyNode("email")
            .addConstraintViolation().disableDefaultConstraintViolation();
            valid = false;
        }
        return valid;
    }
}
