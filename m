Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D04FC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 15:39:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.16634.1743694745693039656
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Apr 2025 08:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JtuHJQNP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4394a823036so10186495e9.0
        for <docs@lists.yoctoproject.org>; Thu, 03 Apr 2025 08:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743694744; x=1744299544; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tjzc0xsAvksuEUBuCkfMUbQ2OhsyVanLaGBHu6eVH8g=;
        b=JtuHJQNPkfJhqTNZFD7ZbvRGTPODYZra3vkTWJQQh1KONsiMdSd3Z9n/cVH536msXk
         4nLtxRLQFXOU+e5SomiQ7+KcKV6fMIjAQ6qIAJ0M1mWHjv+29HF7aYaVlTr2M4gwfc5J
         KdY6zJyM25r4b2COHEpf1syRl8Y9Z0UfWKjmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743694744; x=1744299544;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjzc0xsAvksuEUBuCkfMUbQ2OhsyVanLaGBHu6eVH8g=;
        b=EuX/C9PGsAVr/0QoIQr4XE/MBX/yXXQCS3qAO8nmSxaq02UtjKo2WYGyqssGoenv5u
         Zfs5dmtmHTtyRrUpvCNLbRdH3yY9YpfR9+lR+ppTAvPDq12XfeDE3XfVQLu4vIwuJooZ
         q9qSb5XqNM+YAo5lmCf3KF9AXRSqOYqYcfTwdLKkVGpDyRMIAEcGqg4rpK6UahjNR73Y
         wRKQd/h6ZhhvMTFN4XgX5UWrVw2z/bosuJeNk+Vq1cngjF35zP+HypJ3QOn5uvk2JoKe
         ruAO4k9+FHodaonnKkPNoQmZYep13+7KEvCGYkHE7CYLzjkHwgzUXY/kMhNYwYeSCnBv
         GpUw==
X-Forwarded-Encrypted: i=1; AJvYcCUXkosq3ghHGQverwXkj6TQWYB9m/9wW/5J44eTaccP+UQYDDWtt6wgBRoaJ90kQ5c3kThm@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzMRp2pgEMcP45l76AoJcPm9QBTKfzCL2MllJQdU7TvZRIXV1ib
	bfO1Tsz3MNMMJNkcRZT6hBVkogIBGjt+EQpD+GAFY6GLY/rDX1JDmFjJE3rla58=
X-Gm-Gg: ASbGnctVG/3eSiBY2PvmFaZpTMGnPMPvLrUp229yb9+vXm0TWF8/ue9AgUPCVXJbCJP
	NL55Y6zJyGSGhYz0whCmVsckT7IZjuTL8ejIIfQD8CXcKHoh5eDuKI04X38vuDfl2PpCO4zWtM8
	nFTc2P5fUsJm92iUWfh4/nV7Vm7rlx3OcnAUb22O76uGOfZb0HuIhIY2nSipHpMEEU3HUzoXAGV
	5FRIFIBC7MIDCmOar0j3n/jDlaa3Qb+mHHF2Djv5uIcM9J2XEjLvBuv/4anTqWtSDiTpUrWhql1
	2rpNCuJv2iHczbcce1WexI0DJ6frRzrSPTETORIZRGoG7Kjr7qRU4QjPpmSXxFxSLCif05+8AbW
	xNXJ45H0TMMoYyXg6tgXFtkhzBwcphv4IKg==
X-Google-Smtp-Source: AGHT+IEIPbjwB+z6OiDXvFtC4ynKHiaazXq4P6TZSlSMEOY/4i5kOw26almUVCsvBWwbHpY77eYGrQ==
X-Received: by 2002:a05:600c:470f:b0:43c:e305:6d50 with SMTP id 5b1f17b1804b1-43eb5c95bf9mr65050025e9.24.1743694744022;
        Thu, 03 Apr 2025 08:39:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b5f:9de5:8de7:7270? ([2001:8b0:aba:5f3c:4b5f:9de5:8de7:7270])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec169abd7sm24887275e9.18.2025.04.03.08.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 08:39:03 -0700 (PDT)
Message-ID: <9c3af54f0c74af0b9d0887e0408fd591e936c4da.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 11/11]
 migration-guides/{migration,release-note}-5.2: update for 5.2 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>, antonin.godard@bootlin.com, 
	docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 03 Apr 2025 16:39:02 +0100
In-Reply-To: <37d9c34b-2932-4f1b-b7bb-33a5c5b9d585@cherry.de>
References: 
	<20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
	 <20250328-release-note-5-2-updates-2-v1-11-c913513e9140@bootlin.com>
	 <83f27b97-7352-469b-a6d2-975a32f59335@cherry.de>
	 <69ce733f89c726b7e673d399f215b8b6020deb15.camel@linuxfoundation.org>
	 <37d9c34b-2932-4f1b-b7bb-33a5c5b9d585@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Apr 2025 15:39:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6710

On Mon, 2025-03-31 at 10:32 +0200, Quentin Schulz wrote:
> Hi Richard,
>=20
> On 3/28/25 5:47 PM, Richard Purdie wrote:
> > On Fri, 2025-03-28 at 17:03 +0100, Quentin Schulz via
> > lists.yoctoproject.org wrote:
> > > Hi Antonin,
> > >=20
> > > On 3/28/25 2:07 PM, Antonin Godard via lists.yoctoproject.org
> > > wrote:
> > > > Document changes between 0e91a1dabf27 ("adwaita-icon-theme:
> > > > upgrade 47.0
> > > > -> 48.0") up to b3c21a23ad3a ("migration-guides/release-notes-
> > > > 5.2:
> > > > update for upcoming 5.2 release") in Poky.
> > > >=20
> > > > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > > > ---
> > > > =C2=A0=C2=A0 documentation/migration-guides/migration-5.2.rst=C2=A0=
=C2=A0 | 26
> > > > ++++++++++++++++++++++
> > > > =C2=A0=C2=A0 .../migration-guides/release-notes-5.2.rst=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 22
> > > > ++++++++++++++++++
> > > > =C2=A0=C2=A0 2 files changed, 48 insertions(+)
> > > >=20
> > > > diff --git a/documentation/migration-guides/migration-5.2.rst
> > > > b/documentation/migration-guides/migration-5.2.rst
> > > > index 59a2782f2..c54f054c7 100644
> > > > --- a/documentation/migration-guides/migration-5.2.rst
> > > > +++ b/documentation/migration-guides/migration-5.2.rst
> > > > @@ -178,6 +178,32 @@ This should now be replaced by::
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UBOOT_ENTRYPOINT ?=3D "0x20008000"
> > > > =C2=A0=C2=A0=20
> > > > +
> > > > +Git fetcher: support for multiple revisions per URL removed
> > > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > +
> > > > +The support for having multiple Git revisions per URL in
> > > > :term:`SRC_URI` was
> > > > +removed from BitBake, which means the following syntax is not
> > > > supported
> > > > +anymore::
> > > > +
> > > > +=C2=A0=C2=A0 SRC_URI =3D
> > > > "git://some.host/somepath;branch=3DbranchX,branchY;name=3DnameX,nam
> > > > eY"
> > > > +=C2=A0=C2=A0 SRCREV_nameX =3D "xxxxxxxxxxxxxxxxxxxx"
> > > > +=C2=A0=C2=A0 SRCREV_nameY =3D "yyyyyyyyyyyyyyyyyyyy"
> > > > +
> > > > +This was rarely used in the core repositories, and this
> > > > removal simplifies the
> > > > +code logic in several places.
> > > > +
> > >=20
> > > Can we suggest the user how to transition away from that? What
> > > was this
> > > even supposed to do?
> >=20
> > It would only have ever been useful with bare clones where there
> > wasn't
> > a checkout. The only user I know of used to be the kernel recipe
> > but
> > that no longer does this.
> >=20
>=20
> Ah yes, was doing my grep in git history from bitbake repo instead of
> poky :)
>=20
> It seems like what we did was split the code into a separate git=20
> repository but I assume we can do the same by having the same git
> repo,=20
> simply in a second SRC_URI entry.
>=20
> git log -p -G ";branch=3D.*,.*\""
>=20
> followed by a search for \.bb, \.inc in the pager returned=20
> c29aac6a8b5b417ad46f3cdf9c1a2d61c4f6cdd5 in poky.
>=20
> So I guess we can say:
>=20
> """
> If one of your recipes is still using this mechanism, you can split
> the=20
> code source fetching into two separate entries::
>=20
> =C2=A0=C2=A0=C2=A0 SRC_URI =3D "git://some.host/somepath;branch=3DbranchX=
;name=3DnameX"
> =C2=A0=C2=A0=C2=A0 SRC_URI +=3D "git://some.host/somepath;branch=3Dbranch=
Y;name=3DnameY"
> =C2=A0=C2=A0=C2=A0 SRCREV_nameX =3D "xxxxxxxxxxxxxxxxxxxx"
> =C2=A0=C2=A0=C2=A0 SRCREV_nameY =3D "yyyyyyyyyyyyyyyyyyyy"
>=20
> """
>=20
> (NOT tested).

Multiple revisions only worked with bareclones otherwise it wouldn't
know how to checkout the resulting code during unpack. The above has
the same issue, it wouldn't know how to unpack the resulting code.

With a bare clone the checkout is left to the recipe so it isn't an
issue in that case.

For that reason I think examples are probably not needed as very little
code should be using this (hopefully nothing).

Cheers,

Richard


