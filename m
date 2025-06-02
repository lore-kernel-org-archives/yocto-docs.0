Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290D3C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 15:42:07 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.53080.1748878921173860093
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 08:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JL/OJD/0;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b2efa17ed25so735109a12.1
        for <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 08:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748878920; x=1749483720; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnjxiEH+1ENlh4/0aCwNJpNuqEXQ3yGAnUnbdwnMf+4=;
        b=JL/OJD/0Hn2PFUO9vUt6WsJdAUIpSHfWfGgxXIbaju4zLguwBs97U4YNMIeKkrgqx6
         Y+tmtK3M3Vvx6wy3oG380ajSU3qpSujUY2PCSzc5ACS8k2b6iIeN4tMGyv3AVPTiWfgl
         kGIK4GThi1MxmFLZshWdaSF+nTAGhsusZ5vZCyiPaODswiJZtC7r7+99sxtMiaXTED7w
         QsZIlAZxjDs1Oxb3fw9KJWMQifGBFWuRBMO3XjkT4QU6acDH0PBjZ336I0PduQmJbqTA
         v4uj0y/8YlVIdCc2p+dig+QOnS4bgiMx1+KQvTgxU8DXqmQ3e2q7kTQlrZq3a+bZsKPM
         PMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748878920; x=1749483720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnjxiEH+1ENlh4/0aCwNJpNuqEXQ3yGAnUnbdwnMf+4=;
        b=NrrSfPb9g/LCubn7qdgYIEN99wjxAgMCFNBrVyJf/kwfEKNpM+r61pZvOyQC/bu6+2
         sKyyuht4eIhiLucm5CQ4chhJXwQWox+ocOHXrB/jN1yTDnXpMsaMZD3QofY1Z38l5ZDi
         ZXayufO8teUEg78aQd06Az+brLwEOBYWfNqLe59OKE+8CoXwd6FwON0hSn5qJAZrgdwx
         kt5zmoTJINzLv0cc9GpLvQlGd14AFGu3cgSeZIgFwH/TRNpYF0Jb7lNCGq3H+lCeZDAh
         WhrFQ5MEBrK1R28+lCgHIK2EIRxGcsBtFiM7DsV72yYapGtMcApQBJsA92Xo4zCr6DCM
         O3rw==
X-Gm-Message-State: AOJu0YweJGVTgu3Gysi6OpUIWGevx3mvnqbNOJokgk4aHdlpk5w7BRBU
	tfboVSjQt6w9HETE9zctJunwHl1aE2/I6HVGtDckYCq+2IT+iSA4/5BqABNOsYTxAccgkxeFIkk
	uR7CQhfFsa5VgjSzjKdFcmyiWN0BXplo=
X-Gm-Gg: ASbGncuP2MSgG8F7e+hAxkgamMHuTW41iRF7G5NyCUZHPiQ8ZvCh3d85YCOqDvJnahD
	+6KGNUZYluMZYSkA8j+mhc3v9lAADvuzeEfuWLGThu9Es0p3x7TPk8UAhEPrqXrL7hBzOgpFIMu
	ZxtXBag5JO+ExquyJjE4RzlXJpWu/i+fW1X0yv6uoJB6Q=
X-Google-Smtp-Source: AGHT+IG/eWal6OVnGmw50vwYURQdXRBl4NKhIenZ83QFxqWCtZHjjIRyAWyui9/AIJXn2CS/5wmAQaH3iXd3u88Rqow=
X-Received: by 2002:a17:90a:6d43:b0:312:df08:7276 with SMTP id
 98e67ed59e1d1-312df08761emr467608a91.3.1748878920538; Mon, 02 Jun 2025
 08:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250531154900.53941-1-alperyasinak1@gmail.com> <4f224337-e7c7-4ccb-a0cc-861fddcabc07@cherry.de>
In-Reply-To: <4f224337-e7c7-4ccb-a0cc-861fddcabc07@cherry.de>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Mon, 2 Jun 2025 18:41:49 +0300
X-Gm-Features: AX0GCFsT_n2eI5rFWHsAbjz2BWONoLq_x6_vP-uVHvIa0kthL0Wj5BfLpzUQKBM
Message-ID: <CAGpma=4nc0DcTEddK0FFb6sj2yenN91DnZrcit2poyqOQ_jYSQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document KERNEL_EXTRA_FEATURES
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 15:42:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6982

Since the KERNEL_FEATURES variable is handled in kernel-yocto.bbclass
and KERNEL_EXTRA_FEATURES is usually appended to it, I wanted to
emphasize that this class should be used.
That's why I made a connection between them and assumed that they were
complementary. Apparently I misinterpreted it.  As you said, it always
in final/leaf recipes and not .inc files or classes.

> > +      such as Poky may set a default value using a soft assignment (``=
?=3D``).
> Does it? I don't see it, only an :append is used.

"bitbake-getvar KERNEL_EXTRA_FEATURES" shows that it is
appended(:append) in poky.conf but somehow I missed it and wrote soft
assign... my bad. I should be more careful :)

> I'll let Antonin decide but I am not entirely sure it makes sense to
> document this variable, which is very recipe specific. A point could be
> made that since poky.conf modifies it, maybe it makes sense to document
> it :)

I can prepare a new patch based on your feedback, suggestions.


Quentin Schulz <quentin.schulz@cherry.de>, 2 Haz 2025 Pzt, 14:36
tarihinde =C5=9Funu yazd=C4=B1:
>
> Hi Alper,
>
> On 5/31/25 5:49 PM, Alper Ak via lists.yoctoproject.org wrote:
> > Fix [YOCTO #15751]
> >
> > Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> > ---
> >   documentation/ref-manual/variables.rst | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> >
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref=
-manual/variables.rst
> > index c697bdbbb..2f0925b15 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -5202,6 +5202,24 @@ system and gives an overview of their function a=
nd contents.
> >         Specifies additional ``make`` command-line arguments the OpenEm=
bedded
> >         build system passes on when compiling the kernel.
> >
> > +   :term:`KERNEL_EXTRA_FEATURES`
> > +      Specifies optional kernel features to be added on top of the bas=
e
> > +      configuration in kernel recipes that inherit the :ref:`ref-class=
es-kernel-yocto` class.
> > +
>
> I'm not sure that is true?
>
> git grep KERNEL_EXTRA_FEATURES meta/classes-recipe/kernel-yocto.bbclass
>
> returns nothing.
>
> Looking at the layer level, it seems KERNEL_EXTRA_FEATURES is never used
> as is, only as part of KERNEL_FEATURES, and always in final/leaf recipes
> and not .inc files or classes.
>
> > +      This variable complements :term:`KERNEL_FEATURES` by allowing la=
yers
>
> It doesn't as far as I could tell? You need to make
> KERNEL_EXTRA_FEATURES part of the KERNEL_FEATURES variable for that to
> be true?
>
> > +      to include or override additional features without requiring Pyt=
hon code or
> > +      recipe finalize hooks.
> > +
> > +      Features are defined in ``.scc`` files, which serve as kernel :t=
erm:`Metadata` and usually include patches
> > +      and configuration fragments to be used during the kernel build p=
rocess to modify the Linux kernel.
>
> Gut feeling is that those two lines are too long but haven't checked
> myself, compare to other long lines in this file to see when we wrap text=
.
>
> > +      For example::
> > +
> > +         KERNEL_EXTRA_FEATURES =3D "features/netfilter/netfilter.scc"
> > +         KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
> > +
> > +      By default, :term:`KERNEL_EXTRA_FEATURES` is empty. But, some di=
stributions
>
> It's not, it simply doesn't exist that is all I believe?
>
> > +      such as Poky may set a default value using a soft assignment (``=
?=3D``).
>
> Does it? I don't see it, only an :append is used.
>
> I'll let Antonin decide but I am not entirely sure it makes sense to
> document this variable, which is very recipe specific. A point could be
> made that since poky.conf modifies it, maybe it makes sense to document
> it :)
>
> Cheers,
> Quentin

