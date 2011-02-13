<?php
// Thanks to http://blog.kevburnsjr.com/php-unique-hash
class PseudoCryptComponent extends Object {

  private static $golden_primes = array(
    36 => array(1,29,811,28843,1038077,37370269 /*,1345328837*/)
  );

  public static function udihash($num, $len = 5, $base = 36) {
    $gp = self::$golden_primes[$base];
    $maxlen = count($gp);
    $len = $len > ($maxlen-1) ? ($maxlen-1) : $len;
    while($len < $maxlen && pow($base,$len) < $num) $len++;
    if($len >= $maxlen) throw new Exception($num." out of range (max ".pow($bas$
    $ceil = pow($base,$len);
    $prime = $gp[$len];
    $dechash = ($num * $prime) % $ceil;
    $hash = base_convert($dechash, 10, $base);
    return str_pad($hash, $len, "0", STR_PAD_LEFT);
  }

}
?>