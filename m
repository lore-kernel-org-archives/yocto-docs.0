Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDB6C021AA
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 14:30:40 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.52788.1739802638504622807
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 06:30:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B4CqHLTc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f325dd90eso1435315f8f.3
        for <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 06:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739802636; x=1740407436; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zangcEZzfApJD1c9x0nDXNkrxkjij8E+kB6IHMpvXlk=;
        b=B4CqHLTcuAYg9Y/SH9WNaUX/aWszosbLAB5h3OWm4dFlggx6KKV1CQLxyFvdoyQcom
         q1++CLOTtgCONcb9IDvS/Srl9ASyA/azomhPHIsGuUk8V6/2nuUxkmS5xc0v7JXL7/Da
         lcqPaREk9JF0rY60Ly72GVg+hMpBGsJKM3c7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802636; x=1740407436;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zangcEZzfApJD1c9x0nDXNkrxkjij8E+kB6IHMpvXlk=;
        b=e1KHJ9krs+nOlaDeRADnC8lMgrGgq11VC4jlg7SCHQbjsvLn+LXALPhX18YzfmwGVm
         4MH+cw4w0FNC4XmPYvxmOPvtlCHkG1TH6sAw2+79lFH9YV6r0czqkwgz0B2U01HriF4M
         xZHdPZip0hctBGFNW7dDT38YuhPDdrUNXityFCAx9U5o3yFy+B88NsnaTLrcAlW377Lo
         XhozzKr9ud5KeplTJEpkdDa/iBer5TMgK9CeSh60OeRNGyZR/CH07mRQGdfhbWgrtIpp
         TjJGt6eMqucEQfAAosAXgMonQbRoGHx1r/SOqZxMfC3hbrqivBz6YgDYNCYHCxC6xgUo
         eFLg==
X-Forwarded-Encrypted: i=1; AJvYcCWkJTD0xZiHcUksHfqnM4ZrkbZ4RdR1iftP9BzBqbZ1fO6iJg+kox1bGso5ruojh8QvBm36@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyBVH649VM3GUmaXdRwrLjXajH7qWP4GAnsMe83xlFjnOIDBZVe
	GNge7QWDcV3bvLttsQrrqTLOmcIGnTXro1htnYXg1fv79b7tVsNMFddhcS/nb3w=
X-Gm-Gg: ASbGncvGEcOXl/GYLmHWwg+U3Vb+xiN/WW5IYSbK9JxmxIXvBwADNwlw0SPHairAmzJ
	ORyxj6pnDISijW73nUz/urH+oa56XDmFRwZC05cw3SP/attYyOpjUasael3mwQcomVEv9tCPYkT
	pU6/gI6gxUBYBzCbJORWiaAe+rmju0svu8qH8csgCLmMtxJ48uwvR7i/9f56Dzkr2s7YO9JsULs
	02DL+sriXsfvUHyELC7MxPWqijdyHe9kFoBlHKdxpWZk6fPUf52wm4zZ24ocK6IwTV+35wBB3sR
	rD6kA7nrJAWZw28cETVQ/W3K0KtDIj4nNvhYjlqLhrHCYHpSNI1IN0kKwgp320TlLZqp5wWjQmv
	2De1x
X-Google-Smtp-Source: AGHT+IFW3xqR3JhSbkq8TOpAgKUqM9kbCOlg4mngBsRFdtudOpL0cwItRRbP04nxH20kRne/rQwiUw==
X-Received: by 2002:a5d:518b:0:b0:38f:2f88:b034 with SMTP id ffacd0b85a97d-38f33f4e284mr7461066f8f.42.1739802636404;
        Mon, 17 Feb 2025 06:30:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:12f2:fcaa:2c32:45fc? ([2001:8b0:aba:5f3c:12f2:fcaa:2c32:45fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccdabsm12387811f8f.28.2025.02.17.06.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:30:35 -0800 (PST)
Message-ID: <3bf717794dcd19ba91262b1037daf6c6118f1725.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] contributor-guide/submit-changes: add policy on
 AI generated code
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>, antonin.godard@bootlin.com, 
	docs@lists.yoctoproject.org
Cc: tsc <tsc@lists.openembedded.org>, Yocto TSC
 <tsc@lists.yoctoproject.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Feb 2025 14:30:33 +0000
In-Reply-To: <178a6b27-d616-4fd0-b675-ba4f2767656b@cherry.de>
References: <20250212-ai-policy-v1-1-c9cc7510e317@bootlin.com>
	 <178a6b27-d616-4fd0-b675-ba4f2767656b@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 14:30:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6389

On Mon, 2025-02-17 at 12:20 +0100, Quentin Schulz wrote:
> > +indication that this code was AI generated.
> > +
> > +For example, here is a properly formatted commit message::
> > +
> > +=C2=A0=C2=A0 component: Add the ability to ...
> > +
> > +=C2=A0=C2=A0 AI-Generated: Uses GitHub Copilot
> > +
> > +=C2=A0=C2=A0 Signed-off-by: Your Name <your.name@domain>
> > +
> > +The ``Signed-off-by`` line must be written by you, and not the AI help=
er.
> > +As a reminder, when contributing a change, your ``Signed-off-by`` line=
 is
> > +required and the stipulations in the `Developer's Statement of Origin
> > +1.1 <https://developercertificate.org/>`__ still apply.
> > +
> > +Additionally, you must stipulate AI contributions conform to the Linux
> > +Foundation policy, specifically:
> > +
>=20
> This is exactly the content of the link provided above. I'm not sure we=
=20
> should duplicate it? E.g. it could be updated and we could then have=20
> conflicting instructions there. Should we say which one takes precedence=
=20
> when there can be a conflict?

It was deliberately duplicated so that if it changes we know what it
said previously. This version here is definitive.

Cheers,

Richard



