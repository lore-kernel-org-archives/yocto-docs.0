Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8781CC61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 22:48:19 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.73269.1749509290531877936
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Jun 2025 15:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1B52LZMr;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso3130942f8f.0
        for <docs@lists.yoctoproject.org>; Mon, 09 Jun 2025 15:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1749509289; x=1750114089; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hbA2pBWApvej8A0WraMPxVw4TKFq7lvxUVGqYVJ33Ok=;
        b=1B52LZMr2upR9+/vAspO7d4RjXFNbV5iH5nBkOlLyYYvGPg7IqQdsCEBuy10iswpEO
         ALtKjy3j2PWdL9x7A5xeltYi0JGDwD3lYyv9eBNMkBrDH3SETzSHQd8wBgF85u4dh8IQ
         srwdz2n3J9CXVT+9fvbLew0R7ho65557pIdQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509289; x=1750114089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbA2pBWApvej8A0WraMPxVw4TKFq7lvxUVGqYVJ33Ok=;
        b=vQduLOZ4+8EuJVVtmgxckpXVGU2a/EVkyMA80NwouSiw6JqhbuIceO9jHl1UZ70cMg
         CQP9O9lgXB7iI590UZt4cV9WXu9ilkItR0GY/D1gGEYv9U70v1ZwfMAFJnyHY3QF2ftF
         v8iEa4yfPp5JLMd0ktgcwfkK7TX6QLxGsmizAKg50HgNwfZOe0129bfokdlwdNzeWMky
         A5dKF5SkO4Plh17uvPvFw5u8+YhNFoQb5xDDaGY2MbCKuDlWPdt1c3LS5asHKh3uWrUe
         GDp6d/wZPaL30uvAUenvBUNLWwCLHlvHTpFz9cSvXmibjTi1Ns38m4k/pcNfy5nXDqWn
         EHRQ==
X-Gm-Message-State: AOJu0YwgI98HeW+QcF5lOvYiTyz5rKQC0KeFJg7f6c5T6JKvnPV8LFT3
	CQ8vOApYdsvLjnpbkgqXlu4tPD6yClLod8Xv+GiyPxp+TuKH1pMR/7TPsFoGXEWraCHetDs5mnB
	yXdaHj0zpc4NOal3NG64KQ2nLFRaMdeQXsiVPruxwwA==
X-Gm-Gg: ASbGncu5L2kimFtAsQSnhyCkRmQWLXwysskOwj2Kj+2Xv6v+KD72d4MfwWOJbjDqKtD
	R/ndKGGrCtPvL48N9H7aTBobWa8euJfmqL5tcU8pVh/AatjJTHjCW0oQM4y7LNzp2X2PAm/mQlK
	aEoLM4R4kWDome+7NxpU23D876+wMnIYRMVhgxTAmdcb7s23QnuGvZpLwHBcQsIK0AOGjQ1nu2U
	SDuGw==
X-Google-Smtp-Source: AGHT+IEbR5VCMB5Djnp/NvDiO9sy/JjYF66OamfFLdy+30qE9K58HFumfLDzkhqQSHxiHOXQA7l+qOWqQgzfFGpChEg=
X-Received: by 2002:a05:6000:40cd:b0:3a0:b308:8427 with SMTP id
 ffacd0b85a97d-3a55229c3bamr210752f8f.37.1749509288913; Mon, 09 Jun 2025
 15:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250609222143.3275-1-anibal@limonsoftware.com>
In-Reply-To: <20250609222143.3275-1-anibal@limonsoftware.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 10 Jun 2025 00:47:43 +0200
X-Gm-Features: AX0GCFtl9gwc9zfZIopzY0ZHhli6U0Kf4djvdeIqWF6SxrWQ1jkAl5J5LZeww8c
Message-ID: <CAMSfU+5v+4HGa7L6qUZ1ydZ8i3jcvrU11=9XSZwWYQs9DaH+uA@mail.gmail.com>
Subject: Re: [PATCH] test-manual/ptest: Add info about fail state of ptest-runner/ptests
To: Anibal Limon <anibal@limonsoftware.com>
Cc: docs@lists.yoctoproject.org, antonin.godard@bootlin.com, 
	erik.schumacher@iris-sensing.com
Content-Type: multipart/alternative; boundary="000000000000b280aa06372b5f8b"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Jun 2025 22:48:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7035

--000000000000b280aa06372b5f8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le mar. 10 juin 2025 =C3=A0 00:21, Anibal Limon <anibal@limonsoftware.com> =
a
=C3=A9crit :

> On the ML was pointed about no specific information about
> ptest-runner/ptests so improve docs around.
>
> https://lists.yoctoproject.org/g/yocto-patches/message/1622
>
> Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
>

Thank you for working on this! :)

Can you reference the bug
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15832?
With "[YOCTO #15832]" somewhere in your commit message.


> ---
>  documentation/test-manual/ptest.rst | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/test-manual/ptest.rst
> b/documentation/test-manual/ptest.rst
> index 2c021af51..3b50e354a 100644
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
>

Counting failed tests might lead to weird overflows.
For example, there is a special error code for "ptest-runner itself failed"
(127 IIRC).
If you have 127 failing tests, the calling code may reach a wrong
conclusion.

I'd recommend returning a static non-zero error code on error (e.g 1).


> +
> +Consequently, you might want to add this package to your image.
> +
>
>  Getting Your Package Ready
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
> +   :term:`SRC_URI`. Be sure your *run-ptest* exit with 0 to mark it
>

Use ``run-ptest`` to stay consistent with the rest of the doc?

+   as succesfully executed.
> +   Here is an example that starts a test for ``dbus``::
>
>        #!/bin/sh
>        cd test
> --
> 2.39.5
>


--=20
Yoann Congal
Smile ECS

--000000000000b280aa06372b5f8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 10 juin 2025=
 =C3=A0=C2=A000:21, Anibal Limon &lt;<a href=3D"mailto:anibal@limonsoftware=
.com">anibal@limonsoftware.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On the ML was pointed about no s=
pecific information about<br>
ptest-runner/ptests so improve docs around.<br>
<br>
<a href=3D"https://lists.yoctoproject.org/g/yocto-patches/message/1622" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yocto-pa=
tches/message/1622</a><br>
<br>
Signed-off-by: Anibal Limon &lt;<a href=3D"mailto:anibal@limonsoftware.com"=
 target=3D"_blank">anibal@limonsoftware.com</a>&gt;<br>
</blockquote><div><br></div><div>Thank=C2=A0you for working on this! :)</di=
v><div><br></div><div>Can you reference the bug=C2=A0<a href=3D"https://bug=
zilla.yoctoproject.org/show_bug.cgi?id=3D15832">https://bugzilla.yoctoproje=
ct.org/show_bug.cgi?id=3D15832</a>?</div><div>With &quot;[YOCTO #15832]&quo=
t; somewhere in your commit message.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">---<br>
=C2=A0documentation/test-manual/ptest.rst | 17 ++++++++++++-----<br>
=C2=A01 file changed, 12 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manua=
l/ptest.rst<br>
index 2c021af51..3b50e354a 100644<br>
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
+scripts fails.<br></blockquote><div><br></div><div>Counting failed tests m=
ight lead to weird overflows.</div><div>For example, there is a special err=
or code for &quot;ptest-runner itself failed&quot; (127 IIRC).</div><div>If=
 you have 127 failing tests, the calling code may reach a wrong conclusion.=
</div><div><br></div><div>I&#39;d recommend=C2=A0returning a static non-zer=
o error code on error (e.g 1).</div><div>=C2=A0=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
+<br>
+Consequently, you might want to add this package to your image.<br>
+<br>
<br>
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
+=C2=A0 =C2=A0:term:`SRC_URI`. Be sure your *run-ptest* exit with 0 to mark=
 it<br></blockquote><div><br></div><div>Use ``run-ptest`` to stay consisten=
t with the rest of the doc?</div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
+=C2=A0 =C2=A0as succesfully executed.<br>
+=C2=A0 =C2=A0Here is an example that starts a test for ``dbus``::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#!/bin/sh<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0cd test<br>
-- <br>
2.39.5<br></blockquote></div><div><br clear=3D"all"></div><br><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</fo=
nt><div><font face=3D"Raleway, regular">Smile ECS</font></div></div></div><=
/div>

--000000000000b280aa06372b5f8b--

