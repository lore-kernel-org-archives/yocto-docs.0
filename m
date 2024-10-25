Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEC9D0C617
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 14:16:48 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.13050.1729865801867824612
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 07:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N6ou1TcV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so21316515e9.3
        for <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 07:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729865800; x=1730470600; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HhL0XaAJmbQ7BVMuVhwDk44iYaQDL286mh07HhBCkWo=;
        b=N6ou1TcV/JKPFpOKsxWht0YdV3ZeAsANcJVkMwG5uStJx/Euvl4Ya/9dcbDdSpuKYt
         LnXP4xAkJClEwX1yTFHFHSYdZ3skBxycx8muNNWWu3glRPh9Qqa4z7L/zqYNhnq6XdO0
         VEKumRcnlbgQ+l0Qy7kRgQZ2lvhqOCfRBL8pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865800; x=1730470600;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HhL0XaAJmbQ7BVMuVhwDk44iYaQDL286mh07HhBCkWo=;
        b=NkUr7yh7kJ2fuNGhqDAZzBT++vEKN34319iD8J22cAxECxlLfkBT3591JDs2mTPA4A
         Y5X0VxO18TYRqV13uZOkeHwi8y0x/Ej49Sw1UHLDgBIBaDReJh+DyvlVH6cf9fzAtD7Y
         Gc0cShH4JjAP9JbIE4Ku1djTR7vAQsgZSvX25hCcP9uexHnve9O+sZYUlz+r6et1NBt2
         QvJh7IuhgRs+QOx1T5305xAJt56c1V74uJbmKnS/laOKjYWUse5j404beIL09ibzrZKL
         ENL8ZoohxJ++ZvFxPO/rSiugGk0DMMqKTXyl5MdznYNVsiuOP7Wl/TaGyCUeT82Ryhhz
         RrxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu86voopvim+jLxm9EJ0wincxdkX3X5r//1xBuEQbLgnZEUE+3l680fycldyOmYI75cpVf@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy7Y9XNbpVznxALU5bEOQteDfduze3KpnrHTYNJsogGDCOTMCZr
	ML+PJ+h7Ot8TDWjj0AP2T0FJEF7FGVj2bgfoMwviN/wRaddufwJHo9XjsSwfyCQ=
X-Google-Smtp-Source: AGHT+IFDAbu+4FC3csWYNR2xCW3YYNl3m7iAr5FPW/QtWl/qD/xuiNY0bgmjG6dj1S2LDPANJIKwQw==
X-Received: by 2002:a7b:cb58:0:b0:426:647b:1bfc with SMTP id 5b1f17b1804b1-4318c8cd0c5mr47013905e9.30.1729865798456;
        Fri, 25 Oct 2024 07:16:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5e58:696f:3954:9f3f? ([2001:8b0:aba:5f3c:5e58:696f:3954:9f3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55df56sm48816545e9.10.2024.10.25.07.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:16:38 -0700 (PDT)
Message-ID: <08d90707d7524f11e37604749c1275aa771fd073.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v2] docs: update current releases
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Quentin Schulz
	 <quentin.schulz@cherry.de>
Date: Fri, 25 Oct 2024 15:16:37 +0100
In-Reply-To: <20241025-update-switchers-v2-1-290a6c777a68@bootlin.com>
References: <20241025-update-switchers-v2-1-290a6c777a68@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 14:16:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5593

On Fri, 2024-10-25 at 16:07 +0200, Antonin Godard via
lists.yoctoproject.org wrote:
> Remove dunfell and nanbield which are not supported anymore.
> Add styhead as an active release.
> Set walnascar as the dev branch.
>=20
> The switcher menu now contains:
> - Unstable (dev)
> - Styhead (5.1)
> - Scarthgap (5.0.4)
> - Kirkstone (4.0.22)
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> @Quentin: adding Walnascar as the devbranch does the trick and adds
> Styhead to the switchers menu. And indeed, walnascar _is_ the current
> dev branch, not styhead.

The patch looks good thanks. I just wanted to mention:

https://git.yoctoproject.org/yocto-autobuilder-helper/commit/?id=3D51d842b5=
e0b14e5439b5c89ec314886218a62ebf

i.e. we do have a script in helper which we're also doing some of this
in. I think that script goes on to generation a json file which powers
bits of the main website.

Could we try and converge things. The reason for adding this script was
to get the website code somewhere more accessible so we are slowly
making progress towards that...

Cheers,

Richard

