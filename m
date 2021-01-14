Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.242.1610622397989625015
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 03:06:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=r3K04S+b;
 spf=pass (domain: smile.fr, ip: 209.85.208.173, mailfrom: yoann.congal@smile.fr)
Received: by mail-lj1-f173.google.com with SMTP id e7so5940443ljg.10
        for <docs@lists.yoctoproject.org>; Thu, 14 Jan 2021 03:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4reCAz5JsSnKhr34ah1Qx56qKhenlt5R4fa69T9tIME=;
        b=r3K04S+bI94n+pRSY7jB34ehOS5ueOT/6H70IjGzUy/jokPxA+AmcI6JtliBT1syVx
         kKxVQKRYUTtM2R/oK88Hq7BruR63tqU/Pt6gRKCzGfGa3Tc4bAMwzMKkMCzDLsEUzO4X
         lnvTOq589OtNQ3sSdsmEQWLlAAKMF8QUxQrITZfdQP2K0yDa6my1bmisef1MEZHE6v3Q
         +flB2EK8pnJKE8xTCvCyGDkDA9aTfroTgRsW3j04SibzXHkDK0zY+wjkZAI0Kd6Ns2YT
         CZgCuV3rW+xHv+egJ9SC6uEglRn/sG1q3WXNKBRVv/OvUjC16FshW7fsEiTcIJoy73Un
         3xDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4reCAz5JsSnKhr34ah1Qx56qKhenlt5R4fa69T9tIME=;
        b=djJG9euwZrYSLV2O0fH8TRJl7O/EoP212P2XrisOs06klcCordAoF9sTuKWWc28ept
         eLOg3Jel9KM2ow3Gg2xIw7trAVGl6rn7hOzkezuwnwfxwZdUL+KRovPpmGHhlrYbdVAv
         BI8XPZ6q/vKRkiPgfoQX044zqVKvrrP52paYy0zJVHT1QmhAYCYpM8j7Fsggx4I2BHV+
         keNGKPGZzWHigbUJSXFAtgmtB4XmOFxN6IkK8ZC3bhgqvNVFvrLCQUZdgX6L2mS2c3jI
         ERw4Sq7OResfy0daNg4BetWGtDgG3xdg1+zobC+p7GwnnHWgUAlxW9m01GBAkIGrHMUy
         udZQ==
X-Gm-Message-State: AOAM5309znrf4yD/GRYZXSbQJG0olHsfDFd6htkka87GrHhYTLc1kcUw
	D4XFOkK4d9tgydzVwpxahFniuObitQLVs+ATHNQEMQ==
X-Google-Smtp-Source: ABdhPJzm/mqcIYt4MxCB0NivFu5kRKO3jUURJcLO1YMqkEXH2nGNxrjcTjUfGb9vQZIQdIx+Av0qf/GFg+bWfg5KHOg=
X-Received: by 2002:a2e:8852:: with SMTP id z18mr3033409ljj.94.1610622396182;
 Thu, 14 Jan 2021 03:06:36 -0800 (PST)
MIME-Version: 1.0
References: <20210113172329.7683-1-yoann.congal@smile.fr> <CAP71Wjwi92hxX7U_qC7KwKQpND4mD_F_K8RQ8xBApZUw8o+GFQ@mail.gmail.com>
In-Reply-To: <CAP71Wjwi92hxX7U_qC7KwKQpND4mD_F_K8RQ8xBApZUw8o+GFQ@mail.gmail.com>
From: "Yoann Congal" <yoann.congal@smile.fr>
Date: Thu, 14 Jan 2021 12:06:10 +0100
Message-ID: <CAMSfU+7kP7kotufDWP=b=SSnK2OXc+w96HfK8doZuNTcDja2Hw@mail.gmail.com>
Subject: Re: [docs] [PATCH] toaster-manual: Fix a warning related to the code-block directive
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000cac5a605b8da3fd6"

--000000000000cac5a605b8da3fd6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi !

Le mer. 13 janv. 2021 =C3=A0 18:39, Nicolas Dechesne <nicolas.dechesne@lin=
aro.org>
a =C3=A9crit :

> On Wed, Jan 13, 2021 at 6:23 PM Yoann Congal <yoann.congal@smile.fr>
> wrote:
>
>> Fix the following warning by specifying the language (here : shell):
>> .../yocto/poky/documentation/toaster-manual/reference.rst:572: WARNING:
>> Error in "code-block" directive:
>> 1 argument(s) required, 0 supplied.
>>
>
> Which version of Sphinx are you using? I suspect an old version, in Sphi=
nx
> 2+ (I think) it is no longer an error to omit the language. And I don't =
see
> any warnings in my builds. In fact, we have 0 warning in the whole doc, =
and
> we will try to avoid adding new ones!
>

Well you were right! I was running sphinx 1.8. I got no more warnings afte=
r
upgrading to sphinx 3.4.3.

Sorry about the noise !


>
>
>>
>> .. code-block::
>>
>>    $ bitbake/lib/toaster/manage.py builddelete build_id
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>>  documentation/toaster-manual/reference.rst | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/documentation/toaster-manual/reference.rst
>> b/documentation/toaster-manual/reference.rst
>> index d2ab14c8e6..135968d40c 100644
>> --- a/documentation/toaster-manual/reference.rst
>> +++ b/documentation/toaster-manual/reference.rst
>> @@ -569,7 +569,7 @@ command would return something like the following::
>>  The ``builddelete`` command deletes data associated with a build. Acce=
ss
>>  the command as follows:
>>
>> -.. code-block::
>> +.. code-block:: shell
>>
>>     $ bitbake/lib/toaster/manage.py builddelete build_id
>>
>> --
>> 2.20.1
>>
>>
>>=20
>>
>>

--=20
Yoann Congal
Smile ECS - Expert technique
yoann.congal@smile.fr
+33 6 18 56 76 43

--000000000000cac5a605b8da3fd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi !<br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 13 janv. 2021 =C3=A0=
=
=C2=A018:39, Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linar=
o.org">nicolas.dechesne@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 13, 202=
1 at 6:23 PM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" targ=
et=3D"_blank">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Fix the following warning by specifying =
the language (here : shell):<br>
.../yocto/poky/documentation/toaster-manual/reference.rst:572: WARNING: Er=
ror in &quot;code-block&quot; directive:<br>
1 argument(s) required, 0 supplied.<br></blockquote><div><br></div><div>Wh=
ich version of Sphinx are you using? I suspect an old version, in Sphinx 2+=
 (I think) it is no longer an error to omit the language. And I don&#39;t s=
ee any warnings in my builds. In fact, we have 0 warning in the whole doc, =
and we will try to avoid adding new ones!</div></div></div></blockquote><di=
v>=C2=A0</div><div>Well you were right! I was running sphinx 1.8. I got no =
more warnings after upgrading to sphinx 3.4.3.<br></div><div><br></div><div=
>Sorry about the noise !<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=
=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
.. code-block::<br>
<br>
=C2=A0 =C2=A0$ bitbake/lib/toaster/manage.py builddelete build_id<br>
<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
---<br>
=C2=A0documentation/toaster-manual/reference.rst | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/documentation/toaster-manual/reference.rst b/documentation/to=
aster-manual/reference.rst<br>
index d2ab14c8e6..135968d40c 100644<br>
--- a/documentation/toaster-manual/reference.rst<br>
+++ b/documentation/toaster-manual/reference.rst<br>
@@ -569,7 +569,7 @@ command would return something like the following::<br=
>
=C2=A0The ``builddelete`` command deletes data associated with a build. Ac=
cess<br>
=C2=A0the command as follows:<br>
<br>
-.. code-block::<br>
+.. code-block:: shell<br>
<br>
=C2=A0 =C2=A0 $ bitbake/lib/toaster/manage.py builddelete build_id<br>
<br>
-- <br>
2.20.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Con=
gal</font><div><font face=3D"Raleway, regular">Smile ECS - Expert technique=
</font></div><div><font face=3D"Raleway, regular"><a href=3D"mailto:yoann.c=
ongal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a></font></div><di=
v><font face=3D"Raleway, regular"></font><font face=3D"Raleway, regular">+3=
3 6 18 56 76 43</font><br></div></div></div></div>

--000000000000cac5a605b8da3fd6--
