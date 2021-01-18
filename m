Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.31887.1610969002989764979
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Jan 2021 03:23:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=JF5qBLGD;
 spf=pass (domain: smile.fr, ip: 209.85.218.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f45.google.com with SMTP id g12so23169147ejf.8
        for <docs@lists.yoctoproject.org>; Mon, 18 Jan 2021 03:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tM3SeokKSNzy4uGjyxWhTPrRgUiNhIm0ryBJDhXZmqE=;
        b=JF5qBLGD5UkEG8eE//9wyxF5omr7ZkE2JtjU/cggnoV01qtLgQqMIw1KiGgYKFdF0T
         tQgbzJpeRGNge0xS39xW7QqkS8YNmQVrbUqJ2nf6FUAgj4wltB2yT8n07SAnFgNANbu5
         40T/v+KKOZbZMZyP4uGUePBuRHw76m1MnPbcs9P9AGHHBiK2f2lswD8q+L/Bj1GQ8PMX
         LfHkfNWinDCHmy34JvLvn19sqUfiivr15QOxOcoIL0UZkeSZqmnydwhoYSLhONnyu+/D
         XRn+oyZTXKi2SZTsHrd80HOkM7NPBH46XbCv9mzMeUBvFEpjgm/nvcUcY5Lc/G0NX+HJ
         J7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tM3SeokKSNzy4uGjyxWhTPrRgUiNhIm0ryBJDhXZmqE=;
        b=J4SWCR0WFlB3HkHN1qN5U0yTGmd89BkLSydPvObHc1hZjOUlrgEuTXz8M08Tg4DXPs
         l0S8tpAnLxvTK9ehQSnXwQc2MRLrfP5ucmOe7DbVuxS7An7Y+Gc/8kZDFBHJ21ls7+Qx
         vafcy+jEPdjXTA9hne9lJwQrNTHQHhTUwjtcGpnEgNaVggu7Bkj1HX4e8ME4wIqHsMZX
         3ZZPIBpmbIfrOlUBUr3UXu1OIpysMzinlGkcb+P8ytrPMDkM/uTXNqZobBNN352x2YSl
         pGPrt1kc0k7oElQL2ftU8eg83HWv7eKleP3Ihw90L5ssuPm7UatjlShZACK9ZVxE+9XS
         rBpA==
X-Gm-Message-State: AOAM532SJELOcVo8eaTPYwsq4iokyqxCi5r5imCBFII4p8OtE1KZRKLW
	EVckCBOqHedXQ498jdDjELaTUEAaqZ2EU9PYPoehsQ==
X-Google-Smtp-Source: ABdhPJx3QMLjviOTeGwotYSfGYwoL6J4iult7ht0xj6Uojjn2sB3dBXgnh2qpNBRFCjlF+6jXOPFSKpEJs0IjKMjvfE=
X-Received: by 2002:a17:906:22c7:: with SMTP id q7mr16988654eja.486.1610969001519;
 Mon, 18 Jan 2021 03:23:21 -0800 (PST)
MIME-Version: 1.0
References: <20210118094925.12654-1-yoann.congal@smile.fr> <CAP71WjyqC1PEqAZv_RTnOSf4JtU3Vz2vTB1TP6hdPBdcC9H6LA@mail.gmail.com>
In-Reply-To: <CAP71WjyqC1PEqAZv_RTnOSf4JtU3Vz2vTB1TP6hdPBdcC9H6LA@mail.gmail.com>
From: "Yoann Congal" <yoann.congal@smile.fr>
Date: Mon, 18 Jan 2021 12:22:54 +0100
Message-ID: <CAMSfU+5+EXPNiX4AW4orVRuVwjSeFpYpU5cAN=b-gsooz83vqA@mail.gmail.com>
Subject: Re: [docs] [PATCH] documentation: Add a simple Sphinx extension to check its version
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000147f5205b92af3ee"

--000000000000147f5205b92af3ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 18 janv. 2021 =C3=A0 11:03, Nicolas Dechesne <nicolas.dechesne@lina=
ro.org>
a =C3=A9crit :

> hi Yoann,
>
> On Mon, Jan 18, 2021 at 10:49 AM Yoann Congal <yoann.congal@smile.fr>
> wrote:
>
>> Following this thread [1], point user to the README if they use an
>> out-dated version of Sphinx.
>>
>> [1]: [PATCH] toaster-manual: Fix a warning related to the code-block
>> directive
>>
>> https://lists.yoctoproject.org/g/docs/topic/patch_toaster_manual_fix_a/=
79656195
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>
>
> I was about to reply that I like this patch a lot. and while i was looki=
ng
> at it/testing, I found this in the sphinx docs:
>
> needs_sphinx
> If set to a major.minor version string like '1.1', Sphinx will compare i=
t
> with its version and refuse to build if it is too old. Default is no
> requirement.
>
> needs_extensions
> This value can be a dictionary specifying version requirements for
> extensions in extensions, e.g. needs_extensions =3D
> {'sphinxcontrib.something': '1.5'}. The version strings should be in the
> form major.minor. Requirements do not have to be specified for all
> extensions, only for those you want to check.
>
> they are existing configuration parameters we could use in conf.py. Do y=
ou
> think you could check that and test? that seems to be exactly what we ar=
e
> looking for!
>

Hi Nicolas,

I didn't find these configurations... (And I was aiming to not break the
build even for old Sphinx)

needs_sphinx works really well :
 $ make html
Running Sphinx v3.0.0

Sphinx version error:
This project needs at least Sphinx v3.1 and therefore cannot be built with
this version.
make: *** [Makefile:35: html] Error 2

For needs_extensions, I don't know how to test with different extension
versions. But, AFAIK, we mostly use extensions packaged with Sphinx
distribution so needs_sphinx should be enough.

I'll send another patch.

---
>>  documentation/conf.py                        |  3 ++-
>>  documentation/sphinx/sphinx-version-check.py | 25 ++++++++++++++++++++
>>  2 files changed, 27 insertions(+), 1 deletion(-)
>>  create mode 100644 documentation/sphinx/sphinx-version-check.py
>>
>> diff --git a/documentation/conf.py b/documentation/conf.py
>> index 407ea3292f..4376e67ee3 100644
>> --- a/documentation/conf.py
>> +++ b/documentation/conf.py
>> @@ -43,7 +43,8 @@ extensions =3D [
>>      'sphinx.ext.autosectionlabel',
>>      'sphinx.ext.extlinks',
>>      'sphinx.ext.intersphinx',
>> -    'yocto-vars'
>> +    'yocto-vars',
>> +    'sphinx-version-check'
>>  ]
>>  autosectionlabel_prefix_document =3D True
>>
>> diff --git a/documentation/sphinx/sphinx-version-check.py
>> b/documentation/sphinx/sphinx-version-check.py
>> new file mode 100644
>> index 0000000000..174cdf0cb7
>> --- /dev/null
>> +++ b/documentation/sphinx/sphinx-version-check.py
>> @@ -0,0 +1,25 @@
>> +#!/usr/bin/env python
>> +
>> +"""
>> +Simple Sphinx extension checking if the current version will generate
>> warnings
>> +"""
>> +
>> +import sphinx
>> +from sphinx.util import logging
>> +from sphinx.application import Sphinx
>> +
>> +__version__ =3D '1.0'
>> +
>> +def setup(app: Sphinx):
>> +    if sphinx.version_info < (3, 1, 0):
>> +        logger =3D logging.getLogger(__name__)
>> +        logger.warning(
>> +            "This version of sphinx is known to generate warnings not
>> present "
>> +            "with an up-to-date version. See documentation/README for =
"
>> +            "installation instructions"
>> +        )
>> +
>> +    return dict(
>> +        version=3D__version__,
>> +        parallel_read_safe=3DTrue,
>> +    )
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

--000000000000147f5205b92af3ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 18 janv. 2021 =C3=A0=C2=
=A011:03, Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.o=
rg">nicolas.dechesne@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>hi Yoann,=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, Jan 18, 2021 at 10:49 AM Yoann Congal &lt;<a href=3D"mailto:yoann.c=
ongal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Following this threa=
d [1], point user to the README if they use an out-dated version of Sphinx.=
<br>
<br>
[1]: [PATCH] toaster-manual: Fix a warning related to the code-block direc=
tive<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.yoctoproject.org/g/docs/topic=
/patch_toaster_manual_fix_a/79656195" rel=3D"noreferrer" target=3D"_blank">=
https://lists.yoctoproject.org/g/docs/topic/patch_toaster_manual_fix_a/7965=
6195</a><br>
<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br></blockquote><div><br></d=
iv><div>I was about to reply that I like this patch a lot. and while i was =
looking at it/testing, I found this in the sphinx docs:</div><div><br></div=
>needs_sphinx<br>If set to a major.minor version string like &#39;1.1&#39;,=
 Sphinx will compare it with its version and refuse to build if it is too o=
ld. Default is no requirement.<br><br>needs_extensions<br>This value can be=
 a dictionary specifying version requirements for extensions in extensions,=
 e.g. needs_extensions =3D {&#39;sphinxcontrib.something&#39;: &#39;1.5&#39=
;}. The version strings should be in the form major.minor. Requirements do =
not have to be specified for all extensions, only for those you want to che=
ck.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">th=
ey are existing configuration parameters we could use in conf.py. Do you th=
ink you could check that and test? that seems to be exactly what we are loo=
king for!<br></div></div></blockquote><div><br></div><div>Hi Nicolas,<br></=
div><div><br></div><div>I didn&#39;t find these configurations... (And I wa=
s aiming to not break the build even for old Sphinx)<br></div><div><br></di=
v><div>needs_sphinx works really well :</div><div>=C2=A0$ make html<br>Runn=
ing Sphinx v3.0.0<br><br>Sphinx version error:<br>This project needs at lea=
st Sphinx v3.1 and therefore cannot be built with this version.<br>make: **=
* [Makefile:35: html] Error 2<br></div><div><br></div><div>For needs_extens=
ions, I don&#39;t know how to test with different extension versions. But, =
AFAIK, we mostly use extensions packaged with Sphinx distribution so needs_=
sphinx should be enough.</div><div><br></div><div>I&#39;ll send another pat=
ch.<br></div><div><br></div></div><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">---<br>
=C2=A0documentation/conf.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0documentation/sphinx/sphinx-version-check.py | 25 ++++++++++++++++++=
++<br>
=C2=A02 files changed, 27 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 documentation/sphinx/sphinx-version-check.py<br>
<br>
diff --git a/documentation/conf.py b/documentation/conf.py<br>
index 407ea3292f..4376e67ee3 100644<br>
--- a/documentation/conf.py<br>
+++ b/documentation/conf.py<br>
@@ -43,7 +43,8 @@ extensions =3D [<br>
=C2=A0 =C2=A0 =C2=A0&#39;sphinx.ext.autosectionlabel&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;sphinx.ext.extlinks&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;sphinx.ext.intersphinx&#39;,<br>
-=C2=A0 =C2=A0 &#39;yocto-vars&#39;<br>
+=C2=A0 =C2=A0 &#39;yocto-vars&#39;,<br>
+=C2=A0 =C2=A0 &#39;sphinx-version-check&#39;<br>
=C2=A0]<br>
=C2=A0autosectionlabel_prefix_document =3D True<br>
<br>
diff --git a/documentation/sphinx/sphinx-version-check.py b/documentation/=
sphinx/sphinx-version-check.py<br>
new file mode 100644<br>
index 0000000000..174cdf0cb7<br>
--- /dev/null<br>
+++ b/documentation/sphinx/sphinx-version-check.py<br>
@@ -0,0 +1,25 @@<br>
+#!/usr/bin/env python<br>
+<br>
+&quot;&quot;&quot;<br>
+Simple Sphinx extension checking if the current version will generate war=
nings<br>
+&quot;&quot;&quot;<br>
+<br>
+import sphinx<br>
+from sphinx.util import logging<br>
+from sphinx.application import Sphinx<br>
+<br>
+__version__ =3D &#39;1.0&#39;<br>
+<br>
+def setup(app: Sphinx):<br>
+=C2=A0 =C2=A0 if sphinx.version_info &lt; (3, 1, 0):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger =3D logging.getLogger(__name__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.warning(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;This version of sphinx is=
 known to generate warnings not present &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;with an up-to-date versio=
n. See documentation/README for &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;installation instructions=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 return dict(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 version=3D__version__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parallel_read_safe=3DTrue,<br>
+=C2=A0 =C2=A0 )<br>
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

--000000000000147f5205b92af3ee--
