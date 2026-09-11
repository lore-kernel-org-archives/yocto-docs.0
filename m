Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF297C88E45
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 13:46:20 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39810.1789134376525531372
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 06:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=igF4uUB0;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so6166065e9.1
        for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 06:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789134375; x=1789739175; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/p+Um0xSPO8A5MHZNB+pJJ9vUmgF7zavhReOcqMIrGM=;
        b=igF4uUB0IqXRnF4UJHhKKfl7+2pElTMCGCJq+BN4JkCWAcDhpn9SLCMTqtfDWvBYUh
         BCqB1KFYCtmDdkOiQ0UD4CWIiCTV/DnU9l4u0JH8wHDRHlGxjF5rEvLgss8IalY98LDA
         tSTJ9yK48PMWB0y4L5U2fOg9LK156nd34vSw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134375; x=1789739175;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/p+Um0xSPO8A5MHZNB+pJJ9vUmgF7zavhReOcqMIrGM=;
        b=XYwwuEpNANR8q4knAJ/zSg/rarh15JOjpa7OoYIzQJJ3RC57VZOZkmNbLE0LKWHPmV
         0JBq4yktoL6LmLL/h7H5exeHDWpCiF56gYf2x7pC9CgP+raf28RRQTgVLBBPeyOsvZod
         u26+BcQlDP35PqBCym2Pr6qUK35OfM2ghShjAMyGD+Di6kQwM/sPdZtsr9LqiVtulGMU
         +g0jDKUjo/p4qPMMaLec9C+DZB/7cl9PuXykVubyWd1XRTcNSpmocAapGe4qLrqjF/g7
         40DPnPootqwum4qVjXnebxIoj1uZT3VS5SonMH1BFyFZ0StUBhlgewk37WCDd/fQPemH
         4TzA==
X-Gm-Message-State: AFuF++nXIh4Btyc7UTqHK5H7cequDGnoejHL3OT3jlIhK1cWW+jKhQOE
	wsH2uHcHd38N2wbg6HSynBLQmQGdeaId+H9/Kf/ZINEK+0FxrVZUehV8Yn3JJZqOlj8=
X-Gm-Gg: AYBFou1TvmT/VQjM2Oh35Sd1mgqy4Cxm+AL2ykQwhT0+zgD2PGeo+8JTCVH93UtAyUH
	3bjr05jcDYhkWBbwv8K3ry+hCTYKtX+rSk9PPAbyFIuVf645JWjNqkExwDXxa1pHorTQGF50Vx+
	p/GajWVuZUtquXhsBau8FXk/Tk9mN9kO9gaO436FR4pB5SZ/psfc594G3kQEw6IihE8WZLleB+0
	FRyHqTscPxawxhzBHtbXbiE8y3c1I8SfaOedqoznwAEhtaZWCmgGO3j+fYeRh8jwbe3OYCjZjtD
	vMMuYcpCVZIluCQZisVoRf+87mbktHwrUNzCT2EvOABgA9Gk99EdTTelpsFCogFy2kUuAgtfkqV
	Nj0K3FJtK0rDFGYX3llkG7J3hMlkwNCIrIjbF5oR+pchc9u8kgBjGC5SpGt9f8XdkwGW1Mc9Sm5
	WdReeh2JF+oBTP/IBM1hx0YVvz5dHv59RBeTs/21VQ8bnS+U23/9Iy7bLvfOcDXoOPh5OsKrRpt
	LkMcABQdj2hjpey6/QBWMlMxgFqopK6avos9WiFNnzGBoPUK9SWK/Qfadg4ryAM
X-Received: by 2002:a05:600c:3494:b0:49c:e3c3:5efd with SMTP id 5b1f17b1804b1-49e619aab42mr117168055e9.9.1789134374657;
        Fri, 11 Sep 2026 06:46:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c0d0:78c1:8753:128b? ([2001:8b0:aba:5f3c:c0d0:78c1:8753:128b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a7a686sm57129465e9.1.2026.09.11.06.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:46:13 -0700 (PDT)
Message-ID: <a1ade29f24430238de77852ca5a8045e774a7d75.camel@linuxfoundation.org>
Subject: Re: [docs] Does Ubuntu 24.04 and newer still require AppArmor
 tweaking to run bitbake?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, antonin.godard@bootlin.com
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Fri, 11 Sep 2026 14:46:13 +0100
In-Reply-To: <f983a674-d30d-7659-45f8-ac32a1187c41@crashcourse.ca>
References: <ec2658dc-005e-f6cc-d64e-0a1c15e992a7@crashcourse.ca>
	 <DLCBCIBSXUHT.2SR3V23FN8VPD@bootlin.com>
	 <f983a674-d30d-7659-45f8-ac32a1187c41@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 13:46:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10453

On Fri, 2026-09-11 at 05:16 -0400, Robert P. J. Day via
lists.yoctoproject.org wrote:
> On Fri, 11 Sep 2026, Antonin Godard via lists.yoctoproject.org wrote:
>=20
> > Hi,
> >=20
> > On Thu Sep 10, 2026 at 2:57 PM CEST, Robert P. J. Day wrote:
> > >=20
> > > =C2=A0 I use stock Debian so I haven't needed to mess with this, but
> > > Ubuntu
> > > once had this issue with AppArmor:
> > >=20
> > > https://developerwiki.proventusnova.com/Error:_BitBake_+_AppArmor_Use=
r_Namespace_Restriction_Fix
> > >=20
> > > If that's still a problem, it doesn't seem to be mentioned in the
> > > docs.
> >=20
> > I don't have a running Ubuntu 26.04 distribution but I would say it
> > is still the
> > case if 26.04 is still running AppArmor.
> >=20
> > Users will face the same error as before which is:
> >=20
> > =C2=A0 bb.fatal("User namespaces are not usable by BitBake, possibly du=
e
> > to AppArmor.\n"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "See
> > https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-release-no=
tes/39890#unprivileged-user-namespace-restrictions
> > =C2=A0for more information.")
> >=20
> > In OE-Core's meta/lib/oe/sanity.py.
> >=20
> > This sounds like something we could say in the docs. Would you mind
> > sending a
> > patch for that?
>=20
> =C2=A0 seems to me that the proper place for this would be a "warning"
> admonition at the tail end of this section:
>=20
> https://docs.yoctoproject.org/ref-manual/system-requirements.html#support=
ed-linux-distributions
>=20
> i wouldn't want to get into incredible detail there, just point out
> that starting with ubuntu 24.04, you would get that namespaces error,
> then refer the reader to that discourse link for the solution. does
> that sound adequate? i don't think the YP docs need to reproduce the
> solution in its entirety.

This is important enough I think we should have it documented
ourselves, not externally where it could disappear.

Cheers,

Richard

