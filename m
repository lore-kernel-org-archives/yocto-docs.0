Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB07C0015E
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 17:57:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.94987.1691603840715937913
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Aug 2023 10:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mwg8i9fF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fe4cdb727cso279815e9.0
        for <docs@lists.yoctoproject.org>; Wed, 09 Aug 2023 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691603839; x=1692208639;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uNWecns4+C3H+W6/KiJ/WcuD12F1lC9X1K7S+U2j5uk=;
        b=Mwg8i9fFneFpaBPxEzuPdbmM7WWGuiHJmOBAgoT/jGDd6l2Wdq9kt5+yIWjgXnmxBX
         mSoUbgtbExHw9FvofdqHs+7Zg/qNxa5XgbBJKhBmfYv3l/a6mNTLAL0eg+tktfAVxR0U
         ex1/GX4rIX0NW//ufuHmNAex0QYMqcNJuMiX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691603839; x=1692208639;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNWecns4+C3H+W6/KiJ/WcuD12F1lC9X1K7S+U2j5uk=;
        b=M32Dzxbfmt3oNLyxcBvh657D9oRF2ldZ7k2rLE29MbgwtG5LJmJV+jN8y4qzJq4e7s
         TdFuImZj+mFtea05Vqx3XMymtLA9JPMtwNELEhM+5Pv4CgbtqhX7sT+ipssMHtx8B2ho
         F+ts7zBT9hnNvoCJM66Tro+Rw2R+wr0kXMPQ0DqBD6ufJdYRPF0v/HGORvQ3d/Qj6oif
         tSWBiZkUCrAm83qMxWD0TdQJ/bXBOrrPrshkjyX1hGl6lI8JVIcyZbojXqcJGa744bx/
         QIViVspm3vgZvs6nkZ8lRovwsjFcQJYQw8qZyIMrfhmiVxOltvhldDgieZRwZSHs3PNy
         ae9A==
X-Gm-Message-State: AOJu0YxB5l3M+PD6wb8UVqkt2yKsrQDI9UYXtaleJEtvdObHQxpiKaM8
	cSbqzpvDNuDwr875+OXLXQOtfA==
X-Google-Smtp-Source: AGHT+IFb0Lb4bW8RY91OVNcoUlhQOooPQXI+niRmmOeAeGV+t0NyFAVqg43xgF4h1Nh8Mq9Aw6Z20w==
X-Received: by 2002:a1c:7218:0:b0:3fe:374f:f7fd with SMTP id n24-20020a1c7218000000b003fe374ff7fdmr2686438wmc.33.1691603838836;
        Wed, 09 Aug 2023 10:57:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d249:8c2a:f169:cb41? ([2001:8b0:aba:5f3c:d249:8c2a:f169:cb41])
        by smtp.gmail.com with ESMTPSA id p25-20020a1c7419000000b003fe2bea77ccsm2627238wmc.5.2023.08.09.10.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 10:57:17 -0700 (PDT)
Message-ID: <88d3c02eaadc6ce5356608cf93f84dc81471146d.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 2/3] contributor-guide: add section about why we
 use mailing lists
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons
 <frederic.martinsons@gmail.com>,  michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org
Date: Wed, 09 Aug 2023 18:57:16 +0100
In-Reply-To: <CA+cAkeqBLnr5YRygjCT_6j2M-Hkht3DxAxiQLrP63nBvG9sFwQ@mail.gmail.com>
References: <20230809142520.226581-1-michael.opdenacker@bootlin.com>
	 <20230809142520.226581-2-michael.opdenacker@bootlin.com>
	 <CA+cAkeqBLnr5YRygjCT_6j2M-Hkht3DxAxiQLrP63nBvG9sFwQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Aug 2023 17:57:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4125

On Wed, 2023-08-09 at 17:58 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> On Wed, 9 Aug 2023 at 16:25, Michael Opdenacker via
> lists.yoctoproject.org
> <michael.opdenacker=3Dbootlin.com@lists.yoctoproject.org> wrote:
>=20
> > +One significant factor is that we value peer review. When a change
> > is proposed
> > +to many of the core pieces of the project, it helps to have many
> > eyes of review
> > +go over them. Whilst there is ultimately one maintainer who needs
> > to make the
> > +final call on accepting or rejecting a patch, the review is made
> > by many eyes
> > +and the exact people reviewing it are likely unknown to the
> > maintainer. It is
> > +often the surprise reviewer that catches the most interesting
> > issues!
> > +
> > +This is in contrast to the "GitHub" style workflow where either
> > just a
> > +maintainer makes that review, or review is specifically requested
> > from
> > +nominated people. We believe there is significant value added to
> > the codebase
> > +by this peer review and that moving away from mailing lists would
> > be to the
> > +detriment of our code.
> >=20
>=20
>=20
> For notifications, I don't see why the web flow would not allow to
> send notifications=C2=A0for changes to a mailing list (I think it can als=
o
> be made per user profile to receive notifications for a whole
> project, an issue, a particular project ... etc)

You can make a web interface send notices to an email list, sure, that
isn't hard. Someone then replies giving feedback on the mailing list to
the patch. What happens to that feedback from the web point of view?
This "next step" is where the challenge is.

Patchwork is an attempt to make that match up and it basically shows
how hard this is to get right and pair the worlds up like that.
> =C2=A0
> > +We also need to acknowledge that many of our developers are used
> > to this
> > +mailing list workflow and have worked with it for years, with
> > tools and
> > +processes built around it. Changing away from this would result in
> > a loss
> > +of key people from the project, which would again be to its
> > detriment.
>=20
> I'd like to know some of these flow that are plugged on mail, can we
> insert some examples in the documentation ?

You mean document how mailing list patch work flow works?

> > +The projects are acutely aware that potential new contributors
> > find the
> > +mailing list approach off-putting and would prefer a point-and-
> > click web GUI.
> >=20
>=20
>=20
> I find the term "point-and-click" a little patronizing,
> github/gitlab/others web tools
> are not just point-and-click machine but highly customizable tool
> aims at smoothen the developer work (in term of tracking, viewing
> diff, forking) and to provide enhanced user experience.

I agree we should tweak the wording.

> =C2=A0
> > +Since we don=E2=80=99t believe that can work for us, the project is ai=
ming
> > to ensure
> > +`patchwork <https://patchwork.yoctoproject.org/>` is available to
> > help track
> > +patch status and also looking at how tooling can provide more
> > feedback to users
> > +about patch status. We are looking at tools such as ``patchtest``
> > to
> > +test user contributions before they hit the mailing lists and also
> > at better
> > +documenting how to use such workflows since we recognise that
> > whilst this was
> > +common knowledge a decade ago, it might not be as familiar now.
> >=20
>=20
>=20
> I didn't know patchtest, I'll look at it. I think a big improvement
> (at least for me) in the review
> process would be to some kind of colorized webview of a patch towards
> the target branch.

If you make a pull request from the contrib repos, you can see
colorized diffs using the web interfaces. You can also see that locally
with git itself or tools like gitk too. I do use both the cgit
interface and gitk commands at different times.

> Sorry, but , unless I miss some cool feature of my gmail client, I
> find that view (screenshot=C2=A0join) far more readable that raw diff by
> mail, e.g:

It does depend upon what you're used to. Personally, I can hand edit or
even hand write diff files :/. I'm not saying that is a good idea or a
good thing but it is what it is.

Cheers,

Richard


