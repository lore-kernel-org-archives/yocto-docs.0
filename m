Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7E9E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 09:47:00 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.148764.1734688011039890252
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 01:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PMR8LvDZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38632b8ae71so1274984f8f.0
        for <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 01:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1734688009; x=1735292809; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pW7P34+l9orPdI1+BleKO26Y8w9egxLwrnymLCcwa7M=;
        b=PMR8LvDZte91j1tCQ8gjuW64oD2GIduy1yTTEY93zHislPCfxa5o7/rDFZWkEauwPa
         3NVy+75nb/AeamQ0VPVpsaX7MwmtUP5/e+EMakzvraJw9/Pa7gLYBgwNZvBzxZmmrwxH
         qcnZPs4pimMmXkm7KGzyvhYonEt0hlgzOj358=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734688009; x=1735292809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pW7P34+l9orPdI1+BleKO26Y8w9egxLwrnymLCcwa7M=;
        b=QZ6uovhiZ0LIunv+HA46twhBgmwaDDlmOlbp+o8wQPy4Ttf05B0rDeyMlC2ZxZapIi
         1t8qsxeO5S+0iwVsZDzvWQyrWCfmo/as55U4Atx9ZHEtvMV9+UJQoaNlzhVGtJWUKq2c
         /sjIgHTeBH6hZGPBpW33gtrbDu8NN2OTEKXQP0p05n8VMsqV/UXAicEjEq6XYPgqC8WC
         Y/ykWVxYPRYb5ox9l78YLPOs2PTZDU5Mxa3jDC93+uxdnJNQhN+lEhUoBp8X449bqT1y
         bbgFxYHHQFKd016arAF3SCuoiksQXafJm0eFlHwkY+pqXgeB3TYijW1uZ2JOh9mvUU8C
         VJuA==
X-Forwarded-Encrypted: i=1; AJvYcCUqrEhS8dnv8uVShWsYD4qjeADZTz4brCNZcgY8iD6uSNdjxc+11Zi7CRINiRu+c/9aE/g0@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yye5zM4svGAJxf4lkj4Qm3QroQLl9xNYhdhOcWtLI6hkIVxiEoF
	sguguQtCZ1isIoti8ni7OBPPc+wFKrn690YYQ5gcHTAKbwRE4hAKQ4DoyPfMTgQqlV86JadXp/+
	zp8/xIqNvn25olnDjUMhiAnHZJaLeAgmSuqnXyA==
X-Gm-Gg: ASbGnctx3Syih1lyx2Wxtr+CDRVR08CtVwNzNKN3DCAHaC4XFk6c7LuLYD8LSVbZV/S
	J0ZirIbVplwInroP/tPSVNC7D99/GWDDwwkc=
X-Google-Smtp-Source: AGHT+IGbwD1a7RT82eLlhxcSCH1h/zzLUfr1jOym8p4efK5WYsoScW904VeHHgN49ZZlB05us6kt8K8ziHTvw2O6WvA=
X-Received: by 2002:a5d:5f54:0:b0:385:fb53:c67 with SMTP id
 ffacd0b85a97d-38a221e2743mr2482462f8f.3.1734688009307; Fri, 20 Dec 2024
 01:46:49 -0800 (PST)
MIME-Version: 1.0
References: <20241218200630.823299-1-tgamblin@baylibre.com>
 <CAMSfU+7BFDDxD4w7BsH17Gxyrvt+1SGb1QmKZRE3eENg1Fv2zg@mail.gmail.com> <D6GDPNGTBDPW.1YXTRR6MY1X0B@bootlin.com>
In-Reply-To: <D6GDPNGTBDPW.1YXTRR6MY1X0B@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 20 Dec 2024 10:46:23 +0100
Message-ID: <CAMSfU+4-D+vu=yfQGLoU3a9cL8cX=nXOcjXnW=zWNhVgdfzYkw@mail.gmail.com>
Subject: Re: [docs][PATCH] reproducible-builds.rst: show how to build a single package
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: tgamblin@baylibre.com, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009765400629b08604"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 09:47:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5994

--0000000000009765400629b08604
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 20 d=C3=A9c. 2024 =C3=A0 09:19, Antonin Godard <antonin.godard@boot=
lin.com> a
=C3=A9crit :

> Hi Yoann,
>
> On Thu Dec 19, 2024 at 1:27 PM CET, Yoann Congal via
> lists.yoctoproject.org wrote:
> > Le mer. 18 d=C3=A9c. 2024 =C3=A0 21:06, Trevor Gamblin via lists.yoctop=
roject.org
> > <tgamblin=3Dbaylibre.com@lists.yoctoproject.org> a =C3=A9crit :
> >
> >> Add a bit to the "Can we prove the project is reproducible?" section t=
o
> >> show how OEQA_REPRODUCIBLE_TEST_TARGET can be used to test a single
> >> package (rather than the world build), as this may be useful for
> >> maintainers.
> >>
> >> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> >>
> >
> > Thank you for doing this.
> >
> > That is https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15619 (you =
may
> > want to take it and add a [YOCTO #15619] ref in this patch)
> >
> > ---
> >>  .../test-manual/reproducible-builds.rst       | 22 +++++++++++++-----=
-
> >>  1 file changed, 15 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/documentation/test-manual/reproducible-builds.rst
> >> b/documentation/test-manual/reproducible-builds.rst
> >> index 91f94a5c7..d581155eb 100644
> >> --- a/documentation/test-manual/reproducible-builds.rst
> >> +++ b/documentation/test-manual/reproducible-builds.rst
> >> @@ -91,13 +91,21 @@ run::
> >>
> >>     oe-selftest -r
> reproducible.ReproducibleTests.test_reproducible_builds
> >>
> >> -This defaults to including a ``world`` build so, if other layers are
> >> added, it would
> >> -also run the tests for recipes in the additional layers. Different
> build
> >> targets
> >> -can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET` variab=
le
> >> in ``local.conf``.
> >> -The first build will be run using :ref:`Shared State
> >> <overview-manual/concepts:Shared State>` if
> >> -available, the second build explicitly disables
> >> -:ref:`Shared State <overview-manual/concepts:Shared State>` except fo=
r
> >> recipes defined in
> >> -the :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and build=
s
> on
> >> the
> >> +This defaults to including a ``world`` build so, if other layers are
> >> added, it
> >> +would also run the tests for recipes in the additional layers.
> Different
> >> build
> >> +targets can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET=
`
> >> variable
> >> +in ``local.conf``. For example, running reproducibility tests for onl=
y
> the
> >> +``python3-numpy`` recipe can be done by setting::
> >> +
> >> +   OEQA_REPRODUCIBLE_TEST_TARGET =3D "python3-numpy"
> >> +
> >> +in local.conf before running the ``oe-selftest`` command shown above.
> >> +
> >> +Reproducibility builds the target list twice. The first build will be
> run
> >> using
> >> +:ref:`Shared State <overview-manual/concepts:Shared State>` if
> available,
> >> the
> >> +second build explicitly disables :ref:`Shared State
> >> +<overview-manual/concepts:Shared State>` except for recipes defined i=
n
> the
> >> +:term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and builds on
> the
> >>
> >
> > What do you think of adding that a quick way to test the reproducibilit=
y
> of
> > a recipe is to do
> > OEQA_REPRODUCIBLE_TEST_TARGET =3D "recipe"
> > OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS =3D "DEPENDS of recipe"
> > ?
>
> I have a question on this:
>
> What you are trying to say is that you need to set
> OEQA_REPRODUCIBLE_TEST_TARGET
> to the recipe you want to test (`python3-numpy` in Trevor's example), and
> then
> set OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS to the DEPENDS of the recipe
> (`bitbake-getvar -r python3-numpy DEPENDS` would be a way to obtain that
> value?
> I would put that here as well).
>

Yes, that is what I usually do to test a single recipe's reproducibility.


> My question is: is the reason to set OEQA_REPRODUCIBLE_TEST_SSTATE_TARGET=
S
> to
> avoid rebuilding all the dependencies of OEQA_REPRODUCIBLE_TEST_TARGET
> without
> the sstate cache (and therefore save a lot of time)? If that's why, maybe
> mention it explicitly here too.
>

I agree. For the global project, it makes sense to rebuild everything. But,
for a single developer focused on only one recipe (and making the
hypothesis that all of the dependencies are already reproducible), it is
quicker for them to disable sstate only for the recipe.


> Other question: can OEQA_REPRODUCIBLE_TEST_TARGET contain more than 1
> recipe?


Yes.


> If so, do you need to concatenate the DEPENDS of each of them? The
> variable's doc is
> not really clear on this.
>

Also yes.

There is something to add here. The DEPENDS list is not enough. Some build
dependencies are dynamically computed. For example, I have this to test an
empty recipe :
OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS =3D "autoconf-native automake-native
libtool-native libtool-cross gettext-native ncurses bison-native
texinfo-dummy-native gcc-runtime glibc glibc opkg-utils gcc-cross-x86_64
linux-yocto"
I've gathered this list by looking at the build logs, but I always wanted
to find an automated way to get it.

Final thought, maybe all of this can be fully automated? Something like a
"OEQA_REPRODUCIBLE_ONLY_TEST_TARGET" that would :
* compute every dependencies of the recipe (dynamic deps included)
* build these using sstate
* build the recipe with and without sstate and compare output (normal
reproducible test)

I created https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15701 with th=
is
idea.

Regards,
--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000009765400629b08604
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 20 d=C3=
=A9c. 2024 =C3=A0=C2=A009:19, Antonin Godard &lt;<a href=3D"mailto:antonin.=
godard@bootlin.com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi Yoann,<br>
<br>
On Thu Dec 19, 2024 at 1:27 PM CET, Yoann Congal via <a href=3D"http://list=
s.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject=
.org</a> wrote:<br>
&gt; Le mer. 18 d=C3=A9c. 2024 =C3=A0 21:06, Trevor Gamblin via <a href=3D"=
http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.y=
octoproject.org</a><br>
&gt; &lt;tgamblin=3D<a href=3D"mailto:baylibre.com@lists.yoctoproject.org" =
target=3D"_blank">baylibre.com@lists.yoctoproject.org</a>&gt; a =C3=A9crit =
:<br>
&gt;<br>
&gt;&gt; Add a bit to the &quot;Can we prove the project is reproducible?&q=
uot; section to<br>
&gt;&gt; show how OEQA_REPRODUCIBLE_TEST_TARGET can be used to test a singl=
e<br>
&gt;&gt; package (rather than the world build), as this may be useful for<b=
r>
&gt;&gt; maintainers.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@bayli=
bre.com" target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; Thank you for doing this.<br>
&gt;<br>
&gt; That is <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D15619" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoprojec=
t.org/show_bug.cgi?id=3D15619</a> (you may<br>
&gt; want to take it and add a [YOCTO #15619] ref in this patch)<br>
&gt;<br>
&gt; ---<br>
&gt;&gt;=C2=A0 .../test-manual/reproducible-builds.rst=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 22 +++++++++++++------<br>
&gt;&gt;=C2=A0 1 file changed, 15 insertions(+), 7 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/documentation/test-manual/reproducible-builds.rst<br>
&gt;&gt; b/documentation/test-manual/reproducible-builds.rst<br>
&gt;&gt; index 91f94a5c7..d581155eb 100644<br>
&gt;&gt; --- a/documentation/test-manual/reproducible-builds.rst<br>
&gt;&gt; +++ b/documentation/test-manual/reproducible-builds.rst<br>
&gt;&gt; @@ -91,13 +91,21 @@ run::<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0oe-selftest -r reproducible.ReproducibleTests.t=
est_reproducible_builds<br>
&gt;&gt;<br>
&gt;&gt; -This defaults to including a ``world`` build so, if other layers =
are<br>
&gt;&gt; added, it would<br>
&gt;&gt; -also run the tests for recipes in the additional layers. Differen=
t build<br>
&gt;&gt; targets<br>
&gt;&gt; -can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET` va=
riable<br>
&gt;&gt; in ``local.conf``.<br>
&gt;&gt; -The first build will be run using :ref:`Shared State<br>
&gt;&gt; &lt;overview-manual/concepts:Shared State&gt;` if<br>
&gt;&gt; -available, the second build explicitly disables<br>
&gt;&gt; -:ref:`Shared State &lt;overview-manual/concepts:Shared State&gt;`=
 except for<br>
&gt;&gt; recipes defined in<br>
&gt;&gt; -the :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and b=
uilds on<br>
&gt;&gt; the<br>
&gt;&gt; +This defaults to including a ``world`` build so, if other layers =
are<br>
&gt;&gt; added, it<br>
&gt;&gt; +would also run the tests for recipes in the additional layers. Di=
fferent<br>
&gt;&gt; build<br>
&gt;&gt; +targets can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TA=
RGET`<br>
&gt;&gt; variable<br>
&gt;&gt; +in ``local.conf``. For example, running reproducibility tests for=
 only the<br>
&gt;&gt; +``python3-numpy`` recipe can be done by setting::<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0OEQA_REPRODUCIBLE_TEST_TARGET =3D &quot;python3-nump=
y&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +in local.conf before running the ``oe-selftest`` command shown ab=
ove.<br>
&gt;&gt; +<br>
&gt;&gt; +Reproducibility builds the target list twice. The first build wil=
l be run<br>
&gt;&gt; using<br>
&gt;&gt; +:ref:`Shared State &lt;overview-manual/concepts:Shared State&gt;`=
 if available,<br>
&gt;&gt; the<br>
&gt;&gt; +second build explicitly disables :ref:`Shared State<br>
&gt;&gt; +&lt;overview-manual/concepts:Shared State&gt;` except for recipes=
 defined in the<br>
&gt;&gt; +:term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and build=
s on the<br>
&gt;&gt;<br>
&gt;<br>
&gt; What do you think of adding that a quick way to test the reproducibili=
ty of<br>
&gt; a recipe is to do<br>
&gt; OEQA_REPRODUCIBLE_TEST_TARGET =3D &quot;recipe&quot;<br>
&gt; OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS =3D &quot;DEPENDS of recipe&quot=
;<br>
&gt; ?<br>
<br>
I have a question on this:<br>
<br>
What you are trying to say is that you need to set OEQA_REPRODUCIBLE_TEST_T=
ARGET<br>
to the recipe you want to test (`python3-numpy` in Trevor&#39;s example), a=
nd then<br>
set OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS to the DEPENDS of the recipe<br>
(`bitbake-getvar -r python3-numpy DEPENDS` would be a way to obtain that va=
lue?<br>
I would put that here as well).<br></blockquote><div><br></div><div>Yes, th=
at is what I usually do to test a single recipe&#39;s reproducibility.<br><=
/div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
My question is: is the reason to set OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS =
to<br>
avoid rebuilding all the dependencies of OEQA_REPRODUCIBLE_TEST_TARGET with=
out<br>
the sstate cache (and therefore save a lot of time)? If that&#39;s why, may=
be<br>
mention it explicitly here too.<br></blockquote><div><br></div><div>I agree=
. For the global project, it makes sense to rebuild everything. But, for a =
single developer focused on only one recipe (and making the hypothesis that=
 all of the dependencies are already reproducible), it is quicker for them =
to disable sstate only for the recipe.<br></div><div>=C2=A0<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
Other question: can OEQA_REPRODUCIBLE_TEST_TARGET contain more than 1 recip=
e?</blockquote><div><br></div><div>Yes.<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">If
so, do you need to concatenate the DEPENDS of each of them? The variable&#3=
9;s doc is<br>
not really clear on this.<br></blockquote><div><br></div><div>Also yes. <br=
></div><div><br></div><div>There is something to add here. The DEPENDS list=
 is not enough. Some build dependencies are dynamically computed. For examp=
le, I have this to test an empty recipe :<br></div><div>OEQA_REPRODUCIBLE_T=
EST_SSTATE_TARGETS =3D &quot;autoconf-native automake-native libtool-native=
 libtool-cross gettext-native ncurses bison-native texinfo-dummy-native gcc=
-runtime glibc glibc opkg-utils gcc-cross-x86_64 linux-yocto&quot;</div><di=
v>I&#39;ve gathered this list by looking at the build logs, but I always wa=
nted to find an automated way to get it.</div><div><br></div><div>Final tho=
ught, maybe all of this can be fully automated? Something like a &quot;OEQA=
_REPRODUCIBLE_ONLY_TEST_TARGET&quot; that would :</div><div>* compute every=
 dependencies of the recipe (dynamic deps included)</div><div>* build these=
 using sstate<br></div><div>* build the recipe with and without sstate and =
compare output (normal reproducible test)</div><div><br></div><div>I create=
d <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15701">htt=
ps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15701</a> with this idea.<=
br></div></div><div><br></div><div>Regards,<br clear=3D"all"></div><span cl=
ass=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmai=
l_signature"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal<=
/font><div><font face=3D"Raleway, regular">Smile ECS - Tech expert<br></fon=
t></div></div></div></div>
</div>

--0000000000009765400629b08604--

