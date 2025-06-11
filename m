Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6978C677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 14:33:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.9511.1749652406151099773
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 07:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2ownxoHF;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so57412835e9.0
        for <docs@lists.yoctoproject.org>; Wed, 11 Jun 2025 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1749652404; x=1750257204; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8+TAoeEsHmsKmw6uA5KYxuctSCQwVZxLOpxL/UyFC8Y=;
        b=2ownxoHFVL1nYbjaJd6HUEDat312FZuC+j0l22aGx/+RTmdeth3IxBd48D1NLaa67U
         GVcpKCLx43Mn7/DMZDZDraEklMWBGQ8YLBhQBKlprOklXn2wDjTYnq4/+1iqgPVfPMzl
         DmYS5gyRJdgwrBQO34k0kYL2b4EZOTG3/HJgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749652404; x=1750257204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+TAoeEsHmsKmw6uA5KYxuctSCQwVZxLOpxL/UyFC8Y=;
        b=MsFR6PsfUm1ZCsShVh6F055o8V9jK7BbOlbmoM6nbviPYNahjvDwmX2Dd9VXn0CxUc
         /b3KKX7xqbKuFfH6ASmL0EIhKmgg30DT83xCTRTtgdPwJP8RWXTta5gU55DsdbNTS/Zu
         8Q55GocSv1FQibryuYLRz0OBy2Rd1lMVv36EwxdMPK/Ex1E9ePGl9i3wmcS0Dts3wp4J
         +lFSaMAGC80Uq9xEo1bLfkogTVxNLywmMxqx9vIcNnN1P4RRVgNDb1oq8b8oChDyYQxD
         apeqeLBrJYUkQpad+9gWiPKwlrYLVZfsrehdvE9amggAbNUhInjKrPhfK/mCqIZi2O0/
         eIaw==
X-Gm-Message-State: AOJu0Yx+S9crWMV44l/AcylANtUvstzwPMQop5GAsmEuvTBgr1MDJ8DZ
	J6qOhz9m6VnxzAYp0ezwJGS8VTqy/AMy1LNbyablNLPtCh2F0x1/Phfviehi7MlVagNZ20apaft
	nFP4yLrDEkhP6AnduUzNfjfIHQ5CzNB/+KX8sZrBRxg==
X-Gm-Gg: ASbGnctBJ0J7tlumBEIaeywb50oHDdkrwCvuZVZJtI4QHKv669ntv5qJAZzVOafPBo/
	B63tdwMk+q/6rtxysicFF/sqJPEKFbqyjpukQGQ3nPCnG6yjcFQgPjueDN1CxQ6nIFb+ftEPcUb
	cJQf2LqW4X6BScS2DiLAzNn+HAIQm5sKW6E6eWNDqMNkkA85ciatx6gOoIVXY8q5USHyK543qh5
	pobrmqilw8SG9iK
X-Google-Smtp-Source: AGHT+IGU+v3BrZEIHjA1W0bSilO8mTFFmXfLA06+G/1vZ4esB425Ux3MXf4FumXjighaKnaO0uqHqtNM2vgFK3pMNUU=
X-Received: by 2002:a05:600c:3589:b0:450:d01e:78ee with SMTP id
 5b1f17b1804b1-4532b928e39mr282705e9.24.1749652404402; Wed, 11 Jun 2025
 07:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250611015401.1342422-1-anibal@limonsoftware.com>
In-Reply-To: <20250611015401.1342422-1-anibal@limonsoftware.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 11 Jun 2025 16:32:58 +0200
X-Gm-Features: AX0GCFuTQLBCv1ADMOWwzfpiCZbYKmeONuwU8yEnUPaGC90hIBz--7DIfcjE0Rs
Message-ID: <CAMSfU+64PMHZx1s2ECgYTh0qQ2k8H2iL9=oZ-kYJt3hqN-onNw@mail.gmail.com>
Subject: Re: [PATCHv3] test-manual/ptest: Add info about fail state of ptest-runner/ptests
To: Anibal Limon <anibal@limonsoftware.com>
Cc: docs@lists.yoctoproject.org, antonin.godard@bootlin.com, 
	erik.schumacher@iris-sensing.com
Content-Type: multipart/alternative; boundary="0000000000000b8dd506374cb2ec"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Jun 2025 14:33:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7062

--0000000000000b8dd506374cb2ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le mer. 11 juin 2025 =C3=A0 03:54, Anibal Limon <anibal@limonsoftware.com> =
a
=C3=A9crit :

> On the ML was pointed about no specific information about
> ptest-runner/ptests so improve docs around.
>
> https://lists.yoctoproject.org/g/yocto-patches/message/1622
>
> [YOCTO #15832]
>
> Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
> ---
>  documentation/Pipfile               |  2 ++
>  documentation/test-manual/ptest.rst | 17 ++++++++++++-----
>  2 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/Pipfile b/documentation/Pipfile
> index 7ee1d2290..c99d09c75 100644
> --- a/documentation/Pipfile
> +++ b/documentation/Pipfile
> @@ -9,6 +9,8 @@ verify_ssl =3D true
>  sphinx =3D "*"
>  sphinx-rtd-theme =3D "*"
>  pyyaml =3D "*"
> +vale =3D "*"
> +sphinx-lint =3D "*"
>
^ this change is unrelated and should be split into a separate commit (or
removed if that was an error)


>  [requires]
>  python_version =3D "3"
> diff --git a/documentation/test-manual/ptest.rst
> b/documentation/test-manual/ptest.rst
> index 2c021af51..e064419d7 100644
> --- a/documentation/test-manual/ptest.rst
> +++ b/documentation/test-manual/ptest.rst
> @@ -46,13 +46,19 @@ Running ptest
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  The ``ptest-runner`` package installs a shell script that loops through
> -all installed ptest test suites and runs them in sequence. Consequently,
> -you might want to add this package to your image.
> +all installed ptest test suites and runs them in sequence.
> +
> +During the execution ``ptest-runner`` keeps counter of failed ``ptests``
> +and use it as exit value, failing the execution if any of the
> ``run-ptest``
> +scripts fails.
> +
> +Consequently, you might want to add this package to your image.
> +
>
"keeps counter of failed ``ptests`` and use it as exit value" is not
entirely true.
I went to look in the code of ptest-runner2, and found this commit:
https://git.yoctoproject.org/ptest-runner2/commit/main.c?id=3Dc10e7475353f4=
cfb5afb30ab1012c32c2efde85a
(It was committed by you?) =3D> ptest-runner does keep a count of failed
ptests but returns 1 if the count is > 0.

 Getting Your Package Ready
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>
> -In order to enable a recipe to run installed ptests on target hardware,
> +In order to enable a recipe to run installed ``ptests`` on target
> hardware,
>  you need to prepare the recipes that build the packages you want to
>  test. Here is what you have to do for each recipe:
>
> @@ -77,8 +83,9 @@ test. Here is what you have to do for each recipe:
>
>  -  *Create run-ptest:* This script starts your test. Locate the
>     script where you will refer to it using
> -   :term:`SRC_URI`. Here is an
> -   example that starts a test for ``dbus``::
> +   :term:`SRC_URI`. Be sure your ``run-ptest`` exit with 0 to mark it
> +   as sucessfully executed.
>

Can you clarify here that ptest-runner expects 0 for a successful test or
!=3D0 for a test failure.

Also (but that may be tackled in another patch), oe-selftest's testimage
seems to expect at least a "PASS: ...", "FAIL: ..." line somewhere.
See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15832#c1.


> +   Here is an example that starts a test for ``dbus``::
>
>        #!/bin/sh
>        cd test
> --
> 2.39.5
>

Regards,
--=20
Yoann Congal
Smile ECS

--0000000000000b8dd506374cb2ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 11 juin 2025 =C3=
=A0=C2=A003:54, Anibal Limon &lt;<a href=3D"mailto:anibal@limonsoftware.com=
" target=3D"_blank">anibal@limonsoftware.com</a>&gt; a =C3=A9crit=C2=A0:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On the ML was poin=
ted about no specific information about<br>
ptest-runner/ptests so improve docs around.<br>
<br>
<a href=3D"https://lists.yoctoproject.org/g/yocto-patches/message/1622" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yocto-pa=
tches/message/1622</a><br>
<br>
[YOCTO #15832]<br>
<br>
Signed-off-by: Anibal Limon &lt;<a href=3D"mailto:anibal@limonsoftware.com"=
 target=3D"_blank">anibal@limonsoftware.com</a>&gt;<br>
---<br>
=C2=A0documentation/Pipfile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 ++<br>
=C2=A0documentation/test-manual/ptest.rst | 17 ++++++++++++-----<br>
=C2=A02 files changed, 14 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/documentation/Pipfile b/documentation/Pipfile<br>
index 7ee1d2290..c99d09c75 100644<br>
--- a/documentation/Pipfile<br>
+++ b/documentation/Pipfile<br>
@@ -9,6 +9,8 @@ verify_ssl =3D true<br>
=C2=A0sphinx =3D &quot;*&quot;<br>
=C2=A0sphinx-rtd-theme =3D &quot;*&quot;<br>
=C2=A0pyyaml =3D &quot;*&quot;<br>
+vale =3D &quot;*&quot;<br>
+sphinx-lint =3D &quot;*&quot;<br></blockquote><div>^ this change is unrela=
ted and should be split into a separate commit (or removed if that was an e=
rror)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
=C2=A0[requires]<br>
=C2=A0python_version =3D &quot;3&quot;<br>
diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manua=
l/ptest.rst<br>
index 2c021af51..e064419d7 100644<br>
--- a/documentation/test-manual/ptest.rst<br>
+++ b/documentation/test-manual/ptest.rst<br>
@@ -46,13 +46,19 @@ Running ptest<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
=C2=A0The ``ptest-runner`` package installs a shell script that loops throu=
gh<br>
-all installed ptest test suites and runs them in sequence. Consequently,<b=
r>
-you might want to add this package to your image.<br>
+all installed ptest test suites and runs them in sequence.<br>
+<br>
+During the execution ``ptest-runner`` keeps counter of failed ``ptests``<b=
r>
+and use it as exit value, failing the execution if any of the ``run-ptest`=
`<br>
+scripts fails.<br>
+<br>
+Consequently, you might want to add this package to your image.<br>
+<br></blockquote><div><div>&quot;keeps counter of failed ``ptests`` and us=
e it as exit value&quot; is not entirely=C2=A0true.</div></div><div>I went =
to look in the code of ptest-runner2, and found this commit: <a href=3D"htt=
ps://git.yoctoproject.org/ptest-runner2/commit/main.c?id=3Dc10e7475353f4cfb=
5afb30ab1012c32c2efde85a" target=3D"_blank">https://git.yoctoproject.org/pt=
est-runner2/commit/main.c?id=3Dc10e7475353f4cfb5afb30ab1012c32c2efde85a</a>=
</div><div>(It was committed=C2=A0by you?) =3D&gt;=C2=A0ptest-runner does k=
eep a count of failed ptests but returns 1 if the count is &gt; 0.</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0Getting Your Package Ready<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
<br>
-In order to enable a recipe to run installed ptests on target hardware,<br=
>
+In order to enable a recipe to run installed ``ptests`` on target hardware=
,<br>
=C2=A0you need to prepare the recipes that build the packages you want to<b=
r>
=C2=A0test. Here is what you have to do for each recipe:<br>
<br>
@@ -77,8 +83,9 @@ test. Here is what you have to do for each recipe:<br>
<br>
=C2=A0-=C2=A0 *Create run-ptest:* This script starts your test. Locate the<=
br>
=C2=A0 =C2=A0 script where you will refer to it using<br>
-=C2=A0 =C2=A0:term:`SRC_URI`. Here is an<br>
-=C2=A0 =C2=A0example that starts a test for ``dbus``::<br>
+=C2=A0 =C2=A0:term:`SRC_URI`. Be sure your ``run-ptest`` exit with 0 to ma=
rk it<br>
+=C2=A0 =C2=A0as sucessfully executed.<br></blockquote><div><br></div><div>=
Can you clarify here that ptest-runner expects 0 for a successful test or !=
=3D0 for a test failure.</div><div><br></div><div>Also (but that may be tac=
kled in another patch), oe-selftest&#39;s testimage seems to expect at leas=
t a &quot;PASS: ...&quot;, &quot;FAIL: ...&quot; line somewhere.</div><div>=
See=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D158=
32#c1">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15832#c1</a>.</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0Here is an example that starts a test for ``dbus``::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#!/bin/sh<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0cd test<br>
-- <br>
2.39.5<br></blockquote></div><div><br clear=3D"all"></div>Regards,</div><di=
v dir=3D"ltr"><span class=3D"gmail_signature_prefix">-- </span><br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><font face=3D"Raleway, =
regular">Yoann Congal</font><div><font face=3D"Raleway, regular">Smile ECS<=
/font></div></div></div></div>
</div>

--0000000000000b8dd506374cb2ec--

