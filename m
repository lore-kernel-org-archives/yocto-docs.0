Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C99DCDB47E
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 20:51:44 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.27766.1697057496033157676
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 13:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I7ycVxBi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso3792025e9.3
        for <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 13:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697057494; x=1697662294; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5FRkD0x0Pvvny3bEhMY6Az7VI0og//FgYdJNkhgiu8=;
        b=I7ycVxBirt9WiHngCzPRnlbmlzYUxC2ENBml5TSDMn/Bl9DkdqGdREdvczeEoMWeLS
         w4n8fI5PTivpSUtUftAmWBxFSBlk8vMjpyzKE5Efz1DdVmeKBmKR8QtJ+wtcuyCEhtPu
         KOuxXNAWRWsHd4LAXmQXZU17n/ghIP1piJCk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697057494; x=1697662294;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I5FRkD0x0Pvvny3bEhMY6Az7VI0og//FgYdJNkhgiu8=;
        b=nHgkOTUB2Flai40n4C0tif5zPHX3+V8ZQLqC+3IcJJointcikEgfeScS7CPwcOW2aE
         +3L0kOgA/T6vKSRF4yc9p8jBhKMyqq4hCksN26L6cCSctV/7l5EuVbknX+Phyie9mCJ2
         tdYCpe4EedyIHSCaIfMLpcGOQJQHicacpZOF8jGQ3J4QEUcmXfbIislJ4k3vt+7FIZXh
         9pkTWFkhmlOGdOgrVZMjuLDWQAmSHwaIqGUXqsXhX+FzFS9k6yZJx65dq14e6GPvsInu
         oRi8jXUmjEHpzoq41IT1Cvf6OilFa0AEaWcjO2TM6Ha/mbrP3qXt6SSvmaRAfO7apM+n
         ZUQg==
X-Gm-Message-State: AOJu0YwFCAoOFiDATVZYKVJ/wkaRlZZC/5LNOY/RLZIXmLCkSnO8+3yT
	ju5IN7Qhc+UqjvjAnO52/4fB5rG6ouKtH+azBbM=
X-Google-Smtp-Source: AGHT+IE8BHwTv1IRd7JJOKU79Mu1a+eystNGYYRtPIFpH/YxfdzEBpDeuHuhKG81+YJyNPAaWDQN8g==
X-Received: by 2002:a05:600c:500f:b0:407:5185:192b with SMTP id n15-20020a05600c500f00b004075185192bmr6482399wmr.36.1697057494240;
        Wed, 11 Oct 2023 13:51:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:37b5:155b:a41f:f969? ([2001:8b0:aba:5f3c:37b5:155b:a41f:f969])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c228a00b004065d72ab19sm20152093wmf.0.2023.10.11.13.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 13:51:33 -0700 (PDT)
Message-ID: <6d6409a0527b88f00208aa3f4e8f690c6c70f7f1.camel@linuxfoundation.org>
Subject: Re: [docs] confused about distinction between "BSP" and "BSP layer"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Wed, 11 Oct 2023 21:51:33 +0100
In-Reply-To: <bf75ec3734c0a4e0e88e69b06cd6514b@crashcourse.ca>
References: <bf75ec3734c0a4e0e88e69b06cd6514b@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 20:51:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4355

On Wed, 2023-10-11 at 12:24 -0400, Robert P. J. Day wrote:
> currently reading the BSP Guide, and here's the opening sentence:
>=20
> "A Board Support Package (BSP) is a collection of information that
> defines how to support a particular hardware device, set of devices,
> or hardware platform."
>=20
> so ... "set of devices", as in, a BSP can define the support for more
> than one board? i ask since, here:

Yes, a BSP can support more than one board.

>=20
> file:///home/rpjday/oe/dist/layers/yocto-docs/documentation/_build/html/b=
sp-guide/bsp.html#developing-a-board-support-package-bsp
>=20
> one reads:
>=20
> "Although not required for BSP creation, the meta-intel repository,
> which contains many BSPs ..."
>=20
> whoa ... the meta-intel repository "contains many BSPs"?? so a BSP
> layer contains many BSPs? that just seems confusing.

Yes, they can and do.

> oh, and the meta-intel layer defines all of three "machines", not
> precisely the list in the Note in that section.

In many cases machine definitions have been able to support multiple
platforms which is good and it results in decreased MACHINE counts. In
general a BSP layer can and will support multiple MACHINEs though and
this has been the norm for a long time.

Cheers,

Richard

