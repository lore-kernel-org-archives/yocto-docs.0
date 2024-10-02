Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D11CCF31AA
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 08:59:03 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.2829.1727859533754439106
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 01:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z0D2aDaI;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37cca239886so3703992f8f.2
        for <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 01:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727859532; x=1728464332; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OUxH8+FP+z5aVJCMCIR5sF6ZJKn2mIY1GKY+jvpJao0=;
        b=Z0D2aDaI7+0myNtrAO6LCpWH4EbFZ8t5csbExrey/ukIcjV9pybQVqvlOGm5RC5MsH
         IOJ2xUN0CDenc/KbgtBbQLstFcZmAZGTPENd9tVIEGUr3G2bOulmeOOp9lEDvBBhPFkw
         m5dqww33KQRbzo9B/PgyrWM+uzoXEvZDeTco0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727859532; x=1728464332;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUxH8+FP+z5aVJCMCIR5sF6ZJKn2mIY1GKY+jvpJao0=;
        b=u1RZaQ6COU5VBorC0B8lNHli+QimYLo7A7nGSR21vRohzEDpqxE6uz8eK+ZLzZcAeb
         DBT1uGyFDrdlWbx4/IIykQlXp7Pr16YjvGBPGYLMz+C6pBUPlDkIRHXRV8aBhmQI4flJ
         LIpb7mBdn2HF9OPBA49Ku+VJC9DZXS0jFRWlqPvDCklra0fcd+RUH00UY2jR8u+aIC5T
         ECxc9Em0NdPZQa0elVHgEo+lDIlMzEzTbXG2PEAJGinfpPOFsSqx+whQ6w6RoJUIHTvC
         NgsxfFLKl0pjMxw3yBScfkDdqdw+1aW1TaI8K9k37S6OCaxFgRuycC/YpYJvqSENakNI
         or1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWp170iXv9EOn33w6lPPf4WG4e9FAPJqQMLMtcrNfdzqz3EaAegHqmtJ6L2vX+HcgQXqty@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy6yXQY5Z0OPnBOTmVNlHLMhQUWVd//+j+Jz6Lzsw9Sqxom2vLv
	hbal0vloypQMA5TlXC7dZj8540P2hJe/mLAwDOnIrFVh6+D3JUmgFQRjzRKXX7XAKk+dUB+RbmY
	g
X-Google-Smtp-Source: AGHT+IGCYGqKTmbvbdLL7Mg2AmKag87Rq69P3ScV94ICurWJp6opG38mFcNEVMtOogwgP6Jb9yeXgA==
X-Received: by 2002:a5d:650d:0:b0:37c:f98e:82a5 with SMTP id ffacd0b85a97d-37cfb8cffa9mr1395254f8f.15.1727859532107;
        Wed, 02 Oct 2024 01:58:52 -0700 (PDT)
Received: from [10.1.9.111] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd574282esm13437834f8f.104.2024.10.02.01.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 01:58:51 -0700 (PDT)
Message-ID: <e6fb24c6-8660-4022-9674-9dcdb20fe46f@smile.fr>
Date: Wed, 2 Oct 2024 10:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 1/4] migration/release-notes-5.1: document
 oeqa/selftest envvars change
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
References: <20241001172238.2872529-1-yoann.congal@smile.fr>
 <20241001172238.2872529-2-yoann.congal@smile.fr>
 <f00ae092-32d9-40c6-84f3-0da661e34b66@bootlin.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <f00ae092-32d9-40c6-84f3-0da661e34b66@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 08:59:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5401



Le 02/10/2024 à 09:15, Antonin Godard a écrit :
> Hi Yoann,
> 
>> +   For example (taken from :yocto_ab:`autobuilder <>` environment):
>> +   :term:``BB_LOGCONFIG`` is set as:
> 
> When referring to terms, you should use single-tick, not double,
> otherwise it's not parsed correctly and it doesn't create a reference
> (treated as code instead).

d'oh! v4 sent :)

> 
> Cheers,
> Antonin

-- 
Yoann Congal
Smile ECS - Tech Expert

