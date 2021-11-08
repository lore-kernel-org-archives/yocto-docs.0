Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3A7C433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 09:18:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.42594.1636363096314393205
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Nov 2021 01:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 560BC1C000C;
	Mon,  8 Nov 2021 09:18:14 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: replace Container Layer example
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <16B4B6058A93F2E8.453@lists.yoctoproject.org>
 <20211105173318.33423-1-michael.opdenacker@bootlin.com>
 <38c3b079-662-2ac1-aa58-c91258e9a73d@crashcourse.ca>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <dcd37c10-f376-28be-7bcc-e7c20c054b9f@bootlin.com>
Date: Mon, 8 Nov 2021 10:18:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <38c3b079-662-2ac1-aa58-c91258e9a73d@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Nov 2021 09:18:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2104

Hi Robert,

On 11/6/21 11:05 AM, Robert P. J. Day wrote:
> On Fri, 5 Nov 2021, Michael Opdenacker wrote:
>
>> meta-openembedded is not a layer by itself, at least
>> according to the manual that specifies that a layer must
>> have a conf/layer.conf file.
>>
>> Use "meta-security" as a better example which is
>> consistent with this requirement for a layer.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
>> ---
>>  documentation/ref-manual/terms.rst | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
>> index eccae91a1c..d6f2162c4a 100644
>> --- a/documentation/ref-manual/terms.rst
>> +++ b/documentation/ref-manual/terms.rst
>> @@ -134,10 +134,9 @@ universal, the list includes them just in case:
>>        the Texas Instruments ARM Cortex-A8 development board).
>>
>>     :term:`Container Layer`
>> -      Layers that hold other layers. An example of a container layer is
>> -      OpenEmbedded's `meta-openembedded
>> -      <https://github.com/openembedded/meta-openembedded>`_ layer. The
>> -      ``meta-openembedded`` layer contains many ``meta-*`` layers.
>> +      A layer that holds other layers. An example of a container layer is
>> +      :yocto_git:`meta-security </meta-security/>`. This layer contains
>> +      many ``meta-*`` layers.
>   being a little more verbose, how about
>
> "A 'container layer' is an OE-compatible layer (in the sense that it
> would have a `conf/layer.conf` file identifying it as a layer, as well
> possible classes and recipes directories) that contains subdirectories
> that are OE-compatible layers in their own right. One example of this
> is OE's meta-security layer, which further contains subdirectories
> that are also layers, such as meta-hardening, meta-integrity and so
> on.
>
> This is in contrast to the well-known meta-openembedded checkout
> which, while it contains numerous OE layers as subdirectories, is not
> itself an actual layer."
>
>
>
>   you know what ... maybe i'm overthinking this. maybe we should just
> allow that a "container layer" is any checkout that contains valid
> sub-layers, regardless of whether the top level is a valid layer or
> not, so that both meta-openembedded and meta-security would qualify.
> it's not like the semantic difference makes any *actual* difference,
> so who cares?
>
>   thoughts? if this works, i can put together a patch.

Thanks for the proposed text. It sounds good to me to clarify that a
Container Layer sticks to the definition of a layer, but let's see what
others think.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


