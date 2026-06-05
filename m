Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA30CD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 16:47:17 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12480.1780678032230055976
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 09:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OX+lv+l5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso23735415e9.2
        for <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 09:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780678030; x=1781282830; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRSvsKmuErD97+3+73WRvKrWsHDNK4WiZpMXqKT0ioQ=;
        b=OX+lv+l5dX6cDnMe0jCpAmOkuHm45P7ew11Pz3neOfL3S08mqBePBSFUXN+zFEzcMg
         IHCsoHXkViFb/tRbDyabtuQS7RNx66Lq7coPPLZ4QwL3zKLGphrwSoz2i9n7BKMReymr
         IToLrctnUOLSDRBGvJIkFz8Q0jCyqK3cC7D0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780678030; x=1781282830;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRSvsKmuErD97+3+73WRvKrWsHDNK4WiZpMXqKT0ioQ=;
        b=QZ+inAgC9PPS0sm00OlXccgio4LuZgKgI9B5SYGAe3ikpQdhUhGbNlnq8s1cvynMeN
         n6CPgwWd57cojoWGlr9neqLN2WaDgFK4q/ZUQZkeQRSVAO/lYKSwynsKMTL97HI9oT54
         qe+7A09gfjw/nrFoJF0g6VFmqjyMWXIMk3f7yuqiFqEQGmHUTKm81ZELuzBsJFNjUDx+
         ejGgg7kjYPD47QwD7NMZejpnmCNTbZzBCX6SVgDFiGcFkOCWCXkmVEQ5gX+ePkrM3S8w
         AeNTRnW76b+ERdvEA0WudA2O2VUkjn7ZMDcLYmH6XIOKF6I7VEdUCu2hzvgygDZw3P6R
         ENNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/51wW9qWSzleLX2NKynv7e4jVX50RxsIFoyo6ihARGFN0M9F8bOwk+ZKrAf6ibh21fmrxQ@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YztWmgZCvEWCSNW90i+mtUQpKKuhSpd7mLKf3/rVWINvcG4SfWy
	hA1TwcE6oH8SZMx5/q4tcqDJz8BHmefN6jkJfmBMVqXALrccynrNt5YMrEz20E+2FKi+zvtSsvB
	4z99S
X-Gm-Gg: Acq92OGbLhkw2NI8rr1JA7SBWhy2G0vVTdyqIC/nNDfyvmraVn2/BAqyokALUmzeYjQ
	HkqwA3+EFeWfQVuVwzg0X9oyK8d+cClHSQdiEdxTy1AiJopZk8nQcp+OPMmiuiLiP3tI1wTStOv
	57kaNXDGNFxMqx4yrmAS2M+RoogIVTfWm6qOTDOnKBgjgNiHNZ+U7tqsQv+qvoYQ55+iB2FigmB
	Ns4n6O60MckN2MmiYIKjS9sSPN0UVSsui1Pt+acLDb7bPsYy2NzEtynqZy+4uyimNu4ivGah+lL
	NRUJdA/MLiXwbBiYoOQtJHrNb5FZCINRQmMzrO0WPlUgtnxwRq2kCY3dAakawUGQR2ZeDwm4xRg
	1FbCcdyLgV+Si9vWz4CmZUTsiAc9TSPYNdW7mEY1l5bCMYXboQLKViQipDGsk6dMSLSKDdiiGxf
	B9MqlNfwsAXXSnMF9LF8KZ0MiDB9Hrm/x10kEDcn1PF0eFx00xTd9o2R63WLpCpNb7EsTJ7gCX3
	EVGTuj+p8yIEE7C+JSWwOh9DpU=
X-Received: by 2002:a05:600c:3486:b0:490:b2a6:8c2a with SMTP id 5b1f17b1804b1-490c258f419mr71006705e9.5.1780678030632;
        Fri, 05 Jun 2026 09:47:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:176b:6db2:d527:85f4? ([2001:8b0:aba:5f3c:176b:6db2:d527:85f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413541sm176801005e9.14.2026.06.05.09.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 09:47:10 -0700 (PDT)
Message-ID: <811dc0ab9bf8792c80d4eea04cf79dbf374841be.camel@linuxfoundation.org>
Subject: Re: [docs] why i will be doing a bunch of proofreading for a while
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Date: Fri, 05 Jun 2026 17:47:09 +0100
In-Reply-To: <7ad14a95-f630-5dc9-2920-03a347d0f3eb@crashcourse.ca>
References: <7ad14a95-f630-5dc9-2920-03a347d0f3eb@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 16:47:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9620

On Fri, 2026-06-05 at 09:41 -0700, Robert P. J. Day via
lists.yoctoproject.org wrote:
> =C2=A0 as of today, i am now between gigs so, while i look for another on=
e
> in the area, i might as well pore over the docs and be annoyingly
> pedantic.

Perhaps rather than setting out to annoy us, try and focus that energy
onto something more productive? There are other ways to improve the
docs than just being pedantic...

Cheers,

Richard

