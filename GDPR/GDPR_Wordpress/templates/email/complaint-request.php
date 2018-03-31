<?php
  $confirm_url = add_query_arg(
    array(
      'type' => 'complaint',
      'key' => $args['key'],
      'email' => $args['user']->user_email,
      'data' => $args['data'],
    ),
    home_url()
  );
  $forgot_password_url = add_query_arg(
    array(
      'action' => 'rp',
      'key' => get_password_reset_key( $args['user'] ),
      'login' => $args['user']->user_login,
    ),
    wp_login_url()
  );

echo sprintf(
  esc_html__(
'Someone placed a complaint on your behalf on our site.
By clicking confirm a request will be made and we will do our best to fulfil it.

--------------------------------------------------------
Request
--------------------------------------------------------
%s




To confirm this request, click here: %s



---------------------------------------------------------------------------------
If that wasn\'t you, reset your password: %s
', 'gdpr' ),
  esc_html( $args['data'] ),
  esc_url_raw( $confirm_url ),
  esc_url_raw( $forgot_password_url )
);
