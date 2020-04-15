Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web12.16869.1586965053473832256
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 08:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Wa/2sQY2;
 spf=pass (domain: linaro.org, ip: 209.85.219.177, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f177.google.com with SMTP id o139so198149ybc.11
        for <docs@lists.yoctoproject.org>; Wed, 15 Apr 2020 08:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zyeRzlq8TlOt2yjNxTu7j186DBc/uoHOJKytC1YP26A=;
        b=Wa/2sQY2fUbfPEIbi8Ica/LYh2MAq4r7tTr3H2blLWwL4meSDTUhcHr/bu4clIzoVL
         1lCuTZI/qk6WjzHc4cVUDMLNyTNs0Gx3yk9fKksqc5zp2g4l6q/lwQB8TRzgAF80PH6O
         /G1R3XZVas2nR1PbdQoL+0q5VkmUKfrJ6chkn7QblOKPHETlidjtWL1xjJH0f3VyrlyT
         qv/zhlRNcugmC2Xcct5ccJQdj+vCNMJjWSRb5srPmbtkFc8Z+uZ44tchQFGBKCW1ZVge
         MdddKgPRyjg1PV1b+J/klrSc7Z1fLh9VgBpreQWTl7YNY5gi8VWYzafBMJ+fc+Uk+1Sc
         deGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zyeRzlq8TlOt2yjNxTu7j186DBc/uoHOJKytC1YP26A=;
        b=KaVYvFWhJBoo0uoOZnnlBr066yCVopUZxIHiRh5c+MJ+Wd0JMvfoCHTSVSt6ieDai3
         4WSnccoxpVsfzSucQIyd9muzM3IFdeP9NQEgTK7w/U0bCYGdUCt+n1/R6SyUPLmJHbdo
         o59nqDoG1Mc7+JfLkb0XuOyUv961TolAKxmBV0m3iCxosWEBQsOO5O/gftd/Q5NRFr8P
         Kw0vwgm7Vhrit2DxEAKnwdDYG/OKN9szKmK7w03HsEEZVR8rsATXA9aVmSpLVKAXlPr/
         V4nUVAh5/VUouiiUQ9ATeg4qV5ZQVLc0UwHFJ3Jv5hSh+K79istyReXN1rdM7Wb9XoNw
         CTeg==
X-Gm-Message-State: AGi0PubXKuVz4FmJfKIBoFLzCGXArd0VvNQfWU/TFcO1w5wVSLSkQWs4
	0NwXGa8dRrAVsv9r1EX96teZIU4hZjJ80RxKHDulBg==
X-Google-Smtp-Source: APiQypLjjhfRwVS47vojuQp5HIWvwlIn+NWFWcKHIWpsB7M0+JvLFIQqcQYAc0q3drQyBTWhvhixD653oZwOcB0ch/4=
X-Received: by 2002:a25:ec1:: with SMTP id 184mr9212657ybo.373.1586965052239;
 Wed, 15 Apr 2020 08:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org>
In-Reply-To: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 15 Apr 2020 17:37:20 +0200
Message-ID: <CAP71WjwnFkx4R4Wk__01y5vNJnX_70PUqoVNJ1=QxT8pqf-Lyw@mail.gmail.com>
Subject: Re: Possible changes to the project docs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000361b3305a3561805"

--000000000000361b3305a3561805
Content-Type: text/plain; charset="UTF-8"

hi,

On Wed, Apr 15, 2020 at 12:19 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Since Robert was talking about future docs wide changes, I wanted to
> put an idea out there. Its something a few of us have talked a little
> about. At this point it is an idea, not a decision and something we're
> thinking we need to explore and evaluate.
>
> Basically, the thought is whether to move from docbook to sphinx.
>

Good timing. I have been tossing around this idea... As much as I love
using and reading the YP docs/manual, I know that maintaining and updating
the documentation 'sources' is rather difficult.


> Other projects like the kernel have switched and it could assist some
> of our website/publishing challenges. It might also be easier for
> people to contribute to and there are wider and more modern tools
> supporting that format.
>

Right, and they claimed in https://lwn.net/Articles/692704/:
"if the documentation can be written in plain text rather than DocBook XML,
it's more likely to be written in the first place."

I have spent no more than a couple of hours on it, trying to understand why
the kernel moved and how Sphinx works. The outcome is really
interesting...

I use a conversion tool for DocBook .xml to Sphinx/ReST file format
(pandoc). Of course there are conversion gothas.. but the documentation
source code becomes much easier.

See:
https://people.linaro.org/~nicolas.dechesne/yp-docs/_sources/ref-manual/ref-release-process.xml.rst.txt
vs
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/documentation/ref-manual/ref-release-process.xml

Or even for the variable glossary (sphinx has builtin support for that):
https://people.linaro.org/~nicolas.dechesne/yp-docs/_sources/ref-manual/ref-variables.xml.rst

vs
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/documentation/ref-manual/ref-variables.xml

I have picked the same theme as the Linux kernel documentation, but of
course, the theme is just HTML and CSS, so it's entirely customizable.

For now, only 3 manuals were converted, the html output looks like that:
https://people.linaro.org/~nicolas.dechesne/yp-docs/

I have made a couple of patches to show how to get there:
https://git.linaro.org/people/nicolas.dechesne/poky.git/log/?h=sphinx

It was straightforward to install anything i needed:
sudo apt install pandoc
pip3 install sphinx
# to use the non default theme
pip3 install sphinx_rtd_theme

then it's just:
make html


> It'd be a big change, particularly if we consider we may need to
> convert previous releases of the docs as well as the current version.
> That said, if we were going to do this, the time could be now...
>

The intent is just to show where this could lead us. We need to ensure that
it will not affect the quality of our documentation, which is obviously one
of the project's gems!


>
> Cheers,
>
> Richard
>
>
>
>
>
>

--000000000000361b3305a3561805
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 15, 2020 at 12:19 PM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Since Robert was talking abou=
t future docs wide changes, I wanted to<br>
put an idea out there. Its something a few of us have talked a little<br>
about. At this point it is an idea, not a decision and something we&#39;re<=
br>
thinking we need to explore and evaluate.<br>
<br>
Basically, the thought is whether to move from docbook to sphinx.<br></bloc=
kquote><div><br></div><div>Good timing. I have been tossing around this ide=
a... As much as I love using and reading the YP docs/manual, I know that ma=
intaining and updating the documentation &#39;sources&#39; is rather diffic=
ult.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Other projects like the kernel have switched and it could assist some<br>
of our website/publishing challenges. It might also be easier for<br>
people to contribute to and there are wider and more modern tools<br>
supporting that format.<br></blockquote><div><br></div><div>Right, and they=
 claimed in <a href=3D"https://lwn.net/Articles/692704/" target=3D"_blank">=
https://lwn.net/Articles/692704/</a>:</div>&quot;if the documentation can b=
e written in plain text rather than DocBook XML, it&#39;s more likely to be=
 written in the first place.&quot;</div><div class=3D"gmail_quote"><div><br=
></div><div>I have spent no more than a couple of hours on it, trying to un=
derstand why the kernel moved and how Sphinx works. The outcome is really i=
nteresting...=C2=A0 =C2=A0</div><div><br></div><div><div>I use a conversion=
 tool for DocBook .xml to Sphinx/ReST file format (pandoc). Of course there=
 are conversion gothas.. but the documentation source code becomes much eas=
ier.=C2=A0</div><div><br></div><div>See:</div><div></div><div><a href=3D"ht=
tps://people.linaro.org/~nicolas.dechesne/yp-docs/_sources/ref-manual/ref-r=
elease-process.xml.rst.txt" target=3D"_blank">https://people.linaro.org/~ni=
colas.dechesne/yp-docs/_sources/ref-manual/ref-release-process.xml.rst.txt<=
/a></div><div>vs</div><div><a href=3D"http://git.yoctoproject.org/cgit/cgit=
.cgi/poky/tree/documentation/ref-manual/ref-release-process.xml" target=3D"=
_blank">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/documentation/r=
ef-manual/ref-release-process.xml</a></div><div><br></div><div>Or even for =
the variable glossary (sphinx has builtin support for that):</div><div><a h=
ref=3D"https://people.linaro.org/~nicolas.dechesne/yp-docs/_sources/ref-man=
ual/ref-variables.xml.rst" target=3D"_blank">https://people.linaro.org/~nic=
olas.dechesne/yp-docs/_sources/ref-manual/ref-variables.xml.rst</a>=C2=A0</=
div><div>vs</div><div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/=
poky/tree/documentation/ref-manual/ref-variables.xml" target=3D"_blank">htt=
p://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/documentation/ref-manual/r=
ef-variables.xml</a><br></div><div><br></div><div>I have picked the same th=
eme as the Linux kernel documentation, but of course, the theme is just HTM=
L and CSS, so it&#39;s entirely customizable.=C2=A0<br></div><div><br></div=
><div>For now, only 3 manuals were converted, the html output looks like th=
at:</div><div><a href=3D"https://people.linaro.org/~nicolas.dechesne/yp-doc=
s/" target=3D"_blank">https://people.linaro.org/~nicolas.dechesne/yp-docs/<=
/a><br></div><div><br></div><div>I have made a couple of patches to show ho=
w to get there:</div><div><a href=3D"https://git.linaro.org/people/nicolas.=
dechesne/poky.git/log/?h=3Dsphinx" target=3D"_blank">https://git.linaro.org=
/people/nicolas.dechesne/poky.git/log/?h=3Dsphinx</a>=C2=A0</div><div><br><=
/div><div>It was straightforward to install anything i needed:<br>sudo apt =
install pandoc<br>pip3 install sphinx<br># to use the non default theme<br>=
pip3 install sphinx_rtd_theme<br><br></div><div>then it&#39;s just:</div><d=
iv>make html</div><div><br></div></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
It&#39;d be a big change, particularly if we consider we may need to<br>
convert previous releases of the docs as well as the current version.<br>
That said, if we were going to do this, the time could be now...<br></block=
quote><div><br></div><div>The intent is just to show where this could lead =
us. We need to ensure that it will not affect the quality of our documentat=
ion, which is obviously one of the project&#39;s gems! <br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000361b3305a3561805--
