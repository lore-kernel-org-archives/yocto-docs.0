Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50567C4167B
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 16:33:42 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.129.1698770019917451002
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 09:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QaaPcmYS;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: bhstalel@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-507b9408c61so8150558e87.0
        for <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 09:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698770018; x=1699374818; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=broi7YSn+w3zk0NJhdMf4OdRxplaKnQ8gRPlnBA9zVY=;
        b=QaaPcmYSRzvtM2F9NkrNXMBxk9PxepocpIfz0vGHFyl+0D9RoWe2cg2s2aW9DnmufE
         jBdqVtYr0HKF+vXpXScQZjvUDklIXo2DWcETBwXx/lZDREQRRznkgyfrPVRfbjKfTwP7
         RVXXjyMzELA/IG7McjpOkRHb60svi5Sd6RIEtzLHnJWggBBrJoN81X4xvm4cFdFW8EqL
         aH8EO7aut4oGnJe5AjK7Tbn8DOCpLSY0t9CU3foVl2WqUnbmCXt/wZ5HBl6xOmI6f4Nk
         G6WwDYNxqFoPWVs+Yc75HE1xpvTxGq595CzHgZOslVlNg9Q55fCzC0rC/6/PRDIgYHwR
         L9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698770018; x=1699374818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=broi7YSn+w3zk0NJhdMf4OdRxplaKnQ8gRPlnBA9zVY=;
        b=uuICIYwqxXKh65s69cfA4ZVBy6ryh2Hltc3Cx6Zbayym3qrr2uYPOmODi8x3c/GrST
         R0yjNu2xRaQnVofLdBpK+zAWzY6dMSkyeUzSyGUSAieBD2ESHvL0Jxe1+N7bzxyXMA5M
         lE4bAuOvLXWVi/rpW6mbjeaBQpVg+qMpOnmXC8Z01pEsSgL7mD6JyAJERbtmn8z8YukU
         rB6fPEtS5L8HdM2Xs047iOq9Rfx9G58yNgXv1+aD3qgn1oBbom0vDTTaQNK4v+OxcqC4
         7PoA+HveqIrkLEPgetjjKvKYF6bQcaWdH+q7Xv4fa3aiiue5F7DMBWC0uECPnQ0MGSCr
         ubfQ==
X-Gm-Message-State: AOJu0YyFTGrSbIBp5sF5JFzzXSxJGfU/2fn4xHue1SftZDurTLeCMmVV
	XsL0ONQEpEOfq60ndyWokO+GU04R/33sGs1TAnw=
X-Google-Smtp-Source: AGHT+IEPLDdzYCUR43HN31Mks3dBe+3ZTL9ZZiSH36b4XBXpwAcBpZItrOONf6EbPyyPk8d5WBlzQ2oISy+hvynqpXY=
X-Received: by 2002:a05:6512:159f:b0:507:ce49:81bd with SMTP id
 bp31-20020a056512159f00b00507ce4981bdmr11453026lfb.61.1698770016037; Tue, 31
 Oct 2023 09:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231027155312.577723-1-bhstalel@gmail.com> <da2e6ce3-4338-4273-816e-8fba92f6e0ca@bootlin.com>
 <af4eec13-87d9-d4d1-6f38-2a224fb3dd6c@crashcourse.ca>
In-Reply-To: <af4eec13-87d9-d4d1-6f38-2a224fb3dd6c@crashcourse.ca>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Tue, 31 Oct 2023 17:33:25 +0100
Message-ID: <CAOgG7m3Y=Uu+Ck5VqG0yU=7ikNNRN6whR5DZ0wNexEkYyFF1LQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] overview-manual: concepts: Add Bitbake Tasks Map
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005c6f59060905b7c8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 16:33:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4543

--0000000000005c6f59060905b7c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Robert, Michael,

Thank you for the review.

I fixed the comments, I just need to fix the diagram.

Regarding SONAME, I just wanted to specify that "you need to follow
guidelines when creating shared libraries", anyways
I changed it to:

.. note::

   When creating shared libraries, it is strongly recommended to follow the
> Linux
>    conventions and guidelines. (see `this article
>    <https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html>`_=
_
>    for some background).


I will send V2 by tonight or tomorrow.

Thanks again,
kind regards
Talel

On Tue, Oct 31, 2023 at 4:00=E2=80=AFPM Robert P. J. Day <rpjday@crashcours=
e.ca>
wrote:

> On Tue, 31 Oct 2023, Michael Opdenacker via lists.yoctoproject.org wrote:
>
> > Hi Talel,
> >
> > Many thanks for all this work! See my comments below... Sorry,
> > mostly nitpicking and style improvements, but I do it before Quentin
> > Schulz or Robert P. J. Day wake up ;-)
>
>   too late.
>
> > > +about where and what bitbake does as a job (tasks) in order to
> generate
> > > +the final recipe's package file.
> >
> > "where" sounds weird for a computer task, and the wording sounds
> unnecessarily
> > complicated anyway. What about instead?
> >
> > "to have the full picture about the tasks that BitBake runs to generate
> the
> > final package file for the recipe."
>
>   rule #1: eschew superfliage. that is, don't use unnecessary words.
> why not just, "to understand the tasks that BitBake runs ..."? or, "to
> understand how BitBake generates the final package file for the
> recipe"?
>
> > "``sayhello`` depends on ``libhello`` at compile time as it needs the
> shared
> > library at compile time. It also depends on it at runtime as the shared
>
>   you're saying "at compile time" twice in the same sentence.
>
> > library loader needs to find the library in the root filesystem."
>
>   where else would it find it other than the root filesystem?
>
> > s/rootfs/root filesystem/
> >
> > > +
> > > +#. Create a Git repository for each project with the corresponding
> files
> > > +#. Create a recipe for each project
> > > +#. Make sure that ``sayhello`` recipe :term:`DEPENDS` on ``libhello`=
`
> > > +#. Make sure that ``sayhello`` recipe :term:`RDEPENDS` on ``libhello=
``
> > > +#. Add ``sayhello`` to :term:`IMAGE_INSTALL` to integrate it into
> > > +   the final rootfs
> >
> > Same here
>
>   is it necessary to qualify this as the "final" rootfs? as opposed to
> what other rootfs?
>
> rday
>

--0000000000005c6f59060905b7c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Robert, Michael,<div><br></div><div>Thank you f=
or the review.</div><div><br></div><div>I fixed the comments, I just need t=
o fix the diagram.</div><div><br></div><div>Regarding SONAME, I just wanted=
 to specify that &quot;you need to follow guidelines when creating shared l=
ibraries&quot;, anyways</div><div>I changed it to:</div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">.. note::</blockquote><div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=A0When creating =
shared libraries, it is strongly recommended to follow the Linux<br>=C2=A0 =
=C2=A0conventions and guidelines. (see `this article<br>=C2=A0 =C2=A0&lt;<a=
 href=3D"https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html=
">https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html</a>&gt=
;`__<br>=C2=A0 =C2=A0for some background).</blockquote></div><div><br></div=
><div>I will send V2 by tonight or tomorrow.</div><div><br></div><div>Thank=
s again,</div><div>kind regards</div><div>Talel</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 31, 2023=
 at 4:00=E2=80=AFPM Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcour=
se.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Tue, 31 Oct 2023, Michael Opdenacker via <a =
href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank"=
>lists.yoctoproject.org</a> wrote:<br>
<br>
&gt; Hi Talel,<br>
&gt;<br>
&gt; Many thanks for all this work! See my comments below... Sorry,<br>
&gt; mostly nitpicking and style improvements, but I do it before Quentin<b=
r>
&gt; Schulz or Robert P. J. Day wake up ;-)<br>
<br>
=C2=A0 too late.<br>
<br>
&gt; &gt; +about where and what bitbake does as a job (tasks) in order to g=
enerate<br>
&gt; &gt; +the final recipe&#39;s package file.<br>
&gt;<br>
&gt; &quot;where&quot; sounds weird for a computer task, and the wording so=
unds unnecessarily<br>
&gt; complicated anyway. What about instead?<br>
&gt;<br>
&gt; &quot;to have the full picture about the tasks that BitBake runs to ge=
nerate the<br>
&gt; final package file for the recipe.&quot;<br>
<br>
=C2=A0 rule #1: eschew superfliage. that is, don&#39;t use unnecessary word=
s.<br>
why not just, &quot;to understand the tasks that BitBake runs ...&quot;? or=
, &quot;to<br>
understand how BitBake generates the final package file for the<br>
recipe&quot;?<br>
<br>
&gt; &quot;``sayhello`` depends on ``libhello`` at compile time as it needs=
 the shared<br>
&gt; library at compile time. It also depends on it at runtime as the share=
d<br>
<br>
=C2=A0 you&#39;re saying &quot;at compile time&quot; twice in the same sent=
ence.<br>
<br>
&gt; library loader needs to find the library in the root filesystem.&quot;=
<br>
<br>
=C2=A0 where else would it find it other than the root filesystem?<br>
<br>
&gt; s/rootfs/root filesystem/<br>
&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +#. Create a Git repository for each project with the correspondi=
ng files<br>
&gt; &gt; +#. Create a recipe for each project<br>
&gt; &gt; +#. Make sure that ``sayhello`` recipe :term:`DEPENDS` on ``libhe=
llo``<br>
&gt; &gt; +#. Make sure that ``sayhello`` recipe :term:`RDEPENDS` on ``libh=
ello``<br>
&gt; &gt; +#. Add ``sayhello`` to :term:`IMAGE_INSTALL` to integrate it int=
o<br>
&gt; &gt; +=C2=A0 =C2=A0the final rootfs<br>
&gt;<br>
&gt; Same here<br>
<br>
=C2=A0 is it necessary to qualify this as the &quot;final&quot; rootfs? as =
opposed to<br>
what other rootfs?<br>
<br>
rday<br>
</blockquote></div>

--0000000000005c6f59060905b7c8--

