Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7976FCD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 15:49:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11165.1780674591598460711
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 08:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FxYfnlaQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso12076225e9.2
        for <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 08:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780674590; x=1781279390; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x3MDQJFeJvvo3AaTyjqLrgV+j5UCAeDo4pr7V9bJh+E=;
        b=FxYfnlaQGgJ44acKu/XDRksBVhuvSM8OoXPoG8X6/W0BBGIw634FKUPRRqZqfQ6sog
         w/Ha67QZrYB/R5hFmxjtyICKcHeA0sFhKYJyDb9YZ/g6N+8+IkIP5ififeS187qGa+9Q
         LYeDAgfAbKn3A3322iZkRy6fteqlfU1qHeJqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780674590; x=1781279390;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x3MDQJFeJvvo3AaTyjqLrgV+j5UCAeDo4pr7V9bJh+E=;
        b=q/er0njqQXhzo9/rOIIpNs73UA9CYyPGks9zfpzN6NbW5iWfhI1FZvCn4pNPEL2eVe
         tjVfgTn4rasD1UKyOsHTWisGSXYJ2FYWVJpAbLG0SWeXOWI9ckIl90VmukRCCJS3xx1V
         +fQYzwyAi/HrBJcocEaq8Ww7pKhoRZXvaFta7FNzhig2OpPACzlDqFT31sZP5WwTo05N
         xKiLABi2Ji+Dd1YVLOs30oZx8zmTs+zOniPwzMCbRSgBWWVvW5Ejl3YgGGpGbC4YzZ7C
         oluaY+C5UvLedsB3ypAcKKFypJv0QPJmHqA+F0Z1/4d5skbw29kXJQPe4QARNYkgq7cx
         qJfA==
X-Forwarded-Encrypted: i=1; AFNElJ93ejyI3ogh62DHPn2unLab8JwhPSFsf6uolYRwxw/5miziWCKkqjBUbvlHBAM66Vf9L59P@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz6q2WGx6GNiCtyq10/Bg4+0iuGkq7Nrpx4dt806FBwjYfbjrvI
	zfGRxf9Iw1E/m/bgeI4tEYwX1VLxb0B8ggnb9TAYwl9I2ViP0YappZDdej6Nwl9yUJ4=
X-Gm-Gg: Acq92OHy45ZFtjcLHuwIIo7Tx2cdXyS/0t4R46+IF9kmcqVqR0hrvtlrQvtVeSs2uvP
	K71amP13+UNargsc5lp5qWnaODCyMB3d9C1xjFqjX/tWjufUixSNb6PJPxCjwgpRFqIC5W3lbug
	jWABz8tCq0i+rzEAM2Vw7WHlJkbX3vAKduqGMCXyFN2M+cEkNN2ty9enjrL5CWWkzOxvVrSudl+
	7I5jsyIh2G8MZbL0h420efLiNwArnbK8hQD56NNmmGPosEz+IUdOgK4b96INXA04Gu7ZXAwsLjF
	EYW044oxF2E6KwzalnXvwvKt6LLBAW+TXOH9mKpFwOlqWTqyCXIJ9bopktU8x8FlFSwnuruvrF+
	VoakwPCwc2W0r+cMDkmYLLy64iJj8jEizMPdj4QgriDktP/U4KXz8cc+tYQ2eU5x4W00srQh2Si
	uz3iUUVKBxdTVhELaxWlpZVSpgQmb6Q4NLOU8MujUFPpHneFB7ox0bOkZanabpX/gDWuplj7yEm
	1Scuv6DCVcqR/r5+CJC8A86u6k=
X-Received: by 2002:a05:600c:5394:b0:490:bada:6b15 with SMTP id 5b1f17b1804b1-490c25de6e3mr74758805e9.17.1780674589864;
        Fri, 05 Jun 2026 08:49:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:176b:6db2:d527:85f4? ([2001:8b0:aba:5f3c:176b:6db2:d527:85f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d30eeasm51822175e9.1.2026.06.05.08.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 08:49:49 -0700 (PDT)
Message-ID: <4f5e74f5e90c8eac3eac7c4a590455735c649ab7.camel@linuxfoundation.org>
Subject: Re: [docs] "Required Variables" aren't really "required"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: antonin.godard@bootlin.com, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Fri, 05 Jun 2026 16:49:48 +0100
In-Reply-To: <e8e3de5e-8cd0-3a86-92a5-11bc0e943ecd@crashcourse.ca>
References: <8571c31b-3d25-c00c-df7a-68b61c48cb63@crashcourse.ca>
	   <DJ167JWTFOGI.23YVKLIRK8LG8@bootlin.com>
	   <3091fc6f-a221-8af6-c844-4ffca0bd0ecd@crashcourse.ca>
	  <059b9f24b250f12dfd262d2b44d3afab53d1bdce.camel@linuxfoundation.org>
	  <3bc0de42-2b65-212b-c8ac-39898b4fc0e4@crashcourse.ca>
	 <b5010b6b2373955c252760ef900d860b3480d85d.camel@linuxfoundation.org>
	 <e8e3de5e-8cd0-3a86-92a5-11bc0e943ecd@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 15:49:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9615

On Fri, 2026-06-05 at 11:38 -0400, Robert P. J. Day wrote:
> On Fri, 5 Jun 2026, Richard Purdie wrote:
>=20
> > On Fri, 2026-06-05 at 11:12 -0400, Robert P. J. Day wrote:
> > > =C2=A0 i should point out that the same inconsistency about required
> > > versus
> > > suggested occurs here:
> > >=20
> > > https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.ht=
ml#patch-upstream-status
> > >=20
> > > where it claims that the OE system "requires" patch upstream
> > > status,
> > > but follows that up with that each patch "should" provide
> > > detailed
> > > information. i deleted a few patch "Upstream-Status" lines and
> > > parsing
> > > worked just fine.
> >=20
> > I hinted at this but let me be more specific. Try a build ;-)
> >=20
> > OE-Core definitely requires Upstream-Status.
>=20
> =C2=A0 i did ... so non-OE-Core patches apparently have no such
> requirement.

and did you try it with an OE-Core recipe?

Cheers,

Richard

