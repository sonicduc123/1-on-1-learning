String? validate_input(String? value, String? type) {
  if (value == null || value.isEmpty) {
    return 'Please enter your $type';
  }
  switch (type) {
    case 'Email':
      if (!value.contains('.@')) {
        return 'This is not true type of email';
      }
      break;
    case 'Password':
      if (value.length < 6) {
        return 'Your password must be has at least 6 character';
      }
      break;
    default:
  }
  return null;
}
