Return-Path: <ypa.takayasu.ito@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BC9C369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 15:27:32 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.10944.1745162851629777003
 for <docs@lists.yoctoproject.org>;
 Sun, 20 Apr 2025 08:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TIuxBL49;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: ypa.takayasu.ito@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2260c91576aso28343355ad.3
        for <docs@lists.yoctoproject.org>; Sun, 20 Apr 2025 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745162851; x=1745767651; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJlVTwXMRZa/CFwDtAwYBrZHno7pKuezPhh42DW1SVo=;
        b=TIuxBL49z61vvOO++8jQI/mhB85MTDAvCNcinsJkJfgqXGhwB7Wnt0fmt0ea8fpJ5r
         X1sg9Se+H6iVD4sam8Q0qkgf4pv1Gs42Zv20R6TboYtkPA5gGn5PR9bX/OBE5M8OJUC3
         uizghnq2Q1xJz8PXfo3X2BfQtBL8HtqTmp8ULTjFeb1lAzcD9Bo4re4jnYdbi1X1yzoE
         suLlCv/RN227iYlmU5lQqkem51YeF8tMh1O41EzmQsy54gkIr2gKKTM0JiRwZlaOm2LA
         qaTZgSh+KQ76Y081cWTJem+ErkmpRhb5qXptWE//b5bP1hDR+N5hnuYGxe2lBInRG5nd
         KfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745162851; x=1745767651;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJlVTwXMRZa/CFwDtAwYBrZHno7pKuezPhh42DW1SVo=;
        b=Q2CFPNY5IbCYaLmVjJ1U/QOhSRSMRqCJr8VTNq0ud0Yl/77z4RWwl9+FVqMViOWANg
         6YzVYl/mx+43ncrJBWrATdZghPSR31j8VExMU/a3N07Nv3+IQPk9GZ4TkGKYjw+PlkNE
         rL4voDTw8l4BHc08+V5wUduQsgp8BOdpySfi3elqz9ZRM48s2ZkoowqPcQOwDfWrSQ96
         /EOloqgTVILB0kzhwXynGXOkPqv3Oit1XlPlEvq4yrRIxYks8jcnRVBgg0WsjkERIImc
         uw5f9VuLslmH2xlJIDQSMGPPBlh+8Tm1ptnol4WSK2Jq4ZdSbwlOmg1KA4I6BbbUyf0U
         GsTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+60TMp9mQc0DXu8uUU7qy4QIVU61isbnJxRNHSXS0VlbgUusYBbWAKIQKpQK23wmw0nYn@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxoEf4N41CNEhSFwTDwPPEGf8/4BePf06T+1BiXOCTaZIMkyeMY
	sbRDk+BKB2hgB/ZrhWx4LbQbS8f32a6JEDP+FHyGiovtO5zb+yft
X-Gm-Gg: ASbGncvUB3tXxzX37kZu/bF8V3gf6rB6QbQP8lIN4BHVr/UVVa14XpoRjWxv8/y149H
	kDX7LJg5Qlx/tk0RmBuPZ3OY+mEvBJZh8GWfP3o8+5FyVRHE9GdExsEhI1Qx1mBgYDyh2zRhWzR
	9xkBDUQ08nyPgKvoyWmk5iTlv8fOSA9/Cn2w+wY/x8iyrr/IJ277VJc0s3TFpKWLQN29Sv9pgfM
	H0myzYYeKQ4rUbb1C21yeJMxwubd5uwbCuFREoiLKmusEJ4u7i491EO4O21Nh2F7La9rAszzLIX
	eU4j23+sjK+LxlyzChaI5lQQ9nKK1O5romproKHELZXGP3RrwxZJgcONeVbdZqLYfO+KFXYIp7s
	nU9cNSRIJanhBf81KY5SSzo64vHWRTfUfbepIcuI0Rw==
X-Google-Smtp-Source: AGHT+IEpVMDBkEPDldTBwvdMEYw9K/o/jdM7FRdSBmX5lsfjhqYc+PA1PN48CqJkBknMkklMeIkWpA==
X-Received: by 2002:a17:902:e944:b0:220:ca08:8986 with SMTP id d9443c01a7336-22c535a177fmr168844685ad.22.1745162850887;
        Sun, 20 Apr 2025 08:27:30 -0700 (PDT)
Received: from ?IPV6:2400:2412:6a60:8500:d05c:f0ec:fe7c:a104? ([2400:2412:6a60:8500:d05c:f0ec:fe7c:a104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb48ebsm48987575ad.122.2025.04.20.08.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 08:27:30 -0700 (PDT)
Message-ID: <267b150e-0dd9-43de-8cdf-25324dd78e03@gmail.com>
Date: Mon, 21 Apr 2025 00:27:28 +0900
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
 <a9fd9bfb-dee9-4e94-8a95-d5673a9fd18c@gmail.com>
 <D97VVLZXMTW9.P853JF4BXI1F@bootlin.com>
From: Takayasu Ito <ypa.takayasu.ito@gmail.com>
Content-Language: en-US
In-Reply-To: <D97VVLZXMTW9.P853JF4BXI1F@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 20 Apr 2025 15:27:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6764

Hi Antonin,

The decision is based on the upstream release notes and accompanying information.

As for gstreamer, three update commits have been made.

gstreamer1.0: upgrade 1.24.6 -> 1.24.9
https://git.yoctoproject.org/poky/commit/meta/recipes-multimedia/gstreamer?h=walnascar&id=0770b0 ecea8accb0edb9137595b2c7e0b94bb69b

gstreamer1.0: upgrade 1.24.9 -> 1.24.10
https://git.yoctoproject.org/poky/commit/?h=walnascar&id=d84 bc502cc610cbda9bf19e0320537287bf8a674

gstreamer1.0: upgrade 1.24.10 -> 1.24.12
https://git.yoctoproject.org/poky/commit/?h=walnascar&id= 925d5f1c725ceeb36c180b38a22dfdedd0dfc220

Release information for these updates is found at
https://gstreamer.freedesktop.org/news/

In it, it is stated that the security fixe is included in the 1.24.9 and 1.24.10 releases.

The details are confirmed at
https://gstreamer.freedesktop.org/security/

We can confirm that GStreamer-SA-2024-0004 through GStreamer-SA-2024-0030 were addressed in this release of walnascar.



On 2025/04/16 16:27, Antonin Godard wrote:
> Hi Takayasu,
> 
> On Wed Apr 16, 2025 at 12:34 AM CEST, Takayasu Ito wrote:
>> Hi Antonin,
>>
>> I could not post the patch because I did not have the development environment with me due to machine trouble.
> 
> Okay, that's fine.
> 
> Could you please explain how you obtained these results?
> It's not straightforward for me to assert the validity of your changes. I would
> just need a way to reproduce the results you obtained. cve-check, maybe?
> 
> Antonin
> 

-- 
Takayasu Ito
Yocto Project Ambassador
ypa.takayasu.ito@gmail.com


