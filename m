Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.32174.1610969986436927655
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Jan 2021 03:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=hg4oRcsf;
 spf=pass (domain: smile.fr, ip: 209.85.218.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f46.google.com with SMTP id g3so3841333ejb.6
        for <docs@lists.yoctoproject.org>; Mon, 18 Jan 2021 03:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=enSS1gSHA4nz2qhmqzVyPOvd6LtsENMG/3DzCWpXOwg=;
        b=hg4oRcsfuVYnw7w1FsAabVcob+IiguhB7XXcu1k5Sx1E6ObV6O7xhTPkHd9DHU3GQt
         n+0KcX8Bg/JhCg7120Rf62tYXLoXw9bVrVtmHF6MbN2LjzGywPhhzZJvaKAbUGOSzpKY
         8KLP8aYrRWnAbQOhGMAo8jaO23txagv2UDCOT938zoyZ+Z9BvHz1VQRG6Vsn81oqiGE6
         1fIRi6W/gJZHUMKmnFimqePs1Y73xykBGfiaZte52NljEuY9jyUAEdmLMjVa36VpVF2W
         r/SpnmRKy+PUL/ZTL50LGWNP6X7/89UOdKC1UCJY4YGH0B0k3GuCLq7VjU05ajkrAJSZ
         kEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=enSS1gSHA4nz2qhmqzVyPOvd6LtsENMG/3DzCWpXOwg=;
        b=rHGDcKwqOtgbyDhLhCfVqYanDwRvx+mnf3Jpdk7S0j+IUFD7ITajPrGJx5vzhRdq0c
         PpiclFWywrKbZ6COjM+5abKXR6zf/jzW+pxe5MkDncAof9f+YNJooFvqXjcC2jJZSvRz
         z7ctu5R6cgOF/pvHcw7ZQwtQE5DJnCaUngNlknMkhJREBwkPa0WIGoGHTr75OxCyE7in
         3/H9/4YCmWcsCDqUShSRcWecGWlIdObQgcm+x2Vpug+/R/dtwHI3o8a4hMuA7oCa/+7I
         XLlcoN+orxGwajxs5TbuSjQu+dajuVxf4Oauz/MYzEE3g+s/jLAdIh65FZIsFU6ofBHK
         7A9w==
X-Gm-Message-State: AOAM531z2dDsNEWOfcmdshpulIE9sH7sdDqmDKJbxwuNP4oMOxyXN/J0
	lgbHIvWf2IMyWcBDfq0kV//RaGVkQuoRDvIDlLoR0g==
X-Google-Smtp-Source: ABdhPJytRQvG0KxerLZ2hngUf9GtT5/5qECn9g6B+vzMRhQF+Le+sC6UDHmLgb5vR1J6NT45sEhJPcc5cQPXDZfUQXQ=
X-Received: by 2002:a17:906:22c7:: with SMTP id q7mr17026392eja.486.1610969984773;
 Mon, 18 Jan 2021 03:39:44 -0800 (PST)
MIME-Version: 1.0
References: <20210118094925.12654-1-yoann.congal@smile.fr> <CAP71WjyqC1PEqAZv_RTnOSf4JtU3Vz2vTB1TP6hdPBdcC9H6LA@mail.gmail.com>
 <165B4FC61F0A47B5.3867@lists.yoctoproject.org>
In-Reply-To: <165B4FC61F0A47B5.3867@lists.yoctoproject.org>
From: "Yoann Congal" <yoann.congal@smile.fr>
Date: Mon, 18 Jan 2021 12:39:18 +0100
Message-ID: <CAMSfU+4hbZjP+EvaEux6VtmeBQ10YgVG8-QcCe2K9iXiPhJGoA@mail.gmail.com>
Subject: Re: [docs] [PATCH] documentation: Add a simple Sphinx extension to check its version
To: Yoann CONGAL <yoann.congal@smile.fr>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000afc13f05b92b2d4a"

--000000000000afc13f05b92b2d4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 18 janv. 2021 =C3=A0 12:23, Yoann Congal via lists.yoctoproject.org
<yoann.congal=3Dsmile.fr@lists.yoctoproject.org> a =C3=A9crit :

>
>
> Le lun. 18 janv. 2021 =C3=A0 11:03, Nicolas Dechesne <
> nicolas.dechesne@linaro.org> a =C3=A9crit :
>
>> hi Yoann,
>>
>> On Mon, Jan 18, 2021 at 10:49 AM Yoann Congal <yoann.congal@smile.fr>
>> wrote:
>>
>>> Following this thread [1], point user to the README if they use an
>>> out-dated version of Sphinx.
>>>
>>> [1]: [PATCH] toaster-manual: Fix a warning related to the code-block
>>> directive
>>>
>>> https://lists.yoctoproject.org/g/docs/topic/patch_toaster_manual_fix_a=
/79656195
>>>
>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>>
>>
>> I was about to reply that I like this patch a lot. and while i was
>> looking at it/testing, I found this in the sphinx docs:
>>
>> needs_sphinx
>> If set to a major.minor version string like '1.1', Sphinx will compare =
it
>> with its version and refuse to build if it is too old. Default is no
>> requirement.
>>
>> needs_extensions
>> This value can be a dictionary specifying version requirements for
>> extensions in extensions, e.g. needs_extensions =3D
>> {'sphinxcontrib.something': '1.5'}. The version strings should be in th=
e
>> form major.minor. Requirements do not have to be specified for all
>> extensions, only for those you want to check.
>>
>> they are existing configuration parameters we could use in conf.py. Do
>> you think you could check that and test? that seems to be exactly what =
we
>> are looking for!
>>
>
> Hi Nicolas,
>
> I didn't find these configurations... (And I was aiming to not break the
> build even for old Sphinx)
>
> needs_sphinx works really well :
>  $ make html
> Running Sphinx v3.0.0
>
> Sphinx version error:
> This project needs at least Sphinx v3.1 and therefore cannot be built wi=
th
> this version.
> make: *** [Makefile:35: html] Error 2
>
> For needs_extensions, I don't know how to test with different extension
> versions. But, AFAIK, we mostly use extensions packaged with Sphinx
> distribution so needs_sphinx should be enough.
>
> I'll send another patch.
>

Done here : "[PATCH] documentation: Prevent building documentation with an
outdated version of sphinx" :
https://lists.yoctoproject.org/g/docs/topic/patch_documentation/79920786


>
> ---
>>>  documentation/conf.py                        |  3 ++-
>>>  documentation/sphinx/sphinx-version-check.py | 25 +++++++++++++++++++=
+
>>>  2 files changed, 27 insertions(+), 1 deletion(-)
>>>  create mode 100644 documentation/sphinx/sphinx-version-check.py
>>>
>>> diff --git a/documentation/conf.py b/documentation/conf.py
>>> index 407ea3292f..4376e67ee3 100644
>>> --- a/documentation/conf.py
>>> +++ b/documentation/conf.py
>>> @@ -43,7 +43,8 @@ extensions =3D [
>>>      'sphinx.ext.autosectionlabel',
>>>      'sphinx.ext.extlinks',
>>>      'sphinx.ext.intersphinx',
>>> -    'yocto-vars'
>>> +    'yocto-vars',
>>> +    'sphinx-version-check'
>>>  ]
>>>  autosectionlabel_prefix_document =3D True
>>>
>>> diff --git a/documentation/sphinx/sphinx-version-check.py
>>> b/documentation/sphinx/sphinx-version-check.py
>>> new file mode 100644
>>> index 0000000000..174cdf0cb7
>>> --- /dev/null
>>> +++ b/documentation/sphinx/sphinx-version-check.py
>>> @@ -0,0 +1,25 @@
>>> +#!/usr/bin/env python
>>> +
>>> +"""
>>> +Simple Sphinx extension checking if the current version will generate
>>> warnings
>>> +"""
>>> +
>>> +import sphinx
>>> +from sphinx.util import logging
>>> +from sphinx.application import Sphinx
>>> +
>>> +__version__ =3D '1.0'
>>> +
>>> +def setup(app: Sphinx):
>>> +    if sphinx.version_info < (3, 1, 0):
>>> +        logger =3D logging.getLogger(__name__)
>>> +        logger.warning(
>>> +            "This version of sphinx is known to generate warnings not
>>> present "
>>> +            "with an up-to-date version. See documentation/README for=
 "
>>> +            "installation instructions"
>>> +        )
>>> +
>>> +    return dict(
>>> +        version=3D__version__,
>>> +        parallel_read_safe=3DTrue,
>>> +    )
>>> --
>>> 2.20.1
>>>
>>>
>>>
>>>
>>>
>
> --
> Yoann Congal
> Smile ECS - Expert technique
> yoann.congal@smile.fr
> +33 6 18 56 76 43
>
>=20
>
>

--=20
Yoann Congal
Smile ECS - Expert technique
yoann.congal@smile.fr
+33 6 18 56 76 43

--000000000000afc13f05b92b2d4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 18 janv. 2021 =C3=A0=C2=A012=
:23, Yoann Congal via <a href=3D"http://lists.yoctoproject.org">lists.yocto=
project.org</a> &lt;yoann.congal=3D<a href=3D"mailto:smile.fr@lists.yoctopr=
oject.org">smile.fr@lists.yoctoproject.org</a>&gt; a =C3=A9crit=C2=A0:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">Le=C2=A0lun. 18 janv. 2021 =C3=A0=C2=A011:03, Nicolas Dec=
hesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">=
nicolas.dechesne@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>hi Yoann,</di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, Jan 18, 2021 at 10:49 AM Yoann Congal &lt;<a href=3D"mailto:yoann.conga=
l@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Following this thread [1=
], point user to the README if they use an out-dated version of Sphinx.<br>
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
ch.<br></div></div></div></blockquote><div><br></div><div>Done here : &quot=
;[PATCH] documentation: Prevent building documentation with an outdated ver=
sion of sphinx&quot; : <a href=3D"https://lists.yoctoproject.org/g/docs/top=
ic/patch_documentation/79920786">https://lists.yoctoproject.org/g/docs/topi=
c/patch_documentation/79920786</a></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div></div><div><br></div></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">---<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font fac=
e=3D"Raleway, regular">Smile ECS - Expert technique</font></div><div><font =
face=3D"Raleway, regular"><a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank">yoann.congal@smile.fr</a></font></div><div><font face=3D"Ralew=
ay, regular"></font><font face=3D"Raleway, regular">+33 6 18 56 76 43</font=
><br></div></div></div></div>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Con=
gal</font><div><font face=3D"Raleway, regular">Smile ECS - Expert technique=
</font></div><div><font face=3D"Raleway, regular"><a href=3D"mailto:yoann.c=
ongal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a></font></div><di=
v><font face=3D"Raleway, regular"></font><font face=3D"Raleway, regular">+3=
3 6 18 56 76 43</font><br></div></div></div></div>

--000000000000afc13f05b92b2d4a--
