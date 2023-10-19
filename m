Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7AFCDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:08:09 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.23188.1697706484648066200
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 02:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FkXXC33i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.176, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c50d1b9f22so73229051fa.0
        for <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 02:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697706483; x=1698311283; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z+btl8R0GYesWkxT0Y4gVMM/qv5/P0eKHc7mlBbPqlc=;
        b=FkXXC33isgJ3pESuzq6xoBwSXNA6nFHe7EuFnlerCp7qpQsbHV1mPq1QOGF6GWg71o
         VB60lQCZFocvSHtaVVCt2TVC53iOK+mSHBXbE7BZfYcye4d40O/E2MMGxgCG8aV1tn+Y
         78y5mS4dwLfXf6UFhsH6mbRDqsgSNPXwUNYaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697706483; x=1698311283;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+btl8R0GYesWkxT0Y4gVMM/qv5/P0eKHc7mlBbPqlc=;
        b=bPDzso7PSmom+Q2fY+T5komE8HHTDzCBHvrJl6QzpYrRSvFISAmXD6rrZRHUUCFt5D
         DvXsKOG8DmcFQiuE79jFTggclSlbQ/KImXZmn5g8H5tZyY7EMEGqiUvtK2qn9bQFh2Kw
         wX7KO4anL1Db3roHKt0yVAHj0ceenAXyoN6IwPtMC2JYVgD9L+KtZl6s6LQeKaO1HqwD
         4hGbF8Q+fQ7AB8Ckxk+bgzQMU0P5ReqPlXo2V/EpnkJ9QGkkhUrTaYKlmVodqw6S1P9y
         7TAkuYKtr+QL2zoVedECpSGOtYV5SxTRbsDeUu6/miHQj7ZJWCzL9GFtNStl/Pki5U88
         e8tw==
X-Gm-Message-State: AOJu0Yy90AZcgNJc84xwe0WcaDPcrterjVxHNGhhBkaeRAT+jFeKlgyp
	kDBDGpYOJdP+h5PkvXrGkn5TgQ==
X-Google-Smtp-Source: AGHT+IFz51AVeO3r6rplfTHR1UNE+K6RoRBclQc0e9o5DGP+p/bfdcKM7Eu7uKtf+sEjKNrvOcLDfg==
X-Received: by 2002:a05:651c:202:b0:2c5:1867:b0bc with SMTP id y2-20020a05651c020200b002c51867b0bcmr932014ljn.51.1697706482629;
        Thu, 19 Oct 2023 02:08:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9ec8:2948:ce65:9cfb? ([2001:8b0:aba:5f3c:9ec8:2948:ce65:9cfb])
        by smtp.gmail.com with ESMTPSA id y34-20020a05600c342200b004063977eccesm3852250wmp.42.2023.10.19.02.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 02:08:02 -0700 (PDT)
Message-ID: <501a35be909bd40dcb4bc4682f7b9e27fe8efbd5.camel@linuxfoundation.org>
Subject: Re: [docs] Documenting YP processes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, Marta Rybczynska
	 <rybczynska@gmail.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>, 
	yocto-security@lists.yoctoproject.org
Date: Thu, 19 Oct 2023 10:08:01 +0100
In-Reply-To: <e59bc7cf-4b40-4767-806d-75bc57a2c807@bootlin.com>
References: 
	<CAApg2=TOJg06EP3JJmaoC-mxzPM3=4WkW0y3ADuuXRVsccoefw@mail.gmail.com>
	 <ef4d2c98-e7f2-4c3d-8a59-dd5d1e181dea@bootlin.com>
	 <f296756f07267e29d23732acf41e7c799d7f4d22.camel@linuxfoundation.org>
	 <CAApg2=TMPH+RX4=+uZh7-cG4URFEcYwroxybPMnoBtDZBVk=0Q@mail.gmail.com>
	 <e59bc7cf-4b40-4767-806d-75bc57a2c807@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 09:08:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4414

On Thu, 2023-10-19 at 11:02 +0200, Michael Opdenacker wrote:
> On 19.10.23 at 09:40, Marta Rybczynska wrote:
> > On Wed, Oct 18, 2023 at 7:35=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Wed, 2023-10-18 at 16:57 +0200, Michael Opdenacker wrote:
> > > > Hi Marta
> > > >=20
> > > > On 18.10.23 at 16:23, Marta Rybczynska wrote:
> > > > > Hello,
> > > > > I'm writing the "official" documentation for the YP security proc=
esses
> > > > > and I'm realizing that I do not know which document to put it int=
o.
> > > > > There is no "YP Processes" manual. What about adding a "Security
> > > > > manual"? It can then include:
> > > > > - security processes
> > > > > - a single place describing how to submit CVE fixes
> > > > > - links to other manuals for relevant material and/or rewrites if=
 necessary
> > > > IMHO, it does makes sense to create a new "Security Manual". We
> > > > currently have
> > > > https://docs.yoctoproject.org/dev-manual/vulnerabilities.html with =
some
> > > > useful details contributed over time, but a separate manual would
> > > > probably get more of the attention this topic deserves.
> > > I'm torn between a security section in the Development Manual or a
> > > separate one. I don't think we want too many manuals so I have a slig=
ht
> > > leaning to a section but am open to persuasion.
> > >=20
> > Arguments for both options below. I do not have a strong opinion, while
> > Security Manual seems to me a little better option at this stage.
> >=20
> > In Development Tasks Manual
> > - puts everything in one place
> > - security is a part of a standard development process
> >=20
> > Separate Security Manual
> > - more likely to be found by people who do not consider themself
> > developers ie. security researchers, analysts who have a fix etc
> > - more general visibility (when searching by keywords), can be
> > announced by the project
> > - better fit for processes (Development Tasks Manual is strongly
> > technical and concentrates on tools)
>=20
>=20
> I don't want to vote twice, but your argument for making it more=20
> accessible to people who don't consider themselves developers sounds=20
> pretty strong to me. The better visibility is quite strong too.
> Other opinions?

My concern is whether there is enough content for a dedicated manual. I
know it often feels like there is but when you write it down, I think
there is a lot less than it feels like there is. We should have a
relatively high bar to a new manual. Perhaps we start with a section
and then migrate to a manual if it feels like there is enough content
to make sense?

Cheers,

Richard



