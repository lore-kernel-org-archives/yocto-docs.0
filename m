Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73807C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 14:39:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.52793.1739803141129852762
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 06:39:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GXjnWWko;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so46341895e9.1
        for <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 06:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739803139; x=1740407939; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ViUhqonXNEy+cf3n0jLZ9asoo9iUUSbxnKNdqZehVzU=;
        b=GXjnWWkoEssmTpAxka86zc1TPuWUoTDuirwxiNAtWr6OqJ+vc2gThzeO5bVgUPOST1
         r/GyHQA7IyRdVr///2z8pDdxpKNsG/4dPo8By4rmGyoHuT+r8P9pFqVqBel3s3kW5fie
         WVaodN6Noxez4cAv615+Gtw88Nr0qiqixKTek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739803139; x=1740407939;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ViUhqonXNEy+cf3n0jLZ9asoo9iUUSbxnKNdqZehVzU=;
        b=mmPU7jfFk79Ps9vZsx/EvvGNoUwP5POySO8P6xFBt0agxAlkrnSPpBFhSG3wcs6dCQ
         4K+H6kJsgoZX6gUXeyVK2pBwIXjZPBFrUxFJzrh4QOSs2nEDjvG/nR0miQ+NKeuBkeNh
         flGRpN0FePKOoOU2V3I0TMtgFkdaRhTYNs7Aj092eEeslUx+cgOR74QEiwjc2kHCQVF7
         el4YMwzegFPTeqClqepgiDMT+ecfspnqnWKKXQB3/d6854XJi0pIkk3bhVtuinzPNPoZ
         sZM1vopKDWiYC/eUdx9ZPzXQ1ncMOIyW5AGOFEbtkuACfDa4+N4gZ/pI8xgdxC53wi3j
         Yprg==
X-Forwarded-Encrypted: i=1; AJvYcCX9oVU9czQBV7c40dxgtHSR7dIop6tbJ7tXRddGLbyve5fg3/Bh6gA36yK2EN/ZqjKbkEDM@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxSIf1vLYOh6vDlk8x6TFMnfRM+J/4UvkXjXLv9iEwJIbC2DJWs
	pA5KQAA0gDUReQBxfQSBRzOcaB0vJXQDTUYmfuOzkiZz5F89q3xT3r+vLEvqia0=
X-Gm-Gg: ASbGncstWUOVmP0wUUb6WwvYU4swOofD4QJrL5vdiB99C40hRB1w0S5pIB2f59PU7RG
	913IYYacyPhog8M+fMn4t13ZMka+krjPVmHgto+X9Zyn3ppQdOOVVK5Ysro3Rxxn2QplEF+WT/W
	mkGeuvB3x4lckD0I32Xi0CPKYSAINlAqs8le1pg+T1d2ZCy4m4ncbrWtIqgSvd9BBfGjeWrmkQd
	iZ+KWE+1yEFwsBrDZFCq0CJWZ+yQyXhaVhyRpW41oqNyFGUagkyWPhwsgJgorld7SmVxhBpbE51
	CPoT9AJFJek5y2wkR6FrK6KVEOR8iydAlsWzVJIrxPtF0Rvh9oHkjHC6diuppDtw3diUyrSgQ3N
	3hXgh
X-Google-Smtp-Source: AGHT+IFB000lwHoWNb+asTLFdtwb1uJ5w6Vi4AcmwH+RAvbss5e+M4RZskqJ6E0fu+7ldBYppEmz9g==
X-Received: by 2002:a05:600c:1d95:b0:439:8829:aa69 with SMTP id 5b1f17b1804b1-4398829abd0mr21856175e9.17.1739803139531;
        Mon, 17 Feb 2025 06:38:59 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:12f2:fcaa:2c32:45fc? ([2001:8b0:aba:5f3c:12f2:fcaa:2c32:45fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439872b5a46sm22675995e9.32.2025.02.17.06.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:38:58 -0800 (PST)
Message-ID: <f597acbb816a2eabe39971f5f6765610420967fb.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] contributor-guide/submit-changes: add policy on
 AI generated code
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: antonin.godard@bootlin.com, Quentin Schulz <quentin.schulz@cherry.de>, 
	docs@lists.yoctoproject.org
Cc: tsc <tsc@lists.openembedded.org>, Yocto TSC
 <tsc@lists.yoctoproject.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Feb 2025 14:38:58 +0000
In-Reply-To: <D7USP7RNYI68.2YJEYK482TX3C@bootlin.com>
References: <20250212-ai-policy-v1-1-c9cc7510e317@bootlin.com>
	 <178a6b27-d616-4fd0-b675-ba4f2767656b@cherry.de>
	 <3bf717794dcd19ba91262b1037daf6c6118f1725.camel@linuxfoundation.org>
	 <D7USP7RNYI68.2YJEYK482TX3C@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 14:39:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6392

On Mon, 2025-02-17 at 15:37 +0100, Antonin Godard via
lists.openembedded.org wrote:
> Hi Richard,
>=20
> On Mon Feb 17, 2025 at 3:30 PM CET, Richard Purdie wrote:
> > On Mon, 2025-02-17 at 12:20 +0100, Quentin Schulz wrote:
> > > > +indication that this code was AI generated.
> > > > +
> > > > +For example, here is a properly formatted commit message::
> > > > +
> > > > +=C2=A0=C2=A0 component: Add the ability to ...
> > > > +
> > > > +=C2=A0=C2=A0 AI-Generated: Uses GitHub Copilot
> > > > +
> > > > +=C2=A0=C2=A0 Signed-off-by: Your Name <your.name@domain>
> > > > +
> > > > +The ``Signed-off-by`` line must be written by you, and not the
> > > > AI helper.
> > > > +As a reminder, when contributing a change, your ``Signed-off-
> > > > by`` line is
> > > > +required and the stipulations in the `Developer's Statement of
> > > > Origin
> > > > +1.1 <https://developercertificate.org/>`__ still apply.
> > > > +
> > > > +Additionally, you must stipulate AI contributions conform to
> > > > the Linux
> > > > +Foundation policy, specifically:
> > > > +
> > >=20
> > > This is exactly the content of the link provided above. I'm not
> > > sure we=20
> > > should duplicate it? E.g. it could be updated and we could then
> > > have=20
> > > conflicting instructions there. Should we say which one takes
> > > precedence=20
> > > when there can be a conflict?
> >=20
> > It was deliberately duplicated so that if it changes we know what
> > it
> > said previously. This version here is definitive.
>=20
> I'm not sure if your comment applies to the entire patch, or just the
> bullet points. What should I leave as-is?

I meant that we'd deliberately duplicated the two bullet points from
the original document/link and that we'd want to continue to do that. I
was giving a reason for the duplication to Quentin.

Cheers,

Richard

