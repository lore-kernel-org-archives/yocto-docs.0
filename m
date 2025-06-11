Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E09C71141
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 18:41:18 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.3073.1749667270644461366
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 11:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=I+PgBzwd;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.171, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70e6bddc30aso1039807b3.0
        for <docs@lists.yoctoproject.org>; Wed, 11 Jun 2025 11:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1749667270; x=1750272070; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1bcvtWnEAJ2QPBZSrNuCnIYsUln93EyjYNJ5b7HttjE=;
        b=I+PgBzwdY1qkkskhp2qPIFKhCea7z+mULfDD0JeZYAfVfK0R1gDSAWaVeDnw3yAuix
         5IP3PDXdv08ajffQFSmX5TswYSI2iaTtwVEosu6WiyJkVTmtYRQ/Lnm6P6zXoTk46til
         aw71+BXKeocozyFP9wXtchQTNcHKyEq7FbsSA/Vf0XFAy9kriizwj8qcn4JiLap47muz
         8iTUw06hocw+ZkRq0g81LL2Ji0998g/XrXfuOEzV/vSHvbXz2hhergVkZGbkorVwsUUG
         WbAHMir8vIjpq025qieARSj8KJHndPmRVbyJlphTt2b6RcUfGWp/5tV/EWLezCi2fVnz
         zoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749667270; x=1750272070;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bcvtWnEAJ2QPBZSrNuCnIYsUln93EyjYNJ5b7HttjE=;
        b=Q6hzfVUSCqyHqIKDO/d0ZElaRbgHNzlu9MNg3gr0AW0jmEwShhTw/PvnbYWeSpkFcF
         +glolektGAPHJsqmiFpj1V8aGLuVcYX3kkvSeYwBuNMUsP4HYOKcOjyw/ZxE0z/TGuJ1
         cNbHKSRhCSxgRTRxcNKCAt0yOsuYnybC7+p7+5bAlNMWSNdzix5e+U06lKDT1KYa7k5q
         P4I8B5oPeG2zsyyTaiMgZc/beXauxyL2XuA59tZfwEk75+uyYnu72XEORiHYwsj9Yvor
         WZfOtP6tG5t2Y+VLvNTVCTp3FF9S+4y228slXVCh9CZiQo6afQyw7jvroitk/eRkTWsV
         8Ghg==
X-Gm-Message-State: AOJu0YyZtS6/FjIyAUUq+qn3sggKN84rH2tzk3yVj56GFQ+X6yUt7Bvc
	/b6M8XN+c4Rvmohv4DMnkZWbx5ZQnHVFO72inhBedsj98wgIC74rHKL8a2i9hr8rWagpVLQ+0hB
	WnsDGL62bXwtbCWp8UBR0KrhGTSHsEi6AC4eQYUm24A==
X-Gm-Gg: ASbGncvn+3dWrL+cy+KSYYR5fjcic/5+hG1Kd3p9i0/4+isIsdEQF3C8CqtUniT/yxB
	BPJpGxd2OsCvDgrU3w/3X0+mJiuIeMEV5aymfDyskA9NFZPkoH4Jn556Dd84l3x+EvEMMDwkLTy
	01QeWPnnC1j+r6YidHhI9Xg/FCp6MgyzUIrTspmUhs5N3MKQ==
X-Google-Smtp-Source: AGHT+IESiv86KYDDdS1iGE1tylq075G5WhK6osXYWr3U2wVtnqKbjI1TB40KxlgajUIT3fIFR9tAh9eNcIfZQoFVOXI=
X-Received: by 2002:a05:690c:6f8f:b0:70e:2d77:3cfe with SMTP id
 00721157ae682-7115093ff83mr3970817b3.2.1749667269749; Wed, 11 Jun 2025
 11:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250611015401.1342422-1-anibal@limonsoftware.com> <CAMSfU+64PMHZx1s2ECgYTh0qQ2k8H2iL9=oZ-kYJt3hqN-onNw@mail.gmail.com>
In-Reply-To: <CAMSfU+64PMHZx1s2ECgYTh0qQ2k8H2iL9=oZ-kYJt3hqN-onNw@mail.gmail.com>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Wed, 11 Jun 2025 12:40:57 -0600
X-Gm-Features: AX0GCFsam5B9515A7R16Ii_sg39cfxAhGvr9GXs4P2m2XJaEjevv490OOrFzd5g
Message-ID: <CAOU5ZMtkgwTmkq-iNrS3VMaaSi+X+mzwVQQqnqhXSKmusFO73Q@mail.gmail.com>
Subject: Re: [PATCHv3] test-manual/ptest: Add info about fail state of ptest-runner/ptests
To: Yoann Congal <yoann.congal@smile.fr>
Cc: docs@lists.yoctoproject.org, antonin.godard@bootlin.com, 
	erik.schumacher@iris-sensing.com
Content-Type: multipart/alternative; boundary="00000000000016bc1806375028ef"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Jun 2025 18:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7065

--00000000000016bc1806375028ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 8:33=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> Hello,
>
> Le mer. 11 juin 2025 =C3=A0 03:54, Anibal Limon <anibal@limonsoftware.com=
> a
> =C3=A9crit :
>
>> On the ML was pointed about no specific information about
>> ptest-runner/ptests so improve docs around.
>>
>> https://lists.yoctoproject.org/g/yocto-patches/message/1622
>>
>> [YOCTO #15832]
>>
>> Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
>> ---
>>  documentation/Pipfile               |  2 ++
>>  documentation/test-manual/ptest.rst | 17 ++++++++++++-----
>>  2 files changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/documentation/Pipfile b/documentation/Pipfile
>> index 7ee1d2290..c99d09c75 100644
>> --- a/documentation/Pipfile
>> +++ b/documentation/Pipfile
>> @@ -9,6 +9,8 @@ verify_ssl =3D true
>>  sphinx =3D "*"
>>  sphinx-rtd-theme =3D "*"
>>  pyyaml =3D "*"
>> +vale =3D "*"
>> +sphinx-lint =3D "*"
>>
> ^ this change is unrelated and should be split into a separate commit (or
> removed if that was an error)
>

Nice catch,


>
>
>>  [requires]
>>  python_version =3D "3"
>> diff --git a/documentation/test-manual/ptest.rst
>> b/documentation/test-manual/ptest.rst
>> index 2c021af51..e064419d7 100644
>> --- a/documentation/test-manual/ptest.rst
>> +++ b/documentation/test-manual/ptest.rst
>> @@ -46,13 +46,19 @@ Running ptest
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>>  The ``ptest-runner`` package installs a shell script that loops through
>> -all installed ptest test suites and runs them in sequence. Consequently=
,
>> -you might want to add this package to your image.
>> +all installed ptest test suites and runs them in sequence.
>> +
>> +During the execution ``ptest-runner`` keeps counter of failed ``ptests`=
`
>> +and use it as exit value, failing the execution if any of the
>> ``run-ptest``
>> +scripts fails.
>> +
>> +Consequently, you might want to add this package to your image.
>> +
>>
> "keeps counter of failed ``ptests`` and use it as exit value" is not
> entirely true.
> I went to look in the code of ptest-runner2, and found this commit:
> https://git.yoctoproject.org/ptest-runner2/commit/main.c?id=3Dc10e7475353=
f4cfb5afb30ab1012c32c2efde85a
> (It was committed by you?) =3D> ptest-runner does keep a count of failed
> ptests but returns 1 if the count is > 0.
>

Yeah, I remembered, fixing doc.


>
>  Getting Your Package Ready
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>>
>> -In order to enable a recipe to run installed ptests on target hardware,
>> +In order to enable a recipe to run installed ``ptests`` on target
>> hardware,
>>  you need to prepare the recipes that build the packages you want to
>>  test. Here is what you have to do for each recipe:
>>
>> @@ -77,8 +83,9 @@ test. Here is what you have to do for each recipe:
>>
>>  -  *Create run-ptest:* This script starts your test. Locate the
>>     script where you will refer to it using
>> -   :term:`SRC_URI`. Here is an
>> -   example that starts a test for ``dbus``::
>> +   :term:`SRC_URI`. Be sure your ``run-ptest`` exit with 0 to mark it
>> +   as sucessfully executed.
>>
>
> Can you clarify here that ptest-runner expects 0 for a successful test or
> !=3D0 for a test failure.
>

Let me rephrase.

>
> Also (but that may be tackled in another patch), oe-selftest's testimage
> seems to expect at least a "PASS: ...", "FAIL: ..." line somewhere.
> See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15832#c1.
>
>
>> +   Here is an example that starts a test for ``dbus``::
>>
>>        #!/bin/sh
>>        cd test
>> --
>> 2.39.5
>>
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>

--00000000000016bc1806375028ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 11,=
 2025 at 8:33=E2=80=AFAM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@sm=
ile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,<=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">L=
e=C2=A0mer. 11 juin 2025 =C3=A0=C2=A003:54, Anibal Limon &lt;<a href=3D"mai=
lto:anibal@limonsoftware.com" target=3D"_blank">anibal@limonsoftware.com</a=
>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On the ML was pointed about no specific information about<br>
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
rror)</div></div></div></div></blockquote><div><br></div><div>Nice catch,</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
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
eep a count of failed ptests but returns 1 if the count is &gt; 0.</div></d=
iv></div></div></blockquote><div><br></div><div>Yeah, I remembered, fixing =
doc.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
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
=3D0 for a test failure.</div></div></div></div></blockquote><div><br></div=
><div>Let me rephrase.=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><di=
v><br></div><div>Also (but that may be tackled in another patch), oe-selfte=
st&#39;s testimage seems to expect at least a &quot;PASS: ...&quot;, &quot;=
FAIL: ...&quot; line somewhere.</div><div>See=C2=A0<a href=3D"https://bugzi=
lla.yoctoproject.org/show_bug.cgi?id=3D15832#c1" target=3D"_blank">https://=
bugzilla.yoctoproject.org/show_bug.cgi?id=3D15832#c1</a>.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div></div>

--00000000000016bc1806375028ef--

