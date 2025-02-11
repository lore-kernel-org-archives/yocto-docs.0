Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F80C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 10:36:29 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.9250.1739270182877075438
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 02:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WhKqwBAw;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2810720f8f.0
        for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 02:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739270181; x=1739874981; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sVmGNa9NZnFbeKcd9icklINZQlwBymm+kKnvk3Q2hIo=;
        b=WhKqwBAwmymL75SImp5zEdI4khLnd04+lEA6aG4mpgue335H+ks0Oitn52mLFzew6v
         7UwtWEL7jPbO1QliulDgbYaho4Er8vqtoxL6HW1+JKwuF130fGCTPqYML+awJs5Jyzc9
         iqlauHtDdP8fP5VwEyAlbEjMnlxFcTt6wRsnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270181; x=1739874981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVmGNa9NZnFbeKcd9icklINZQlwBymm+kKnvk3Q2hIo=;
        b=wR5jDiQf9UPMAqR2ResOYNCoFbCTLi7wzTZ+Mkwwz2zRnBGVnxQKv0mRrox7a4OvIS
         AvdRNa60WBWZ55rnjV7jPuGbwlCzR+tSy6Jty5erKraifwLDt8c8mggVkiCWC77ai/1P
         jClwVzyt3coMuDosY7QS9CTs29fbRccvv3WxHiXClZLK+GvQ8EX5JHXanPggtLnHh8df
         m3fzSCsEx7O3qkknlsaMJV6qA68F3tBNVW7IuFesMi7+AB14wDj828U7yJ0chsYJV3/4
         wyM/NVcUGqp9xjpSiMicpn1S2q03J8aISWzJMzpRErKcThHOX+6l4c28umnhO4YkzchX
         Odeg==
X-Gm-Message-State: AOJu0Yz5sBZYT5FYUcY8ssgwZPyRTYVkod+NmI+u37xS8wlf3Q0AEHPQ
	I+pxn3zKn85K+AOyOl6We3/z6a+ZIzNPdqIETeS2D6a+uT8QarDz6dTEAAcWZunMGphred9L6P/
	ZNF+8UOt4itbdtMVwvr9eC/VHxSnphJDUcGcPvA==
X-Gm-Gg: ASbGnctCVwIlsFECFidseejCGWW6kIPeeK1Ipk7lJZOMtqg0umYHSvTbLtpiASOWTlY
	1cRKqmn94/m9M0w9uOWpsCCddYEr+WgYBMBgEo5n6OLXKbogBQgunzX7Ds7YcJZ3h76gUakvD
X-Google-Smtp-Source: AGHT+IGsgE1SvVyWt2XFbLFls1UnjpxlkUJgdpv6zW6mZJ9ndPqWhvjE0BIv/+JzH2h31IyyZIarGX4M5bFbTA2lHx4=
X-Received: by 2002:a05:6000:2cd:b0:38d:db7b:5d90 with SMTP id
 ffacd0b85a97d-38ddb7b6068mr8990895f8f.41.1739270181252; Tue, 11 Feb 2025
 02:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20250209233245.1397155-1-yoann.congal@smile.fr> <8b15c9fd-f33e-4b58-b306-e66822093887@cherry.de>
In-Reply-To: <8b15c9fd-f33e-4b58-b306-e66822093887@cherry.de>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 11 Feb 2025 11:35:55 +0100
X-Gm-Features: AWEUYZnWC5efU6D8z7KdAQwB8c8cOcrxI2J7yFY3paxuMA7tkFqZEDFGkzfyO-c
Message-ID: <CAMSfU+6LtcGJGaEqPvHRk6Wo754=sO-P+qnvXE3FzpXuKRi4dw@mail.gmail.com>
Subject: Re: [docs] [PATCH v3 1/4] ref-manual/variables: document OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005281db062ddb65af"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 10:36:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6327

--0000000000005281db062ddb65af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 10 f=C3=A9vr. 2025 =C3=A0 18:37, Quentin Schulz <quentin.schulz@che=
rry.de> a
=C3=A9crit :

> Hi Yoann,
>
> On 2/10/25 12:32 AM, Yoann Congal via lists.yoctoproject.org wrote:
> > From: Yoann Congal <yoann.congal@smile.fr>
> >
> > This documents the variable used in the "automate testing a single
> > recipe's reproducibility" feature [YOCTO #15701]
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> > v2->v3: Quentin's review:
> > * s/target/target(s)/
> > * Removed Guillaume Reviewed-by (given privately)
> > ---
> >   documentation/ref-manual/variables.rst | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> > index adbef69d8..2f1937632 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -5807,6 +5807,11 @@ system and gives an overview of their function
> and contents.
> >         For additional information on how this variable is used, see th=
e
> >         initialization script.
> >
> > +   :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
> > +      Set build target(s) for build reproducibility testing but activa=
te
> > +      :ref:`shared state <overview-manual/concepts:shared state cache>=
`
> build
> > +      for most dependencies. See
> :doc:`/test-manual/reproducible-builds`.
> > +
>
> What do you mean by "most dependencies"?
>
> The code I glanced at in OE-Core seems to indicate it adds all DEPENDS
> from each leaf recipe to the list of targets to build with sstate-cache
> (the same way it's done for OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS).
>

Sadly, DEPENDS is not all the dependencies of a recipe. Some dependencies
are added via
do_task[depends] =3D "recipe:do_task2"
Those don't appear in DEPENDS but are built anyway.

Look at PACKAGE_DEPENDS for example:
https://git.yoctoproject.org/poky/tree/meta/classes-global/package.bbclass#=
n232
There are other instances.

I plan to improve the reproducibility test to include all of those with a
suggestion from Richard, and then, going back to the doc and removing this
"most" among other changes...



> Cheers,
> Quentin
>


--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000005281db062ddb65af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 10=
 f=C3=A9vr. 2025 =C3=A0=C2=A018:37, Quentin Schulz &lt;<a href=3D"mailto:qu=
entin.schulz@cherry.de">quentin.schulz@cherry.de</a>&gt; a =C3=A9crit=C2=A0=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Yoann,<br>
<br>
On 2/10/25 12:32 AM, Yoann Congal via <a href=3D"http://lists.yoctoproject.=
org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:=
<br>
&gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; <br>
&gt; This documents the variable used in the &quot;automate testing a singl=
e<br>
&gt; recipe&#39;s reproducibility&quot; feature [YOCTO #15701]<br>
&gt; <br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt; v2-&gt;v3: Quentin&#39;s review:<br>
&gt; * s/target/target(s)/<br>
&gt; * Removed Guillaume Reviewed-by (given privately)<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0documentation/ref-manual/variables.rst | 5 +++++<br>
&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/documentation/ref-manual/variables.rst b/documentation/re=
f-manual/variables.rst<br>
&gt; index adbef69d8..2f1937632 100644<br>
&gt; --- a/documentation/ref-manual/variables.rst<br>
&gt; +++ b/documentation/ref-manual/variables.rst<br>
&gt; @@ -5807,6 +5807,11 @@ system and gives an overview of their function =
and contents.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0For additional information on how thi=
s variable is used, see the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initialization script.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0:term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Set build target(s) for build reproducibility te=
sting but activate<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 :ref:`shared state &lt;overview-manual/concepts:=
shared state cache&gt;` build<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 for most dependencies. See :doc:`/test-manual/re=
producible-builds`.<br>
&gt; +<br>
<br>
What do you mean by &quot;most dependencies&quot;?<br>
<br>
The code I glanced at in OE-Core seems to indicate it adds all DEPENDS <br>
from each leaf recipe to the list of targets to build with sstate-cache <br=
>
(the same way it&#39;s done for OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS).<br>=
</blockquote><div><br></div><div>Sadly, DEPENDS is not all the dependencies=
 of a recipe. Some dependencies are added via</div><div>do_task[depends] =
=3D &quot;recipe:do_task2&quot;</div><div>Those don&#39;t appear in DEPENDS=
 but are built anyway.<br></div></div><div class=3D"gmail_quote gmail_quote=
_container"><br></div><div class=3D"gmail_quote gmail_quote_container">Look=
 at PACKAGE_DEPENDS for example:</div><div class=3D"gmail_quote gmail_quote=
_container"><a href=3D"https://git.yoctoproject.org/poky/tree/meta/classes-=
global/package.bbclass#n232">https://git.yoctoproject.org/poky/tree/meta/cl=
asses-global/package.bbclass#n232</a></div><div class=3D"gmail_quote gmail_=
quote_container">There are other instances.</div><div class=3D"gmail_quote =
gmail_quote_container"><br></div><div class=3D"gmail_quote gmail_quote_cont=
ainer">I plan to improve the reproducibility test to include all of those w=
ith a suggestion from Richard, and then, going back to the doc and removing=
 this &quot;most&quot; among other changes...</div><div class=3D"gmail_quot=
e gmail_quote_container">=C2=A0<br></div><div class=3D"gmail_quote gmail_qu=
ote_container"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
Cheers,<br>
Quentin<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--0000000000005281db062ddb65af--

