Return-Path: <ypa.takayasu.ito@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F687C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 22:34:39 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.6888.1744756469290891074
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Apr 2025 15:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZNKXYAON;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: ypa.takayasu.ito@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-223f4c06e9fso1202825ad.1
        for <docs@lists.yoctoproject.org>; Tue, 15 Apr 2025 15:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744756469; x=1745361269; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMTvJTfj8PSFd1CWl5QyL50E9BgzatwTr34u+ewJM3Y=;
        b=ZNKXYAONerWH/m0prWwkU46IFExroh55QXpO7D443kUzou6bheHafLolDLCTDHupxN
         HK0yQc4Ik5GvgpGASLlcs1l7WFyg+f+Jt5GvtA9F8YpxaUrAeQa1jaVMRCEt+zKQRuYY
         6pvGzWYC9S4RkGdYlaKPIF25J8Lq3M0qy6E239xhUWnYf5Lspr3tQrv9J9+eRy038rHv
         7bx271t3adbYxfoIQFEhtSPXOnkdTvKUX6ORqftybzP/7SoPHgOCqf8MqgpR6gAUmTNC
         CaUydhUHLt0D0YyL0r/KpaxumarXmp8WfXcC/HJbk4+E+0vd0wTn/hyvbhyHsKSe5qfo
         VbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744756469; x=1745361269;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tMTvJTfj8PSFd1CWl5QyL50E9BgzatwTr34u+ewJM3Y=;
        b=FSMLnSGnZkTFnlYLI1QJcovzbq5vgkwmKXIgjRGvuVqQxHWCwwpgt/CHJXmATW4pVl
         Dqf2N/FhRlpCuykWrpDy1pAzRobJt/+3gm6/dGNHIuL8AO+bTHPb06h1+5Erzx7XHxGX
         B2jesCDevq74SSiuL4Y72i76Kp0wAZ8jqNqQTJp1t1M2Hv6OWQaMz3Utnc26JNb4uPr9
         Ac9hSwETPhKg3cDlP3B9TInCZ4BrE+OtY1CK408taCWrIggFlnXd2Lz0xvDCXOz186KY
         SxZx24sw185QOjGL+JXj6oKENGFA+V71nBcEAZQMTmsl1dGZ5RvH8lFgPE4p6w+k+Mod
         T33Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgTENOOEhpa5Mi5pMDBZokgOyoEfAZJH20QQxOt4nU7Xxh+9TwAb5AehGnfXiwq8H8KP0i@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yx5JYS3PzJtGCsvfZFvtyT1ZN9qVAD+/DR7pD7SdpYYVval4/ai
	wuQPLAluadHU2HKi9JM3bwcXIciwwSiPI2crWZSRLLrSDRIt+TA8+FxI3ruO
X-Gm-Gg: ASbGnctJAGuEptmT+vgU6AIOTnvQFrMdvVwrKGGogPahtdICh3Rnro//q+IOfIo5LDF
	D2o/zl8a6q3xOQB6hsHOoUgF0mzh8Ba59IfEFjJRCwJJZJk0uOlewZZyLYttvZLX2dfQLpN9stn
	Lrlxcs/B0py4V7lrnZ9QXFySRghuPo1vwn4KenssRjZ0JlLXcfxBdaLXPj1BOAUPiQjwIVRxtYz
	82yj7w3OlKu/T5CurWW4SbCpW3wD5dw79NI6f8TwN/87nJbeTnEGUYlWAUFD9T3Z/wi9vVG/8i0
	51YRTM7bU9Z7KTfNEhbjiEYVYlrNT5id5TdMrLMKVHfvCJjov+j+gDjJ1vJI03PhLUMrWZIAR5M
	zPF4paVfeitKQHTAqNJv7uBxH37o8q2U=
X-Google-Smtp-Source: AGHT+IGdQgmzOJ754iwJx4QnE9O1DXLG5og12ClYWa765SG5rIkYyzzOJw/hcJWjlH8XEI+IrP4d4Q==
X-Received: by 2002:a17:902:f646:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-22c30d8a7c8mr22310065ad.25.1744756468489;
        Tue, 15 Apr 2025 15:34:28 -0700 (PDT)
Received: from ?IPV6:2400:2412:6a60:8500:44d3:5fb4:bb45:e203? ([2400:2412:6a60:8500:44d3:5fb4:bb45:e203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fa5d83sm504295ad.125.2025.04.15.15.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 15:34:28 -0700 (PDT)
Message-ID: <a9fd9bfb-dee9-4e94-8a95-d5673a9fd18c@gmail.com>
Date: Wed, 16 Apr 2025 07:34:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 04/11] migration-guides/release-notes-5.2.rst: add
 security fixes
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
 <20250328-release-note-5-2-updates-2-v1-4-c913513e9140@bootlin.com>
 <5fc0d33e-4ba5-4f8d-80c2-c5c87be79680@gmail.com>
 <D976ZCV50JQR.3B8GAANQILPQ1@bootlin.com>
From: Takayasu Ito <ypa.takayasu.ito@gmail.com>
Content-Language: en-US
In-Reply-To: <D976ZCV50JQR.3B8GAANQILPQ1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Apr 2025 22:34:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6751

Hi Antonin,

I could not post the patch because I did not have the development environment with me due to machine trouble.

On 2025/04/15 20:56, Antonin Godard wrote:
> Hi Takayasu,
> 
> On Sat Apr 12, 2025 at 6:38 PM CEST, Takayasu Ito wrote:
>> Hi all.
>>
>> * CVEs that have been fixed but are not on the list
>>
>> < +   * -  ``gstreamer1.0``
>> < +     - :cve_nist:`2024-47606`
>> < +   * -  ``gstreamer1.0-plugins-base``
>> < +     - :cve_nist:`2024-47538`, :cve_nist:`2024-47541`, :cve_nist:`2024-47542`,  :cve_nist:`2024-47600`,
>> :cve_nist:`2024-47607`, :cve_nist:`2024-47615`, :cve_nist:`2024-47835`
>> < +   * -  ``gstreamer1.0-plugins-good``
>> < +     - :cve_nist:`2024-47537`, :cve_nist:`2024-47539`, :cve_nist:`2024-47540`, :cve_nist:`2024-47543`,
>> :cve_nist:`2024-47544`, :cve_nist:`2024-47545`, :cve_nist:`2024-47546`, :cve_nist:`2024-47596`, :cve_nist:`2024-47597`,
>> :cve_nist:`2024-47598`, :cve_nist:`2024-47599`, :cve_nist:`2024-47601`, :cve_nist:`2024-47602`, :cve_nist:`2024-47603`,
>> :cve_nist:`2024-47606`, :cve_nist:`2024-47613`, :cve_nist:`2024-47774`, :cve_nist:`2024-47775`, :cve_nist:`2024-47776`,
>> :cve_nist:`2024-47777`, :cve_nist:`2024-47778`, :cve_nist:`2024-47834`
>> see https://gstreamer.freedesktop.org/security/
>>
>> < +   * - ``openssh``
>> < +     - :cve_nist:`2025-26465`, :cve_nist:`2025-26466`
>> see https://www.openssh.com/txt/release-9.9p2
>>
>> < +   * - ``socat``
>> < +     - :cve_nist:`2024-54661`
>> see http://www.dest-unreach.org/socat/
>>
>> * CVEs already fixed in previous releases
>>
>>   > +   * - ``libssh2``
>>   > +     - :cve_nist:`2023-48795`
>>
>> The patch for CVE-2023-28795, which is no longer needed due to libssh2 upgrading to 1.11.1, was committed on 2024/01/24 and has
>> already been fixed at the time of the scarthgap release, so we do not consider it necessary to post it to this list of fixes.
>> see:
>> https://git.yoctoproject.org/poky/commit/meta/recipes-support/libssh2/libssh2?h=walnascar&id=3adac25f899054b7d1d8c14458a1a4cd310abbd7
>>
>>
>> * CVE numbers that should be changed in ascending order
>>
>>   > +   * - ``expat``
>>   > +     - :cve_nist:`2024-50602`, :cve_nist:`2024-8176`
>> < +   * - ``expat``
>> < +     - :cve_nist:`2024-8176`, :cve_nist:`2024-50602`
>>
>>
>>   > +   * - ``grub``
>>   > +     - :cve_nist:`2024-45781`, :cve_nist:`2024-45782`, :cve_nist:`2024-56737`, :cve_nist:`2024-45780`,
>> :cve_nist:`2024-45783`, :cve_nist:`2025-0624`, :cve_nist:`2024-45774`, :cve_nist:`2024-45775`, :cve_nist:`2025-0622`,
>> :cve_nist:`2024-45776`, :cve_nist:`2024-45777`, :cve_nist:`2025-0690`, :cve_nist:`2025-1118`, :cve_nist:`2024-45778`,
>> :cve_nist:`2024-45779`, :cve_nist:`2025-0677`, :cve_nist:`2025-0684`, :cve_nist:`2025-0685`, :cve_nist:`2025-0686`,
>> :cve_nist:`2025-0689`, :cve_nist:`2025-0678`, :cve_nist:`2025-1125`
>> < +   * - ``grub``
>> < +     - :cve_nist:`2024-45774`, :cve_nist:`2024-45775`, :cve_nist:`2024-45776`, :cve_nist:`2024-45777`,
>> :cve_nist:`2024-45778`, :cve_nist:`2024-45779`, :cve_nist:`2024-45780`, :cve_nist:`2024-45781`, :cve_nist:`2024-45782`,
>> :cve_nist:`2024-45783`, :cve_nist:`2024-56737`, :cve_nist:`2025-0622`, :cve_nist:`2025-0624`, :cve_nist:`2025-0677`,
>> :cve_nist:`2025-0678`, :cve_nist:`2025-0684`, :cve_nist:`2025-0685`, :cve_nist:`2025-0686`, :cve_nist:`2025-0689`,
>> :cve_nist:`2025-0690`, :cve_nist:`2025-1118`, :cve_nist:`2025-1125`
>>
>>   > +   * - ``libarchive``
>>   > +     - :cve_nist:`2024-57970`, :cve_nist:`2025-25724`, :cve_nist:`2025-1632`
>> < +   * - ``libarchive``
>> < +     - :cve_nist:`2024-57970`, :cve_nist:`2025-1632`, :cve_nist:`2025-25724`
>>
>>   > +   * - ``libxml2``
>>   > +     - :cve_nist:`2025-24928`, :cve_nist:`2024-56171`
>> < +   * - ``libxml2``
>> < +     - :cve_nist:`2024-56171`, :cve_nist:`2025-24928`
>>
>>   > +   * - ``tiff``
>>   > +     - :cve_nist:`2023-52356`, :cve_nist:`2023-6228`, :cve_nist:`2023-6277`
>> < +   * - ``tiff``
>> < +     - :cve_nist:`2023-6277`, :cve_nist:`2023-52356`, :cve_nist:`2023-6228`
>>
>>   > +   * - ``vim``
>>   > +     - :cve_nist:`2024-45306`, :cve_nist:`2024-47814`, :cve_nist:`2025-22134`, :cve_nist:`2025-24014`,
>> :cve_nist:`2025-26603`, :cve_nist:`2025-1215`, :cve_nist:`2025-27423`, :cve_nist:`2025-29768`
>> < +   * - ``vim``
>> < +     - :cve_nist:`2024-45306`, :cve_nist:`2024-47814`, :cve_nist:`2025-1215`, :cve_nist:`2025-22134`, :cve_nist:`2025-24014`,
>> :cve_nist:`2025-26603`, :cve_nist:`2025-27423`, :cve_nist:`2025-29768`
> 
> Thanks!
> 
> Can you please send a patch on the mailing list with these additions? So that
> you take credit for the changes. Please also describe how you came up with this
> list.
> 
> Regards,
> Antonin
> 

-- 
Takayasu Ito
Yocto Project Ambassador
ypa.takayasu.ito@gmail.com


