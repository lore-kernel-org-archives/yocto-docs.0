Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.12001.1610470282958382118
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 08:51:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gDrU+K5d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id t16so3243931wra.3
        for <docs@lists.yoctoproject.org>; Tue, 12 Jan 2021 08:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=mQYks/CcvpGFy9/v4lwBiLrCt+VpO9qQyxTauHPweRM=;
        b=gDrU+K5d71Hv7hPg+ZbkHvSL9zIvBKMHQmllnoCTUfz3I7WYWgMHxLi8p4leB2lN4l
         PgGSccLFYPFP9hvYmMdV4AoX9npCAvRNLTvbHq18W+25jz10gaXExoEQE/8iBw09BHwU
         NOcN3Pu34HWVSN1KqxJdcJ07oNkSVNeNKWTX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mQYks/CcvpGFy9/v4lwBiLrCt+VpO9qQyxTauHPweRM=;
        b=Eut43+FtJMHv6cpMZknUCgd2YH6qcs04NI9pejwZLZDkKeDt0dCzVuQoFofM+B2CDq
         oAeBvTza4/W4vL9WoavZRK+TYwMcHTkYoX4YbgHOtaz2TchFJOavQ9B36L5s0nSeq588
         T1k3/+kcDrJ12ztmk/NejDTwRYWzdcvslDWNoZ4A0n+CN64NIpuP86QmzeKBBjbUxN9a
         zWGGFAGiPGYGh9k4YmmkwYtJs/SJcW8mWBFzgEmbTgHyE4byWDu1m8lEDEAW/Essx+mI
         sgpMmKYF8rqmu4MlxfCuiNHg5g5H4byuKtqMXkYgJNi5Eubxxi+AVsJEGli6+epxkcHE
         rhpA==
X-Gm-Message-State: AOAM5335nn/wu9ZNr01RAKSNASZlLGOBzg/ne1w89ujL8MtoxD2DLXSw
	+t3A1tgPoehGQd1id4zJIbQcXA==
X-Google-Smtp-Source: ABdhPJwO00fGuGxSU6tpTSqYhgxHBxVdm1D/erDJGeNyARfYox9hjFgzytsAtmY1vFEWrBEdIgq9RA==
X-Received: by 2002:a5d:4ece:: with SMTP id s14mr5135880wrv.427.1610470281417;
        Tue, 12 Jan 2021 08:51:21 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:281a:af36:8e71:af21? ([2001:8b0:aba:5f3c:281a:af36:8e71:af21])
        by smtp.gmail.com with ESMTPSA id v20sm6064194wra.19.2021.01.12.08.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 08:51:20 -0800 (PST)
Message-ID: <37bf57e90601494b4dd3a9cbe8021efc0ae70794.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] common-tasks.rst: Fix GNU_HASH in hello.bb
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Leon Anavi <leon.anavi@konsulko.com>, Quentin Schulz
	 <quentin.schulz@streamunlimited.com>
Cc: docs@lists.yoctoproject.org
Date: Tue, 12 Jan 2021 16:51:17 +0000
In-Reply-To: <e63813ef-26e8-72f0-34fd-f75d8011f4df@konsulko.com>
References: <20210111191655.23792-1-leon.anavi@konsulko.com>
	 <20210112091623.4puwnclbtw4nixno@qschulz>
	 <a1d67e85-fa8b-dfd9-2bf0-b5efe9eca5de@konsulko.com>
	 <3eb6f61ff31061ffd357a8d592710144b29ecbc7.camel@linuxfoundation.org>
	 <e63813ef-26e8-72f0-34fd-f75d8011f4df@konsulko.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-12 at 14:51 +0200, Leon Anavi wrote:
> Hi Richard,
> 
> On 12.01.21 г. 13:56 ч., Richard Purdie wrote:
> > Adding LDFLAGS is definltey the better way to fix this, we should be
> > encouraging people to use LDFLAGS in makefiles and scripts.
> OK, regarding these circumstances I will update accordingly my patch and 
> submit it again.

Sounds good thanks.

> > I suspect 24.10.8 might be better saying that LDFLAGS is the preferred
> > fix, failing that the CC tweak is a second option.
> OK, sounds good. Should I try editing the text and submit a patch for 
> this too?

Yes please!

Cheers,

Richard

