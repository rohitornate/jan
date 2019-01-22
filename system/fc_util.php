<?php

class FCUtility
{

    public static function encrypt($string, $secretKey)
    {
        $plaintext = FCUtility::pkcs5_pad($string, 16);
        $key = substr($secretKey, 0, 16);
        return bin2hex(mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, $plaintext, MCRYPT_MODE_ECB));
    }

    public static function decrypt($string, $secretKey)
    {
        $key = substr($secretKey, 0, 16);
        $decrypted = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, hex2bin($string), MCRYPT_MODE_ECB);
        $padSize = ord(substr($decrypted, -1));
        return substr($decrypted, 0, $padSize * -1);
    }

    public static function pkcs5_pad($text, $blocksize)
    {
        $pad = $blocksize - (strlen($text) % $blocksize);
        return $text . str_repeat(chr($pad), $pad);
    }

    public static function generateChecksumForJson($json_decode, $merchantKey)
    {

        // Remove null and empty values from the json and sort keys in alphabetical order
        $sanitizedInput = FCUtility::sanitizeInput($json_decode, $merchantKey);

        // Append merchant Key
        $serializedObj = $sanitizedInput . $merchantKey;
        error_log(print_r($serializedObj, TRUE));
        // Calculate Checksum for the serialized string
        return FCUtility::calculateChecksum($serializedObj);
    }

    private static function calculateChecksum($serializedObj)
    {
        // Use 'sha-265' for hashing
        $checksum = hash("sha256", $serializedObj, false);
        return $checksum;
    }

    private static function recur_ksort(&$array)
    {
        // Sort json object keys alphabetically recursively
        foreach ($array as &$value) {
            if (is_array($value))
                FCUtility::recur_ksort($value);
        }
        return ksort($array);
    }

    private static function sanitizeInput(array $json_decode, $merchantKey)
    {
        $reqWithoutNull = array_filter($json_decode, function ($k) {

            if (is_null($k)) {
                return false;
            }
            if (is_array($k)) {
                return true;
            }

            return !(trim($k) == "");
        });

        FCUtility::recur_ksort($reqWithoutNull);
        $flags = JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE;
        return json_encode($reqWithoutNull, $flags);
    }
}