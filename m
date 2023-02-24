Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC92AC61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 15:40:50 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.20719.1677253241203541150
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 07:40:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fxW0qL/9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id ED0FE40003;
	Fri, 24 Feb 2023 15:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677253239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7VxxrxFShuTk/Q2eiRP8P5RhB8/7UHYZbKY5PxzN/sk=;
	b=fxW0qL/9vyNRMhSulwoQvWI3vftu7rQCWjWfWXs2sg2qqDxIPl2DBfBW/FViz6NQEEnGdZ
	f996BsY3i0DyMau0wQkRwfQeoRxo5g8/YGnJNvgukjhOvhTgjgsQQJkUBcqRQd1BdwHSx9
	rqQWojtS5pn2bpD2vqweGaejW6y1lLkR6HY89KOdZYaVaBc4yFokHyb7akXfCLjxT8wprV
	nI1IBqTyRgWC5L5y7/HMxuvjCN6Zt5yF9VekIdrxBpHf5HefkZ2/PxKljCEStg6mEJAHyr
	cJjUlycdwyvj9u2ZjTN/8Kdg0uvORoj44+r3TuFfPRl8jBzTngbtHy2dm65FdA==
Message-ID: <fb44c3c9-43d4-1e41-8f62-d4575543211b@bootlin.com>
Date: Fri, 24 Feb 2023 16:40:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/2] dev-manual: new-recipe.rst: add Meson example
 recipe
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com
References: <20230223153729.2492175-1-michael.opdenacker@bootlin.com>
 <8768bbd9-b871-b8ef-07fc-b52548533532@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <8768bbd9-b871-b8ef-07fc-b52548533532@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Feb 2023 15:40:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3739

Hi Quentin

Thanks for this new review!

On 24.02.23 at 11:17, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Michael,
>
> On 2/23/23 16:37, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   documentation/dev-manual/new-recipe.rst | 31 +++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/documentation/dev-manual/new-recipe.rst 
>> b/documentation/dev-manual/new-recipe.rst
>> index 143c8b9c3b..9f00ac198f 100644
>> --- a/documentation/dev-manual/new-recipe.rst
>> +++ b/documentation/dev-manual/new-recipe.rst
>> @@ -1173,6 +1173,8 @@ recipe examples given various scenarios:
>>     -  Building an Autotooled package
>>   +-  Building a Meson package
>> +
>>   -  Splitting an application into multiple packages
>>     -  Adding binaries to an image
>> @@ -1288,6 +1290,35 @@ as described in the 
>> ":ref:`dev-manual/licenses:tracking license changes`"
>>   section in the Yocto Project Overview and Concepts Manual. You can 
>> quickly
>>   create Autotool-based recipes in a manner similar to the previous 
>> example.
>>   +Building a Meson Package
>> +------------------------
>> +
>> +Applications built with the `Meson build system 
>> <https://urldefense.com/v3/__https://mesonbuild.com/__;!!OOPJP91ZZw!hLxKIQgq28T7YW2MJN7MXVRoRC3TFLq8G2weHzeanzmiYu9JQS0ZsNUDJUCUDpFE9WGcl43l7VZrhhYZGJEczHo866O_aElqIP4L9UTg9UqYB2ZrNqD_$ 
>> >`__
>> +just need a recipe that has sources described in :term:`SRC_URI` and 
>> inherits
>> +the :ref:`ref-classes-meson` class.
>> +
>> +The :oe_git:`ipcalc recipe 
>> </meta-openembedded/tree/meta-networking/recipes-support/ipcalc>`
>> +is a simple example of an application without dependencies::
>> +
>> +   SUMMARY = "Tool to assist in network address calculations for 
>> IPv4 and IPv6."
>> +   HOMEPAGE = 
>> "https://urldefense.com/v3/__https://gitlab.com/ipcalc/ipcalc__;!!OOPJP91ZZw!hLxKIQgq28T7YW2MJN7MXVRoRC3TFLq8G2weHzeanzmiYu9JQS0ZsNUDJUCUDpFE9WGcl43l7VZrhhYZGJEczHo866O_aElqIP4L9UTg9UqYB5zP6znR$ 
>> "
>> +
>> +   SECTION = "net"
>> +
>> +   LICENSE = "GPL-2.0-only"
>> +   LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +   SRC_URI = 
>> "git://gitlab.com/ipcalc/ipcalc.git;protocol=https;branch=master"
>> +   SRCREV = "4c4261a47f355946ee74013d4f5d0494487cc2d6"
>> +
>> +   S = "${WORKDIR}/git"
>> +
>> +   inherit meson
>> +
>> +Applications with dependencies are likely to inherit the
>> +:ref:`ref-classes-pkgconfig` class, as ``pkg-config`` it is the 
>> default method
>
> s/it//


Oops, good catch. Fixed.

>
>> +that Meson uses to find dependencies and compile applications 
>> against them.
>> +
>
> I would suggest:
> s/that Meson uses to find/used by Meson to find/
> but that's a matter of personal taste.


This suits my personal taste too ;-)
Accepted.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


