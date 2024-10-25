Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA420D149C8
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 16:46:41 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.280.1729874793775974006
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 09:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KqtGt+8I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43158625112so22458865e9.3
        for <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729874792; x=1730479592; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A3k8EQgYgDf7ZHRGd1Ro04cDkvg6Os0dPFYHk9kD51M=;
        b=KqtGt+8ItNmhXG7h54VKhkH/JTBHx24rp7ejYBNGQYCxaCDA7JxEwwMw9cnizDoFhS
         iLbfqdSSoTnTAxIqPMl6xNgPimXz99euQzwv7wumcsY48UlzykXUOacPBKz9RgEYXGnT
         FP3XK4oNASUgXa5RC5YFovb8U8UQl6qJdCefg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729874792; x=1730479592;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A3k8EQgYgDf7ZHRGd1Ro04cDkvg6Os0dPFYHk9kD51M=;
        b=EWfFpl4YtbaJZmNlZ+SPGGtJ+dAS/lQI0ofFN2w2gdDTYptMD9YBn36FOY5Oyk/xrX
         /NwBqAMgrBo1oX4tnxD1i0n2TnzDdQbsx731K12rPHK1QwP81B5m8QtuvRdZTLtb4hF9
         o3VJ2hcS6rsw+ttJ3LIRXk6w5eSDr1NQ1Q2RVtnC/ZZFAvAxW/t6Iew5FJCB/y1vyYiw
         M1uR8RqTmKbQRlBxElARZUovnc0GnMQwtNCLe9q7YQ0VlbpJMUXk9Qa6/3hGe1v+rjw4
         SXB7JnvcCtwO1iurge3JcyeFsXw9jPUHEeP88FUse1nFEmQbNQrqxIZqW2+tuYzlMn+C
         Bpzw==
X-Forwarded-Encrypted: i=1; AJvYcCVUNYFZGDc3GvxUKGoh6CkkRdsFQDmX+Y7rUrh4vh9vh6hf09aPs4sPbHIDKZeuwSCfx5rI@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzbN67dvaDxKk/EfW5kAibJVdICoMs1DJO6UdLvk+udt/C+2b4F
	1GveG8DopemRgralw2QNsgGZvVnl730EjKnHiWW71pGYaQct+TpjWpMCBiiiBOM=
X-Google-Smtp-Source: AGHT+IGbQZt+n2X/gspINCfB2yYs17Wyiig+8PkwYdawJ1a6J+ZYjpbb+a7WMLoUyOGEIqe/4zdXrQ==
X-Received: by 2002:a05:600c:500a:b0:431:537d:b3b4 with SMTP id 5b1f17b1804b1-43184206669mr81712075e9.11.1729874791702;
        Fri, 25 Oct 2024 09:46:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5e58:696f:3954:9f3f? ([2001:8b0:aba:5f3c:5e58:696f:3954:9f3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193594ff3sm22443705e9.12.2024.10.25.09.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:46:31 -0700 (PDT)
Message-ID: <8b6e063746c2fa94d2638d32e1cf7bff87a6e3c9.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v2] docs: update current releases
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>, antonin.godard@bootlin.com, 
	docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Michael Halstead
	 <mhalstead@linuxfoundation.org>
Date: Fri, 25 Oct 2024 17:46:30 +0100
In-Reply-To: <52c88f7a-4f23-4663-9396-5297c0959d1d@cherry.de>
References: <20241025-update-switchers-v2-1-290a6c777a68@bootlin.com>
	 <08d90707d7524f11e37604749c1275aa771fd073.camel@linuxfoundation.org>
	 <0006cdff-a101-40f4-81e5-c23540bf4df6@cherry.de>
	 <fb85055a28b4e3f236ee1c29467d4a503539d2dc.camel@linuxfoundation.org>
	 <52c88f7a-4f23-4663-9396-5297c0959d1d@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 16:46:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5599

On Fri, 2024-10-25 at 16:37 +0200, Quentin Schulz wrote:
> Hi Richard,
>=20
> On 10/25/24 4:28 PM, Richard Purdie wrote:
> > On Fri, 2024-10-25 at 16:24 +0200, Quentin Schulz wrote:
> > > Hi Antonin, Richard,
> > >=20
> > > On 10/25/24 4:16 PM, Richard Purdie wrote:
> > > > On Fri, 2024-10-25 at 16:07 +0200, Antonin Godard via
> > > > lists.yoctoproject.org wrote:
> > > > > Remove dunfell and nanbield which are not supported anymore.
> > > > > Add styhead as an active release.
> > > > > Set walnascar as the dev branch.
> > > > >=20
> > > > > The switcher menu now contains:
> > > > > - Unstable (dev)
> > > > > - Styhead (5.1)
> > > > > - Scarthgap (5.0.4)
> > > > > - Kirkstone (4.0.22)
> > > > >=20
> > > > > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > > > > ---
> > > > > @Quentin: adding Walnascar as the devbranch does the trick
> > > > > and adds
> > > > > Styhead to the switchers menu. And indeed, walnascar _is_ the
> > > > > current
> > > > > dev branch, not styhead.
> > > >=20
> > > > The patch looks good thanks. I just wanted to mention:
> > > >=20
> > > > https://git.yoctoproject.org/yocto-autobuilder-helper/commit/?id=3D=
51d842b5e0b14e5439b5c89ec314886218a62ebf
> > > >=20
> > > > i.e. we do have a script in helper which we're also doing some
> > > > of this
> > > > in. I think that script goes on to generation a json file which
> > > > powers
> > > > bits of the main website.
> > > >=20
> > > > Could we try and converge things. The reason for adding this
> > > > script was
> > > > to get the website code somewhere more accessible so we are
> > > > slowly
> > > > making progress towards that...
> > > >=20
> > >=20
> > > We should be able to build the docs with only code from yocto-
> > > docs git
> > > repo and without network access.
> > >=20
> > > One of the issues we have in the docs is that there are releases
> > > without
> > > tags in yocto-docs but we still have some migration
> > > manuals/documentation for those, c.f. missing_tags in the script.
> >=20
> > We should probably add those. I can't remember what was blocking us
> > on
> > doing that...
> >=20
>=20
> Someone having the time and courage to figure out which commit is to
> be tagged for each forgotten release and then tagging it :)

af9bf61a54c059e72c807ca8061a57d6fe74c5fa yocto-3.1
bd140f0f9988fbd55f428a8ba7a54ae68716a33a yocto-3.1.1
17cc71a8f76e7b3245c9008646bb3961ad85261a yocto-3.1.2
26c5549580e108c40aa7c95860d12c675596820c yocto-2.5.3
65207b6afa6df7d82cd3482d61f10b308da6fac7 yocto-1.7
29a30b9ace435ad0c6260e026033ac1a86314d73 yocto-1.7.1
326a8009ca0bef0a4686510bb521010d8f58ac81 yocto-1.6
dd281ed7ce0cdfc30b87dc6b48077a55cfe09929 yocto-1.6.1
812bf8e2c91c4dd14a2245509ea7008a24e90835 yocto-1.6.2
228887f330f05037524e8982394a07cfd03d660b yocto-1.5
2e0cf7319ec72e8ccbf93b4a6602f3ab20259588 yocto-1.5.2
e61b251da0d8225f7497b2b7a0a8c8d1510a429b yocto-1.5.3
34d5133e8b97a8debb2458733a2b15ad3f0988d0 yocto-1.5.4
4470f32879ea9ad21c1d4821de6a8aa5740bbc6b yocto-1.4.4
3eb430258ba1106dedb584abbbb4fb4aeb2f09cc yocto-1.2
f0c7f750c3eccd4401e14f7415340e9675052d4d yocto-1.1
753e3eb80b1fa6148e12f9eb93d23f4613b6be05 yocto-1.1.1
fc4cb441031bca79f09203f9268f0528078fb652 yocto-1.1.2
8b6416db1e04af83ecdf57522240ac859d5d8031 yocto-1.0

It isn't so bad. In poky, "git checkout yocto-XXX", then git log
documentation/ and see what the docs revision was.

Around 1.0 it gets messy as the docs repo wasn't separate!

I didn't find them all but this should clean things up a bit. I've
asked Michael if he can add the tags.

Cheers,

Richard

