Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40C3CD6E41
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:18:07 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22457.1763036280755178958
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 04:18:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WdGM9RtS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b32a5494dso393352f8f.2
        for <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 04:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1763036279; x=1763641079; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uRjKpNgvykp7BWtEJYI2K7ynHbFiYSMCQnKOeLupes=;
        b=WdGM9RtS71c3xb6vxO1XJC6i2iqoCBZtcISpTwPJCiVZfvhj/JCn+uurqN+3OU+cCY
         Yx6gu1b4CwjgQc1DuQSEoBM70tICOoAu1ar5k28g34Z1Dj7G7FKrXW2B/7Nqan5Cc3fj
         ZOZbbGXwxC61CEruOkHgs9YX/PLAeIxuXd4gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763036279; x=1763641079;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8uRjKpNgvykp7BWtEJYI2K7ynHbFiYSMCQnKOeLupes=;
        b=LxSyqBlOrrc1ivdt/XAOQJoRKCYtYryXa5lxEr9QFsd6EqqA9XDbtKjaDnJ595D+f5
         ETh9YWhltbe1EKoqy/vqKKM+TJSoFssp8wnpSuUepzh174Z+QNwlDU6SURz418JVehuW
         r1h4oV1MtmIH1m9y9eGdUJy1lI/jXFwDYEgC7RwLudG8FKPx8pWVJoiQvrGy+jZlFwVK
         aNTIQcbjbn4AcbOZ97U4zdHVXMl8QOLDb1cXpDEg2kVIoHr2KXmudsIvDmcUi5gbQjMS
         dgFXb/HjdB3VlLZMgeYHqlCZE3MYS8M4i9MmPSZMXaWxKlpKm0iwSFF1uFYQLQ2dJJzv
         reDA==
X-Forwarded-Encrypted: i=1; AJvYcCVL8PmNPKNODpZFtT+YUHaekCM7xT7t4RLDO0oLwvgA/j2GBeqZQtuU9979Sf9F9LXK+bv9@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwCZJi8loF1YC5EGy4WT7bl/CM2T0UUzbPLr88/0gvTn5KSgiTI
	UzSuwjbuejMof/uDSU6MZtUnA8xEG+ibK8RWKH00/xRZEzr71ragpbebV9NMRz/tOzY=
X-Gm-Gg: ASbGncs1T8Gjmsjby67SGmPYI7n+Ozxu7GQGpYKrp0DxB7OP6B8Ip6/PAaelYyL3zib
	XPbfMsZzFfxZ4vOS5u4UO2muc/BSobNfF2Up9XDLd+uLNoufMuy+8Gk/3uh67qwrurM18LjwYxG
	5bRy4wYtQs6jPO7llz2HnIUECeopnUssDWf5xVaCUg4v4KT1e+mEROM2xzZhv//H0tOvfo0V/gC
	Wsemt7ypR3PG0eXD90GSil8JzDW1n3ucuaRRqfTDhJWpK5ThRtVEO+GjqYPdHC/mmo1P/HSI6wX
	wA2ZMR+3tYNTZ1j4Zjjf5WbpTHhSB940sfrMpZaawgPXyqQU4ZMD7fCUXBw1V4ToOvwaQyRqwrg
	Oh0IgiUrMuRwq060gfd6fd9xBUcqCcmyhA6ouQFJ5ktj0ES8f6X9rzlnCZA2btUyZqKDmS2J1Yn
	4fgBeYiwKrCKvUg1sSDOqSDNc0u4lJq0RGjPX+qnlFfnzPd8QsvewrKLqbs58pJdnq
X-Google-Smtp-Source: AGHT+IHRQdvm6IzQz3xywhZtxMR4QxTMUCXtFt7HmFxKo4zPbee5JaTmiy7zWacK1CV1yyO+6QugVw==
X-Received: by 2002:a05:6000:1842:b0:42b:39ee:2889 with SMTP id ffacd0b85a97d-42b4bdb50c1mr5986491f8f.48.1763036279129;
        Thu, 13 Nov 2025 04:17:59 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4ffe:a0c9:fea0:699b? ([2001:8b0:aba:5f3c:4ffe:a0c9:fea0:699b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f2084dsm3711226f8f.42.2025.11.13.04.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 04:17:58 -0800 (PST)
Message-ID: <2bf345665a3ee9737d97456c036497c548b0c57f.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: add ubuntu
 25.10 to supported distros
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: antonin.godard@bootlin.com, quentin.schulz@cherry.de, 
	docs@lists.yoctoproject.org
Date: Thu, 13 Nov 2025 12:17:57 +0000
In-Reply-To: <DE7JVU50DGHH.1SV7UKLZNZSFY@bootlin.com>
References: <20251113-add-ubuntu-25-10-v1-1-092133ab6d40@bootlin.com>
	 <aab4e0ab-839a-4900-a91f-87bdcd322220@cherry.de>
	 <DE7JVU50DGHH.1SV7UKLZNZSFY@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 12:18:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8035

On Thu, 2025-11-13 at 13:03 +0100, Antonin Godard via lists.yoctoproject.or=
g wrote:
> Hi,
>=20
> On Thu Nov 13, 2025 at 11:07 AM CET, Quentin Schulz via lists.yoctoprojec=
t.org wrote:
> > Hi Antonin,
> >=20
> > On 11/13/25 10:03 AM, Antonin Godard via lists.yoctoproject.org wrote:
> > > After it was added to meta-yocto/meta-poky's sanity.conf.
> > >=20
> > > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > > ---
> > > Note: merge when either is merged:
> > > * https://lore.kernel.org/r/20251112224534.3094578-1-richard.purdie@l=
inuxfoundation.org
> > > * https://lore.kernel.org/r/20251111-contrib-mathieu-ubuntu_2510-v1-1=
-4e50cc96eb00@bootlin.com
> > > ---
> > > =C2=A0 documentation/ref-manual/system-requirements.rst | 1 +
> > > =C2=A0 1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/documentation/ref-manual/system-requirements.rst b/docum=
entation/ref-manual/system-requirements.rst
> > > index fcefd6c7a..0860c7a3f 100644
> > > --- a/documentation/ref-manual/system-requirements.rst
> > > +++ b/documentation/ref-manual/system-requirements.rst
> > > @@ -79,6 +79,7 @@ supported on the following distributions:
> > > =C2=A0 -=C2=A0 Ubuntu 22.04 (LTS)
> > > =C2=A0 -=C2=A0 Ubuntu 24.04 (LTS)
> > > =C2=A0 -=C2=A0 Ubuntu 25.04
> > > +-=C2=A0 Ubuntu 25.10
> > > =C2=A0=20
> >=20
> > We should probably update documentation/tools/build-docs-container to=
=20
> > also be able to build for Ubuntu 25.10 (and make sure we can actually=
=20
> > build stuff with it :) ).
>=20
> Yes, thanks for reminding me, I tested it and the build worked fine with =
ubuntu
> 25.10. Patch coming.
>=20
> > https://lore.kernel.org/yocto-patches/CADfgfoZh_6cw3YnapQR3DfrWah3Prp1a=
j6-d5tJW_jJN5u28CQ@mail.gmail.com/=C2=A0
> > adds fedora 43 workers as well, but I guess it's too early for marking=
=20
> > that as tested distro :)
>=20
> Ha yes indeed, they might be under test still, I'll keep an eye on that.

Fedora 43 doesn't actually work yet. We are just testing with it to
work out what issues we have...

Cheers,

Richard

