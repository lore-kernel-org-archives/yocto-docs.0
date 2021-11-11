Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0ECC433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 10:49:34 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.8999.1636627772843138632
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 02:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OcJMB0Gj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id u18so9059788wrg.5
        for <docs@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 02:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=WYVXMUJ2KrB/7+A68LHAmok0BNHsUwWlWXTxTZ1F0V8=;
        b=OcJMB0GjLYvPW3WxQ/nzKO0X4MXhO+++nl0CkKm9oqF58K21SYMy61NWl0TTgmJ3nQ
         VGfZB/EeZT2aVp7JBAyg24TpU3RV+XkI7ipVB00AYdnvPA1CNIx92uOcW2O5ElNDs2Af
         Y1Cfv8lTtxEENgbBqHUx9ygQLelSIDo8fRaB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WYVXMUJ2KrB/7+A68LHAmok0BNHsUwWlWXTxTZ1F0V8=;
        b=lNw9I8hFrg2goTzxoj9wCvgtAPhY4PEIXaBe7aSh75J+COIJsDwYDZ/0h+ZZy6YgAN
         Ut6X+wm2l8kP3itotL6E+/j7JgHT8i+1lSw4ZDwxfUdvzXd3QCXDRMeVPN6l+unhdEje
         Wc/7d2NjRY9EXT6Goi2pXeULb8x8p+/Z0b7wL3Wty3Xfojsa5m0MloXUrlSf6jxJOlTO
         r8Emo9e4AVJD6qvY1/lAHe1F6yoMZ+oZgjGJykPQq+WUGkpfaqfz4pBj153U8vrG2rOR
         nyu3bzdP/t8gpbsGCnW6x31/JJ+zzjcmUJgC28mt4nfhL6rKNo+omuIuiq3ReOIRkMSB
         Xvag==
X-Gm-Message-State: AOAM5306QUfDkRnXRglqOD/IXUfHxyGi4XoqbFbIR7sQOppvZN4RJUKQ
	VNL+z56QqDX3eVC57/3fK5myuw==
X-Google-Smtp-Source: 
 ABdhPJyTHEnWesY/FfwhDTZhGRZ8bvC6PdETrmyax+hMjvhCb25EbXSRQaTvuEu+7FVTQjnyx/APzw==
X-Received: by 2002:a5d:518d:: with SMTP id k13mr7702119wrv.120.1636627771279;
        Thu, 11 Nov 2021 02:49:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b19:11f4:a3d9:cabc?
 ([2001:8b0:aba:5f3c:b19:11f4:a3d9:cabc])
        by smtp.gmail.com with ESMTPSA id
 u2sm2480844wrr.35.2021.11.11.02.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 02:49:30 -0800 (PST)
Message-ID: 
 <28e1fd85397766a89160ce5c3705c85145530b92.camel@linuxfoundation.org>
Subject: Re: Fwd: Re: [bitbake-devel] [oe-core][PATCH 1/2] devtools: Initial
 recipe for repo 2.17.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, docs
 <docs@lists.yoctoproject.org>, Michael Halstead
 <mhalstead@linuxfoundation.org>
Cc: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Date: Thu, 11 Nov 2021 10:49:29 +0000
In-Reply-To: <61ce3cac-70fe-5325-d92e-037d7f365b93@bootlin.com>
References: 
	<a82b048c5f9f164696b1dd1e3e6c4997ede4f5ad.camel@iris-sensing.com>
	 <45438478b288da1880e92bb1ccc246732a24abc9.camel@linuxfoundation.org>
	 <ab0450c7-8f2f-9822-1ef7-61712cc45f6e@bootlin.com>
	 <61ce3cac-70fe-5325-d92e-037d7f365b93@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Nov 2021 10:49:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2127

On Wed, 2021-11-10 at 09:47 +0100, Michael Opdenacker wrote:
> On 11/9/21 11:40 AM, Michael Opdenacker wrote:
> > Richard, Jasper,
> > 
> > On 11/8/21 1:48 PM, Richard Purdie wrote:
> > > Hi Michael and Michael,
> > > 
> > > This sounds like something we should prioritise fixing?
> > Good catch, thanks!
> > 
> > I agree,
> > https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html
> > should also redirect to https://docs.yoctoproject.org/singleindex.html
> > 
> > I'll ask Michael H. to change this.
> 
> Michael H. took care of this.

Thanks all, that should be a useful fix.

Cheers,

Richard


