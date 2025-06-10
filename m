Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D4FC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 01:51:50 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.76801.1749520307807881787
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Jun 2025 18:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=zZ0XURyD;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.180, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70e447507a0so39299237b3.0
        for <docs@lists.yoctoproject.org>; Mon, 09 Jun 2025 18:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1749520307; x=1750125107; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=73+gCmBcgpBQ69L5PH0kk6A/l6IOoJbCH01EKh1Pat4=;
        b=zZ0XURyDSZMAwK92G+Q56ShB+OGzsBhodOGb/q/jySuDBlR4JTiUmoT11ot8mrwDRw
         C6UebNZAG47QyIkb9w2im6uNh33Jrh2zfuzRKbJjvR6ZtDhT3M+/bA/kVDKb6BOP4PyU
         iIxMikakjf56WJRuN+xMBcAelZf+wRHgudVHbxD8gZjQmxihPOuE5pB1ZCAR1olavdwc
         hHhmSZqweSrz/7ck3DqMjJKoVcH/DeZbrGbRmeEptEd1PieDtoQVQZ8cI9zA7BXxbmCP
         PM4QqlorJkjt6hjvTsdtcdIXBS+j53OhDkmG4hBC16w3F8KK0PnR57DKhhNizxPRqDCX
         Zfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749520307; x=1750125107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73+gCmBcgpBQ69L5PH0kk6A/l6IOoJbCH01EKh1Pat4=;
        b=NZStIZLeWdaLwTaaFtV6wnj6vvuWmkH/WUPXuVv3GIhJxRDJ7lYI7T4FjM9+R8dBYY
         s9mWAuBuTy1B1IgmPyW789XEzaojXveSWkMkmPpCYMwxGWf9QiPET3wlrXcJP0034hd/
         8XQI/Z+dABsCc6VNPSmeD87AJTMNp+w1+8YA2/GVsbhyZB4wxdXBw4UieAY9iBejjoPU
         nHDf2ilhyvf281Vf7bFT9h+UTGzOGs2DUWamFvg8u62xKJQBF3B1Vkg2OIyu9QOhl9wf
         Z/b+D4lRTcbwd5aYt1nWXYbLGw2exRbg2g2sJXjzd4qqSYstpgjVk1UoTHUSJnAs/Tct
         RdIg==
X-Gm-Message-State: AOJu0Yx2eOEgN2ZOEuWshXlmpR38YbeWTeQUJNNgjeIKb3/oZyNn41yL
	ujh4aswtSV4oFRYUSZo/fsXg0u48jkTddeOvEd39qGutW0QzmpQ8kZDQH3crrCepV+eDUf46kRq
	w1qiDbYjJW3Q3RrL3baJ+FOWVckUhlaIeta0LPWgT9g==
X-Gm-Gg: ASbGnct1iEsDA/GA+fQFmDzzvWwQ9s98zqiDDc3uCJRnmzlB+71SxZwfoRjA5uLqsBD
	y/pjvWqSItZb+TZWT3GjiPLpiziq1R4IoT5hfkGVnzCfV4vtE5Nt2/jxhguetvcBvOJt7dIW8pa
	fI6ilCli4VPEGopO6OTiW0JXNW9WeSunw6yZ/IRvnKRpbT
X-Google-Smtp-Source: AGHT+IFXlRwYZMn6INNSO96FeG2ZN8wmzEPjKwhSzxQwBFC6bBpx0P/J9bXNecZ6G8gOzUvg+sYMgJQhc/bApU588OU=
X-Received: by 2002:a05:690c:45ca:b0:710:e8a8:7768 with SMTP id
 00721157ae682-710f771e8f7mr234624057b3.31.1749520306949; Mon, 09 Jun 2025
 18:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250609222143.3275-1-anibal@limonsoftware.com> <CAMSfU+5v+4HGa7L6qUZ1ydZ8i3jcvrU11=9XSZwWYQs9DaH+uA@mail.gmail.com>
In-Reply-To: <CAMSfU+5v+4HGa7L6qUZ1ydZ8i3jcvrU11=9XSZwWYQs9DaH+uA@mail.gmail.com>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Mon, 9 Jun 2025 19:51:35 -0600
X-Gm-Features: AX0GCFtBVcQXhrGY6QEFfHDjA0RADdanuj7dhpsEvx9gXxV_PnJFlVmyZ3ofeYo
Message-ID: <CAOU5ZMvHT7Camn=h6WwuvB1fEObHmcKbvjHMb2qBo9tM8-2D4w@mail.gmail.com>
Subject: Re: [PATCH] test-manual/ptest: Add info about fail state of ptest-runner/ptests
To: Yoann Congal <yoann.congal@smile.fr>
Cc: docs@lists.yoctoproject.org, antonin.godard@bootlin.com, 
	erik.schumacher@iris-sensing.com
Content-Type: multipart/alternative; boundary="0000000000006c5e4206372df032"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 01:51:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7037

--0000000000006c5e4206372df032
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 4:48=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr>=
 wrote:

> Hello,
>
> Le mar. 10 juin 2025 =C3=A0 00:21, Anibal Limon <anibal@limonsoftware.com=
> a
> =C3=A9crit :
>
>> On the ML was pointed about no specific information about
>> ptest-runner/ptests so improve docs around.
>>
>> https://lists.yoctoproject.org/g/yocto-patches/message/1622
>>
>> Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
>>
>
> Thank you for working on this! :)
>
> Can you reference the bug
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15832?
> With "[YOCTO #15832]" somewhere in your commit message.
>
>
>> ---
>>  documentation/test-manual/ptest.rst | 17 ++++++++++++-----
>>  1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/documentation/test-manual/ptest.rst
>> b/documentation/test-manual/ptest.rst
>> index 2c021af51..3b50e354a 100644
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
>>
>
> Counting failed tests might lead to weird overflows.
> For example, there is a special error code for "ptest-runner itself
> failed" (127 IIRC).
> If you have 127 failing tests, the calling code may reach a wrong
> conclusion.
>
> I'd recommend returning a static non-zero error code on error (e.g 1).
>

I will look into the bug description, and see how we can fix the behaviour
you are experiencing.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15832#c0


>
>
>> +
>> +Consequently, you might want to add this package to your image.
>> +
>>
>>  Getting Your Package Ready
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
>> +   :term:`SRC_URI`. Be sure your *run-ptest* exit with 0 to mark it
>>
>
> Use ``run-ptest`` to stay consistent with the rest of the doc?
>

I sent a v2.

Cheers!,
Anibal


>
> +   as succesfully executed.
>> +   Here is an example that starts a test for ``dbus``::
>>
>>        #!/bin/sh
>>        cd test
>> --
>> 2.39.5
>>
>
>
> --
> Yoann Congal
> Smile ECS
>

--0000000000006c5e4206372df032
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 9, =
2025 at 4:48=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smi=
le.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello,</div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 10 jui=
n 2025 =C3=A0=C2=A000:21, Anibal Limon &lt;<a href=3D"mailto:anibal@limonso=
ftware.com" target=3D"_blank">anibal@limonsoftware.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On the M=
L was pointed about no specific information about<br>
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
zilla.yoctoproject.org/show_bug.cgi?id=3D15832" target=3D"_blank">https://b=
ugzilla.yoctoproject.org/show_bug.cgi?id=3D15832</a>?</div><div>With &quot;=
[YOCTO #15832]&quot; somewhere in your commit message.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">---<br>
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
o error code on error (e.g 1).</div></div></div></blockquote><div><br></div=
><div>I will look into the bug description, and see how we can fix the beha=
viour you are experiencing.</div><div><br></div><div><a href=3D"https://bug=
zilla.yoctoproject.org/show_bug.cgi?id=3D15832#c0">https://bugzilla.yoctopr=
oject.org/show_bug.cgi?id=3D15832#c0</a></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_=
quote"><div>=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
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
t with the rest of the doc?</div></div></div></blockquote><div><br></div><d=
iv>I sent a v2.</div><div><br></div><div>Cheers!,</div><div>Anibal</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div class=3D"gmail_quote"><div><br></div><blockquote class=3D"gmail_=
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
</blockquote></div></div>

--0000000000006c5e4206372df032--

