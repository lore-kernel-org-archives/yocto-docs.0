Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469C4C021A1
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:34:42 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.2877.1739316880217309159
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 15:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XhL+xVxU;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso15962855e9.0
        for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 15:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739316879; x=1739921679; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e7fPl11kZkRbYbRyuZn4wDT0MO+l9WBTjhWwKRf6V0k=;
        b=XhL+xVxU7iUQHXqBK3W7r8wWnChxr1/OCH/q0uu4lVoTJKWLkwc4SBqVd0zzY4BdlP
         VTYVzJUg/i4wQVIzAhkPVljQv0lkFKeHmfVIzwFDSFVpbdqMIOYXP9i2jHdlQIz0i6UU
         4cgiHdAibVF1CPUzzOV/5FVYHC3IRes6QXQxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739316879; x=1739921679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7fPl11kZkRbYbRyuZn4wDT0MO+l9WBTjhWwKRf6V0k=;
        b=dG/XJZvVclkTKTK0DAOZOuYSCaErMi2PbP//rMH1JWSi4MXxrerXapzyabs8vVQ+6L
         ppwbGWZMAIxOvGu6XdSTBmAeCy0ncjieG/1Qa9cDIkQ+z4GzqkbV64i7rByrsV/H3+Cz
         stfqqbuVg02oAuk9tQi5QjDZ6LX4BhV/JqDLhMkDJuIYkFg2SYxdIZkA06CMOV8ZX4Li
         mqRUf4TSsUpHE6FiFBVhyfpBAn+n7Y7LQWXgTDd86ubQOv0HJh907tPKqjjyz0924HB4
         7KV4uY0NASHUJ+tKKda47Y1Pos2uHXqU6T0Ixv12LtIvU6GTHhadeYVOzU0J3VUW3N1g
         yLPA==
X-Gm-Message-State: AOJu0Yzz5F3ai+8QoerQ0ztMh22NGfdGkLS3Xdmc03sVbd4FYWO801GG
	rxIv4KODWKwf4uc8qA+CTgiDeLw2TRSFy6fYt+BqY0LqGKrDTbPI/3tLZKOscKY84IYmunPsidl
	MoxbkFgesJwnYiSZNleFDRbY2viRFyo2ZJt7qvf4Re2l276Co
X-Gm-Gg: ASbGncuYBqql4xXSfGcEzwP15iJ4IJPWxMUnNg7gfs/bFWrYmIZBFWTYLVKeOr78afO
	cD1+Xbskj1fXkCxlinxGgANQuYxMDhwUIEHHMupVpqevODDqvQd1RNuKcNWIHN6Ri45MvVCln
X-Google-Smtp-Source: AGHT+IG44l6J4mL+HMOOha9V5vH/jNqiYMAmzrvHsIhX4Njxpw+fqRzmO2536QDNgYkHoITBi/TN5ojYJ6NfG7GkDTo=
X-Received: by 2002:a05:600c:1c84:b0:439:34d3:63dd with SMTP id
 5b1f17b1804b1-4395816a167mr10384735e9.7.1739316878587; Tue, 11 Feb 2025
 15:34:38 -0800 (PST)
MIME-Version: 1.0
References: <20250209233245.1397155-1-yoann.congal@smile.fr>
 <8b15c9fd-f33e-4b58-b306-e66822093887@cherry.de> <CAMSfU+6LtcGJGaEqPvHRk6Wo754=sO-P+qnvXE3FzpXuKRi4dw@mail.gmail.com>
 <56bf748d-4f6d-4b94-80e3-5625a9948e41@cherry.de>
In-Reply-To: <56bf748d-4f6d-4b94-80e3-5625a9948e41@cherry.de>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 12 Feb 2025 00:34:12 +0100
X-Gm-Features: AWEUYZnPJiFhOxLFHchWF8rIka6PrF2efG6yNl7cTUQgg5Nqi-rEFXPEliQFbsk
Message-ID: <CAMSfU+6eU2ByBWk9r8w6ZUo+CAMm01K-HLfdD7XWYTJhLWCtNw@mail.gmail.com>
Subject: Re: [docs] [PATCH v3 1/4] ref-manual/variables: document OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b34f3b062de644d4"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 23:34:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6342

--000000000000b34f3b062de644d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 11 f=C3=A9vr. 2025 =C3=A0 14:57, Quentin Schulz <quentin.schulz@che=
rry.de> a
=C3=A9crit :

> Hi Yoann,
>
> On 2/11/25 11:35 AM, Yoann Congal wrote:
> > Le lun. 10 f=C3=A9vr. 2025 =C3=A0 18:37, Quentin Schulz <quentin.schulz=
@cherry.de>
> a
> > =C3=A9crit :
> >
> >> Hi Yoann,
> >>
> >> On 2/10/25 12:32 AM, Yoann Congal via lists.yoctoproject.org wrote:
> >>> From: Yoann Congal <yoann.congal@smile.fr>
> >>>
> >>> This documents the variable used in the "automate testing a single
> >>> recipe's reproducibility" feature [YOCTO #15701]
> >>>
> >>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> >>> ---
> >>> v2->v3: Quentin's review:
> >>> * s/target/target(s)/
> >>> * Removed Guillaume Reviewed-by (given privately)
> >>> ---
> >>>    documentation/ref-manual/variables.rst | 5 +++++
> >>>    1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/documentation/ref-manual/variables.rst
> >> b/documentation/ref-manual/variables.rst
> >>> index adbef69d8..2f1937632 100644
> >>> --- a/documentation/ref-manual/variables.rst
> >>> +++ b/documentation/ref-manual/variables.rst
> >>> @@ -5807,6 +5807,11 @@ system and gives an overview of their function
> >> and contents.
> >>>          For additional information on how this variable is used, see
> the
> >>>          initialization script.
> >>>
> >>> +   :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
> >>> +      Set build target(s) for build reproducibility testing but
> activate
> >>> +      :ref:`shared state <overview-manual/concepts:shared state
> cache>`
> >> build
> >>> +      for most dependencies. See
> >> :doc:`/test-manual/reproducible-builds`.
> >>> +
> >>
> >> What do you mean by "most dependencies"?
> >>
> >> The code I glanced at in OE-Core seems to indicate it adds all DEPENDS
> >> from each leaf recipe to the list of targets to build with sstate-cach=
e
> >> (the same way it's done for OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS).
> >>
> >
> > Sadly, DEPENDS is not all the dependencies of a recipe. Some dependenci=
es
> > are added via
> > do_task[depends] =3D "recipe:do_task2"
> > Those don't appear in DEPENDS but are built anyway.
> >
> > Look at PACKAGE_DEPENDS for example:
> >
> https://git.yoctoproject.org/poky/tree/meta/classes-global/package.bbclas=
s#n232
> > There are other instances.
> >
> > I plan to improve the reproducibility test to include all of those with=
 a
> > suggestion from Richard, and then, going back to the doc and removing
> this
> > "most" among other changes...
> >
>
> I can't believe how much I'm learning from reviewing patches for the
> docs. I hope people understand that and we get more people reviewing and
> sending patches to the ML :)
>
> I missed the [depends] thingy and was totally unaware of the other ones.
> Can you then make it explicit which dependencies we're talking about?
> i.e. the ones explicitly listed in DEPENDS (which may not be all
> dependencies, c.f. [depends] varflags, PACKAGE_DEPENDS and other
> implementations).
>

I can't be too explicit since I don't know all of the dependencies and this
should be a non-issue in the next version.
I took your suggestion (I hope that was one ^^) for v4.

Thanks


> Thanks for the explanation and pointer, much appreciated!
>
> Cheers,
> Quentin
>


--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000b34f3b062de644d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 11=
 f=C3=A9vr. 2025 =C3=A0=C2=A014:57, Quentin Schulz &lt;<a href=3D"mailto:qu=
entin.schulz@cherry.de">quentin.schulz@cherry.de</a>&gt; a =C3=A9crit=C2=A0=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Yoann,<br>
<br>
On 2/11/25 11:35 AM, Yoann Congal wrote:<br>
&gt; Le lun. 10 f=C3=A9vr. 2025 =C3=A0 18:37, Quentin Schulz &lt;<a href=3D=
"mailto:quentin.schulz@cherry.de" target=3D"_blank">quentin.schulz@cherry.d=
e</a>&gt; a<br>
&gt; =C3=A9crit :<br>
&gt; <br>
&gt;&gt; Hi Yoann,<br>
&gt;&gt;<br>
&gt;&gt; On 2/10/25 12:32 AM, Yoann Congal via <a href=3D"http://lists.yoct=
oproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</=
a> wrote:<br>
&gt;&gt;&gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr=
" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This documents the variable used in the &quot;automate testing=
 a single<br>
&gt;&gt;&gt; recipe&#39;s reproducibility&quot; feature [YOCTO #15701]<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal=
@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; v2-&gt;v3: Quentin&#39;s review:<br>
&gt;&gt;&gt; * s/target/target(s)/<br>
&gt;&gt;&gt; * Removed Guillaume Reviewed-by (given privately)<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 documentation/ref-manual/variables.rst | 5 +++++<=
br>
&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 5 insertions(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/documentation/ref-manual/variables.rst<br>
&gt;&gt; b/documentation/ref-manual/variables.rst<br>
&gt;&gt;&gt; index adbef69d8..2f1937632 100644<br>
&gt;&gt;&gt; --- a/documentation/ref-manual/variables.rst<br>
&gt;&gt;&gt; +++ b/documentation/ref-manual/variables.rst<br>
&gt;&gt;&gt; @@ -5807,6 +5807,11 @@ system and gives an overview of their f=
unction<br>
&gt;&gt; and contents.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 For additional information o=
n how this variable is used, see the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initialization script.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0:term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 Set build target(s) for build reproducib=
ility testing but activate<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 :ref:`shared state &lt;overview-manual/c=
oncepts:shared state cache&gt;`<br>
&gt;&gt; build<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 for most dependencies. See<br>
&gt;&gt; :doc:`/test-manual/reproducible-builds`.<br>
&gt;&gt;&gt; +<br>
&gt;&gt;<br>
&gt;&gt; What do you mean by &quot;most dependencies&quot;?<br>
&gt;&gt;<br>
&gt;&gt; The code I glanced at in OE-Core seems to indicate it adds all DEP=
ENDS<br>
&gt;&gt; from each leaf recipe to the list of targets to build with sstate-=
cache<br>
&gt;&gt; (the same way it&#39;s done for OEQA_REPRODUCIBLE_TEST_SSTATE_TARG=
ETS).<br>
&gt;&gt;<br>
&gt; <br>
&gt; Sadly, DEPENDS is not all the dependencies of a recipe. Some dependenc=
ies<br>
&gt; are added via<br>
&gt; do_task[depends] =3D &quot;recipe:do_task2&quot;<br>
&gt; Those don&#39;t appear in DEPENDS but are built anyway.<br>
&gt; <br>
&gt; Look at PACKAGE_DEPENDS for example:<br>
&gt; <a href=3D"https://git.yoctoproject.org/poky/tree/meta/classes-global/=
package.bbclass#n232" rel=3D"noreferrer" target=3D"_blank">https://git.yoct=
oproject.org/poky/tree/meta/classes-global/package.bbclass#n232</a><br>
&gt; There are other instances.<br>
&gt; <br>
&gt; I plan to improve the reproducibility test to include all of those wit=
h a<br>
&gt; suggestion from Richard, and then, going back to the doc and removing =
this<br>
&gt; &quot;most&quot; among other changes...<br>
&gt; <br>
<br>
I can&#39;t believe how much I&#39;m learning from reviewing patches for th=
e <br>
docs. I hope people understand that and we get more people reviewing and <b=
r>
sending patches to the ML :)<br>
<br>
I missed the [depends] thingy and was totally unaware of the other ones. <b=
r>
Can you then make it explicit which dependencies we&#39;re talking about? <=
br>
i.e. the ones explicitly listed in DEPENDS (which may not be all <br>
dependencies, c.f. [depends] varflags, PACKAGE_DEPENDS and other <br>
implementations).<br></blockquote><div><br></div><div>I can&#39;t be too ex=
plicit since I don&#39;t know all of the dependencies and this should be a =
non-issue in the next version.</div><div>I took your suggestion (I hope tha=
t was one ^^) for v4.</div><div><br></div><div>Thanks</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks for the explanation and pointer, much appreciated!<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--000000000000b34f3b062de644d4--

