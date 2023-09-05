Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A47C83F3E
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 13:34:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.21548.1693920852079295484
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 06:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=o4LulgLD;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-401b393df02so25497005e9.1
        for <docs@lists.yoctoproject.org>; Tue, 05 Sep 2023 06:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1693920850; x=1694525650; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lLYKL4rgp36GRTfILd7vVKYDB//ye97LXhS/TAZsV6k=;
        b=o4LulgLDg2Kvijei05LRFUe5i9vV6L/y4UeoE0tQ4dOfgTZBetr72A/PIaIsOhR//y
         Ee5+rJiGonJZciv1oR6gTYHlF12bC4OqsY7XufQTSgRxgpgXY0uVfn1YDb3K49O453aQ
         RJvFQe2EwpELOj7ySx3oeQfNYnOMjiH6PCY16vaxTghqq9gaFwodW6BIhiyeB6zaERBa
         oe/ZEWI2B9UjiTbMxClstxNCfY2Kc+CsEg5uWmJdbg+EMJimPbmD5NW03ug78f/nD/rD
         f+CIon4lADA7alswKyXiGffepwvpqInIHQ3HnHO8vOy01Iw0uFXZkvQVqVIKXA2yKaEM
         Ys9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693920850; x=1694525650;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLYKL4rgp36GRTfILd7vVKYDB//ye97LXhS/TAZsV6k=;
        b=OhQXMhrvEZHDhXHZ3BL9O/Ar+f0ZifrFYE6dXD21SF5wudNGOGWDtIx3eorxq73XuA
         +1MAQNomtSORe6EN48b23gnsj22USIeYTNwHa9BKu7GPteRmsDNYcjItrxn4qDQoTRPG
         xlZWw37PNAeCiebT9REHAFr6aNef2HJ70Cz77ZgF2m90K9tALedifUTTBhxUY4BoNhPC
         Z/Rq4WmlkHt7CpL9UBcz9x/4ddILG1hoTRqzAF14O+ATxt22G+UVqV0j9qx46hH6IofQ
         jTBy+gosiqRI+eAKZOn9J9VyRCgDZ15TK9ZBonBqWEN0XhAUmkc3uZi60Z60bRUnjTNp
         ib+A==
X-Gm-Message-State: AOJu0YyktnuMF1LHTFv+9hVOmFZZj7V0pWYX3SlW+c12/EPtF56saD/5
	WQB9k8SXSCFyW4Jx0bbksIhbag==
X-Google-Smtp-Source: AGHT+IETifp+HX2ooJt0B3/Aitbj5v0w+JJfsunXnOy3TBrFBk2tygPiryVmF18uK+poOsVTarWomw==
X-Received: by 2002:a05:600c:22ca:b0:3fb:b5dc:dab1 with SMTP id 10-20020a05600c22ca00b003fbb5dcdab1mr9447798wmg.39.1693920850058;
        Tue, 05 Sep 2023 06:34:10 -0700 (PDT)
Received: from [192.168.0.32] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id f23-20020a1c6a17000000b003fc01189b0dsm16758959wmc.42.2023.09.05.06.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 06:34:09 -0700 (PDT)
Message-ID: <ef36bc2e-c29c-a06f-3520-ae0a2e3f4521@smile.fr>
Date: Tue, 5 Sep 2023 15:34:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [docs] [PATCH] dev-manual: remove unsupported :term: markup
 inside markup
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
References: <20230904102111.472125-1-yoann.congal@smile.fr>
 <20af2d30-c531-7285-073d-030fc58d44cf@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20af2d30-c531-7285-073d-030fc58d44cf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Sep 2023 13:34:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4191

On 9/5/23 10:21, Michael Opdenacker wrote:
> Hi Yoann

Hi Michael,

> On 04.09.23 at 12:21, Yoann Congal wrote:
>> ":term:`Initramfs`" in bold text appears verbatim (no link is created).
>>
>> The term link is present elsewhere in the text so remove the extra
>> markup.
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>>   documentation/dev-manual/building.rst | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
>> index 1f1642e84..a39579349 100644
>> --- a/documentation/dev-manual/building.rst
>> +++ b/documentation/dev-manual/building.rst
>> @@ -273,12 +273,12 @@ loading modules needed to locate and mount the final root filesystem.
>>     Follow these steps to create an :term:`Initramfs` image:
>>   -#. *Create the :term:`Initramfs` Image Recipe:* You can reference the
>> +#. *Create the Initramfs Image Recipe:* You can reference the
>>      ``core-image-minimal-initramfs.bb`` recipe found in the
>>      ``meta/recipes-core`` directory of the :term:`Source Directory`
>>      as an example from which to work.
>>   -#. *Decide if You Need to Bundle the :term:`Initramfs` Image Into the Kernel
>> +#. *Decide if You Need to Bundle the Initramfs Image Into the Kernel
>>      Image:* If you want the :term:`Initramfs` image that is built to be bundled
>>      in with the kernel image, set the :term:`INITRAMFS_IMAGE_BUNDLE`
>>      variable to ``"1"`` in your ``local.conf`` configuration file and set the
> 
> 
> Thank you for the patch!
> Actually, I'd prefer to keep the code as it is. It doesn't hurt as the output is the same, and it makes it easier to look for terms which are not referred to through a ":term:" statement.

Maybe I was not clear enough in my message.

The output does not stay the same :
It goes from ":term:`Initramfs`" (":term:" is visible in the output!). see https://photos.app.goo.gl/KqRnXGy4B5UGi4Wi6 or https://docs.yoctoproject.org/dev/dev-manual/building.html#building-an-initial-ram-filesystem-initramfs-image
... to just "Initramfs".
 
> It's also possible that future versions of Sphinx will create such a link.

In any case, feel free to ignore this patch. The choice is yours, I just wanted to be sure you saw the problem I was trying to fix.

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

