Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.11423.1621203122218854946
 for <docs@lists.yoctoproject.org>;
 Sun, 16 May 2021 15:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wADYNPob;
 spf=pass (domain: linaro.org, ip: 209.85.218.41, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f41.google.com with SMTP id s22so6124297ejv.12
        for <docs@lists.yoctoproject.org>; Sun, 16 May 2021 15:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EIPBQz1U8Ex9QNP1DW99iq8ainsqlav3ZHDXuavOXcw=;
        b=wADYNPobuwVjPgMn6e7VSk7l4mDZketH0BXDuCgKcg5uAqO51K4cRVJtJMq2NEJZwQ
         pMq+B3fTjZ5zyFNUbuMn72WJsb44Qsk84wxHruSAhFck7EAprZ+VUT9k/C6NVrZ8GmWx
         fctA+FJFPqNNmBBWXWHElW6IGwHJjTKXvFyxgcmD4gj6wSJSdESRs0zpcTpwsqjDXuya
         iCvEVwGW8MlurvXJgqFXOgq6hD2iJscrSGc50NT1QXijGwZ9NvwwDnYqyJ5/kaQ5gNDw
         9/+Ur8csAuZoPNpUsdhiwaUE9SUHrAt0tgGeFjUyXxGoD7iOLwXrwYz5PYrCp6/uaTqg
         QRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EIPBQz1U8Ex9QNP1DW99iq8ainsqlav3ZHDXuavOXcw=;
        b=FoYbROT2JYpzGUUVCqSh4JXKsMp64RwIP8oRkDS9qFppgU7wNUEYCS69HqDXueXWFz
         ASVR9GyGTbfAHenSOc7dUqPS/4yy9dChBIeBWRbMyyb3tWKeLaHFwWuA9aSj7t4nHgo3
         Rm+J7LzH/QNEPSI1Phy8JXfto87oiV3P4ObiqTAv8i85o6XjCIPs64U3Fe7lpApyTUEF
         fPGfAi+rWcXr6aeiJ9rZxlcXxDVYCX4rLYS+/DSB6BoJ0uKMLuOCgtwVnHL37ABABtPC
         8wxyL1RPwVbC95KUanDC2VtZ7qI6XWOFtbVLzoaZC0+47oWetlch+DR0x+1TY2iUE+qA
         Nu6A==
X-Gm-Message-State: AOAM532EMJ3uATYuAz2Yq1NUGyCexn7SgSoakJ4phSB+DI56/isyi33r
	AQ7EhF37DNPXKUCd+imZ6T3WRBE8bDpVmtjjs9kLdw==
X-Google-Smtp-Source: ABdhPJzqs5EoapM9jFe46KqBJqZPU8xB1yedpn3m/y8D68afGDiFNYM7LyYq0X2m/fCufRxFTp2QCHF9B1JMtZqnYG0=
X-Received: by 2002:a17:906:591:: with SMTP id 17mr18332063ejn.347.1621203120617;
 Sun, 16 May 2021 15:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 17 May 2021 00:11:50 +0200
Message-ID: <CAP71WjxpKO1hXb5wEgXeiHVt4EwfeEc08cTz88CG7684Eu-KJw@mail.gmail.com>
Subject: Re: [docs] [RFC 0/3] add support for diagrams generated from SVG sources
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000001d287405c279c495"

--0000000000001d287405c279c495
Content-Type: text/plain; charset="UTF-8"

On Sat, May 15, 2021 at 9:12 AM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> This RFC proposes modifications to the Makefile and the Sphinx
> configuration (conf.py file) to support:
>
> - The generation of PNG diagrams from SVG sources for the generation
>   of the EPUB manual. Directly using SVG in EPUB shows at least
>   font size and alignment issues.
>
>   The conf.py file has been modified to let the EPUB builder know
>   that it should prefer PNG over SVG when both formats are available.


> - The generation of PDF diagrams from SVG sources for the generation
>   of the PDF manual. PDF output cannot use SVG, and needs PDF diagrams
>   instead.
>
> New diagrams are stored in separate "svg" directories so that generated
> .png and .pdf files can be "gitignored" without ignoring the original
> .png files that have no .svg source.
>
> In the source .rst files, new diagrams can now be included as, for example:
> image:: svg/git-workflow.*
>
> Note that the way the Makefile was modified can most probably be improved,
> as my "make" skills are pretty limited. I'm interested in your suggestions!
>

Getting more svg files is definitely the way to go.. thanks for starting
this. It seems like there are sphinx extensions to convert images as
needed, e.g.
https://www.sphinx-doc.org/en/master/usage/extensions/imgconverter.html
or
https://github.com/sephalon/sphinxcontrib-svg2pdfconverter
which seems to support inkscape:
https://github.com/sephalon/sphinxcontrib-svg2pdfconverter/blob/master/sphinxcontrib/inkscapeconverter.py


Have you looked into that or not?


> My goal is to progressively replace PNG diagrams with SVG ones:
>    - To get high quality definition output documents, in all output formats
>    - To Have the ability to update diagrams
> I would indeed do this very progressively, a little bit every week,
> not at the expense of other tasks.
>
> Michael Opdenacker (3):
>   Makefile: allow epub and latexpdf outputs to use diagrams from SVG
>     sources
>   conf.py: prefer PNG to SVG in EPUB output
>   overview-manual: SVG diagram for the git workflow
>
>  documentation/.gitignore                      |    2 +
>  documentation/Makefile                        |   29 +-
>  documentation/conf.py                         |    4 +
>  .../development-environment.rst               |    4 +-
>  .../overview-manual/figures/git-workflow.png  |  Bin 26586 -> 0 bytes
>  .../overview-manual/svg/git-workflow.svg      | 1205 +++++++++++++++++
>  6 files changed, 1239 insertions(+), 5 deletions(-)
>  delete mode 100644 documentation/overview-manual/figures/git-workflow.png
>  create mode 100644 documentation/overview-manual/svg/git-workflow.svg
>
> --
> 2.25.1
>
>
> 
>
>

--0000000000001d287405c279c495
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 15, 2021 at 9:12 AM Micha=
el Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael=
.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">This RFC proposes modifications to the Makefile and =
the Sphinx<br>
configuration (conf.py file) to support:<br>
<br>
- The generation of PNG diagrams from SVG sources for the generation<br>
=C2=A0 of the EPUB manual. Directly using SVG in EPUB shows at least<br>
=C2=A0 font size and alignment issues.<br>
<br>
=C2=A0 The conf.py file has been modified to let the EPUB builder know<br>
=C2=A0 that it should prefer PNG over SVG when both formats are available.=
=
=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
- The generation of PDF diagrams from SVG sources for the generation<br>
=C2=A0 of the PDF manual. PDF output cannot use SVG, and needs PDF diagram=
s<br>
=C2=A0 instead.<br>
<br>
New diagrams are stored in separate &quot;svg&quot; directories so that ge=
nerated<br>
.png and .pdf files can be &quot;gitignored&quot; without ignoring the ori=
ginal<br>
.png files that have no .svg source.<br>
<br>
In the source .rst files, new diagrams can now be included as, for example=
:<br>
image:: svg/git-workflow.*<br>
<br>
Note that the way the Makefile was modified can most probably be improved,=
<br>
as my &quot;make&quot; skills are pretty limited. I&#39;m interested in yo=
ur suggestions!<br></blockquote><div><br></div><div>Getting more svg files =
is definitely the way to go.. thanks for starting this. It seems like there=
 are sphinx extensions to convert images as needed, e.g.</div><div><a href=
=3D"https://www.sphinx-doc.org/en/master/usage/extensions/imgconverter.htm=
l">https://www.sphinx-doc.org/en/master/usage/extensions/imgconverter.html<=
/a><br></div><div>or</div><div><a href=3D"https://github.com/sephalon/sphin=
xcontrib-svg2pdfconverter">https://github.com/sephalon/sphinxcontrib-svg2pd=
fconverter</a><br></div><div>which seems to support inkscape:</div><div><a =
href=3D"https://github.com/sephalon/sphinxcontrib-svg2pdfconverter/blob/mas=
ter/sphinxcontrib/inkscapeconverter.py">https://github.com/sephalon/sphinxc=
ontrib-svg2pdfconverter/blob/master/sphinxcontrib/inkscapeconverter.py</a>=
=C2=A0</div><div><br></div><div>Have you looked into that or not?</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
My goal is to progressively replace PNG diagrams with SVG ones:<br>
=C2=A0 =C2=A0- To get high quality definition output documents, in all out=
put formats<br>
=C2=A0 =C2=A0- To Have the ability to update diagrams<br>
I would indeed do this very progressively, a little bit every week,<br>
not at the expense of other tasks.<br>
<br>
Michael Opdenacker (3):<br>
=C2=A0 Makefile: allow epub and latexpdf outputs to use diagrams from SVG<=
br>
=C2=A0 =C2=A0 sources<br>
=C2=A0 conf.py: prefer PNG to SVG in EPUB output<br>
=C2=A0 overview-manual: SVG diagram for the git workflow<br>
<br>
=C2=A0documentation/.gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0documentation/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A029 +-<br>
=C2=A0documentation/conf.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +<br>
=C2=A0.../development-environment.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +-<br>
=C2=A0.../overview-manual/figures/git-workflow.png=C2=A0 |=C2=A0 Bin 26586=
 -&gt; 0 bytes<br>
=C2=A0.../overview-manual/svg/git-workflow.svg=C2=A0 =C2=A0 =C2=A0 | 1205 =
+++++++++++++++++<br>
=C2=A06 files changed, 1239 insertions(+), 5 deletions(-)<br>
=C2=A0delete mode 100644 documentation/overview-manual/figures/git-workflo=
w.png<br>
=C2=A0create mode 100644 documentation/overview-manual/svg/git-workflow.sv=
g<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000001d287405c279c495--
