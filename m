Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64533C001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 19:03:57 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.4692.1691003035186366253
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Aug 2023 12:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=D11UWEYQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fe383c1a26so282700e87.1
        for <docs@lists.yoctoproject.org>; Wed, 02 Aug 2023 12:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691003033; x=1691607833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HMJaA/vwQhdWSDaSa1cZ1Jwe8LIObrYjqmUdd0NYciM=;
        b=D11UWEYQKX5EB4kZbVFhvTgLiXiss6Akx24WQp1oCgml/r3Sp1GoOSkRvEjOJLPbMk
         SV+mkTq6X5iFcpCrIRRD2aAdEVDeam+awk1jy9k4JFWzPE78S2ah7mWQDl2skj38LfwM
         N82dO63Z2WHENz23KBDzcCWqyMK0l+dixf2yJMUAeG6f9BDBixDi1Hvby5x3fS5upxsP
         Yf8OV0ocf4nkrbNX6PjsNr6exSQLXqB4QeC8vBdq8wseileAR1qmZsDqzL6TkEmM5NvI
         9ZMru+LlwW6SCriz+dAAhNqbBI9Bq5FCoYw22bPCEGFZi1ZmgcL6JlYnjeyx2PDdsQ+6
         ByVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691003033; x=1691607833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMJaA/vwQhdWSDaSa1cZ1Jwe8LIObrYjqmUdd0NYciM=;
        b=bs3E4qeZZ+eony93bSo1N4XuTgeyySEFNtF9BliTe+8WqxUNemE7VpdYAVM2OsuGdn
         V5tcDD/7RAob+B9QmY7pkjBOCc/M0uXEhYTVDkpxJEr4ifFVQeB+tn9bJ1P5srTXAOov
         3aKT1bPzlij/8W+H86+xP3C0bOtCOlPagbh9P5pEIvorW3u7f/jP6iY634QHMurz3lZ0
         2K0RGuKOZfz2RuhZlVhwLWBPVaKKqJGxCx5FWBSgLAnYHByHZWF37JCBEhyo8TE0uEIc
         CzCxqun1e+HCC4ixKqyJg4HeFMIvCx9dBWmHZKNxf7Qa/7g+zmCJFBqsihRTx3gM5cxK
         PXng==
X-Gm-Message-State: ABy/qLa1+U9zlps+EuuTYUBcqsxOzNBTMxpGLjgHuwsR5cAiVmOo67JP
	OMIcaKO2Fo8tBDIhuT0rZczbesoeN0qxD99umDY=
X-Google-Smtp-Source: APBJJlHvf/PvLNWCg4o9gQUX7b8drDr9pPLXvX/GQ+pN3y7YrNZojBM26gznqIXpsMlayoeAexTAIeg/Qrw/IOi7YVA=
X-Received: by 2002:a19:771d:0:b0:4fd:c771:ed7f with SMTP id
 s29-20020a19771d000000b004fdc771ed7fmr4905524lfc.65.1691003032855; Wed, 02
 Aug 2023 12:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <177798C553711AAA.2497@lists.yoctoproject.org> <20230802184810.193478-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20230802184810.193478-1-michael.opdenacker@bootlin.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 2 Aug 2023 21:03:41 +0200
Message-ID: <CA+cAkerSd1716krSrEcHmFCGPK+jEbTTCnmi_Y-mj+id-5TshA@mail.gmail.com>
Subject: Re: [PATCH v2] ref-manual: classes.rst: suppress rust-hello-world
 reference, add ptest-cargo class
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000166c940601f55316"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Aug 2023 19:03:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4103

--000000000000166c940601f55316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 2 ao=C3=BBt 2023, 20:48, <michael.opdenacker@bootlin.com> a =C3=A9c=
rit :

> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>
> Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> ---
>
> Changes in V2:
> - Fix commit title
>   (was suggesting that ptest-cargo was removed)
> - Misc style and grammar fixes
> - Replace "_" by "-" in the "ptest_cargo" name
> - Move the "ptest-cargo" description further in the file
>   to keep the alphabetic ordering of class names.
> ---
>  documentation/ref-manual/classes.rst | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst
> b/documentation/ref-manual/classes.rst
> index a7819d5b60..973070dfb1 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -266,12 +266,15 @@ manager, allowing to fetch package dependencies and
> build your program.
>  Using this class makes it very easy to build Rust programs. All you need
>  is to use the :term:`SRC_URI` variable to point to a source repository
>  which can be built by Cargo, typically one that was created by the
> -``cargo new`` command, containing a ``Cargo.toml`` file and a ``src``
> +``cargo new`` command, containing a ``Cargo.toml`` file, a ``Cargo.lock`=
`
> file and a ``src``
>  subdirectory.
>
> -You will find a simple example in the
> -:oe_git:`rust-hello-world_git.bb
> </openembedded-core/tree/meta/recipes-extended/rust-example/
> rust-hello-world_git.bb>`
> -recipe. A more complex example, with package dependencies, is the
> +If you want to build and package tests of the program, inherit the
> +:ref:`ref-classes-ptest-cargo` class instead of :ref:`ref-classes-cargo`=
.
> +
> +You will find an example (that show also how to handle possible git
> source dependencies) in the
> +:oe_git:`zvariant_3.12.0.bb
> </openembedded-core/tree/meta-selftest/recipes-extended/zvariant/
> zvariant_3.12.0.bb>`
> +recipe. Another example, with only crate dependencies, is the
>  :oe_git:`uutils-coreutils
> </meta-openembedded/tree/meta-oe/recipes-core/uutils-coreutils>`
>  recipe, which was generated by the `cargo-bitbake <
> https://crates.io/crates/cargo-bitbake>`__
>  tool.
> @@ -2517,6 +2520,17 @@ the class' functionality is largely disabled unles=
s
> "ptest" appears in
>  section in the Yocto Project Development Tasks Manual for more informati=
on
>  on ptest.
>
> +.. _ref-classes-ptest-cargo:
> +
> +``ptest-cargo``
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The :ref:`ref-classes-ptest-cargo` class is a class which extends the
> +:ref:`ref-classes-cargo` class and adds ``compile_ptest_cargo`` and
> +``install_ptest_cargo`` steps to respectively build and install
> +test suites defined in the ``Cargo.toml`` file, into a dedicated
> +``-ptest`` package.
> +
>  .. _ref-classes-ptest-gnome:
>
>  ``ptest-gnome``
> --
> 2.34.1
>

Thanks Michael for all the fixes to my patch.

>

--000000000000166c940601f55316
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le mer. 2 ao=C3=BBt 2023, 20:48,  &lt;<a href=3D"mailt=
o:michael.opdenacker@bootlin.com">michael.opdenacker@bootlin.com</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Michael Opd=
enacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com" target=3D"_bl=
ank" rel=3D"noreferrer">michael.opdenacker@bootlin.com</a>&gt;<br>
<br>
From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gmail.c=
om" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.com</a>&=
gt;<br>
<br>
Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinson=
s@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail=
.com</a>&gt;<br>
Reviewed-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bo=
otlin.com" target=3D"_blank" rel=3D"noreferrer">michael.opdenacker@bootlin.=
com</a>&gt;<br>
<br>
---<br>
<br>
Changes in V2:<br>
- Fix commit title<br>
=C2=A0 (was suggesting that ptest-cargo was removed)<br>
- Misc style and grammar fixes<br>
- Replace &quot;_&quot; by &quot;-&quot; in the &quot;ptest_cargo&quot; nam=
e<br>
- Move the &quot;ptest-cargo&quot; description further in the file<br>
=C2=A0 to keep the alphabetic ordering of class names.<br>
---<br>
=C2=A0documentation/ref-manual/classes.rst | 22 ++++++++++++++++++----<br>
=C2=A01 file changed, 18 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst<br>
index a7819d5b60..973070dfb1 100644<br>
--- a/documentation/ref-manual/classes.rst<br>
+++ b/documentation/ref-manual/classes.rst<br>
@@ -266,12 +266,15 @@ manager, allowing to fetch package dependencies and b=
uild your program.<br>
=C2=A0Using this class makes it very easy to build Rust programs. All you n=
eed<br>
=C2=A0is to use the :term:`SRC_URI` variable to point to a source repositor=
y<br>
=C2=A0which can be built by Cargo, typically one that was created by the<br=
>
-``cargo new`` command, containing a ``Cargo.toml`` file and a ``src``<br>
+``cargo new`` command, containing a ``Cargo.toml`` file, a ``Cargo.lock`` =
file and a ``src``<br>
=C2=A0subdirectory.<br>
<br>
-You will find a simple example in the<br>
-:oe_git:`<a href=3D"http://rust-hello-world_git.bb" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">rust-hello-world_git.bb</a> &lt;/openembedded-cor=
e/tree/meta/recipes-extended/rust-example/<a href=3D"http://rust-hello-worl=
d_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rust-hello-world_=
git.bb</a>&gt;`<br>
-recipe. A more complex example, with package dependencies, is the<br>
+If you want to build and package tests of the program, inherit the<br>
+:ref:`ref-classes-ptest-cargo` class instead of :ref:`ref-classes-cargo`.<=
br>
+<br>
+You will find an example (that show also how to handle possible git source=
 dependencies) in the<br>
+:oe_git:`<a href=3D"http://zvariant_3.12.0.bb" rel=3D"noreferrer noreferre=
r" target=3D"_blank">zvariant_3.12.0.bb</a> &lt;/openembedded-core/tree/met=
a-selftest/recipes-extended/zvariant/<a href=3D"http://zvariant_3.12.0.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">zvariant_3.12.0.bb</a>&gt;`=
<br>
+recipe. Another example, with only crate dependencies, is the<br>
=C2=A0:oe_git:`uutils-coreutils &lt;/meta-openembedded/tree/meta-oe/recipes=
-core/uutils-coreutils&gt;`<br>
=C2=A0recipe, which was generated by the `cargo-bitbake &lt;<a href=3D"http=
s://crates.io/crates/cargo-bitbake" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://crates.io/crates/cargo-bitbake</a>&gt;`__<br>
=C2=A0tool.<br>
@@ -2517,6 +2520,17 @@ the class&#39; functionality is largely disabled unl=
ess &quot;ptest&quot; appears in<br>
=C2=A0section in the Yocto Project Development Tasks Manual for more inform=
ation<br>
=C2=A0on ptest.<br>
<br>
+.. _ref-classes-ptest-cargo:<br>
+<br>
+``ptest-cargo``<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+The :ref:`ref-classes-ptest-cargo` class is a class which extends the<br>
+:ref:`ref-classes-cargo` class and adds ``compile_ptest_cargo`` and<br>
+``install_ptest_cargo`` steps to respectively build and install<br>
+test suites defined in the ``Cargo.toml`` file, into a dedicated<br>
+``-ptest`` package.<br>
+<br>
=C2=A0.. _ref-classes-ptest-gnome:<br>
<br>
=C2=A0``ptest-gnome``<br>
-- <br>
2.34.1<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Thanks Michael for all the fixes to my patch.=C2=A0</div><div dir=3D"=
auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquot=
e></div></div></div>

--000000000000166c940601f55316--

