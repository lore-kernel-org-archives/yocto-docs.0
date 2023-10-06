Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D802E92FF8
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 08:05:07 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.7919.1696579496797505684
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Oct 2023 01:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=0r9O80Y5;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3231dff4343so1116324f8f.0
        for <docs@lists.yoctoproject.org>; Fri, 06 Oct 2023 01:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696579495; x=1697184295; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cPB6SNucT5BpPz5YBo/KFM+Zyqt9OdeaBrPw3FBAwQw=;
        b=0r9O80Y5wfdPc2SX3r1F3dvlSFcX9H57LH5jTBXnNxb0qB6yxrxT98C7bGA5DyXlo7
         yhfjEYoPM+21+IggK3RPlDYvVuaKpU1tnVFLX75BvO3GjjWhlVhN41tCD7mGbRbAREFC
         lbKqk30LG4hHaq8NLxXxIRkhnZu62VPaFeASnCFQS1EWacMesSmjLcd12xizyvjD5LR9
         OWn8C6U0tnmB2zzwsOfmgb8BdtA81mehFS8lxqaYlQHrbDKj2tU0dMFKDrUMwdw4QeZb
         AiA3a5r+cLHPS6ZyOHChi+mxDmbNB3R03/mWq20HSFbjFcQQQJu31K922pKw+LXwblH/
         z+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696579495; x=1697184295;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPB6SNucT5BpPz5YBo/KFM+Zyqt9OdeaBrPw3FBAwQw=;
        b=tgfBFhDssGUDnwUC6PNBo+/jWVSopKhAm4zsErjZRZg37pc1Dz4xs8VOFvvLZO/4Ge
         GMrY14B9EP/D7HGUJZ2iTsBxIS+vUFNJ0IZ13gZ5xHkMpU3L/GoeWyMxd3Ikf8bnCMg+
         8UQV4bOpIcwpomSYBc8YCK7gPTNrSJ8zsY9YITYaaGBuUiUnTircebsS1QLu2KdmpRMH
         A77zalBMMZTbTldCjC68RcqH7reBIs0vavQvEhLYYDVeSvKVIVNEs1KLM2F7XuOpinJ1
         tHianK7/qNkNqSn/zQT6mpfvlfIC8uXmpychDwxKU/wMwgIWKAtGFF4Ehaj6hWMw7SyD
         oPBA==
X-Gm-Message-State: AOJu0YzdjvVV8rXNRDQsF3FC83vUN5mf0n6PSWPJN1VtBx6G7Ee8AXYX
	eyXga736Zy6GrJhGsnG4CHTDjw==
X-Google-Smtp-Source: AGHT+IHkWTNYBPZDKVIhkTSC2l1mbl8jAJqFcsD0oe5PhOtk5K9HVl9dA6NrZMUL4HYPcrbCTJOa5Q==
X-Received: by 2002:adf:e288:0:b0:329:6d7c:ca71 with SMTP id v8-20020adfe288000000b003296d7cca71mr355364wri.17.1696579494931;
        Fri, 06 Oct 2023 01:04:54 -0700 (PDT)
Received: from [192.168.0.23] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id s4-20020a5d6a84000000b00327bf4f2f14sm1027488wru.88.2023.10.06.01.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 01:04:54 -0700 (PDT)
Message-ID: <95f8fd72-7a3f-1e5d-af9a-e7e240a001ab@smile.fr>
Date: Fri, 6 Oct 2023 10:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [docs] [PATCH v2] ref-manual: Add documentation for the
 unimplemented-ptest QA warning
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>,
 docs@lists.yoctoproject.org
References: <20231004143651.1796870-1-yoann.congal@smile.fr>
 <ae397d71-220a-e86e-e087-55ea6000dece@bootlin.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <ae397d71-220a-e86e-e087-55ea6000dece@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Oct 2023 08:05:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4330

On 10/4/23 19:14, Michael Opdenacker wrote:
> Yoann, Jérémy,

Hi,
 
> Thanks for the documentation patch!
> 
> On 04.10.23 at 16:36, Yoann Congal wrote:
>> From: Jérémy Rosen <jeremy.rosen@smile.fr>
>>
>> Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
>> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>> This is the v2 for the doc of this series:
>> https://lists.openembedded.org/g/openembedded-core/message/188680
>>
>> v1->v2:
>> * Fix shortlog tag
>>
>>   documentation/ref-manual/classes.rst   |  3 +++
>>   documentation/ref-manual/qa-checks.rst | 11 +++++++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
>> index 3f0d4844e..3eede8c7b 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -1480,6 +1480,9 @@ Here are the tests you can list with the :term:`WARN_QA` and
>>      also inherits :ref:`ref-classes-features_check` in order for the
>>      requirement to actually work.
>>   +-  ``unimplemented-ptest:`` Checks that ptest are implemented for upstream
>> +   tests.
> 
> Shouldn't it be "ptests" instead of "ptest"?
> 
>> +
>>   -  ``unlisted-pkg-lics:`` Checks that all declared licenses applying
>>      for a package are also declared on the recipe level (i.e. any license
>>      in ``LICENSE:*`` should appear in :term:`LICENSE`).
>> diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
>> index 4a02e7206..cc9afeb7c 100644
>> --- a/documentation/ref-manual/qa-checks.rst
>> +++ b/documentation/ref-manual/qa-checks.rst
>> @@ -789,6 +789,17 @@ Errors and Warnings
>>       use a relative path rather than an absolute one, or to pick up the path from
>>       runtime configuration or environment variables.
>>   +.. _qa-check-unimplemented-ptest:
>> +
>> +- ``<tool> tests detected [unimpemented-ptest]``
> 
> s/unimpemented/unimplemented/
> 
>> +
>> +    This check will detect if the source of the package contains some upstream-
>> +    provided tests and, if such tests are detected, that ptests are implemented
> s/if such tests are detected/if so/
>> +    for this recipe.  see the ":ref:`dev-manual/packages:testing packages with ptest`"
> 
> 
> s/see/See/

Thanks! We took all of these.

> Looks good to me otherwise.
> Thanks in advance for a quick V3 ;-)

We'll send a v3 once we fix the "code part" of the series.

> Cheers
> Michael.

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

