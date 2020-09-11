Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.3489.1599811489590831145
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2020 01:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PloT8ivP;
 spf=pass (domain: linaro.org, ip: 209.85.219.174, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f174.google.com with SMTP id e11so2728078ybk.1
        for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2020 01:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FyjHldDVg8qakkSFUqkFZa/m8cOlMxv0wX0jRMfTKoQ=;
        b=PloT8ivPIaCWkbB+UfBWDkoxpeA2eCfMO1hHE8H7PuKWC4PfPGMCh/nHvgOsQnAlQL
         b3CSxafxhr+gvWF/PseKMrsIYTuMDlKP8+Iw+iAljAjDFCQAP/7KSL3barjgKXFoHw7u
         NF/JS25JGCH6EYWcoR8zwgD46hYK4iS7828K8Mnz36ulsxUyGhm+4NDorA57lbegLRuv
         AwORqKAMdSrunAYPJDk9IvRtB47yc2GkSfwOQppAoaZsHRLSDBetTnthULKqfBqC7mhD
         xkR2XC2y6x5b1XRmj/yBHSEZCzbI3yCF9zcbHeYKBjPWKcpBLiHWCk5RXU/QTZRwgpsB
         5rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FyjHldDVg8qakkSFUqkFZa/m8cOlMxv0wX0jRMfTKoQ=;
        b=OcWMNRkglstqdD8HQ1VlxtYoDMSMr/1mjQ3KOWW7Spx3Wg76kDPbOL1v1jCguFElK8
         wegSy3IzI9HRbRV1xdyeggA7SH34FkuYdzzrYgG7uk8ZVeQfnOvoidvT+MGyoApOJGpN
         6HNmTD6YVBIQbLeuBZ31JHlkGoHGd3priwBGYNuJm36s1pbtqp4lnmZAX1fykhsHTUvZ
         eaD2GDvVkX+sJgrh2UOtInJpk8N8/XWZddLyPh/2BKERrqXTJHozR7jJPPnVbfaPYnDP
         t4PmVpit93/JHqkd/H/A8FjNq5x0jasPOZMOD2PM4nbEMetN2Kx8CJTIXE9DyVwzerjv
         SY1A==
X-Gm-Message-State: AOAM533QfzGx56Emo9X9t5QjgK033IyRWuOnThxWiO4MxhbmhEUGG917
	qaR5c12qyl0SbYxxQQ2N1WlIwCR3uZYfzZnEqt7wWw==
X-Google-Smtp-Source: ABdhPJwN0jsW73HrH9UjrR1r3p/7bmQwRi56O99oBYyZzJHhIFby/dDS5o0+Y4qkDmerfFH2SZBxQNj7wCrsWukXPCw=
X-Received: by 2002:a05:6902:4cf:: with SMTP id v15mr800457ybs.373.1599811488740;
 Fri, 11 Sep 2020 01:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200615142412.30882-1-akuster808@gmail.com> <20200615142412.30882-2-akuster808@gmail.com>
In-Reply-To: <20200615142412.30882-2-akuster808@gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 11 Sep 2020 10:04:38 +0200
Message-ID: <CAP71WjxLR9=7AoCdLUb4u=_YM6cvZN43eJPoPXLjGjt=A9d9fw@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/8] bsp-guide: Add SPDX license headers
To: akuster <akuster808@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007e8cbc05af052383"

--0000000000007e8cbc05af052383
Content-Type: text/plain; charset="UTF-8"

hi Armin, RP,

On Mon, Jun 15, 2020 at 4:24 PM akuster <akuster808@gmail.com> wrote:

> [Yocto #13873]
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  documentation/bsp-guide/bsp-guide-customization.xsl | 2 ++
>  documentation/bsp-guide/bsp-guide.xml               | 1 +
>  documentation/bsp-guide/bsp-style.css               | 2 ++
>  documentation/bsp-guide/bsp.xml                     | 1 +
>  4 files changed, 6 insertions(+)
>
> diff --git a/documentation/bsp-guide/bsp-guide-customization.xsl
> b/documentation/bsp-guide/bsp-guide-customization.xsl
> index de674a0ae..37fcbcd20 100644
> --- a/documentation/bsp-guide/bsp-guide-customization.xsl
> +++ b/documentation/bsp-guide/bsp-guide-customization.xsl
> @@ -1,4 +1,6 @@
>  <?xml version='1.0'?>
> +<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
>

While doing the sphinx conversion, I noticed that the bsp-guide is using a
slightly different license than the other manuals (e.g. the non commercial
flavor). There was a commit in 2015 to 'fix' the license statement, but it
was just a partial change, since the link to the license wasn't changed:

https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?id=bb1d80c121e9e34090a07feac9d510b2304f058e

When the bsp guide was initially imported in 2010, it was using the NC
flavor:
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?id=d630317b6b297ba6567cc2e3914706dda0690245

I don't know why the change was done in 2015. But I wanted to flag this as
a potential 'issue'.

While I am here.. I also wanted to mention that I couldn't find
CC-BY-2.0-UK SPDX tag in the SPDX licenses list.. only CC-BY-2.0 exists
(without the -UK tag).



> +
>  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="
> http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format"
> version="1.0">
>
>    <xsl:import href="
> http://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl"
> />
> diff --git a/documentation/bsp-guide/bsp-guide.xml
> b/documentation/bsp-guide/bsp-guide.xml
> index a189606ce..93ba1e7fe 100755
> --- a/documentation/bsp-guide/bsp-guide.xml
> +++ b/documentation/bsp-guide/bsp-guide.xml
> @@ -1,6 +1,7 @@
>  <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
>  "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
>  [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
> +<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
>
>  <book id='bsp-guide' lang='en'
>        xmlns:xi="http://www.w3.org/2003/XInclude"
> diff --git a/documentation/bsp-guide/bsp-style.css
> b/documentation/bsp-guide/bsp-style.css
> index 0c8689b96..4ccf5d8ae 100644
> --- a/documentation/bsp-guide/bsp-style.css
> +++ b/documentation/bsp-guide/bsp-style.css
> @@ -1,4 +1,6 @@
>  /*
> +   SPDX-License-Identifier: CC-BY-2.0-UK
> +
>     Generic XHTML / DocBook XHTML CSS Stylesheet.
>
>     Browser wrangling and typographic design by
> diff --git a/documentation/bsp-guide/bsp.xml
> b/documentation/bsp-guide/bsp.xml
> index 96c0455f6..72a077e80 100644
> --- a/documentation/bsp-guide/bsp.xml
> +++ b/documentation/bsp-guide/bsp.xml
> @@ -1,6 +1,7 @@
>  <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
>  "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
>  [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
> +<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
>
>  <chapter id='bsp'>
>
> --
> 2.17.1
>
> 
>

--0000000000007e8cbc05af052383
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">hi Armin, RP,</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 15, 2020 at 4:24=
 PM akuster &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>[Yocto #13873]<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" ta=
rget=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0documentation/bsp-guide/bsp-guide-customization.xsl | 2 ++<br>
=C2=A0documentation/bsp-guide/bsp-guide.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0documentation/bsp-guide/bsp-style.css=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0documentation/bsp-guide/bsp.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A04 files changed, 6 insertions(+)<br>
<br>
diff --git a/documentation/bsp-guide/bsp-guide-customization.xsl b/documen=
tation/bsp-guide/bsp-guide-customization.xsl<br>
index de674a0ae..37fcbcd20 100644<br>
--- a/documentation/bsp-guide/bsp-guide-customization.xsl<br>
+++ b/documentation/bsp-guide/bsp-guide-customization.xsl<br>
@@ -1,4 +1,6 @@<br>
=C2=A0&lt;?xml version=3D&#39;1.0&#39;?&gt;<br>
+&lt;!--SPDX-License-Identifier: CC-BY-2.0-UK--&gt;<br></blockquote><div><=
br></div><div>While doing the sphinx conversion, I noticed that the bsp-gui=
de is using a slightly different license than the other manuals (e.g. the n=
on commercial flavor). There was a commit in 2015 to &#39;fix&#39; the lice=
nse statement, but it was just a partial change, since the link to the lice=
nse wasn&#39;t changed:</div><div><br></div><div><a href=3D"https://git.yoc=
toproject.org/cgit/cgit.cgi/yocto-docs/commit/?id=3Dbb1d80c121e9e34090a07fe=
ac9d510b2304f058e">https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/co=
mmit/?id=3Dbb1d80c121e9e34090a07feac9d510b2304f058e</a></div><div><br></div=
><div>When the bsp guide was initially imported in 2010, it was using the N=
C flavor:</div><div><a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/y=
octo-docs/commit/?id=3Dd630317b6b297ba6567cc2e3914706dda0690245">https://gi=
t.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?id=3Dd630317b6b297ba656=
7cc2e3914706dda0690245</a><br></div><div><br></div><div>I don&#39;t know wh=
y the change was done in 2015. But I wanted to flag this as a potential &#3=
9;issue&#39;.</div><div><br></div><div>While I am here.. I also wanted to m=
ention that I couldn&#39;t find CC-BY-2.0-UK SPDX tag in the SPDX licenses =
list.. only CC-BY-2.0 exists (without the -UK tag).</div><div><br></div><di=
v>=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0&lt;xsl:stylesheet xmlns:xsl=3D&quot;<a href=3D"http://www.w3.org/19=
99/XSL/Transform" rel=3D"noreferrer" target=3D"_blank">http://www.w3.org/19=
99/XSL/Transform</a>&quot; xmlns=3D&quot;<a href=3D"http://www.w3.org/1999/=
xhtml" rel=3D"noreferrer" target=3D"_blank">http://www.w3.org/1999/xhtml</a=
>&quot; xmlns:fo=3D&quot;<a href=3D"http://www.w3.org/1999/XSL/Format" rel=
=3D"noreferrer" target=3D"_blank">http://www.w3.org/1999/XSL/Format</a>&qu=
ot; version=3D&quot;1.0&quot;&gt;<br>
<br>
=C2=A0 =C2=A0&lt;xsl:import href=3D&quot;<a href=3D"http://downloads.yocto=
project.org/mirror/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl" rel=
=
=3D"noreferrer" target=3D"_blank">http://downloads.yoctoproject.org/mirror=
/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl</a>&quot; /&gt;<br>
diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-gui=
de/bsp-guide.xml<br>
index a189606ce..93ba1e7fe 100755<br>
--- a/documentation/bsp-guide/bsp-guide.xml<br>
+++ b/documentation/bsp-guide/bsp-guide.xml<br>
@@ -1,6 +1,7 @@<br>
=C2=A0&lt;!DOCTYPE book PUBLIC &quot;-//OASIS//DTD DocBook XML V4.2//EN&qu=
ot;<br>
=C2=A0&quot;<a href=3D"http://www.oasis-open.org/docbook/xml/4.2/docbookx.=
dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.org/docbook=
/xml/4.2/docbookx.dtd</a>&quot;<br>
=C2=A0[&lt;!ENTITY % poky SYSTEM &quot;../poky.ent&quot;&gt; %poky; ] &gt;=
<br>
+&lt;!--SPDX-License-Identifier: CC-BY-2.0-UK--&gt;<br>
<br>
=C2=A0&lt;book id=3D&#39;bsp-guide&#39; lang=3D&#39;en&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0xmlns:xi=3D&quot;<a href=3D"http://www.w3.org/2=
003/XInclude" rel=3D"noreferrer" target=3D"_blank">http://www.w3.org/2003/X=
Include</a>&quot;<br>
diff --git a/documentation/bsp-guide/bsp-style.css b/documentation/bsp-gui=
de/bsp-style.css<br>
index 0c8689b96..4ccf5d8ae 100644<br>
--- a/documentation/bsp-guide/bsp-style.css<br>
+++ b/documentation/bsp-guide/bsp-style.css<br>
@@ -1,4 +1,6 @@<br>
=C2=A0/*<br>
+=C2=A0 =C2=A0SPDX-License-Identifier: CC-BY-2.0-UK<br>
+<br>
=C2=A0 =C2=A0 Generic XHTML / DocBook XHTML CSS Stylesheet.<br>
<br>
=C2=A0 =C2=A0 Browser wrangling and typographic design by<br>
diff --git a/documentation/bsp-guide/bsp.xml b/documentation/bsp-guide/bsp=
.xml<br>
index 96c0455f6..72a077e80 100644<br>
--- a/documentation/bsp-guide/bsp.xml<br>
+++ b/documentation/bsp-guide/bsp.xml<br>
@@ -1,6 +1,7 @@<br>
=C2=A0&lt;!DOCTYPE chapter PUBLIC &quot;-//OASIS//DTD DocBook XML V4.2//EN=
&quot;<br>
=C2=A0&quot;<a href=3D"http://www.oasis-open.org/docbook/xml/4.2/docbookx.=
dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.org/docbook=
/xml/4.2/docbookx.dtd</a>&quot;<br>
=C2=A0[&lt;!ENTITY % poky SYSTEM &quot;../poky.ent&quot;&gt; %poky; ] &gt;=
<br>
+&lt;!--SPDX-License-Identifier: CC-BY-2.0-UK--&gt;<br>
<br>
=C2=A0&lt;chapter id=3D&#39;bsp&#39;&gt;<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000007e8cbc05af052383--
