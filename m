Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731E9E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 12:28:13 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.128040.1734611292415623588
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 04:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ddm7pBlj;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385e87b25f0so1212948f8f.0
        for <docs@lists.yoctoproject.org>; Thu, 19 Dec 2024 04:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1734611291; x=1735216091; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z946519iSTD5NVvOc8B/PoXmWrE+a1gR2JzsmFqJVP4=;
        b=ddm7pBljKesWWsWr44gKe8nsp1f+VQIEQ2Gj7lDu/LdOhGeZbj1xAvyJK2XnRPMY7R
         TOUcvIFkzEkUMNP9pJXnM2q7A5RxJ899OhLHZIdKYuGQohi+HVm+BA5TjYCFpJIaH9eZ
         28qCiKVGbT+DNPzWvVTUtOeYslaysjGGZz830=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734611291; x=1735216091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z946519iSTD5NVvOc8B/PoXmWrE+a1gR2JzsmFqJVP4=;
        b=K6euKRT3StFVaKks38J5tjXF5VHP+V755OHDci25IsbhAqdLSErYs9anrtmT4KwaoH
         2oLr5i8Y8SlzCrgwfJf77lvRZ6/V4gjrW/DgD1wsr96j0CwRAx4GUh89VZRdMcsEzSca
         bzUm7zBzXczLyPzQcdaSDlY1wJi4kedDuJZfWB5phROZy7+cOKa3BBcmS+vYZKz4imz2
         lLeY4trH8/Ei5iZArt7Lzm9MB1brHN7iaeMpLSjBU+1RLGMj/pHwxJfsXi5WSUVBzmba
         H8JwMVdFoYehS/zBKSNeudr0KXsxISGG1cgXPDw6+Rzn3HfR18+TxPIus28s/efdM2Ba
         6O5w==
X-Gm-Message-State: AOJu0YxllE54l52pNKRpYRgo7zcGJAvr2LGb2XjQFmNAd2sccDZ3Ic86
	NizH1RsgGhGSOstjr3bI7fyuDBNCdTeVN+uRU18e54+ZkwUs/n/YuDNkR2nR8QpXOsvmOwJYwxH
	AjmeOfJ6o0L9Atjpmbk+xoye/w3+WtrvB4Hwedw==
X-Gm-Gg: ASbGncs52MeWXVfznoQAo4cVjbtyJBjgloDcMhU1IUxasWlFTu29T8W85M5pnI8XdTe
	Hdz7upif6leb2VrZVO/sVCAF/ZuRJ9woDs5jld3+K
X-Google-Smtp-Source: AGHT+IGpQwC7NjDbj5Gy+T/3Srv8E4EQOPKrBjCtLVjs65r7knioaxPNW8M3/DxkLV6viXVUNLIDTwPlpaUL0B8k6mE=
X-Received: by 2002:a5d:5f44:0:b0:382:45db:6a1e with SMTP id
 ffacd0b85a97d-38a1a214d75mr3276980f8f.14.1734611290576; Thu, 19 Dec 2024
 04:28:10 -0800 (PST)
MIME-Version: 1.0
References: <20241218200630.823299-1-tgamblin@baylibre.com>
In-Reply-To: <20241218200630.823299-1-tgamblin@baylibre.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 19 Dec 2024 13:27:44 +0100
Message-ID: <CAMSfU+7BFDDxD4w7BsH17Gxyrvt+1SGb1QmKZRE3eENg1Fv2zg@mail.gmail.com>
Subject: Re: [docs][PATCH] reproducible-builds.rst: show how to build a single package
To: tgamblin@baylibre.com
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000cc706406299ea9ea"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Dec 2024 12:28:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5985

--000000000000cc706406299ea9ea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 d=C3=A9c. 2024 =C3=A0 21:06, Trevor Gamblin via lists.yoctoproje=
ct.org
<tgamblin=3Dbaylibre.com@lists.yoctoproject.org> a =C3=A9crit :

> Add a bit to the "Can we prove the project is reproducible?" section to
> show how OEQA_REPRODUCIBLE_TEST_TARGET can be used to test a single
> package (rather than the world build), as this may be useful for
> maintainers.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>

Thank you for doing this.

That is https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15619 (you may
want to take it and add a [YOCTO #15619] ref in this patch)

---
>  .../test-manual/reproducible-builds.rst       | 22 +++++++++++++------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/documentation/test-manual/reproducible-builds.rst
> b/documentation/test-manual/reproducible-builds.rst
> index 91f94a5c7..d581155eb 100644
> --- a/documentation/test-manual/reproducible-builds.rst
> +++ b/documentation/test-manual/reproducible-builds.rst
> @@ -91,13 +91,21 @@ run::
>
>     oe-selftest -r reproducible.ReproducibleTests.test_reproducible_build=
s
>
> -This defaults to including a ``world`` build so, if other layers are
> added, it would
> -also run the tests for recipes in the additional layers. Different build
> targets
> -can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET` variable
> in ``local.conf``.
> -The first build will be run using :ref:`Shared State
> <overview-manual/concepts:Shared State>` if
> -available, the second build explicitly disables
> -:ref:`Shared State <overview-manual/concepts:Shared State>` except for
> recipes defined in
> -the :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and builds o=
n
> the
> +This defaults to including a ``world`` build so, if other layers are
> added, it
> +would also run the tests for recipes in the additional layers. Different
> build
> +targets can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET`
> variable
> +in ``local.conf``. For example, running reproducibility tests for only t=
he
> +``python3-numpy`` recipe can be done by setting::
> +
> +   OEQA_REPRODUCIBLE_TEST_TARGET =3D "python3-numpy"
> +
> +in local.conf before running the ``oe-selftest`` command shown above.
> +
> +Reproducibility builds the target list twice. The first build will be ru=
n
> using
> +:ref:`Shared State <overview-manual/concepts:Shared State>` if available=
,
> the
> +second build explicitly disables :ref:`Shared State
> +<overview-manual/concepts:Shared State>` except for recipes defined in t=
he
> +:term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and builds on th=
e
>

What do you think of adding that a quick way to test the reproducibility of
a recipe is to do
OEQA_REPRODUCIBLE_TEST_TARGET =3D "recipe"
OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS =3D "DEPENDS of recipe"
?
(If not, leave the ticket assigned to me and I'll get to it eventually)


>  specific host the build is running on. This means we can test
> reproducibility
>  builds between different host distributions over time on the Autobuilder=
.
>
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5983):
> https://lists.yoctoproject.org/g/docs/message/5983
> Mute This Topic: https://lists.yoctoproject.org/mt/110186946/4316185
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000cc706406299ea9ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">Le=C2=A0mer. 18 d=C3=A9c. 2024 =C3=A0=C2=A021:06, T=
revor Gamblin via <a href=3D"http://lists.yoctoproject.org" target=3D"_blan=
k">lists.yoctoproject.org</a> &lt;tgamblin=3D<a href=3D"mailto:baylibre.com=
@lists.yoctoproject.org" target=3D"_blank">baylibre.com@lists.yoctoproject.=
org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Add a bit to the &quot;Can we prove the project is reproduc=
ible?&quot; section to<br>
show how OEQA_REPRODUCIBLE_TEST_TARGET can be used to test a single<br>
package (rather than the world build), as this may be useful for<br>
maintainers.<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" =
target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br></blockquote><div><br></=
div><div>Thank you for doing this.</div><div><br></div><div>That is=C2=A0<a=
 href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15619" target=
=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15619</a> (=
you may want to take it and add a [YOCTO #15619] ref in this patch)</div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0.../test-manual/reproducible-builds.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
2 +++++++++++++------<br>
=C2=A01 file changed, 15 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentat=
ion/test-manual/reproducible-builds.rst<br>
index 91f94a5c7..d581155eb 100644<br>
--- a/documentation/test-manual/reproducible-builds.rst<br>
+++ b/documentation/test-manual/reproducible-builds.rst<br>
@@ -91,13 +91,21 @@ run::<br>
<br>
=C2=A0 =C2=A0 oe-selftest -r reproducible.ReproducibleTests.test_reproducib=
le_builds<br>
<br>
-This defaults to including a ``world`` build so, if other layers are added=
, it would<br>
-also run the tests for recipes in the additional layers. Different build t=
argets<br>
-can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET` variable in=
 ``local.conf``.<br>
-The first build will be run using :ref:`Shared State &lt;overview-manual/c=
oncepts:Shared State&gt;` if<br>
-available, the second build explicitly disables<br>
-:ref:`Shared State &lt;overview-manual/concepts:Shared State&gt;` except f=
or recipes defined in<br>
-the :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and builds on =
the<br>
+This defaults to including a ``world`` build so, if other layers are added=
, it<br>
+would also run the tests for recipes in the additional layers. Different b=
uild<br>
+targets can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET` var=
iable<br>
+in ``local.conf``. For example, running reproducibility tests for only the=
<br>
+``python3-numpy`` recipe can be done by setting::<br>
+<br>
+=C2=A0 =C2=A0OEQA_REPRODUCIBLE_TEST_TARGET =3D &quot;python3-numpy&quot;<b=
r>
+<br>
+in local.conf before running the ``oe-selftest`` command shown above.<br>
+<br>
+Reproducibility builds the target list twice. The first build will be run =
using<br>
+:ref:`Shared State &lt;overview-manual/concepts:Shared State&gt;` if avail=
able, the<br>
+second build explicitly disables :ref:`Shared State<br>
+&lt;overview-manual/concepts:Shared State&gt;` except for recipes defined =
in the<br>
+:term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and builds on the<=
br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"gm=
ail_quote">What do you think of adding that a quick way to test the reprodu=
cibility of a recipe is to do<br>OEQA_REPRODUCIBLE_TEST_TARGET =3D &quot;re=
cipe&quot;</div><div class=3D"gmail_quote">OEQA_REPRODUCIBLE_TEST_SSTATE_TA=
RGETS =3D &quot;DEPENDS of recipe&quot;</div><div class=3D"gmail_quote">?</=
div><div class=3D"gmail_quote">(If not, leave the ticket assigned to me and=
 I&#39;ll get to it eventually)<br></div><div class=3D"gmail_quote"><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0specific host the build is running on. This means we can test reprodu=
cibility<br>
=C2=A0builds between different host distributions over time on the Autobuil=
der.<br>
<br>
-- <br>
2.39.5<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#5983): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/5983" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/5983</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110186946/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110186946/4316185</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.conga=
l@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>
</div>

--000000000000cc706406299ea9ea--

