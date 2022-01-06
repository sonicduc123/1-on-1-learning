String? validate_input(String? value, String? type) {
  if (value == null || value.isEmpty) {
    return 'Please enter your $type';
  }
  switch (type) {
    case 'Email':
      if (!value.contains('@')) {
        return 'Your email is missing "@" character';
      }
      if (!value.contains('.')) {
        return 'Your email is missing "." character';
      }
      break;
    case 'Password': case 'Confirm password':
      if (value.length < 6) {
        return 'Your password must be has at least 6 character';
      }
      break;
    default:
  }
  return null;
}
