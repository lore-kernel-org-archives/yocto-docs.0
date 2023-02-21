Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215D1C6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 12:57:57 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.41040.1676984270498244522
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 04:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QH3I7K+y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5C20C240007;
	Tue, 21 Feb 2023 12:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676984268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/2qig4K1Cx111C/Zmw/hPzuXtnXgE3NC0vsr12fM5w=;
	b=QH3I7K+yUA+TvUzbfbKyn6oyxLyUIwhVSBeKjVeJ+Ev7tEniZQDGYdW/Re9aLVZiTM2A8k
	Z0raIXEbTVuS9+wgyOYefMeFI4RAZC+6yzUD/wX0jD7VN42pNW9i4+M6e7V7raQZp8xZnu
	4zmEsibKH+QhN0StdvzGVoPUpIAu4PTnpG8s6ChMDCCQ5H7QidxUjRWgxGBVziBBzc2iaV
	UIelC3rk4NpBcUp/qPHp8OItUbKvvfD/hUM6VczzYqac2dEwh2iAlWgeY+33u1OM25zdTW
	B8IIVhbJFdg3ZHrVzaseJ2DuqVXCJEmb2qpkbpFDweEyTJ0tklhuw9AwMKzZKA==
Message-ID: <b827f17a-0d3e-7e49-dca5-cc1b2154f427@bootlin.com>
Date: Tue, 21 Feb 2023 13:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: document COMMERCIAL_[AUDIO|VIDEO]_PLUGINS
 variables
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20230221104436.20516-1-michael.opdenacker@bootlin.com>
 <b218e63b-b446-25d7-165a-b4a9926cc047@theobroma-systems.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <b218e63b-b446-25d7-165a-b4a9926cc047@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Feb 2023 12:57:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3706

Hi Quentin,

Many thanks for the review!

On 21.02.23 at 13:01, Quentin Schulz wrote:
> -``COMMERCIAL_AUDIO_PLUGINS`` and ``COMMERCIAL_VIDEO_PLUGINS`` statements
>> -(along with the enabling :term:`LICENSE_FLAGS_ACCEPTED`) includes the
>> -plugins or components into built images, thus adding support for media
>> -formats or components.
>> +:term:`COMMERCIAL_AUDIO_PLUGINS` and 
>> :term:`COMMERCIAL_VIDEO_PLUGINS` statements
>> +(along with the enabling :term:`LICENSE_FLAGS_ACCEPTED`) includes 
>> the plugins or
>
> s/with the/with/ or s/with the enabling/with the enabling of/
>
> as "along with the enabling <smth>" feels wrong to me.


Right. I'll fix this. There were a few style issues in the existing 
text. I'll double check in other places.

>
>> +components into built images, thus adding support for media formats or
>> +components.
>> +
>> +.. note::
>> +
>> +   GStreamer "ugly" and "bad" plugins are actually available through
>> +   open source licenses. However, the "ugly" ones can be subject to 
>> software
>> +   patents in some countries, making it necessary to pay licensing fees
>> +   to distribute them. The "bad" ones are just unreliable and therefore
>
> s/are just unreliable/are deemed unreliable/
>
> Also mention that this isn't a choice of Yocto but rather gstreamer 
> community's?


Right, this makes sense. This was my text this time.

>
>> +   should be used with care.
>>     Maintaining Open Source License Compliance During Your Product's 
>> Lifecycle
>> ==========================================================================
>> diff --git a/documentation/ref-manual/variables.rst 
>> b/documentation/ref-manual/variables.rst
>> index 760c608bde..26215f679f 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -1313,6 +1313,26 @@ system and gives an overview of their function 
>> and contents.
>>         optional at the distribution level, in case the hardware 
>> supports
>>         Bluetooth but you do not ever intend to use it.
>>   +   :term:`COMMERCIAL_AUDIO_PLUGINS`
>> +      This variable is specific to the :yocto_git:`GStreamer recipes
>> + 
>> </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
>> +      It allows to build the GStreamer `"ugly"
>> + 
>> <https://urldefense.com/v3/__https://github.com/GStreamer/gst-plugins-ugly__;!!OOPJP91ZZw!g3-jyo-zyCDgt8PzhEQCODfcdBgZFn81oApK_JDf-SOUZOj7xU1NTcsM3TiT7ijx5ktBKoVFrB10eWRqoTwwCKsmaV88ozoHJZrdCVVHKI1r1avSgpDo$ 
>> >`__  and
>> +      `"bad" 
>> <https://urldefense.com/v3/__https://github.com/GStreamer/gst-plugins-bad__;!!OOPJP91ZZw!g3-jyo-zyCDgt8PzhEQCODfcdBgZFn81oApK_JDf-SOUZOj7xU1NTcsM3TiT7ijx5ktBKoVFrB10eWRqoTwwCKsmaV88ozoHJZrdCVVHKI1r1Wm8oVT2$ 
>> >`__ audio plugins.
>> +
>> +      See the ":ref:`dev-manual/licenses:other variables related to 
>> commercial licenses`"
>> +      section in the Development Tasks Manual for usage details.
>> +
>> +   :term:`COMMERCIAL_VIDEO_PLUGINS`
>> +      This variable is specific to the :yocto_git:`GStreamer recipes
>> + 
>> </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
>> +      It allows to build the GStreamer `"ugly"
>> + 
>> <https://urldefense.com/v3/__https://github.com/GStreamer/gst-plugins-ugly__;!!OOPJP91ZZw!g3-jyo-zyCDgt8PzhEQCODfcdBgZFn81oApK_JDf-SOUZOj7xU1NTcsM3TiT7ijx5ktBKoVFrB10eWRqoTwwCKsmaV88ozoHJZrdCVVHKI1r1avSgpDo$ 
>> >`__  and
>> +      `"bad" 
>> <https://urldefense.com/v3/__https://github.com/GStreamer/gst-plugins-bad__;!!OOPJP91ZZw!g3-jyo-zyCDgt8PzhEQCODfcdBgZFn81oApK_JDf-SOUZOj7xU1NTcsM3TiT7ijx5ktBKoVFrB10eWRqoTwwCKsmaV88ozoHJZrdCVVHKI1r1Wm8oVT2$ 
>> >`__ video plugins.
>> +
>> +      See the ":ref:`dev-manual/licenses:other variables related to 
>> commercial licenses`"
>> +      section in the Development Tasks Manual for usage details.
>> +
>
> Please don't mention where to find the documentation if you link it. 
> It allows to move the source across manuals without having to update 
> the text, only the links.
>
> If you want to point to a specific section of the paragraph about 
> commercial licenses, maybe add a target in there? e.g.
>
> .. _gstreamer-commercial-licenses:


Good idea. We have tons of references like that in the manual, but we 
could gradually update them.

Thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


