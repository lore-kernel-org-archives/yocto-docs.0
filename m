Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28425C02194
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 13:35:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.11833.1738762498293991901
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 05:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XQX7AmHX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-438a39e659cso46564885e9.2
        for <docs@lists.yoctoproject.org>; Wed, 05 Feb 2025 05:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738762497; x=1739367297; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10D8AQr9MW60mF7MHkwqIYR7w0kz5rAeIzxCD/WpPRs=;
        b=XQX7AmHXftrfm4iv6eCigD6dZmchK2r14TILBPunyVvMLZz71m/OsBEOwgLiO1nxiK
         lDe2ppCmQJOt4OXNCH2D/wQ713BKpezwT9n+nSftGCFKaiCszmp9WwNOmeEz9PCKoUTs
         DbzIYl5v+tFm2IOiFU+XpGNUiHYpr5W/+Ufb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762497; x=1739367297;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=10D8AQr9MW60mF7MHkwqIYR7w0kz5rAeIzxCD/WpPRs=;
        b=ez6bGVb28SNInTNYOuxwtbt3nnlDQa0QPonjAseKu7GfUy5QPXklQQZroLGovMRAAT
         4v5pqVf8l0ih4LPmHAqPn4EQoa5mABXPaUIgHumlDFqIJ+UE7o+Jt9QuBAsAxe8c2aZd
         5a4qLZJrObDFU5dKwuEvTV4ZZdMQvmG6o+lCGeMUtQgLbYHO1u9ldLMl6Gd2pN7XbOcp
         J7p+3Ho3CRoXG2C1zU6mDdzGugial3iwgk3IxVOjXRK8iM3uFx/xZCYsz6LWS5KRjXXH
         yNX+oBtq472cZrFhQTk7AYFKB+JnDGXSWecpV0di9TiWuyiMLJUL//rmO7ggxasnVp9v
         icfw==
X-Forwarded-Encrypted: i=1; AJvYcCWJdQp98O1lU/qVws4JUWcaAAENSvMmKxSaE/DnPl8o5g8oQt6D280ohn/mWVwuZ4L57fB5@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyvfVn8RAIOe7PZ7yklmp/ADVSjAMMUqBiGNiPE6BTC6QrQzImu
	P5mFHFKtCdviJYJ8PfkjAYMrI9GBYYMJ1KS6w0ulS5QDGVJcr61h6d8Km++oV4Q=
X-Gm-Gg: ASbGncthoF+ZeFv3ZnxM5yAuxgUwe9Aw2KPGRootUwa6P2eOlfN/rJTP2h093YDCdEu
	9+g4DEBbK59ffSbP/KiN3LZPGzNbkx+0EOuFHE2Lsdq6ldwru97likZNivuF2b5b9U8bDKB6DbW
	QmV6k4RxfOJgfULuep8n0Mevmdh2UG4D4e2flNyJBLSz5vaITzk2JF5vx/ad3+0XDTpsgvLVxnE
	Zs1yVba0H5DbSJ1He9AxYpnJhAhq/GD1FKeeRzkL6ZIbE/zl5aHfOBfyV+08bAqQ2mEP7P9Y6j/
	7YTqNoNDQQM70KaUjP9MzzcVK/Qhziv1b2Sc5by1x+euvzfp3QWaY/FnunxiswpNIkdGkuGJKB4
	mqvaJ
X-Google-Smtp-Source: AGHT+IFoowtFk88gv9p8PWT/YeVar6h+P99rXbaXBDCHmNivSBEbL+OeuGPlgnoEJQXKxC8ZsnSHxw==
X-Received: by 2002:a05:600c:5814:b0:434:f739:7ce3 with SMTP id 5b1f17b1804b1-4390e88b7d8mr16468595e9.8.1738762496638;
        Wed, 05 Feb 2025 05:34:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:be8c:5293:84c1:352a? ([2001:8b0:aba:5f3c:be8c:5293:84c1:352a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390da71041sm21050445e9.27.2025.02.05.05.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 05:34:56 -0800 (PST)
Message-ID: <7b5e158cc6d983ec0aac8c13365572fe5a44b3d2.camel@linuxfoundation.org>
Subject: Re: [bitbake-devel] [PATCH v2] add basic support for b4
 contribution workflow
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@cherry.de, Quentin Schulz <foss+yocto@0leil.net>, 
	bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org
Date: Wed, 05 Feb 2025 13:34:55 +0000
In-Reply-To: <abd86c0a-0c57-4425-b4c0-b8c9ba21cbea@cherry.de>
References: <20250117-b4-support-v2-1-7178f61d49e4@cherry.de>
	 <abd86c0a-0c57-4425-b4c0-b8c9ba21cbea@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Feb 2025 13:35:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6247

On Wed, 2025-02-05 at 14:11 +0100, Quentin Schulz via lists.openembedded.or=
g wrote:
> Hi all,
>=20
> On 1/17/25 11:44 AM, Quentin Schulz wrote:
> > From: Quentin Schulz <quentin.schulz@cherry.de>
> >=20
> > b4[1] is a very nice tool for mail-based contribution. A config[2] file
> > exists to set up a few defaults. We can use it to set the Cc recipients
> > to always add, in our case the mailing list.
> >=20
> > This also adds a wrapper script that is called by b4 to figure out whic=
h
> > addresses to put as Cc recipients. Considering that patches to the doc/
> > directory also need to be sent to the yocto-docs mailing list, this
> > wrapper handles that. A limitation of the script (lsdiff actually) is
> > that it doesn't know how to handle empty files, but those should be
> > of rather rare occurrences.
> >=20
> > While the wrapper script should be enough by itself to add the bitbake
> > mailing list to the Cc recipients, one still needs to manually run b4
> > prep --auto-to-cc for that to happen. Therefore, let's add an explicit
> > send-series-cc so that at least that mailing list is always there.
> >=20
> > Because we currently do not have anything to check for patch validity,
> > remove requirement for b4 prep --check to be run before sending a patch
> > series, via disable-needs-checking in prep-pre-flight-checks.
> >=20
> > [1] https://pypi.org/project/b4/
> > [2] https://b4.docs.kernel.org/en/latest/config.html
> >=20
> > Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> > ---
> > This adds a basic config file for b4 to avoid to have to add the mailin=
g
> > list by hand.
> > For documentation patches, the additional mailing list will be added
> > when running b4 prep --check, as is required for each new series manage=
d
> > by b4.
> >=20
> > Note that b4 supports patchwork, c.f.
> > https://b4.docs.kernel.org/en/latest/config.html#patchwork-integration-=
settings
> > though I have no clue what it does with it as I am no maintainer, but
> > maybe something worth having a look at if some maintainer of this repo
> > wants to use b4 to merge stuff?
> > ---
> > Changes in v2:
> > - add b4-wrapper for auto-detecting patches that are to be sent to the
> > =C2=A0=C2=A0 docs mailing list as well,
> > - disable forced b4 prep --check for each b4-managed series,
> > - Link to v1: https://lore.kernel.org/r/20240524-b4-support-v1-1-0c4334=
c36cc7@cherry.de
> > ---
> > =C2=A0 .b4-config=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
> > =C2=A0 b4-wrapper.py | 38 ++++++++++++++++++++++++++++++++++++++
> > =C2=A0 2 files changed, 42 insertions(+)
> >=20
> > diff --git a/.b4-config b/.b4-config
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..0b699f204c414099f2118ff=
dbc9f7b24454e4a4e
> > --- /dev/null
> > +++ b/.b4-config
> > @@ -0,0 +1,4 @@
> > +[b4]
> > +=C2=A0 send-series-cc =3D bitbake-devel@lists.openembedded.org
> > +=C2=A0 send-auto-cc-cmd =3D ./b4-wrapper.py send-auto-cc-cmd
>=20
> All the above should be to instead of cc, will fix in next version.
>=20
> @Richard, is the b4-wrapper.py below (this one for BitBake and not=20
> Poky!) fine in BitBake git repo? I believe it should since it needs to=
=20
> be called even when one develops from "vanilla" BitBake git repo and not=
=20
> poky combo repo. Just asking for confirmation here (and maybe you want a=
=20
> different name too?).

I guess the location is ok but can we call it b4-bitbake-wrapper.py
please? This is so that if someone sends patches, it is clear which
wrapper the patch is against. Top level files in repos can sometimes
get interesting for that, even if b4 should be helping make sure the
right patches go to the right lists in future!

Cheers,

Richard



