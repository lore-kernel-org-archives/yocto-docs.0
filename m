Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.18202.1621254795990429268
 for <docs@lists.yoctoproject.org>;
 Mon, 17 May 2021 05:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vW1OOQwi;
 spf=pass (domain: linaro.org, ip: 209.85.208.48, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f48.google.com with SMTP id t3so6666922edc.7
        for <docs@lists.yoctoproject.org>; Mon, 17 May 2021 05:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=COTuNfCLF5qndztTS3jxm2mzqxzgxUs9S+mTYVcL/SU=;
        b=vW1OOQwie1/UYDx2XU7289bWlSDPfdAj7fpTxkqdjhF5EPJjpMGNw9gOygkedvGbYE
         mjjq8vpivZGhRNOyTQMpsdhnpVIS2tNujj9aqsXGxIWLTaad3QYHPDwuQStpV0AmU58M
         9ABcm6SmiTiyQIX6KzDXhJ1DXN0xIEz+WkiEdPs4IDnGQ5x37bw6zNbW7l6VQHFbflWP
         jJ8Aw64ea3Bp/ImwJq5Okn/gMNHQITv+8CBMonTptRr3/0on5/HjpRbWgDlhpsiNtXwL
         x9inrD5v9bJbscfcNjNzajO5Ac18sr9c+wMiT/IDXcosXHWZtPq1Vnm2zhcQjHlFVHw/
         oG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=COTuNfCLF5qndztTS3jxm2mzqxzgxUs9S+mTYVcL/SU=;
        b=HTy5IPnsfH6qt0HNYvTk9a71L9Q1QdrgjjA8PFNZdzAzALQ8c5LDlIemZnQYWVvDRT
         8g7s8O2WpxowNyAvNN9wFdr3wlJXPacqJngE2YjUInvMFSvn6/Ns/0vyPmDidmVTyJEH
         KHzm+cQYeiqtx0pwZxWuOVqnEbTRduP3uxtpIbz5riAG95/jIl2tnSqV5q/yDJCvJm68
         e0kQGakH9RXf1mFNaeSJ4tOCdDgJbPDpqZZPjvxgt/c1mb2SaTkbSgpQ/0OXbCSP0PEX
         DZD+nrOlr989xT8aicmFm9abKJP+fSptUSF5FENGNA8OMyj5ofeeU77mPsfUcj2omBoS
         Zl5A==
X-Gm-Message-State: AOAM5320IvzQX5n1MC5SiN7hDl8mOEFYIDXZb9l6Shl0o7YRbmWuLy/K
	00+09Pg4J0o6ruGX5lZCI8Q8442qezHy9OXrLuWwSQ==
X-Google-Smtp-Source: ABdhPJxbztfQhH2GJXOkzrX7OjUMC+Og21MUtfIZT+P9cUjtSbUcUexoGmbc89E/jpJvSOKDXUMfEoFbaAIoMVScy8M=
X-Received: by 2002:a50:c44f:: with SMTP id w15mr72849841edf.79.1621254794342;
 Mon, 17 May 2021 05:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
 <CAP71WjxpKO1hXb5wEgXeiHVt4EwfeEc08cTz88CG7684Eu-KJw@mail.gmail.com> <c9b30dd5-b153-b966-be59-fb936caedc6d@bootlin.com>
In-Reply-To: <c9b30dd5-b153-b966-be59-fb936caedc6d@bootlin.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 17 May 2021 14:33:05 +0200
Message-ID: <CAP71WjzhCxdEVafKw9qfhfNaf2u2ZfDe7gQ31sVV3J9BVwFmPQ@mail.gmail.com>
Subject: Re: [docs] [RFC 0/3] add support for diagrams generated from SVG sources
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000001b88d105c285cce2"

--0000000000001b88d105c285cce2
Content-Type: text/plain; charset="UTF-8"

On Mon, May 17, 2021 at 10:45 AM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Nicolas,
>
> On 5/17/21 12:11 AM, Nicolas Dechesne wrote:
> >
> >
> >
> > Getting more svg files is definitely the way to go.. thanks for
> > starting this. It seems like there are sphinx extensions to convert
> > images as needed, e.g.
> > https://www.sphinx-doc.org/en/master/usage/extensions/imgconverter.html
> > <https://www.sphinx-doc.org/en/master/usage/extensions/imgconverter.html
> >
> > or
> > https://github.com/sephalon/sphinxcontrib-svg2pdfconverter
> > <https://github.com/sephalon/sphinxcontrib-svg2pdfconverter>
> > which seems to support inkscape:
> >
> https://github.com/sephalon/sphinxcontrib-svg2pdfconverter/blob/master/sphinxcontrib/inkscapeconverter.py
> > <
> https://github.com/sephalon/sphinxcontrib-svg2pdfconverter/blob/master/sphinxcontrib/inkscapeconverter.py
> >
> >
> > Have you looked into that or not?
>
>
> Not yet, but this sounds like a much better option for converting SVG to
> PNG and PDF, rather than having to do this manually in the Makefile.
> I will try to use those.
>

FWIW, I really like the PDF output.. the whole doc in a single PDF is
great. We should make it a goal for this release cycle to produce and
release PDF (I know some prefer epub.. so perhaps we can do both).

We should probably review the PDF output and tweak it a bit, for example, I
don't think we need the "Current and Previous releases" sections.


>
> Thanks for the great suggestion!
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000001b88d105c285cce2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 17, 2021 at 10:45 AM Mich=
ael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michae=
l.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi Nicolas,<br>
<br>
On 5/17/21 12:11 AM, Nicolas Dechesne wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Getting more svg files is definitely the way to go.. thanks for<br>
&gt; starting this. It seems like there are sphinx extensions to convert<br=
>
&gt; images as needed, e.g.<br>
&gt; <a href=3D"https://www.sphinx-doc.org/en/master/usage/extensions/imgco=
nverter.html" rel=3D"noreferrer" target=3D"_blank">https://www.sphinx-doc.o=
rg/en/master/usage/extensions/imgconverter.html</a><br>
&gt; &lt;<a href=3D"https://www.sphinx-doc.org/en/master/usage/extensions/i=
mgconverter.html" rel=3D"noreferrer" target=3D"_blank">https://www.sphinx-d=
oc.org/en/master/usage/extensions/imgconverter.html</a>&gt;<br>
&gt; or<br>
&gt; <a href=3D"https://github.com/sephalon/sphinxcontrib-svg2pdfconverter"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/sephalon/sphinxcon=
trib-svg2pdfconverter</a><br>
&gt; &lt;<a href=3D"https://github.com/sephalon/sphinxcontrib-svg2pdfconver=
ter" rel=3D"noreferrer" target=3D"_blank">https://github.com/sephalon/sphin=
xcontrib-svg2pdfconverter</a>&gt;<br>
&gt; which seems to support inkscape:<br>
&gt; <a href=3D"https://github.com/sephalon/sphinxcontrib-svg2pdfconverter/=
blob/master/sphinxcontrib/inkscapeconverter.py" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/sephalon/sphinxcontrib-svg2pdfconverter/blob=
/master/sphinxcontrib/inkscapeconverter.py</a><br>
&gt; &lt;<a href=3D"https://github.com/sephalon/sphinxcontrib-svg2pdfconver=
ter/blob/master/sphinxcontrib/inkscapeconverter.py" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/sephalon/sphinxcontrib-svg2pdfconverter/bl=
ob/master/sphinxcontrib/inkscapeconverter.py</a>&gt;=C2=A0<br>
&gt;<br>
&gt; Have you looked into that or not?<br>
<br>
<br>
Not yet, but this sounds like a much better option for converting SVG to<br=
>
PNG and PDF, rather than having to do this manually in the Makefile.<br>
I will try to use those.<br></blockquote><div><br></div><div>FWIW, I really=
 like the PDF output.. the whole doc in a single PDF is great. We should ma=
ke it a goal for this release cycle to produce and release PDF (I know some=
 prefer epub.. so perhaps we can do both).</div><div><br></div><div>We shou=
ld probably review the PDF output and tweak it a bit, for example, I don&#3=
9;t think we need the &quot;Current and Previous releases&quot; sections.</=
div><div>=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Thanks for the great suggestion!<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--0000000000001b88d105c285cce2--
