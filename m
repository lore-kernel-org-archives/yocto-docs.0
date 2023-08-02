Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FC1C001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 14:51:59 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.17404.1690987914609892133
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Aug 2023 07:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SC1QzPWl;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso7089625e87.1
        for <docs@lists.yoctoproject.org>; Wed, 02 Aug 2023 07:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690987913; x=1691592713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rnpGPYGMCLZxow0rA74KNu9CJLqSp7uw0p7D3waK8XM=;
        b=SC1QzPWlDeNCSResCiNjOFGHrLRj+OyzItbUrmIdEB+PjqX+Nnyiccb/AjZSOejCvZ
         KJMf2p/41FHFaculgWi08J8tI4lbBgoLg5LbFGbx4QjICMkQ0oYH37ghIE2jI7dUXmcO
         e5iy8mikarJqgf8MfTg1isfwJ4lDcuhPN1auNJuFptU1NPHmsFkt8Pf97AV4HWnlrpip
         Gi06FrIshQ/mp10cqeXd+JWAgmTEAp93vdIg3bjmawZ3dVYLMhm+ZdoSUeiJ7g0l03X4
         0v7d+jYMsozUcB7KZi25MVBLejM4W5Ksx2BjxsW3zKWe27oNk92i0/001GLzliYls0Ok
         i8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690987913; x=1691592713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rnpGPYGMCLZxow0rA74KNu9CJLqSp7uw0p7D3waK8XM=;
        b=grWNtLazQed6VoIdG/WJ0mfgGgBAeiEYmsl70+jg5AbPP6YAe+Z7A40sQT2ZFqzD4C
         muxbEXiW0z9vPc+8ZW0fYrchenRlJcd2ddXXSJEGZHqb7sN2K7HkXBpnJCjXqkcl7Wqf
         dHcTauTybUYATjYaEz2rr6MPLtdEtovAorddtEB6Vvre9pXC3OJZr+BcnC1t5mphGzkr
         QsaYsNbgres/tiNoDy/B1M4E47VhknTDMpev7T+LhfHQ3dLBYYZRc/nKAk1tDaQYh/PL
         r3AvGkuX1k1krUiN6E1N1OMmdSdIuqJ1Yb/kpBR/PtIUPY8r++w7Sw7ru2a6yEFLruZC
         Ym7A==
X-Gm-Message-State: ABy/qLalvEJOUIRpXazHp9lKbwaBaLMwrvME+DIW0a4XEMnvgdw4x4Dd
	CWLoaEPRrhcgAAK2PVBA1Po1PyxvA8I0Q0+r+0s=
X-Google-Smtp-Source: APBJJlE0tm4wjIqj+D13WX1LwAqKv0waqbcBx3nwMJeIqwEZAu+CKnh7W6EkiP0WU/qEAv+ZT3Xe9Z6MB7NPdwX2Inc=
X-Received: by 2002:a05:6512:5cf:b0:4fb:61ea:95dc with SMTP id
 o15-20020a05651205cf00b004fb61ea95dcmr4627139lfo.7.1690987912382; Wed, 02 Aug
 2023 07:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230802132352.95244-1-frederic.martinsons@gmail.com> <cc9f9aa3-3951-f9cf-fd8c-a2b38db5ffc2@bootlin.com>
In-Reply-To: <cc9f9aa3-3951-f9cf-fd8c-a2b38db5ffc2@bootlin.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 2 Aug 2023 16:51:40 +0200
Message-ID: <CA+cAkeoD9DotF5VU-GEC_6_b7WEeOY-Lr4qvb8C0NvUsAcbH+g@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: classes.rst: suppress rust-hello-world
 reference and ptest-cargo class
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d64f170601f1cd59"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Aug 2023 14:51:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4099

--000000000000d64f170601f1cd59
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Aug 2023 at 16:45, Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Frederic,
>
> On 02.08.23 at 15:23, Frederic Martinsons wrote:
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > ---
> >   documentation/ref-manual/classes.rst | 20 ++++++++++++++++----
> >   1 file changed, 16 insertions(+), 4 deletions(-)
> >
> > diff --git a/documentation/ref-manual/classes.rst
> b/documentation/ref-manual/classes.rst
> > index e555a80b5..950231f40 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -266,12 +266,15 @@ manager, allowing to fetch package dependencies
> and build your program.
> >   Using this class makes it very easy to build Rust programs. All you
> need
> >   is to use the :term:`SRC_URI` variable to point to a source repository
> >   which can be built by Cargo, typically one that was created by the
> > -``cargo new`` command, containing a ``Cargo.toml`` file and a ``src``
> > +``cargo new`` command, containing a ``Cargo.toml`` file, a
> ``Cargo.lock`` file and a ``src``
> >   subdirectory.
> >
> > -You will find a simple example in the
> > -:oe_git:`rust-hello-world_git.bb
> </openembedded-core/tree/meta/recipes-extended/rust-example/
> rust-hello-world_git.bb>`
> > -recipe. A more complex example, with package dependencies, is the
> > +If you want to build and package tests of the program, replace
> :ref:`ref-classes-cargo`
> > +inheritance by :ref:`ref-classes-ptest-cargo` one.
> > +
> > +You will find an example (that show also how to handle possible git
> source dependencies) in the
> > +:oe_git:`zvariant_3.12.0.bb
> </openembedded-core/tree/meta-selftest/recipes-extended/zvariant/
> zvariant_3.12.0.bb>`
> > +recipe. Another example, with only crates dependencies, is the
> >   :oe_git:`uutils-coreutils
> </meta-openembedded/tree/meta-oe/recipes-core/uutils-coreutils>`
> >   recipe, which was generated by the `cargo-bitbake <
> https://crates.io/crates/cargo-bitbake>`__
> >   tool.
> > @@ -290,6 +293,15 @@ An exception is the "rust" recipe, to build the
> Rust compiler and runtime
> >   library, which is built by Cargo but cannot use the
> :ref:`ref-classes-cargo`
> >   class. This is why this class was introduced.
> >
> > +.. _ref-classes-ptest-cargo:
> > +
> > +``ptest_cargo``
> > +===============
> > +
> > +The :ref:`ref-classes-ptest-cargo` class is a class which extend
> :ref:`ref-classes-cargo`
> > +and add a compile_ptest_cargo/install_ptest_cargo steps to respectively
> build and install
> > +test suites defined in ``Cargo.toml`` file in a dedicate -ptest package.
>
>
> Many thanks for the patch. I'd just add a few style and grammar fixes,
> but I'll take care of those by myself.
>

Many thanks!


> If there are no other comments by tomorrow, I'll merge it into
> master-next for docs.
>
> Could you just confirm that this patch doesn't depend on the 3 OE-core
> patches you've just sent?
>

Glad you asked, the part concerning ptest-cargo class doesn't depend on
them, but the removal
of rust-hello-world does (third patch on the series you mentioned).
Sorry, I should have made two patches for the docs. Please tell me
if it is too annoying for you and I'll send a rework here with two patches
instead of a single one (one for ptest-cargo
doc and one for removal of rust-hello-world).


> Thanks again
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000d64f170601f1cd59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 2 Aug 2023 at 16:45, Michael =
Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael.op=
denacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi Frederic,<br>
<br>
On 02.08.23 at 15:23, Frederic Martinsons wrote:<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.mart=
insons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<b=
r>
&gt; ---<br>
&gt;=C2=A0 =C2=A0documentation/ref-manual/classes.rst | 20 ++++++++++++++++=
----<br>
&gt;=C2=A0 =C2=A01 file changed, 16 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-=
manual/classes.rst<br>
&gt; index e555a80b5..950231f40 100644<br>
&gt; --- a/documentation/ref-manual/classes.rst<br>
&gt; +++ b/documentation/ref-manual/classes.rst<br>
&gt; @@ -266,12 +266,15 @@ manager, allowing to fetch package dependencies =
and build your program.<br>
&gt;=C2=A0 =C2=A0Using this class makes it very easy to build Rust programs=
. All you need<br>
&gt;=C2=A0 =C2=A0is to use the :term:`SRC_URI` variable to point to a sourc=
e repository<br>
&gt;=C2=A0 =C2=A0which can be built by Cargo, typically one that was create=
d by the<br>
&gt; -``cargo new`` command, containing a ``Cargo.toml`` file and a ``src``=
<br>
&gt; +``cargo new`` command, containing a ``Cargo.toml`` file, a ``Cargo.lo=
ck`` file and a ``src``<br>
&gt;=C2=A0 =C2=A0subdirectory.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -You will find a simple example in the<br>
&gt; -:oe_git:`<a href=3D"http://rust-hello-world_git.bb" rel=3D"noreferrer=
" target=3D"_blank">rust-hello-world_git.bb</a> &lt;/openembedded-core/tree=
/meta/recipes-extended/rust-example/<a href=3D"http://rust-hello-world_git.=
bb" rel=3D"noreferrer" target=3D"_blank">rust-hello-world_git.bb</a>&gt;`<b=
r>
&gt; -recipe. A more complex example, with package dependencies, is the<br>
&gt; +If you want to build and package tests of the program, replace :ref:`=
ref-classes-cargo`<br>
&gt; +inheritance by :ref:`ref-classes-ptest-cargo` one.<br>
&gt; +<br>
&gt; +You will find an example (that show also how to handle possible git s=
ource dependencies) in the<br>
&gt; +:oe_git:`<a href=3D"http://zvariant_3.12.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">zvariant_3.12.0.bb</a> &lt;/openembedded-core/tree/meta-self=
test/recipes-extended/zvariant/<a href=3D"http://zvariant_3.12.0.bb" rel=3D=
"noreferrer" target=3D"_blank">zvariant_3.12.0.bb</a>&gt;`<br>
&gt; +recipe. Another example, with only crates dependencies, is the<br>
&gt;=C2=A0 =C2=A0:oe_git:`uutils-coreutils &lt;/meta-openembedded/tree/meta=
-oe/recipes-core/uutils-coreutils&gt;`<br>
&gt;=C2=A0 =C2=A0recipe, which was generated by the `cargo-bitbake &lt;<a h=
ref=3D"https://crates.io/crates/cargo-bitbake" rel=3D"noreferrer" target=3D=
"_blank">https://crates.io/crates/cargo-bitbake</a>&gt;`__<br>
&gt;=C2=A0 =C2=A0tool.<br>
&gt; @@ -290,6 +293,15 @@ An exception is the &quot;rust&quot; recipe, to b=
uild the Rust compiler and runtime<br>
&gt;=C2=A0 =C2=A0library, which is built by Cargo but cannot use the :ref:`=
ref-classes-cargo`<br>
&gt;=C2=A0 =C2=A0class. This is why this class was introduced.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +.. _ref-classes-ptest-cargo:<br>
&gt; +<br>
&gt; +``ptest_cargo``<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +<br>
&gt; +The :ref:`ref-classes-ptest-cargo` class is a class which extend :ref=
:`ref-classes-cargo`<br>
&gt; +and add a compile_ptest_cargo/install_ptest_cargo steps to respective=
ly build and install<br>
&gt; +test suites defined in ``Cargo.toml`` file in a dedicate -ptest packa=
ge.<br>
<br>
<br>
Many thanks for the patch. I&#39;d just add a few style and grammar fixes, =
<br>
but I&#39;ll take care of those by myself.<br></blockquote><div><br></div><=
div>Many thanks!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
If there are no other comments by tomorrow, I&#39;ll merge it into <br>
master-next for docs.<br>
<br>
Could you just confirm that this patch doesn&#39;t depend on the 3 OE-core =
<br>
patches you&#39;ve just sent?<br></blockquote><div><br></div><div>Glad you =
asked, the part concerning ptest-cargo class doesn&#39;t depend on them, bu=
t the removal</div><div>of rust-hello-world=C2=A0does (third patch on the s=
eries you mentioned).</div><div>Sorry, I should have made two patches for t=
he docs. Please tell me</div><div>if it is too annoying for you and I&#39;l=
l send a rework here with two patches instead of a single one (one for ptes=
t-cargo</div><div>doc and one for removal of rust-hello-world).</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks again<br>
Cheers<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--000000000000d64f170601f1cd59--

