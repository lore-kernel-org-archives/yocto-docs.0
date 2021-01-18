Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.31460.1610964206954336831
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Jan 2021 02:03:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YdUyZ7Nj;
 spf=pass (domain: linaro.org, ip: 209.85.218.46, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f46.google.com with SMTP id q22so22844134eja.2
        for <docs@lists.yoctoproject.org>; Mon, 18 Jan 2021 02:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1X7lvGPxDvgy3ZBARrFyrfeKcTT6O6WGHh128mdXTlg=;
        b=YdUyZ7NjmAkTWDeCnzZ/qKn7230w0oNfO4BAoVjD/i5qa91UuPqZCckYRZ+cbDkG0I
         4M3ntR1+1l8yNM6/rJmt2gduHAvQ75LZlOIvnFKy30mU5nWtvyDHyuyPd3B/b4JpQFc1
         uYzNovHd8CWI7l+EWyzDslCz/ctgBnEDlb2LD2dkaJujda3U9P8NGxAGn47NYn9CrXNJ
         eq7jXVMeLxBUW9986sPq58914NMWsk0sJ5/m7O6kkq0dyHEjQqUrt6J+tROP5FBOF+p7
         QHfbjawyXzIq1QR/bWPpcqKovymdCXpKG74jyMk3gEicVf6GLHypB9ILAzdS2Cy5L6Hm
         tK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1X7lvGPxDvgy3ZBARrFyrfeKcTT6O6WGHh128mdXTlg=;
        b=MzNRk0lYVQCMdVEv3qd5ELm0QHax4H+rmA5Q01+/1eg0KUpH+XQ5JLtPrxDJ9IbWH8
         uojGpO8LvG3BYi2ed+0fvlAA1LtpH4vEhFGa6t9FhYnOPbxPtV5QcAB2muLH57de2LU/
         l6Rju3vTJB1w4zxiW6TmBGTh2jRWdatpLMALVHYmxpmYEUVj+ZKFXJfmBbtfyD46Cq4k
         Vp6lQ+CqDeyXx7/HtLY32ctVPPtk2KQ/ZAx/dYhwhUvmLPaTqS0axF5Dp6Hg2Bey0/7K
         OUHV2SUJ1u6witgwr2diYFep64dFHgZk50Q3xNMBedyrMec/NoKBQnYQ8iqxswM85ONO
         8lkg==
X-Gm-Message-State: AOAM533+WQ3Q2nD8fV4PYKLG8LXYi+OftsxzkavgCuapqUyNOikaKeQi
	KFe3zDXlvGcSDi78xEkmgF+vhzT04/PKD7MPq8X9jlKKhEvKBg==
X-Google-Smtp-Source: ABdhPJxo4P/Rx7Lre4+7ZwSDJ94h7iC+zENn83+cJz2bx3PY5E5Gr8sWVfm2LvPbQMSRazwpoIL6YA02JI1tnOSdr8Y=
X-Received: by 2002:a17:906:1291:: with SMTP id k17mr17686125ejb.288.1610964205459;
 Mon, 18 Jan 2021 02:03:25 -0800 (PST)
MIME-Version: 1.0
References: <20210118094925.12654-1-yoann.congal@smile.fr>
In-Reply-To: <20210118094925.12654-1-yoann.congal@smile.fr>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 18 Jan 2021 11:03:14 +0100
Message-ID: <CAP71WjyqC1PEqAZv_RTnOSf4JtU3Vz2vTB1TP6hdPBdcC9H6LA@mail.gmail.com>
Subject: Re: [docs] [PATCH] documentation: Add a simple Sphinx extension to check its version
To: Yoann Congal <yoann.congal@smile.fr>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000366df705b929d5fc"

--000000000000366df705b929d5fc
Content-Type: text/plain; charset="UTF-8"

hi Yoann,

On Mon, Jan 18, 2021 at 10:49 AM Yoann Congal <yoann.congal@smile.fr> wrote:

> Following this thread [1], point user to the README if they use an
> out-dated version of Sphinx.
>
> [1]: [PATCH] toaster-manual: Fix a warning related to the code-block
> directive
>
> https://lists.yoctoproject.org/g/docs/topic/patch_toaster_manual_fix_a/79656195
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>

I was about to reply that I like this patch a lot. and while i was looking
at it/testing, I found this in the sphinx docs:

needs_sphinx
If set to a major.minor version string like '1.1', Sphinx will compare it
with its version and refuse to build if it is too old. Default is no
requirement.

needs_extensions
This value can be a dictionary specifying version requirements for
extensions in extensions, e.g. needs_extensions =
{'sphinxcontrib.something': '1.5'}. The version strings should be in the
form major.minor. Requirements do not have to be specified for all
extensions, only for those you want to check.

they are existing configuration parameters we could use in conf.py. Do you
think you could check that and test? that seems to be exactly what we are
looking for!

---
>  documentation/conf.py                        |  3 ++-
>  documentation/sphinx/sphinx-version-check.py | 25 ++++++++++++++++++++
>  2 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 documentation/sphinx/sphinx-version-check.py
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 407ea3292f..4376e67ee3 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -43,7 +43,8 @@ extensions = [
>      'sphinx.ext.autosectionlabel',
>      'sphinx.ext.extlinks',
>      'sphinx.ext.intersphinx',
> -    'yocto-vars'
> +    'yocto-vars',
> +    'sphinx-version-check'
>  ]
>  autosectionlabel_prefix_document = True
>
> diff --git a/documentation/sphinx/sphinx-version-check.py
> b/documentation/sphinx/sphinx-version-check.py
> new file mode 100644
> index 0000000000..174cdf0cb7
> --- /dev/null
> +++ b/documentation/sphinx/sphinx-version-check.py
> @@ -0,0 +1,25 @@
> +#!/usr/bin/env python
> +
> +"""
> +Simple Sphinx extension checking if the current version will generate
> warnings
> +"""
> +
> +import sphinx
> +from sphinx.util import logging
> +from sphinx.application import Sphinx
> +
> +__version__ = '1.0'
> +
> +def setup(app: Sphinx):
> +    if sphinx.version_info < (3, 1, 0):
> +        logger = logging.getLogger(__name__)
> +        logger.warning(
> +            "This version of sphinx is known to generate warnings not
> present "
> +            "with an up-to-date version. See documentation/README for "
> +            "installation instructions"
> +        )
> +
> +    return dict(
> +        version=__version__,
> +        parallel_read_safe=True,
> +    )
> --
> 2.20.1
>
>
> 
>
>

--000000000000366df705b929d5fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hi Yoann,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Jan 18, 2021 at 10:49 AM Yoann Conga=
l &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Followi=
ng this thread [1], point user to the README if they use an out-dated versi=
on of Sphinx.<br>
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
king for!<br><br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">---<br>
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

--000000000000366df705b929d5fc--
