Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3667AC02194
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 13:44:48 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.12053.1738763081655785493
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 05:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OhaTJG2T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361c705434so50443645e9.3
        for <docs@lists.yoctoproject.org>; Wed, 05 Feb 2025 05:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738763080; x=1739367880; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+P1jvZNw1wv7RXAWypJMyR12aFQXipJd6jtVWgCfXU=;
        b=OhaTJG2T6830V6YRxahcoLs+kriViCj1aSMAUMFEeaTssvsytbaiecdNsOC0PJz0qk
         CYd4VdFiUkLIvuEGbHShiFS1UUfccYSZHZ486gm+z9fNhC9gPUnJiXxsK35zs64vQz3E
         o+63lOYdkZeXK/miLAF5fJOlRL5Y8GB4QOK1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738763080; x=1739367880;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h+P1jvZNw1wv7RXAWypJMyR12aFQXipJd6jtVWgCfXU=;
        b=R/SwcYCAHc0phTQ2qqaUbPAn4U0nIOc/VZnM/S7tJBokj8bMU8FDYyRoOVJaHhT307
         Z70kuqmYyX4Mk0A2lWjTl6/wOLVu31hzXZEy+QB7XC5wp6U8cGM2CQet6KQWqbfLb7eJ
         uvFLFc4RgO9/y/SIyvCpPvio6pof5zYquBb71DNl4rEB1FrRFtDZghBcQ6/q52FQaNJA
         /zJSGfNwRVgquQXccBa3YmUz61DZx+AH1x/Xr6sUEZeGLxq7XXcbVZ8FgK6/QioX5NPp
         EByVLmm0yH/hYicH0/enhvQqUyCR81uc5N2y28T4q7ZhMUrx7CRYSYrI857K0B5AKeVp
         hTlA==
X-Forwarded-Encrypted: i=1; AJvYcCWV7ZqR7IwHvCIsQf48h9KSQ5VVQAyiv62po/9fbZF57n1gxhnLbm4o1SAi/iFZ3dwAlw7e@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy4oksQym4EA+4NjmtKTM7VUoRupRbQLUwfrHR2kbs9GqcPazZg
	Y8Wu/2+xQFrLcJvcsJQ7RE8Xzf928FMx549s7E2bu9Ri2sR8cNO8ZSh0V/cQJR8=
X-Gm-Gg: ASbGncs5AuUHre2gJW3zLiVF2P7FCqRGNalCNYvR8S2KAwuDPex9+L1w6h3JRMNO6vZ
	yckBqMkK2qztLsGULE9tDUIoyVpcPiNtIJ5WVYV6HmW7DR28wNaMLvCPJ85dNdwBDBlMShj34um
	2wPl1kvkbPGfRtlfg9YC/48ie0ZDIkmGLK/wLlKmQvgBHBWX7C0sOCta8lUqj/aefi0RBCLuOoU
	A9XqLsDDx1uYsIR57fh5RVQwY/8JUDFUvViUFXjx26LVvf8A7EfsrS9GmIeVgnkcogIlqofJjX8
	sFZ4dms4fPqrhbqflqyLJUh7OFVgnhE8Al7s6NpJojbLy5d+5RwsmqfsrjYheQn4vD82GAfD4ho
	EX2dX
X-Google-Smtp-Source: AGHT+IHIxwQBWto8ru8KtB+OPbcoMgxj5qGxYJjtOM9PrgOZrWpIvRY1ITtjnm5P55c8TOOPaMbTcQ==
X-Received: by 2002:a05:600c:1c8c:b0:431:5044:e388 with SMTP id 5b1f17b1804b1-4390d55fca6mr19685875e9.22.1738763079983;
        Wed, 05 Feb 2025 05:44:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:be8c:5293:84c1:352a? ([2001:8b0:aba:5f3c:be8c:5293:84c1:352a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94dba7sm21536525e9.14.2025.02.05.05.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 05:44:39 -0800 (PST)
Message-ID: <6e43bf6563a06db487fff96144fd2e61dd3d97cc.camel@linuxfoundation.org>
Subject: Re: [bitbake-devel] [PATCH v2] add basic support for b4
 contribution workflow
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>, Quentin Schulz
	 <foss+yocto@0leil.net>, bitbake-devel@lists.openembedded.org, 
	docs@lists.yoctoproject.org
Date: Wed, 05 Feb 2025 13:44:38 +0000
In-Reply-To: <e81c3992-5da5-42f4-b629-3288c63d00a8@cherry.de>
References: <20250117-b4-support-v2-1-7178f61d49e4@cherry.de>
	 <abd86c0a-0c57-4425-b4c0-b8c9ba21cbea@cherry.de>
	 <7b5e158cc6d983ec0aac8c13365572fe5a44b3d2.camel@linuxfoundation.org>
	 <e81c3992-5da5-42f4-b629-3288c63d00a8@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Feb 2025 13:44:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6249

On Wed, 2025-02-05 at 14:38 +0100, Quentin Schulz wrote:
> Hi Richard,
>=20
> On 2/5/25 2:34 PM, Richard Purdie wrote:
> > On Wed, 2025-02-05 at 14:11 +0100, Quentin Schulz via lists.openembedde=
d.org wrote:
> > > Hi all,
> > >=20
> > > On 1/17/25 11:44 AM, Quentin Schulz wrote:
> > > > From: Quentin Schulz <quentin.schulz@cherry.de>
> > > >=20
> > > > b4[1] is a very nice tool for mail-based contribution. A config[2] =
file
> > > > exists to set up a few defaults. We can use it to set the Cc recipi=
ents
> > > > to always add, in our case the mailing list.
> > > >=20
> > > > This also adds a wrapper script that is called by b4 to figure out =
which
> > > > addresses to put as Cc recipients. Considering that patches to the =
doc/
> > > > directory also need to be sent to the yocto-docs mailing list, this
> > > > wrapper handles that. A limitation of the script (lsdiff actually) =
is
> > > > that it doesn't know how to handle empty files, but those should be
> > > > of rather rare occurrences.
> > > >=20
> > > > While the wrapper script should be enough by itself to add the bitb=
ake
> > > > mailing list to the Cc recipients, one still needs to manually run =
b4
> > > > prep --auto-to-cc for that to happen. Therefore, let's add an expli=
cit
> > > > send-series-cc so that at least that mailing list is always there.
> > > >=20
> > > > Because we currently do not have anything to check for patch validi=
ty,
> > > > remove requirement for b4 prep --check to be run before sending a p=
atch
> > > > series, via disable-needs-checking in prep-pre-flight-checks.
> > > >=20
> > > > [1] https://pypi.org/project/b4/
> > > > [2] https://b4.docs.kernel.org/en/latest/config.html
> > > >=20
> > > > Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> > > > ---
> > > > This adds a basic config file for b4 to avoid to have to add the ma=
iling
> > > > list by hand.
> > > > For documentation patches, the additional mailing list will be adde=
d
> > > > when running b4 prep --check, as is required for each new series ma=
naged
> > > > by b4.
> > > >=20
> > > > Note that b4 supports patchwork, c.f.
> > > > https://b4.docs.kernel.org/en/latest/config.html#patchwork-integrat=
ion-settings
> > > > though I have no clue what it does with it as I am no maintainer, b=
ut
> > > > maybe something worth having a look at if some maintainer of this r=
epo
> > > > wants to use b4 to merge stuff?
> > > > ---
> > > > Changes in v2:
> > > > - add b4-wrapper for auto-detecting patches that are to be sent to =
the
> > > > =C2=A0=C2=A0=C2=A0 docs mailing list as well,
> > > > - disable forced b4 prep --check for each b4-managed series,
> > > > - Link to v1: https://lore.kernel.org/r/20240524-b4-support-v1-1-0c=
4334c36cc7@cherry.de
> > > > ---
> > > > =C2=A0=C2=A0 .b4-config=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
> > > > =C2=A0=C2=A0 b4-wrapper.py | 38 +++++++++++++++++++++++++++++++++++=
+++
> > > > =C2=A0=C2=A0 2 files changed, 42 insertions(+)
> > > >=20
> > > > diff --git a/.b4-config b/.b4-config
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..0b699f204c414099f21=
18ffdbc9f7b24454e4a4e
> > > > --- /dev/null
> > > > +++ b/.b4-config
> > > > @@ -0,0 +1,4 @@
> > > > +[b4]
> > > > +=C2=A0 send-series-cc =3D bitbake-devel@lists.openembedded.org
> > > > +=C2=A0 send-auto-cc-cmd =3D ./b4-wrapper.py send-auto-cc-cmd
> > >=20
> > > All the above should be to instead of cc, will fix in next version.
> > >=20
> > > @Richard, is the b4-wrapper.py below (this one for BitBake and not
> > > Poky!) fine in BitBake git repo? I believe it should since it needs t=
o
> > > be called even when one develops from "vanilla" BitBake git repo and =
not
> > > poky combo repo. Just asking for confirmation here (and maybe you wan=
t a
> > > different name too?).
> >=20
> > I guess the location is ok but can we call it b4-bitbake-wrapper.py
>=20
> b4-wrapper-bitbake.py to follow the same naming scheme as for the one
> for poky that is stored in OE-Core maybe?

That makes sense, might as well try and be consistent :)

> > please? This is so that if someone sends patches, it is clear which
> > wrapper the patch is against. Top level files in repos can sometimes
> > get interesting for that, even if b4 should be helping make sure the
> > right patches go to the right lists in future!
>=20
> One could have the interesting idea of contributing patches to the=20
> b4-wrapper-bitbake.py script without using b4, so a unique name across=
=20
> the code bases makes sense to me.
>=20
> Looking at it, do we want the script to be in contrib/ in BitBake repo=
=20
> maybe?

I'd wondered about that and would be fine with it. It would reduce
"clutter" in the top level directory which already has too many files
to me!

Cheers,

Richard

