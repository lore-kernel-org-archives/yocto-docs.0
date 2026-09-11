Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00B3C88E4C
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 08:11:42 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34545.1789114299948550292
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 01:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RgoIESRV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48436216a98so367736f8f.0
        for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 01:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789114298; x=1789719098; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OskD5y5EHttXfQjqgMZKJcWP2oLe4XDX30LewOkbKmY=;
        b=RgoIESRV0JgS/YwXDCLre9FKSSO18FG5QOwKkI7pB2TSCZOHK9OtH/uLzMRxL16RFF
         otu3pc14lXVMVXvcSpsJnGKBOgJ5+YNiyDSDdyhqfmQx8aPtpC1RiSqN1KvFgMQUmlvt
         2S+7I4bnm4lN65HmeLEIZwXOnCRjfknXmusF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114298; x=1789719098;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OskD5y5EHttXfQjqgMZKJcWP2oLe4XDX30LewOkbKmY=;
        b=qhIP5INx/PqrlzruYPTS2Eswg/Ou8+ESMRXKe0IFSPMdt0mzAYw7KecCkrOdFzxy9b
         0V0Hm6KWYMJ8WGo86PK+5xhqk4JcaIf4nvB7xCaHsjGRruwUINGQw+J3smhDkyMCFJmq
         ofJEKlM/8QpFrBsjUoxdFgTBnShO8qMWhMHSDYewilU3wgncjmQkbp1LMSY1fK0rDd6L
         La55QtpIaqF8Bedf0UmyYawfKr1xOJZOZwbdvtm02h97GQiFALDwRm+E4n0A+QxRmmle
         /om1XjJgjHTobkrJBVRHnHbKLeLg1t4KWXYRGdU/tZ3uTkaHjLWBJcnfmw3hZ9CrYGCO
         XHgw==
X-Forwarded-Encrypted: i=1; AKwUvByvsSIbS8pbVpB9Vwm63v6nCihA5EndsFYJwtC3qXkvmEB+wHEbA4AJ8SGHij4Co855e7/r@lists.yoctoproject.org
X-Gm-Message-State: AFuF++mFbSYy+TttbYU8extXaj71/S0sxEjFrVwPy6b7UEC4UMjxpqMj
	jCllTrkrKraSCpFZ/vveoywWx9M/YrQysXPj9rJNXGhjkmRP6ce62d3JITqPDl9XlLQ=
X-Gm-Gg: AYBFou3AxCq4rYLGkTTfd0eCuc9Llu+I3rZo7ouQfVpQ9VEga6GAWyeUHc79u51m7bc
	XA0MuQ2kAvQfTplm6X2dfWZcxp3+zAbIQT4Dg6V6QgvFgrD8icyetEwSR9Qe65Ni8YFtFCVd9bL
	7eNfds3Y80ZLZzVhEpbbaXLoFjNFmgmuLI91Mw17Pu5lWlFrB9bjCIpzMEVdy5ifFb6onmbjR5L
	ULZ1+kP5zCyWVZRYVJLduVnRs3qJKKtOx65cGko04aP5WAjud8AQcvvuI2nX5Qou2FMzfKIB1DR
	aY4x2illt9mzdpm4JSJpYBNsliviMP26hoQmQKMV8CHe8DvxE1fLaHfBHt/QNzz96J0DjwnMfAZ
	dRUIHtAnWZugHdQysyl78Dsj2+U2vNDMdW5NzwOD5SYt7jI/TbV5UH+aiT97eRjV6svMqf17t3r
	jNxbQuR1hDK0gowAErSvpaQGlX+61vycl0jDg8MiVz1MLW8TjKbO13WvB3v/0wGuSFqHgQQxUNQ
	Y+VJwqu4BiMOyo/QQ687euD81M9OoZURISIa8g00IYReTUTVMzw+pIuQIOjuMuv
X-Received: by 2002:a05:6000:2686:b0:484:416f:9f0f with SMTP id ffacd0b85a97d-486eafd604bmr3134104f8f.2.1789114297813;
        Fri, 11 Sep 2026 01:11:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c0d0:78c1:8753:128b? ([2001:8b0:aba:5f3c:c0d0:78c1:8753:128b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm4425828f8f.23.2026.09.11.01.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:11:37 -0700 (PDT)
Message-ID: <77bf65b0b522381206757245ed2f8b224c6fcde5.camel@linuxfoundation.org>
Subject: Re: [docs] Does Ubuntu 24.04 and newer still require AppArmor
 tweaking to run bitbake?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: antonin.godard@bootlin.com, "Robert P. J. Day" <rpjday@crashcourse.ca>, 
 YP docs mailing list <docs@lists.yoctoproject.org>
Date: Fri, 11 Sep 2026 09:11:36 +0100
In-Reply-To: <DLCBCIBSXUHT.2SR3V23FN8VPD@bootlin.com>
References: <ec2658dc-005e-f6cc-d64e-0a1c15e992a7@crashcourse.ca>
	 <DLCBCIBSXUHT.2SR3V23FN8VPD@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 08:11:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10451

On Fri, 2026-09-11 at 09:36 +0200, Antonin Godard via lists.yoctoproject.or=
g wrote:
> Hi,
>=20
> On Thu Sep 10, 2026 at 2:57 PM CEST, Robert P. J. Day wrote:
> >=20
> > =C2=A0 I use stock Debian so I haven't needed to mess with this, but Ub=
untu
> > once had this issue with AppArmor:
> >=20
> > https://developerwiki.proventusnova.com/Error:_BitBake_+_AppArmor_User_=
Namespace_Restriction_Fix
> >=20
> > If that's still a problem, it doesn't seem to be mentioned in the
> > docs.
>=20
> I don't have a running Ubuntu 26.04 distribution but I would say it is st=
ill the
> case if 26.04 is still running AppArmor.

I can confirm users do hit this on Ubuntu systems, I've run into this mysel=
f.

Cheers,

Richard

