Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40890D1680D
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 10:52:57 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7727.1767955975608195893
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 02:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qqDa/iVo;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-432d2c96215so1218741f8f.3
        for <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 02:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767955974; x=1768560774; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lOZl2SLEjS//NoGz4TeIcyTyNqjcCt6RQBMkukQIZyg=;
        b=qqDa/iVoZJxRvF7+8K/525bK5rv2nO97Y8HmeYVQbfYQBeD33ERhzCw8am0zNc2Iq4
         cxSjrhfCQxvz+ANAfSBGBkD+INaem00diBhX52O9VNoGISkwZ0L4+lheghwM/nV0qENZ
         eSV0gTlsgRmIT4xQvqSJGcz5TbbjLqZbBGtT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767955974; x=1768560774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOZl2SLEjS//NoGz4TeIcyTyNqjcCt6RQBMkukQIZyg=;
        b=f3XtoMz+6bbdACLS4JL38FCiw/qYw8CfTsngCINwN93wcms6m5/tlVP/RIkWn4hz6e
         736WZcIdh8f1D3IEWgjw9ZzV+dnc4ZE+RaAldrWQWk0njXG8fqOWOpYh5lTX6kWYiPJs
         GVvyla+B98oD11yxctIEkkXJ0wcdCPp2vPXcAfzH+H7HbYGGNipRR/JvuFP40UgSGw2j
         Euu+2h31wq7LNB7h4JDIrqWD2t9Z6hQkwJgc1VOFanGZWPKJG3wUBe8QRveuUMvEuTQe
         eXhFeAalpiprk3KjaKZwsYZyJSsemRvLZZTxQAZXws9z7bPNXhLs+tX/4jD0TOwZBzT8
         MVDA==
X-Gm-Message-State: AOJu0YwvZmwVnuNafCmO0DOLAfstz2g3HfT3QMb8aPQX1Urw74Fu8ZGH
	9THzpl6CGATDvUzlmM4bFrbUnR2w6DFP0hxed7Ze1EpoARZ4Dq2H6OmGh3192XE5eUIocGDNcHn
	sSYNtY7HhBdAa0g1bRG4QOrHeZbEtkjFC1pC5x9iK6Q==
X-Gm-Gg: AY/fxX4qftWm+bMOmHMFBnyJbox4GNhKQvooMAiz6iBs5GYRKTdoCWVT+RsJr8wA9nd
	YASMqD6dbTLDmNmjMS0JzK+sfARbT3zi/ouVnSOqKtQGuTw9n4igoZRC4nGVECFIxiayOySWoO8
	R+Nwr+BE4xsaK3gfI1VDeII06eCq4qmLgyUshG92YyZ/yH64mbwJgQ7Dja+nvdAGMnf8ueeLXmB
	jZSGLhTWwb+/RWcRnyb2/aizg7c1y8WWjsqFnHhdDUE3HvNx2HG4xC/rxbp2/IfLxe4bdSSe8zT
	RBoh8ekclI4xaYJrdtDuB52ol5zIKA==
X-Google-Smtp-Source: AGHT+IHjS0GZq+3V8pM/Ab5OBHxFAHD4nsM6oP8LS6H9MBf8AEb34IHfEde4iODId+owN+fZDPKaLWTh2jO01KOVt4k=
X-Received: by 2002:a05:6000:2dc2:b0:431:9dd:2cca with SMTP id
 ffacd0b85a97d-432c3789f76mr9557216f8f.7.1767955973979; Fri, 09 Jan 2026
 02:52:53 -0800 (PST)
MIME-Version: 1.0
References: <20260109-ptest-output-v1-1-29b1b2039c97@bootlin.com>
In-Reply-To: <20260109-ptest-output-v1-1-29b1b2039c97@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 9 Jan 2026 11:52:28 +0100
X-Gm-Features: AZwV_QgpYheGHwBZUSLdAkn6QetJnN3M2ys7LiZZalaY6fX0ZH9Tvss3gdu-1FE
Message-ID: <CAMSfU+4hrCHXwC8BHS_VSO38b=N1r20NzfnWJU6TQkSGgA3DFg@mail.gmail.com>
Subject: Re: [PATCH] test-manual/ptest.rst: detail the exit code and output requirements
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000ced0000647f25305"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 10:52:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8448

--000000000000ced0000647f25305
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 9 janv. 2026 =C3=A0 11:45, Antonin Godard <antonin.godard@bootlin.c=
om> a
=C3=A9crit :

> A ptest must emit at least one test result on the console, as this is
> required by the testimage class (which ignores the exit code).
> ptest-runner on the other hand, ignore the output and only cares about
> the exit code.
>
> Add these two items as requirements for a ptest to be valid.
>
> Fixes [YOCTO #15832]
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>

Thanks!

Looks good to me :)
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>


> ---
>  documentation/test-manual/ptest.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/documentation/test-manual/ptest.rst
> b/documentation/test-manual/ptest.rst
> index 4e6be35df..1c946f81d 100644
> --- a/documentation/test-manual/ptest.rst
> +++ b/documentation/test-manual/ptest.rst
> @@ -91,6 +91,25 @@ test. Here is what you have to do for each recipe:
>        cd test
>        make -k runtest-TESTS
>
> +-  *Return an appropriate exit code*: The ``run-ptest`` script must
> return 0 on
> +   success, 1 on failure. This is needed by ``ptest-runner`` to keep
> track of
> +   the successful and failed tests.
> +
> +-  *Make sure the test prints at least one test result*: The execution o=
f
> the
> +   ``run-ptest`` script must result in at least one test result output o=
n
> the
> +   console, with the following format::
> +
> +      result: testname
> +
> +   Where ``result`` can be one of ``PASS``, ``SKIP``, or ``FAIL``.
> ``testname``
> +   can be any name.
> +
> +   There can be as many test results as desired.
> +
> +   This information is read by the :ref:`ref-classes-testimage` class an=
d
> +   :oe_git:`logparser
> </openembedded-core/tree/meta/lib/oeqa/utils/logparser.py>`
> +   module.
> +
>  -  *Ensure dependencies are met:* If the test adds build or runtime
>     dependencies that normally do not exist for the package (such as
>     requiring "make" to run the test suite), use the
>
> ---
> base-commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18
> change-id: 20260109-ptest-output-29a943659c2e
>
>

--=20
Yoann Congal
Smile ECS

--000000000000ced0000647f25305
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 9 =
janv. 2026 =C3=A0=C2=A011:45, Antonin Godard &lt;<a href=3D"mailto:antonin.=
godard@bootlin.com">antonin.godard@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">A ptest must emi=
t at least one test result on the console, as this is<br>
required by the testimage class (which ignores the exit code).<br>
ptest-runner on the other hand, ignore the output and only cares about<br>
the exit code.<br>
<br>
Add these two items as requirements for a ptest to be valid.<br>
<br>
Fixes [YOCTO #15832]<br>
<br>
Signed-off-by: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.=
com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br></blockquote><=
div><br></div><div>Thanks!</div><div><br></div><div>Looks good to me :)</di=
v><div>Reviewed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r">yoann.congal@smile.fr</a>&gt;</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
---<br>
=C2=A0documentation/test-manual/ptest.rst | 19 +++++++++++++++++++<br>
=C2=A01 file changed, 19 insertions(+)<br>
<br>
diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manua=
l/ptest.rst<br>
index 4e6be35df..1c946f81d 100644<br>
--- a/documentation/test-manual/ptest.rst<br>
+++ b/documentation/test-manual/ptest.rst<br>
@@ -91,6 +91,25 @@ test. Here is what you have to do for each recipe:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0cd test<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0make -k runtest-TESTS<br>
<br>
+-=C2=A0 *Return an appropriate exit code*: The ``run-ptest`` script must r=
eturn 0 on<br>
+=C2=A0 =C2=A0success, 1 on failure. This is needed by ``ptest-runner`` to =
keep track of<br>
+=C2=A0 =C2=A0the successful and failed tests.<br>
+<br>
+-=C2=A0 *Make sure the test prints at least one test result*: The executio=
n of the<br>
+=C2=A0 =C2=A0``run-ptest`` script must result in at least one test result =
output on the<br>
+=C2=A0 =C2=A0console, with the following format::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 result: testname<br>
+<br>
+=C2=A0 =C2=A0Where ``result`` can be one of ``PASS``, ``SKIP``, or ``FAIL`=
`. ``testname``<br>
+=C2=A0 =C2=A0can be any name.<br>
+<br>
+=C2=A0 =C2=A0There can be as many test results as desired.<br>
+<br>
+=C2=A0 =C2=A0This information is read by the :ref:`ref-classes-testimage` =
class and<br>
+=C2=A0 =C2=A0:oe_git:`logparser &lt;/openembedded-core/tree/meta/lib/oeqa/=
utils/logparser.py&gt;`<br>
+=C2=A0 =C2=A0module.<br>
+<br>
=C2=A0-=C2=A0 *Ensure dependencies are met:* If the test adds build or runt=
ime<br>
=C2=A0 =C2=A0 dependencies that normally do not exist for the package (such=
 as<br>
=C2=A0 =C2=A0 requiring &quot;make&quot; to run the test suite), use the<br=
>
<br>
---<br>
base-commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18<br>
change-id: 20260109-ptest-output-29a943659c2e<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000ced0000647f25305--

