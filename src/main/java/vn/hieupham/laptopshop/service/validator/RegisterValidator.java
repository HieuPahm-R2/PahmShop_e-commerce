package vn.hieupham.laptopshop.service.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import vn.hieupham.laptopshop.domain.dto.RegisterDTO;

public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {
    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context){
        boolean valid = true;
        //check if password matches
        if(!user.getPassword().equals(user.getConfirmPassword())){
            context.buildConstraintViolationWithTemplate("ERROR, Not matches").addPropertyNode("confirmPassword")
            .addConstraintViolation().disableDefaultConstraintViolation();
            valid = false;
        }
        return valid;
    }
}
