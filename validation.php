<?php
/**
 * The MIT License (MIT)
 *
 * Copyright (c) 2016 Smartex.io Ltd.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

/**
 * @deprecated 1.5.0 This file is deprecated, use moduleFrontController instead
 */

include(dirname(__FILE__).'/../../config/config.inc.php');
include(dirname(__FILE__).'/../../header.php');
include(dirname(__FILE__).'/smartex.php');

$context  = Context::getContext();
$cart     = $context->cart;

$smartex   = new smartex();

if ($cart->id_customer == 0 OR $cart->id_address_delivery == 0 OR $cart->id_address_invoice == 0 OR !$smartex->active)
        Tools::redirect('index.php?controller=order&step=1');

// Check that this payment option is still available in case the customer
// changed his address just before the end of the checkout process
$authorized = false;

foreach (Module::getPaymentModules() as $module)
        if ($module['name'] == 'smartex') {
                $authorized = true;
                break;
        }

if (!$authorized)
        die($smartex->l('This payment method is not available.', 'validation'));

echo $smartex->execPayment($cart);

include_once(dirname(__FILE__).'/../../footer.php');

