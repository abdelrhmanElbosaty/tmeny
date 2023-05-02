const registerAsTouristMutation = r"""
 mutation registerAsTourist(
  $input : RegisterInput!
) {
  registerAsTourist(
    input: $input
  ) {
    message
    data 
    code
    success
    message
  }
}
""";

const resendEmailVerificationCodeMutation = r"""
mutation resendEmailVerificationCode($input : SendEmailVerificationCodeInput!) {
  resendEmailVerificationCode(
    input: $input
  ) {
    message
    code
    data
  }
}
""";

const verifyTouristOtbByEmailMutation = r"""
mutation verifyTouristByEmail($input : VerifyUserByEmailInput!) {
  verifyTouristByEmail(
    input: $input
  ) {
    data {
      id
      token 
      isCompletedRegister
    }
    message
    code
    success
  }
}
""";

const emailAndPasswordLoginMutation = r"""
mutation emailAndPasswordLogin($input: EmailAndPasswordLoginInput!) {
  emailAndPasswordLogin(input: $input) {
    message
    data {
      id
      email
      token
      isCompletedRegister
    }
    code
    success
    message
  }
}
""";

const forgetPasswordMutation = r"""
mutation forgetPassword($input : ForgetPasswordInput!) {
  forgetPassword(input: $input) {
    data
    code
    success
    message
  }
}
""";

const verifyForgetPasswordCodeMutation = r"""
mutation verifyForgetPasswordCode($input: VerifyForgetPasswordCodeInput!) {
  verifyForgetPasswordCode(
    input: $input
  ) {
    data
    code
    success
    message
  }
}
""";

const resetPasswordMutation = r"""
mutation resetPassword ($input : ResetPasswordInput!) {
  resetPassword(
    input: $input
  ) {
    code
    message
    data {
      id
      token
      firstName
      lastName
      fullName
      isCompletedRegister
    }
  }
}
""";


const socialLoginOrRegisterMutation = r"""
mutation socialLoginOrRegister($input: RegisterOrLoginBySocialAccountInput!) {
  socialLoginOrRegister(input: $input) {
    data{
      id
      token
      isCompletedRegister
    }
    code
    success
    message
  }
}
""";


