Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9327C64EC4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 10:00:48 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.6656.1676541646337596531
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 02:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RwltYT9G;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A92F224000D;
	Thu, 16 Feb 2023 10:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676541644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YG53N1OYvHyxjQvsyaQot74DXMez8JET81mRM+a8yT4=;
	b=RwltYT9G7ImwnUzYVMJUNkF9XY+ZyyfOOQKNnaA9dXke6RB1AEe/EXhu3Tm1NwQZnwWC/f
	zn4lUgRCiHOw4Q0d9/MpaguuryUthzygvzqujL9EanxlRoYoWMqzvxLC57YrxOdlasqaxu
	Pdz0pgbhlEs/V/yFqkMLd1aYX/TtepWPmCvIb83+Hz9a9Rm32IppJ8Sbl7A0Uyi/EGzuEa
	k/Lz81TXLvOjkOBqbr2OTiOup7aR+OIyq+iwBn6rwkRj1GVNqIYYHgRAJ8DAuga0KCEHDh
	07H9rHt5EjAG7dy9/QIBo287TyvOtPI1Z7cWNoor9GpOridh194xwIHlVBGeeg==
Message-ID: <37886a31-5eea-278d-7558-fcaa631384bc@bootlin.com>
Date: Thu, 16 Feb 2023 11:00:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: classes.rst: improvements to cmake
 class documentation
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com
References: <20230215105907.114700-1-michael.opdenacker@bootlin.com>
 <20d3b32d-e5b1-f39b-81da-47ce782726aa@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20d3b32d-e5b1-f39b-81da-47ce782726aa@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Feb 2023 10:00:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3692

Hi Quentin,

On 16.02.23 at 10:32, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Michael,
>
> On 2/15/23 11:59, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> - Fix quoting for path to cmake modules
>> - Document OECMAKE_GENERATOR variable
>> - Style simplifications
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   documentation/ref-manual/classes.rst   | 25 ++++++++++++++-----------
>>   documentation/ref-manual/variables.rst | 10 ++++++++++
>>   2 files changed, 24 insertions(+), 11 deletions(-)
>>
>> diff --git a/documentation/ref-manual/classes.rst 
>> b/documentation/ref-manual/classes.rst
>> index b5443c0d0a..3beccb4855 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -346,17 +346,20 @@ in order to make them relocatable.
>>   ``cmake``
>>   =========
>>   -The ref:`ref-classes-cmake` class allows for recipes that need to 
>> build software using
>> -the `CMake 
>> <https://urldefense.com/v3/__https://cmake.org/overview/__;!!OOPJP91ZZw!iNA2vN8toaxYO2TbPOrNnBcNXS6SmFZYJDid21JEAzDilDFda1et7uKBF9xjIdOmh6u-9K0NW4WLqOXZPtlcj7xyFOiYeZ0ClIsmkLl9Ecg3LmpEaTDt$ 
>> >`__ build system. You can use
>> -the :term:`EXTRA_OECMAKE` variable to specify
>> -additional configuration options to be passed using the ``cmake``
>> -command line.
>> -
>> -On the occasion that you would be installing custom CMake toolchain
>> -files supplied by the application being built, you should install them
>> -to the preferred CMake Module directory: ``${D}${datadir}/cmake/``
>> -Modules during
>> -:ref:`ref-tasks-install`.
>> +The :ref:`ref-classes-cmake` class allows recipes to build software 
>> using the
>> +`CMake 
>> <https://urldefense.com/v3/__https://cmake.org/overview/__;!!OOPJP91ZZw!iNA2vN8toaxYO2TbPOrNnBcNXS6SmFZYJDid21JEAzDilDFda1et7uKBF9xjIdOmh6u-9K0NW4WLqOXZPtlcj7xyFOiYeZ0ClIsmkLl9Ecg3LmpEaTDt$ 
>> >`__ build system. You can use the
>> +:term:`EXTRA_OECMAKE` variable to specify additional configuration 
>> options to
>> +pass to the ``cmake`` command line.
>> +
>> +By default, the :ref:`ref-classes-cmake` class uses
>> +`Ninja 
>> <https://urldefense.com/v3/__https://ninja-build.org/__;!!OOPJP91ZZw!iNA2vN8toaxYO2TbPOrNnBcNXS6SmFZYJDid21JEAzDilDFda1et7uKBF9xjIdOmh6u-9K0NW4WLqOXZPtlcj7xyFOiYeZ0ClIsmkLl9Ecg3LqOSrdIo$ 
>> >`__ instead of GNU make for building, which
>> +offers better build performance. If a recipe is broken with Ninja, 
>> then the
>> +recipe can set the :term:`OECMAKE_GENERATOR` variable to ``Unix 
>> Makefiles`` to
>> +use GNU make instead.
>> +
>> +If you need to instal custom CMake toolchain files supplied by the 
>> application
>
> s/instal/install/
>
> Rest is fine, so
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>


Thanks for the review. Fixed.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


