Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D53C282D2
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 13:30:45 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.52826.1741008643196425926
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 05:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D2jL2SKy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bbd711eedso9917545e9.3
        for <docs@lists.yoctoproject.org>; Mon, 03 Mar 2025 05:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741008641; x=1741613441; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qp58Om/uo6n0Ktmsab8Tvx8UDHsMwxPv+uYRKCO7Gm4=;
        b=D2jL2SKyodoeY8iH6dDHwDavC0VospS/EHgAHpbFGXAH1sWGLFBdtWxYbYQO/f4WsH
         gJWogHFkVUu1I6a1ELaLB8bvjTzDGr4lmBP+TvP2O3JQdfSrmOMBSbPd58rM5eh78Zym
         wqDNyMQ+ExweS/OoOLP1zd6V8GUp9wyF6CIKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741008641; x=1741613441;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qp58Om/uo6n0Ktmsab8Tvx8UDHsMwxPv+uYRKCO7Gm4=;
        b=cvzgbdLptLxHa4rFoyhnImiE2aezMAcoU9/I7LW78u+/wviyd4Hiv1itQgz9ox1U6A
         dKHiQ+6zdN2vv7EVn9LueUdXfa233kZAzHVqNCLV+JWOxVtKli++jLYAQJTjAME8PhyI
         LlG/cXeosCAX8/ffpDwccvoVLK/dCSajJtVFHAPeTdIzD9IUewTw0WXFQozAOTzPucl0
         a12WdNv3C9rP0dovqKQLAoux1Nut2uHjSp9LQtZFv6Rgah53zUhUlIyDZcoIihqi4EwL
         pcBk51FZo7hEvSlxMECryP6tmbNq+0C1hdbXxN+tppQ+Y5rqmYbkopaSIvW7Z338ixRf
         CUCw==
X-Forwarded-Encrypted: i=1; AJvYcCVat7ZEPjOw7e3uGytCpxv25Yes/chtWZUlh4qnGNrGitFyo7PP0EiWu+udllfFsZsgTtrs@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxAHJiaV19BhzNDSUCyvyrZx8TExDXAeb6KaSf553lLC8iiTsQY
	vyVA5fOr7Iq0CvzKmthQ5YcMbOd5eLCQ9w7/fN5yl+3O0DwX6+VX2DYQNv/OAeE=
X-Gm-Gg: ASbGnctqSyNlj0jxqdgTh3mexgFUDw/FI3+4bC39znb8JLdRO8xsu/9pNejZUfB+elt
	QV/79ATmuzk/+doYrCZSWRXt4N4d6sDLS3B3Cikry947W6Al+yBZw8AC2vIME1IqqKkOIK+lMak
	LRByGOMjTeTdgReC4yikC0OJd4kQvvwJ1Pu3Ngmbt6rXuF4kRL6AWCZAGTdQoD5xMLN+yoCOQUI
	+2v30nKEuaLgiBznJhoPBxAgZBhmuj765J52b3GiOi8RNekGaD/u3VVsWed2necJYGQTjsI1TNe
	OLa/xP8ZxPT9aP7OsUKiX29uao8UAhzhWCb9uYs9u4PGmhY5uqu9xlN2sXKWWE54ncSKrlpG7MH
	w5rrYXjeOeEiFmQMdvTJSU1v+dlE3j5s=
X-Google-Smtp-Source: AGHT+IEuU5CpZt7jFxzK7pzqXr+747Pf77wvO4G8dqdxFyNfojY2SONkVJw+bjEpJV36+716I40mgA==
X-Received: by 2002:a05:600c:4ec8:b0:439:6101:5440 with SMTP id 5b1f17b1804b1-43ba66df834mr118286695e9.8.1741008641436;
        Mon, 03 Mar 2025 05:30:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c70:3037:60d2:90d7? ([2001:8b0:aba:5f3c:c70:3037:60d2:90d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b8d6bc3fcsm129494295e9.0.2025.03.03.05.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:30:40 -0800 (PST)
Message-ID: <5ba58eac24f7a7500ed184e7795a057b97c4feec.camel@linuxfoundation.org>
Subject: Re: [bitbake-devel] [PATCH v4 1/4] fetch2/git: Add support for fast
 initial shallow fetch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Koch, Stefan" <stefan-koch@siemens.com>, "Ross.Burton@arm.com"
	 <Ross.Burton@arm.com>
Cc: "Sudler, Simon" <simon.sudler@siemens.com>, 
 "bitbake-devel@lists.openembedded.org"	
 <bitbake-devel@lists.openembedded.org>, "docs@lists.yoctoproject.org"	
 <docs@lists.yoctoproject.org>, "Kiszka, Jan" <jan.kiszka@siemens.com>, 
 "alex.kanavin@gmail.com"	 <alex.kanavin@gmail.com>,
 "quentin.schulz@cherry.de" <quentin.schulz@cherry.de>
Date: Mon, 03 Mar 2025 13:30:39 +0000
In-Reply-To: <af06c73f8f4b8b03cf84af9bd2c401b561a6a9db.camel@siemens.com>
References: <20250221172602.527924-1-stefan-koch@siemens.com>
		 <80041E02-3798-4BAD-86C3-D27381F6179C@arm.com>
	 <af06c73f8f4b8b03cf84af9bd2c401b561a6a9db.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Mar 2025 13:30:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6479

On Mon, 2025-03-03 at 13:24 +0000, Koch, Stefan wrote:
> On Thu, 2025-02-27 at 20:39 +0000, Ross Burton wrote:
> > On 21 Feb 2025, at 17:25, Koch, Stefan via lists.openembedded.org
> > <stefan-koch=3Dsiemens.com@lists.openembedded.org> wrote:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ud.shallow_skip_fast =3D
> > > d.getVar("BB_GIT_SHALLOW_SKIP_FAST") =3D=3D "1"
> >=20
> > Why would we need a way _from a recipe_ to say =E2=80=9Ceven though I a=
sked
> > for a shallow clone, don=E2=80=99t actually do a shallow clone=E2=80=9D=
?=C2=A0 If a recipe
> > doesn=E2=80=99t want to do a shallow clone, it can not set BB_GIT_SHALL=
OW=3D1.
> v5 patch set will not have `BB_GIT_SHALLOW_SKIP_FAST` anymore, but
> still have skip fast functionality, see mail from 2025-02-26 at 08:58
> +0000=C2=A0 sent by Richard.
> >=20
> > > +=C2=A0=C2=A0=C2=A0 @contextmanager
> > > +=C2=A0=C2=A0=C2=A0 def create_atomic(self, filename):
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """Create as a temp file =
and move atomically into position
> > > to avoid races"""
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd, tfile =3D
> > > tempfile.mkstemp(dir=3Dos.path.dirname(filename))
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 y=
ield tfile
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
mask =3D os.umask(0o666)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 o=
s.umask(umask)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 o=
s.chmod(tfile, (0o666 & ~umask))
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 o=
s.rename(tfile, filename)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 finally:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 o=
s.close(fd)
> >=20
> > I realise you=E2=80=99re just moving code, but atomically creating an e=
mpty
> > file seems pretty pointless.
> This is the bug report for that code snippet:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14441
>=20
> This was introduced by commit 3250bc950c56bd7dd2114df26e5a8e13b04ceac8:
> fetch2/git: Avoid races over mirror tarball creation
>=20
> Maybe, Richard can explain why this is needed...

It took me a minute to realise but it isn't an empty file, it is passed
through the yield, content added, *then* moved into position.

Cheers,

Richard



