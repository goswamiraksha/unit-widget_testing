import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_testing_demo/core/utils/common_utils.dart';
class MockCommonUtils extends Mock implements CommonUtils{}
void main() {
  setUp((){});
  tearDown(() => null);
  test('empty email test', () {
    expect(CommonUtils.isValidateEmail(''), 'Please type your email.',);
  });
  test('invalid email test', () {
    expect(CommonUtils.isValidateEmail('unittestinggmail.com'), 'Please enter a valid email',);
  });
  test('empty password test', () {
    expect(CommonUtils.isPasswordValid(''), 'Please type your password.');
  });
  test('invalid password test', () {
    expect(CommonUtils.isPasswordValid('tyughhg'), 'Your password must be at least 8 alphanumeric length.');
  });
  test('invalid login test',()
  {
    expect(CommonUtils.validateAndSignIn('unittestingggmail.com','1324'), 'please enter email and password in valid format');
  }
  );
  test(
      'valid login test', (){
    expect(CommonUtils.validateAndSignIn('unittesting@gmail.com', '12345678'), 'Log In Success');
  });
  test(
      'invalid email login test', (){
    expect(CommonUtils.validateAndSignIn('unittestinggmail.com', '12345678'), 'please enter email in valid format');
  });
  test('match confirm password test', () {
    expect(CommonUtils.validateConfirmPassword('12345678', '12345678'), 'Password Match');
  });

  test(
      'clashing confirm password test', (){
    expect( CommonUtils.validateConfirmPassword('12345677', '12345678'), 'Password not match');
  });

  test(
      'unconventional confirm password test', (){
    expect(CommonUtils.validateConfirmPassword('12378', '12478'), 'password not matched and less than 8 alphanumeric length');
  });
  test(
      'short confirm password test', (){
    expect(CommonUtils.validateConfirmPassword('12345', '12345'), 'Your password must be at least 8 alphanumeric length.');
  });}