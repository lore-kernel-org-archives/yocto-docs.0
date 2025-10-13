Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BC6CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:20:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.43306.1760361635294535270
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 06:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lg7Ed2E6;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e52279279so29638425e9.3
        for <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 06:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760361633; x=1760966433; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCzH9E+fZtx3nfH4DzTh/haGF/0XsuCqb3PoXOPnPZk=;
        b=Lg7Ed2E66drDI/kbJnYzm9ZGOsR653/sPS3CeqD1ip4Vd4HagzmAsYEJO0k/JWBe6o
         fcFhuFJX8TTHBso0qBhiERERG3HrbLh8PRQ1oVQbdETgeaQre1mAUnNLYbRLcEmWdADb
         ob9m3cj8N7egQsh3ct2I2kZGr0kmyZzZXccODyt//2ublcYXYfnuAeZSGIQUHoas7tKz
         xV3znc/72SK0rGe6bIapGiM4MigcseeZgbLwbuFUxc3TRRNJeSb4669uW/QnpuMufRLg
         jUgxoGEayWggCBX7oNQeBCTWL6andEtFms0s17z6qo9vHhEbISTcX3OotLLWEg4wC9OD
         9oSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361633; x=1760966433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCzH9E+fZtx3nfH4DzTh/haGF/0XsuCqb3PoXOPnPZk=;
        b=coHdl4/uMjn8Ca3aJSNZWNtSxW4gcYYCIMFJ5O/X3pQL0KpzDmZPHOjHgRINCK3auR
         29Yx/uupq5+wNaZ7vT1dsVMfcfCyF9AdhEeQBDlzuXn+3rkENKiC+lX/CmYvjH9y6Yfl
         zW4O7e9nwP1GNH0iToFyfIRM20TMtq8cV8fVpUfh+zA2mxx2a/jaKi5dRjE4hFNnck6m
         ry2sYBSPYcwHj26eSswKOwfs8c8jxtJx4A5trlGcsULjCizZ0D1ievlsnAWgvlwsR9Ju
         VZYkGYP1zUlJM4UXLzbIWvfuvuqaz6TI7tk7nC42Iqw1acOdcUvC2CQcx7KZ3j7kMTMd
         uK3A==
X-Forwarded-Encrypted: i=1; AJvYcCXgRnPawKoZiREyng7yk7suRxp/qVXM8fjzKlpwz3GZ+QWlJLDXRYnZOt1efaBKfXrEIfqK@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YykzOKlAoSUTwmj5BUMMHf55+ieGsUdwPK5GdWsQc8ooS8S3lhF
	JN+Mfn82NODKWlzXFwx/s3vauowp0psPENRAdUCxgv78sB62Y/GfDykV
X-Gm-Gg: ASbGnctW+UC4NBUESOlTCXmkodVxceQMWvNla0fZDIAPLkPVA7KdcGM9whtwLiuC/cI
	lsZ5l4p/hReUyzJZ5I46tp8q5w7PggDLIq8zliSQSrLE7NIF0C2NgXcHBJGB3t/srwAq/N2cwAp
	9hXggH9u0G3zlkOlKSc6vuP0BQtg1/dfOagBMnBfMnfypMHZqyWypVM5jsE5CLxDLeDPYJWqmwZ
	HBUdEPvddsGCGIi73Z+WhxTFxt4WpWVifaBrEYhegus4O5FMRA6PDcCCTCs9kCr82Cbc+RA2lkJ
	pKVClaehs3TerfA+jdbyXh86h2Pp8tJ7UKVrE6hYIRsxyRsf9SsflxIMUQ5sesSuG42Ggo2i41l
	jKLOk72e75dEsKDmn42Fq/+I6ccWkwHyGdC6VjIR2BPBKIOiBGQ==
X-Google-Smtp-Source: AGHT+IFR/1y+poyR9nzsAptCyTO0IugdnzQ+EeDUdq1xM9ANxcX56irU9ClM1enS51pt9ok1/bntNw==
X-Received: by 2002:a05:600c:4e41:b0:45f:2cf9:c229 with SMTP id 5b1f17b1804b1-46fa9a220b1mr149686385e9.0.1760361633435;
        Mon, 13 Oct 2025 06:20:33 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf790sm17756899f8f.28.2025.10.13.06.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 06:20:33 -0700 (PDT)
Message-ID: <1db34a8d-a28e-458b-a230-bfd2253eb13c@gmail.com>
Date: Mon, 13 Oct 2025 15:20:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: add note about PSEUDO
 ignore/include precedence
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
References: <20251010142311.3509374-1-skandigraun@gmail.com>
 <DDH4SWMDF96V.357XHVKSKC1HA@bootlin.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DDH4SWMDF96V.357XHVKSKC1HA@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 13:20:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7692


On 10/13/25 12:44, Antonin Godard wrote:
> On Fri Oct 10, 2025 at 4:23 PM CEST, Gyorgy Sarvari via lists.yoctoproject.org wrote:
>> This commit[1] in pseudo introduced the PSEUDO_INCLUDE_PATHS variable, however
>> the previous PSEUDO_IGNORE_PATHS variable is still present also. Add a clarifying
>> note about the order of precedence of the two.
>>
>> [1]: https://git.yoctoproject.org/pseudo/commit/?id=2c43381180f9cfef4c0a8bb0c1658a86c3fcc876
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  documentation/ref-manual/variables.rst | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>> index 1d4ec413ca..d180341079 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -7567,7 +7567,9 @@ system and gives an overview of their function and contents.
>>        by pseudo when monitoring and recording file operations, in order to avoid
>>        problems with files being written to outside of the pseudo context and
>>        reduce pseudo's overhead. A path is ignored if it matches any prefix in the list
>> -      and can include partial directory (or file) names.
>> +      and can include partial directory (or file) names. In case a path prefix is
>> +      present in both this, and in :term:`PSEUDO_INCLUDE_PATHS` variable, then
>> +      the latter takes precedence.
>>  
>>     :term:`PSEUDO_INCLUDE_PATHS`
>>        A comma-separated (without spaces) list of path prefixes that should be included
> In these kind of situations, I think a good way of being extra clear is:
>
> """
> In case a path prefix is present in both :term:`PSEUDO_IGNORE_PATHS` and in
> :term:`PSEUDO_INCLUDE_PATHS`, :term:`PSEUDO_INCLUDE_PATHS` takes precedence.
> """
>
> What do you think?
>
> Also, we could probably add the same sentence to PSEUDO_INCLUDE_PATHS's
> description?

Sure, v2 will come in minutes.

>
> Thanks,
> Antonin
>


