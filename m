Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5812C98332
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 13:46:09 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19304.1790430361353680554
 for <docs@lists.yoctoproject.org>;
 Sat, 26 Sep 2026 06:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G66ROjF0;
 spf=pass (domain: gmail.com, ip: 74.125.225.141, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so9700615e9.1
        for <docs@lists.yoctoproject.org>; Sat, 26 Sep 2026 06:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790430359; x=1791035159; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zuWgwcexj5fLvPN1mm14DAb9+S0l2srUGmQDC9JdCBA=;
        b=G66ROjF0QwxTYGMYfQ/vf0C015thNt1au7TD2DnwGL+1EKF5pdaeMfqJGvMP/mtH9s
         xpmMJd+LHbxAoXRx255vFUTo2ZkR2k6tzWLcRILKs5SzIpXcb3+S0bX4emi7Izrfiv9e
         +e8ROOA81Jf12P/IAhyGWwuP5yfaxvDtN/VyVW6mEdONdhsKcp50Q+lTMnctel3t1j2A
         +DRNT6E+lfM/ELPRZbO4qO3FHD47ipH8ItYKyi0xXsdIwU2MkWdMsMfAeiY2VbQ4wUPd
         0PfyJETTA6oF16V5VEurqX71kWobXl4/VhNMlOdhFL9jzxWsfHsvWGaF2T/9tNc1fEnl
         uK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430359; x=1791035159;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zuWgwcexj5fLvPN1mm14DAb9+S0l2srUGmQDC9JdCBA=;
        b=AdXcdCNXzbL/oav0nitIQutMszy6lq6qc/Fy/JskTYfDX2esMISng/DDpI8ovvuzfD
         7XokIo9Mx1oSQcgk2WBs+kRK/8fPEH2UHckL7gyvbdy03tQJz7HSkLgvHA9YHQIpRY+Y
         GNyCvqLHxBB8bnvsA6WPpu+BE9xdz8jwDAsu31vpUAidSj7jfhA/ExlyoLFwUNh9WylY
         /iTevdmsq5W3O+ya39hnwxmE2M4WqSrcf73tj23VAXQA1B1R/n+kxufWcqFlIZp3KEAx
         V/6auR/eNi0NcC4jvD7X4PSjsjtu6dR6I2n3XKXHS9EHD2aueXaPx2+2TOi2rGOLhdUr
         p7gw==
X-Forwarded-Encrypted: i=1; AKwUvBz/EkTFaAXPg6kmOaVCNjrZl9qk3rvvtmxeBXp//xy6OCYn0R4h+Tb+ALvmcFQmfyzAuGM2@lists.yoctoproject.org
X-Gm-Message-State: AFuF++lM8r52YngzASqYMtStoOjsqGYt9ljk2rsbPKSHIqOnKyH1O8h3
	crOAbye+v3dwPR33JCCtx/5gWbSFoRYnHDtSZHaRz5k5M+V5DmzuU8PF
X-Gm-Gg: AYBFou3Cf751fLFLJTdExn4f97bWL0PIV9W39VxHQsBGNtGuNUaEqnyrMp07dXmg7yu
	zYPPAQbEGD7sqb+GlZCJPU2yBzpe7fQb1jDe/72I6FQNSrYy6xXdBu+jes+sEiHQCaAQK5BwCge
	TKPnjOa9On7RAPsXlWSOn0l3lsOsP6M1bNJ3luZJzwL5vCQhZPxj7QkJdKlM0hsrmuuOy8c0foa
	RazidAgVuVF0QJej2vYqP5RdbaOeTFcfTWULtTN+fP9YUf1uDsA8IXIhlmfrjgS5s1WIOvasvDf
	Smrk/+gAjX6lpfDl7EW0HG13RtMyA3OhGlShu4PjDZlm9217cb7ODzz1xuzx6AxNRpr51xTdb1e
	VaO3t3qatU9Bk4OEqTzAqJj+waiWZlC8IEZ7ojVdgKmS6hUoDE8a7J0O8h8I/go6gKKQ3u81GnC
	V720sN96PfkUQ65EsZMI0Oqj/DSJ6SIR+E2BROSe9c3BH+fEaZb8AuA3ewegPuQ8S9xINA4nKNP
	1HT0cGGESwE97sNxWIQwoJ6HqNqCQMC8Av3p69z5/7BLRk=
X-Received: by 2002:a05:600c:468d:b0:49f:f9d1:e618 with SMTP id 5b1f17b1804b1-49ff9d1e6b1mr32055175e9.17.1790430359439;
        Sat, 26 Sep 2026 06:45:59 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ffabc3f33sm38976225e9.4.2026.09.26.06.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:45:58 -0700 (PDT)
Message-ID: <52604c0a16ab13ed6ac8a567d7e22e731d164bf0.camel@gmail.com>
Subject: Re: [docs] [PATCH v2 0/5] dev-manual/devtool: ide-sdk doc rewrite
 and Mermaid diagrams
From: adrian.freihofer@gmail.com
To: paul@pbarker.dev, AdrianF <adrian.freihofer@siemens.com>, 
	docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com
Date: Sat, 26 Sep 2026 15:45:58 +0200
In-Reply-To: <8e8a2198ffc43898045566b07fef83c011ad9697.camel@pbarker.dev>
References: <20260924192929.907566-1-adrian.freihofer@siemens.com>
	 <8e8a2198ffc43898045566b07fef83c011ad9697.camel@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 26 Sep 2026 13:46:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10642

On Sat, 2026-09-26 at 14:21 +0100, Paul Barker via
lists.yoctoproject.org wrote:
> On Thu, 2026-09-24 at 21:29 +0200, AdrianF wrote:
> > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> >=20
> > Update the "devtool ide-sdk" section to reflect its current
> > behavior,
> > and fix outdated non-patch local file handling docs (5.1 change).
> >=20
> > Add the sphinxcontrib-mermaid Sphinx extension, add workflow/
> > architecture diagrams for "devtool ide-sdk", and convert the
> > existing
> > devtool add/modify/upgrade flow chart PNGs to Mermaid too.
> >=20
> > Diagrams render client-side via a CDN-hosted mermaid.js, so the
> > build
> > server needs no new dependency.
>=20
> Hi Adrian,
>=20
> Expecting clients to fetch the CDN-hosted mermaid.js breaks the
> ability
> to render the diagrams offline for local reading. We also generate
> PDF
> and ePub versions of the docs - would this change require CDN access
> to
> build those?
>=20
> We may be better carrying a minified copy of mermaid.js and setting
> mermaid_use_local [1].
>=20
> [1]:
> https://sphinxcontrib-mermaid-demo.readthedocs.io/en/latest/#mermaid-use-=
local

Hi Paul

That might be a good idea for the HTML case, but I was unsure how it
would work for PDF or EPUB outputs. It=E2=80=99s not possible to embed the
dynamic Mermaid rendering engine directly into a PDF or EPUB file.

For PDF and EPUB cases, the rendering needs to take place at Sphinx
build-time, which requires a JavaScript runtime on our build machines.
I had a quick chat with Antonin about this, and he mentioned that an
infrastructure change like this would need some evaluation.

We can actually support both formats seamlessly using the
sphinxcontrib-mermaid extension along with mermaid-cli (mmdc):

 * For HTML builds: Sphinx serves client-side JavaScript as planned,
   rendering diagrams in the reader's browser without extra build
   dependencies.
 * For PDF / EPUB builds: Sphinx automatically uses mermaid-cli
   (@mermaid-js/mermaid-cli) behind the scenes during build-time to
   rasterize/convert Mermaid blocks into static SVG or PNG images,
   embedding them directly into the output document.

On the infrastructure side, this requires adding Node.js and running
npm install -g @mermaid-js/mermaid-cli on the documentation build
runners/CI environment. Would this be feasible?

Best regards,
Adrian



>=20
> Best regards,
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#10641):
> https://lists.yoctoproject.org/g/docs/message/10641
> Mute This Topic: https://lists.yoctoproject.org/mt/121415542/4454582
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/docs/unsub=C2=A0[adrian.freihofer@gmail.=
com
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

