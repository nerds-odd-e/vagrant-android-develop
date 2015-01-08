<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wordpress');

/** MySQL database password */
define('DB_PASSWORD', 'wordpress');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'q(dMJ&|hlU`-d14PE3Qr2lrcBLedq<{%f*!7_84ls`m)w[>$Xe]WY4?V=bQU>Hx0');
define('SECURE_AUTH_KEY',  'm,IL14;A?v_YmL?`Si-qQLUJyw!k6SXN<{n[]P.m,UdPP6fmmIFe$:#.I)sy24{3');
define('LOGGED_IN_KEY',    'zy)^M5h[h|*Fojn3T$D_I|cDO3n]8zGYHW}Z  =N9b+;nsSE>ur[8k}qjop9A,5^');
define('NONCE_KEY',        'zq]1ct9Sx~{3K42{tlPBbw[N6I2:?L$k544<GYhhHM|67]S@wM`;1cJh@G)cu#zz');
define('AUTH_SALT',        'CW]c~n|K%)f(P_-j3PRZh9_r]?(SU}/(stCQB#o:8j^/]AYq0?{9!6.xK1 ;[l{6');
define('SECURE_AUTH_SALT', 'R{:V(w2332p~XM9d1pE}uS_Trz&CsCQvOQpQrvx18XXxN-c6lQuwf1-BCqT^{)%z');
define('LOGGED_IN_SALT',   'sEhl7N>rW2?7p4STwf-J#+p_w$t&>ITAT_+X>F=4_(<ldKLvE3jb4g}_g/PmPPN$');
define('NONCE_SALT',       '/S/<IJL;/]Fy(R@$e_$|SIuB}]`K#^;RdaO2;nK`f-$R<]u.MFNWOUr17;~r*v=a');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
