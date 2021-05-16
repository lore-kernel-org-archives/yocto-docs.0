Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.11606.1621204206629789283
 for <docs@lists.yoctoproject.org>;
 Sun, 16 May 2021 15:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HGqCFhi3;
 spf=pass (domain: linaro.org, ip: 209.85.218.41, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f41.google.com with SMTP id w3so6380820ejc.4
        for <docs@lists.yoctoproject.org>; Sun, 16 May 2021 15:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DJMg7DtjLKzsZdzNiZ/cMmQWYh3U6A4Xng1TO4aCuJc=;
        b=HGqCFhi34LsTHGickJk4tStHPy61MBi2EMi9nIeXnoB9Eij+GAfNgzBFq4u4zhuB1h
         tLJZWdKpPj32yFWNNYJMV9uFbHO+ivPXCezT9eNehpcIgUfwvABnuQqfv23hraT0ogLH
         jN8EzdI/0iL5bqd/nsITNWy/MijKz6YHS+GFVw2X3pJ7LYMdYKQ3NNsCyF0o2yGAT8Ia
         DuWX8a3+JN6cu9LyunJPeOmvQAXMlv3uoqKuwrPAzA9nXo4H/59uk10eOmL9lTXURBwn
         j3Q65eISFRlGAbFrrLtnKJGTVfuokr1VZs3g4gDrIMYa6QM4AtCNcj0rP4j9yfdvS8bA
         XkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DJMg7DtjLKzsZdzNiZ/cMmQWYh3U6A4Xng1TO4aCuJc=;
        b=btQX0j/hSzDV3WskV33vbNqVEFTGreGQ+rVjbv0j8F3vTjtznaXr24fUbSOYRO0LYp
         jViBqrKv4waaz5WLvTRO+Gn8ozehfSqFKC20gYNa/G2ALeGofqOtbepCSVNwHTV8cJso
         S9G9Z5yxEI+qjoUjigu31ykMHE+ag8oDVzD2bqC1+KiszQVoklFAxzJWRWXxAqL+TqKS
         12ywlnKA3LpZOLhozf0sK8PuPrukihn/C5YEISDxMCWn4xHY9bkjrorxdbz0tT4IBJ3E
         RLL2Q5bkx5ZxuiI9RhcNmmUxMg7UDh9HNGs2ELeiFyRdaMvMqR3LZexYxofwXT/xXKyA
         3yNQ==
X-Gm-Message-State: AOAM533UKso+R51vV1LG9hqaO0oCYqAIOZvb1bs/s1j8GNaP6f6yAs3j
	m0Z1edgg/E1UH0YnX/bn+7QUidVW9BFKEKZts1DDlg==
X-Google-Smtp-Source: ABdhPJz2KHDf++9vnSMgg/81tCRRKZrtJ7o46EfHipEFdRfD96FsAHIHlTSahH9XWcyptbbOIJ6DYcv8YDs0Ok827hs=
X-Received: by 2002:a17:906:c9cf:: with SMTP id hk15mr25602226ejb.445.1621204204965;
 Sun, 16 May 2021 15:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210515071219.307241-1-michael.opdenacker@bootlin.com> <20210515071219.307241-3-michael.opdenacker@bootlin.com>
In-Reply-To: <20210515071219.307241-3-michael.opdenacker@bootlin.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 17 May 2021 00:29:54 +0200
Message-ID: <CAP71Wjy_i6N=V+aKuZJA4U50QxDdWVg4pp4yLXsG2kDyQaaMkQ@mail.gmail.com>
Subject: Re: [docs] [RFC 2/3] conf.py: prefer PNG to SVG in EPUB output
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000bee6b605c27a0454"

--000000000000bee6b605c27a0454
Content-Type: text/plain; charset="UTF-8"

On Sat, May 15, 2021 at 9:13 AM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> SVG directly included in EPUB output has multiple issues,
> in particular font size and alignment ones (tested on two
> EPUB readers).
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/conf.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 5a2e25f7b2..798a365c7f 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -136,3 +136,7 @@ latex_elements = {
>      'passoptionstopackages':
> '\PassOptionsToPackage{bookmarksdepth=5}{hyperref}',
>      'preamble': '\setcounter{tocdepth}{2}',
>  }
> +
> +# Make the EPUB builder prefer PNG to SVG because of issues rendering
> Inkscape SVG
> +from sphinx.builders.epub3 import Epub3Builder
> +Epub3Builder.supported_image_types = ['image/png', 'image/svg+xml',
> 'image/gif', 'image/jpeg']
>

If you concluded svg has issues, should we remove it from this list
instead?


> --
> 2.25.1
>
>
> 
>
>

--000000000000bee6b605c27a0454
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 15, 2021 at 9:13 AM Micha=
el Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael=
.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">SVG directly included in EPUB output has multiple is=
sues,<br>
in particular font size and alignment ones (tested on two<br>
EPUB readers).<br>
<br>
Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker=
@bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
---<br>
=C2=A0documentation/conf.py | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/documentation/conf.py b/documentation/conf.py<br>
index 5a2e25f7b2..798a365c7f 100644<br>
--- a/documentation/conf.py<br>
+++ b/documentation/conf.py<br>
@@ -136,3 +136,7 @@ latex_elements =3D {<br>
=C2=A0 =C2=A0 =C2=A0&#39;passoptionstopackages&#39;: &#39;\PassOptionsToPa=
ckage{bookmarksdepth=3D5}{hyperref}&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;preamble&#39;: &#39;\setcounter{tocdepth}{2}&#39;=
,<br>
=C2=A0}<br>
+<br>
+# Make the EPUB builder prefer PNG to SVG because of issues rendering Ink=
scape SVG<br>
+from sphinx.builders.epub3 import Epub3Builder<br>
+Epub3Builder.supported_image_types =3D [&#39;image/png&#39;, &#39;image/s=
vg+xml&#39;, &#39;image/gif&#39;, &#39;image/jpeg&#39;]<br></blockquote><di=
v><br></div><div>If you concluded svg has issues, should we remove it from =
this list instead?=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000bee6b605c27a0454--
