Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A882C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 11:32:49 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.21921.1747913565794459385
 for <docs@lists.yoctoproject.org>;
 Thu, 22 May 2025 04:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IZfwMp//;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfe574976so57626065e9.1
        for <docs@lists.yoctoproject.org>; Thu, 22 May 2025 04:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747913564; x=1748518364; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=akaW5aEOwbT/pqncYSA992LHWEFUKuS49ecZAWZmAak=;
        b=IZfwMp//6OfDeGn7B369EI8hykwgC3QK4kHlJfx74YgdSQzr31ZQ6CVcP3Lju3n2RZ
         +barySG8QlM6rOiFl1LTS+2fFzAlZZxTQ/ik/WOpzHgfHENQzdqVUc4Nuc7EsSdSIgsS
         eFVa06FfoTMjaxnQE7w6xN/fin781h0HIFkPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747913564; x=1748518364;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=akaW5aEOwbT/pqncYSA992LHWEFUKuS49ecZAWZmAak=;
        b=ogJ48K45rdFMB4L3LYcYFEr2DP71mnsDs8HvB6f891sdAjM8Grpkm9XPbS40yGRWGA
         3vKOa3fu93nQtKmZs+YMFDqPYqTD2NY7pVT/pz08dWtebJM/Jjkj7B/XQkNwbHFwC7jl
         cZuVAUL2Eeq++Ofot2+iDMzkMcXXnV5uwnIWRpdBTZWaQ9YV34lm7HyHwcN4W+Zk0UWF
         LsLkIoz26qykmDEI3li3S3tiHP1k3wH7/+a+PJV/vFgAhn0xzaZuWtezU+vveFFSgnn1
         aAvvYA8GA2mJHwImRPf9AookV0CAWU0y9+p1p90rSHLSv6ircpBc3HirpKthzIJMO9Nn
         MfZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3y+gNRbjru2MpCHeZGBiwnLvhcYSCyJHoEOO+EBc03wjiycHKcj3cAMagrGmBBaX7/ePf@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yw9c7nQBJxAXXgrFxdGDQB1jnBRHpzmZGz4iXwi3GIZe5rxeum/
	ai+K9biibF051ZFZQ4+aOthn0Z2mT7rkSFiYtEZwyQigc8U49EQzOjBqGZNWSPctL+Y=
X-Gm-Gg: ASbGnctAD0k+4n7VHOMIGzUzxZMaEQhxL3XkgKsECACJJycQvRmyB3/kABDpCjr0sJO
	t3aIk5EAaFQ0ZfyAZLHA77nVFnDqOz7EIZAu9IlJpYzqGOgSwuNf60yJ0qvemlYoIO8RTUXvIpY
	Jw6Lv6tjrJzbAkuI+I0sYWHR4Fx53eoOmyK6tA37hfegOOhrFbRAST8mFu22RtFSAMe7geCB+UU
	jk/D2ssCKkW9C7GThKAc8ygnC7R33xhuOM9diHY0LvMydOvP33M+cUIf3KFDWvHvg3UNJdvlRoD
	EjbSzuhVWpTSf7VEN9oMY0jfXLViVeXeD/4r8sisaQlSepJrpMG4qQivfBpLomTOBqbieE9xie6
	pcDB/p92ofTGqEEM598zDWCW6UIO1ZkIMTUp+SpHv
X-Google-Smtp-Source: AGHT+IELeM3/uMk+/q2R8lTYOwSNRRVtuFighpwE+693hwNVbk8SM7KEpxDeiqYWm3ZvcEAUTPMLNQ==
X-Received: by 2002:a05:600c:c0da:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-442fe667ec9mr188236635e9.29.1747913563812;
        Thu, 22 May 2025 04:32:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f7cf:689b:6e57:f0de? ([2001:8b0:aba:5f3c:f7cf:689b:6e57:f0de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-448ba3d8facsm80323255e9.6.2025.05.22.04.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:32:43 -0700 (PDT)
Message-ID: <b1e217227e179aa3789e0fd3263da04e14966c0d.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] fetch2: Ensure a valid symlink in `PREMIRRORS` case
 when using shallow cloning
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Koch, Stefan" <stefan-koch@siemens.com>, 
 "bitbake-devel@lists.openembedded.org"
	 <bitbake-devel@lists.openembedded.org>
Cc: "quentin.schulz@cherry.de" <quentin.schulz@cherry.de>, "Kiszka, Jan"	
 <jan.kiszka@siemens.com>, "docs@lists.yoctoproject.org"	
 <docs@lists.yoctoproject.org>, "liezhi.yang@windriver.com"	
 <liezhi.yang@windriver.com>, "niqingliang2003@gmail.com"	
 <niqingliang2003@gmail.com>, "alex.kanavin@gmail.com"
 <alex.kanavin@gmail.com>
Date: Thu, 22 May 2025 12:32:42 +0100
In-Reply-To: <52082b629ebcc83f94f2768620a2867a1f027059.camel@siemens.com>
References: <20250521163311.2745308-1-stefan-koch@siemens.com>
		 <d11158333f8ac0f2d6525e593ba7dd0ce6a57369.camel@linuxfoundation.org>
	 <52082b629ebcc83f94f2768620a2867a1f027059.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 May 2025 11:32:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6880

On Thu, 2025-05-22 at 11:24 +0000, Koch, Stefan wrote:
> On Thu, 2025-05-22 at 12:12 +0100, Richard Purdie wrote:
> > On Wed, 2025-05-21 at 18:33 +0200, Stefan Koch wrote:
> > > - Since `ud.path` contains in that case the `PREMIRRORS` prefix
> > > path,
> > > =C2=A0 this change ensures that a correct symlink is set up.
> > >=20
> > > Signed-off-by: Stefan Koch <stefan-koch@siemens.com>
> > > ---
> > > =C2=A0lib/bb/fetch2/__init__.py | 5 +++++
> > > =C2=A01 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/lib/bb/fetch2/__init__.py
> > > b/lib/bb/fetch2/__init__.py
> > > index 2de4f4f8c..052505456 100644
> > > --- a/lib/bb/fetch2/__init__.py
> > > +++ b/lib/bb/fetch2/__init__.py
> > > @@ -1117,7 +1117,12 @@ def try_mirror_url(fetch, origud, ud, ld,
> > > check =3D False):
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 origud.method.build_mir=
ror_data(origud, ld)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return origud.localpath
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Otherwise the resu=
lt is a local file:// and we symlink
> > > to it
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # This could also be a li=
nk to a shallow archive
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ensure_symlink(ud.lo=
calpath, origud.localpath)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # When using shallow mode=
, add a symlink to the original
> > > fullshallow
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # path to ensure a valid =
symlink even in the
> > > `PREMIRRORS`
> > > case
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if getattr(ud, 'shallow',=
 False) and not
> > > os.path.exists(origud.fullshallow):
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e=
nsure_symlink(ud.localpath, origud.fullshallow)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 update_stamp(origud,=
 ld)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ud.localpath
> >=20
> > I guess the one problem here is that we're teaching a general
> > function
> > in __init__ a fetcher specific issue :/.
> >=20
> I thought so, too.
>=20
> Anyway, I have decided for the symlink solution for two reasons:
> - the PREMIRRORS logic is handled overall within __init__
> - there is already one symlink created
>=20
> > Ideally we probably should have some fetcher specific function
> > calls
> > for this to preserve the independence of the parent methods...
> Another option I had thought about is to store the origud.path
> somewhere and reuse it in the git fetcher. Then the archive could be
> saved with the correct name instead of adding an additional symlink.
>=20
> Question here: Is this free of another side-effects?
>=20

The trouble is that doesn't nest, you can have mirrors of mirrors or
mirrors. That can be handled with a chain of symlinks.

I think the right solution here is a specific new method for fetchers
which is called after premirrors to put links in place.

The default would be:

ensure_symlink(ud.localpath, origud.localpath)

however the git fetcher would append the shallow logic.

Something like:

FetchMethod()
    def update_mirror_links(ud, origud):
        ensure_symlink(ud.localpath, origud.localpath)

Git(FetchMethod):
    def update_mirror_links(ud, origud):
        super().update_mirror_links(ud, origud)
        if ud,shallow and not os.path.exists(origud.fullshallow):
            ensure_symlink(ud.localpath, origud.fullshallow)


Cheers,

Richard

