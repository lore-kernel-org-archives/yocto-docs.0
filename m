Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5819CDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 07:40:38 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.22448.1697701233538956412
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 00:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hNOeIgKz;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so96420761fa.3;
        Thu, 19 Oct 2023 00:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697701232; x=1698306032; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJ8GV/glrCd+KJ40V6LPkk1aM2vwsheTiDM4O8FzeT4=;
        b=hNOeIgKzeV/yh5460hrDW1eZsp1iBnhWli38ICTVgWXONmIexuwW9QQ8URs2slIESp
         xYUQy0ctAGQuzQE4tgko+tp0UCx0gVX9sCXbdV8vk34w4IZYPmYKDFxac0mv8wfyJBAa
         nEeilCAjJCSrn3hqOEH98Y4iY8YHyA92yJG18ShLsmAchOr37lDkFpgs4D6bWMPAmbsH
         B7qkx8ue2RCkTvFAimz8bpuQVfUuZ/ZKmFFimrsxpej9FK2ePtOK8aL43hzw7Y+Rq60v
         x00Uz/i+Gx9Gx8F3cBLambNnqHs6MevBX8gy4oKz+41XZveezcK9OFkMtZK9A7/8xBBF
         EgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697701232; x=1698306032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJ8GV/glrCd+KJ40V6LPkk1aM2vwsheTiDM4O8FzeT4=;
        b=rGdgDmzdkVb6A8LH4jUz1nsCOrLgObVLFy7x77MQlPTpW2gmbQCSz9MKpJZCxi43HF
         7rI+XRyDmbnQMyKR5z+UGE+imlHFgm9HuX6wLacoWTH82jgGXA/f/+h9TDyqovqA+ppE
         fB88t8PlQll2Bq7UpXxltoST+ZlsIkQqpj97J8/isnfA5930kIYr+cy2htRy/bepOPPj
         kYyyS5MpzPceKOeTLC3HTEbVVIB6UK2/vxl2/FM9WB8q1QjQ/IvOwYPra5C1jCmSHY4i
         2Bv3Lw1xKsdwxXb989o5uCQ2kA2/h13axc7vgQpPyK+2biwNn2D3lT0g+Hz9nycK1CmF
         xTWQ==
X-Gm-Message-State: AOJu0YwiXbvY91/VzTJgfgQnoUab4bIN7n8u+diHiikVlYMHESYcrQk+
	bUm/WoJMoYZyDhp+7b+m6lLnanT98S7vIjcb56A=
X-Google-Smtp-Source: AGHT+IHGtFY1W5S9DeI3X8/Cx7gI8vlBKQThAu85/lg/WKL2vVPOLdfYUHPDFjPuFIvYdXb1eznCvuhz6rixuXohaxw=
X-Received: by 2002:a2e:9114:0:b0:2c5:17f5:1546 with SMTP id
 m20-20020a2e9114000000b002c517f51546mr906271ljg.2.1697701231483; Thu, 19 Oct
 2023 00:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=TOJg06EP3JJmaoC-mxzPM3=4WkW0y3ADuuXRVsccoefw@mail.gmail.com>
 <ef4d2c98-e7f2-4c3d-8a59-dd5d1e181dea@bootlin.com> <f296756f07267e29d23732acf41e7c799d7f4d22.camel@linuxfoundation.org>
In-Reply-To: <f296756f07267e29d23732acf41e7c799d7f4d22.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 19 Oct 2023 09:40:19 +0200
Message-ID: <CAApg2=TMPH+RX4=+uZh7-cG4URFEcYwroxybPMnoBtDZBVk=0Q@mail.gmail.com>
Subject: Re: [docs] Documenting YP processes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	YP docs mailing list <docs@lists.yoctoproject.org>, yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 07:40:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4411

On Wed, Oct 18, 2023 at 7:35=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-10-18 at 16:57 +0200, Michael Opdenacker wrote:
> > Hi Marta
> >
> > On 18.10.23 at 16:23, Marta Rybczynska wrote:
> > > Hello,
> > > I'm writing the "official" documentation for the YP security processe=
s
> > > and I'm realizing that I do not know which document to put it into.
> > > There is no "YP Processes" manual. What about adding a "Security
> > > manual"? It can then include:
> > > - security processes
> > > - a single place describing how to submit CVE fixes
> > > - links to other manuals for relevant material and/or rewrites if nec=
essary
> >
> > IMHO, it does makes sense to create a new "Security Manual". We
> > currently have
> > https://docs.yoctoproject.org/dev-manual/vulnerabilities.html with some
> > useful details contributed over time, but a separate manual would
> > probably get more of the attention this topic deserves.
>
> I'm torn between a security section in the Development Manual or a
> separate one. I don't think we want too many manuals so I have a slight
> leaning to a section but am open to persuasion.
>
Arguments for both options below. I do not have a strong opinion, while
Security Manual seems to me a little better option at this stage.

In Development Tasks Manual
- puts everything in one place
- security is a part of a standard development process

Separate Security Manual
- more likely to be found by people who do not consider themself
developers ie. security researchers, analysts who have a fix etc
- more general visibility (when searching by keywords), can be
announced by the project
- better fit for processes (Development Tasks Manual is strongly
technical and concentrates on tools)

Note that a chapter on CVE fixing is also in Contrubutor's Manual

Cheers,
Marta

