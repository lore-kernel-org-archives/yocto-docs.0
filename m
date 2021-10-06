Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5953AC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 14:49:05 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.13130.1633531743819237874
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 07:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xiRynxtA;
 spf=pass (domain: linaro.org, ip: 209.85.208.43,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f43.google.com with SMTP id v18so10854552edc.11
        for <docs@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 07:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/obDJDr7J2Tl9vHGdy3HU2klsE0xgIgWL/d62FFEobg=;
        b=xiRynxtAIqE51JBfe5i1fmX+PRYwO03zGgxhvjIbix0HP4uNC6dKPHr6ZnzVC/kFe7
         Cfje5OtXhD3QxXPKgD9/sGAyqw0YMujcnOSQcx8ZqjE3M/WcqEvG4Dy+KijTWz9T/xu8
         686WHf5fq1rXdTkGu2BG5RVHeGlWUDLkx/wAHvrx8oV/6pL8w0gezFFwZSZIPZ2sq1oV
         u6G+16kwffA5jTPIeq5ZqRoMsFL6GmDhkD7mL4JTvg/jLGXrD6X1o0OU1r1hwtNMkIY5
         CtMAw6BlgzNh8X/SA0FJvkECyjkAT5F5orkvwOhoSuNunAu00yGMmun9IvGbQ8j3jDuY
         B6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/obDJDr7J2Tl9vHGdy3HU2klsE0xgIgWL/d62FFEobg=;
        b=PPJPedOQ9X7MPkxVVYvU0DIZn50419n/pErUwnKDMNhZj1nmn19T5eGkpVAmYhy3rK
         db9OdyGJsnnkQ+OoiLMU/WR89YVY3g0tQSVFx2QiTlNNYDelY5kZe+/4Smx0U3vLgG7/
         SUeYLE+lwThUq8PSK3a/enhIK10USg/NcKI9n+1F/sxbteqbhNPZiuPBMy7LcRwkA7sj
         smgMNFmYUwp/ax7JV6HcqPHrGrCs1oijlj0LN0bD049zYgRiNUnsOVpSLLtKovbKrJX1
         ANr9wzvC84jTSTHQvQe4ItUBoNPYwxeA6u4r57UKhVGjeFh2A8UBvnN5KLYxN5JMD0Fd
         8WxA==
X-Gm-Message-State: AOAM532J1AAucyBwpKpJDD+5IEmvDNGDDR1p4J+2vGCC3ppMFP7adV7c
	9TJ0LCelFj8Aou6BV9QJPuio9BbrMhdcLwVPNTyMgg==
X-Google-Smtp-Source: 
 ABdhPJxcfy7eogbvPsyv00D0q7anOLJnTlTI4G+SZ2CbHteoswfjYCxo4ewVytrei4mNdRvdiLM/MM6MYVgjZA2EfPk=
X-Received: by 2002:a17:907:2bec:: with SMTP id
 gv44mr21900253ejc.523.1633531710566;
 Wed, 06 Oct 2021 07:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <16834414503E8A25.21857@lists.yoctoproject.org>
 <20211006122238.959343-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20211006122238.959343-1-michael.opdenacker@bootlin.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 6 Oct 2021 16:48:19 +0200
Message-ID: 
 <CAP71WjzQKKf2rOoxFKWqAKemgwO9JZLKykk+kYYQBoRSnsHOuQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/4] Makefile: allow epub and latexpdf outputs to
 use diagrams from SVG sources
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000568f8105cdb03d8a"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Oct 2021 14:49:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1931

--000000000000568f8105cdb03d8a
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 6, 2021 at 2:22 PM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> html output is great when directly using SVG
> epub output has to use exported PNG because of issues using SVG directly
> latexpdf output cannot use SVG, it needs exported PDF instead
>
> This adds rules to generate PNG and PDF formats from new SVG sources.
>
> Newly added diagrams have be stored in svg/ subdirectories
> so that PNG and PDF files generated from SVG can be "gitignored"
> without ignoring the original PNG diagrams that have no SVG source.
>
> Note: had to remove the dependency to "Makefile" in the final "catch-all"
> target,
> otherwise it was also catching the SVG to PNG and SVG to PDF targets.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>

For the entire series:
Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Thanks for turning the initial RFC into this series. We need to get back at
producing and releasing PDF files. It might be a bit too late for this
release.. perhaps not.. but definitely something to do for 3.5.

Quickly browsing through the PDF I can spot some graphics issues.. Would be
interesting to do an in-depth review of the PDF!


> ---
>  documentation/.gitignore |  2 ++
>  documentation/Makefile   | 29 ++++++++++++++++++++++++++---
>  documentation/README     |  2 ++
>  3 files changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/.gitignore b/documentation/.gitignore
> index c44580b088..35ead8af66 100644
> --- a/documentation/.gitignore
> +++ b/documentation/.gitignore
> @@ -1,3 +1,5 @@
>  _build/
>  Pipfile.lock
>  .vscode/
> +*/svg/*.png
> +*/svg/*.pdf
> diff --git a/documentation/Makefile b/documentation/Makefile
> index 996f01b7d5..f015026562 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -6,8 +6,11 @@
>  SPHINXOPTS    ?= -W --keep-going -j auto
>  SPHINXBUILD   ?= sphinx-build
>  SOURCEDIR     = .
> +IMAGEDIRS     = */svg
>  BUILDDIR      = _build
>  DESTDIR       = final
> +SVG2PNG       = inkscape
> +SVG2PDF       = inkscape
>
>  ifeq ($(shell if which $(SPHINXBUILD) >/dev/null 2>&1; then echo 1; else
> echo 0; fi),0)
>  $(error "The '$(SPHINXBUILD)' command was not found. Make sure you have
> Sphinx installed")
> @@ -17,7 +20,7 @@ endif
>  help:
>         @$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)
> $(O)
>
> -.PHONY: help Makefile clean publish
> +.PHONY: help Makefile clean publish epub latexpdf
>
>  publish: Makefile html singlehtml
>         rm -rf $(BUILDDIR)/$(DESTDIR)/
> @@ -26,10 +29,30 @@ publish: Makefile html singlehtml
>         cp $(BUILDDIR)/singlehtml/index.html
> $(BUILDDIR)/$(DESTDIR)/singleindex.html
>         sed -i -e 's@index.html#@singleindex.html#@g'
> $(BUILDDIR)/$(DESTDIR)/singleindex.html
>
> +# Build a list of SVG files to convert to PDFs
> +PDFs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.pdf,$(wildcard
> $(SOURCEDIR)/$(dir)/*.svg)))
> +
> +# Build a list of SVG files to convert to PNGs
> +PNGs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard
> $(SOURCEDIR)/$(dir)/*.svg)))
> +
> +# Pattern rule for converting SVG to PDF
> +%.pdf : %.svg
> +       $(SVG2PDF) --export-filename=$@ $<
> +
> +# Pattern rule for converting SVG to PNG
> +%.png : %.svg
> +       $(SVG2PNG) --export-filename=$@ $<
> +
>  clean:
> -       @rm -rf $(BUILDDIR)
> +       @rm -rf $(BUILDDIR) $(PNGs) $(PDFs)
> +
> +epub: $(PNGs)
> +       @$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)
> $(O)
> +
> +latexpdf: $(PDFs)
> +       @$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)
> $(O)
>
>  # Catch-all target: route all unknown targets to Sphinx using the new
>  # "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
> -%: Makefile
> +%:
>         @$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)
> $(O)
> diff --git a/documentation/README b/documentation/README
> index 1e7b4f0e65..6b72f82441 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -113,6 +113,8 @@ To install all required packages run:
>
>   $ pip3 install sphinx sphinx_rtd_theme pyyaml
>
> +Also install the "inkscape" package from your distribution.
> +
>  To build the documentation locally, run:
>
>   $ cd documentation
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1926):
> https://lists.yoctoproject.org/g/docs/message/1926
> Mute This Topic: https://lists.yoctoproject.org/mt/86117757/1279857
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> nicolas.dechesne@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000568f8105cdb03d8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 6, 2021 at 2:22 PM Michae=
l Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael.=
opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">html output is great when directly using SVG<br>
epub output has to use exported PNG because of issues using SVG directly<br=
>
latexpdf output cannot use SVG, it needs exported PDF instead<br>
<br>
This adds rules to generate PNG and PDF formats from new SVG sources.<br>
<br>
Newly added diagrams have be stored in svg/ subdirectories<br>
so that PNG and PDF files generated from SVG can be &quot;gitignored&quot;<=
br>
without ignoring the original PNG diagrams that have no SVG source.<br>
<br>
Note: had to remove the dependency to &quot;Makefile&quot; in the final &qu=
ot;catch-all&quot; target,<br>
otherwise it was also catching the SVG to PNG and SVG to PDF targets.<br>
<br>
Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@=
bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br></=
blockquote><div><br></div><div>For the entire series:</div><div>Reviewed-by=
: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicol=
as.dechesne@linaro.org</a>&gt;</div><div><br></div><div>Thanks for turning =
the initial RFC into this series. We need to get back at producing and rele=
asing PDF files. It might be a bit too late for this release.. perhaps not.=
. but definitely something to do for 3.5.=C2=A0</div><div><br></div><div>Qu=
ickly browsing through the PDF I can spot some graphics issues.. Would be i=
nteresting to do an in-depth review of the PDF!</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0documentation/.gitignore |=C2=A0 2 ++<br>
=C2=A0documentation/Makefile=C2=A0 =C2=A0| 29 ++++++++++++++++++++++++++---=
<br>
=C2=A0documentation/README=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A03 files changed, 30 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/documentation/.gitignore b/documentation/.gitignore<br>
index c44580b088..35ead8af66 100644<br>
--- a/documentation/.gitignore<br>
+++ b/documentation/.gitignore<br>
@@ -1,3 +1,5 @@<br>
=C2=A0_build/<br>
=C2=A0Pipfile.lock<br>
=C2=A0.vscode/<br>
+*/svg/*.png<br>
+*/svg/*.pdf<br>
diff --git a/documentation/Makefile b/documentation/Makefile<br>
index 996f01b7d5..f015026562 100644<br>
--- a/documentation/Makefile<br>
+++ b/documentation/Makefile<br>
@@ -6,8 +6,11 @@<br>
=C2=A0SPHINXOPTS=C2=A0 =C2=A0 ?=3D -W --keep-going -j auto<br>
=C2=A0SPHINXBUILD=C2=A0 =C2=A0?=3D sphinx-build<br>
=C2=A0SOURCEDIR=C2=A0 =C2=A0 =C2=A0=3D .<br>
+IMAGEDIRS=C2=A0 =C2=A0 =C2=A0=3D */svg<br>
=C2=A0BUILDDIR=C2=A0 =C2=A0 =C2=A0 =3D _build<br>
=C2=A0DESTDIR=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D final<br>
+SVG2PNG=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D inkscape<br>
+SVG2PDF=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D inkscape<br>
<br>
=C2=A0ifeq ($(shell if which $(SPHINXBUILD) &gt;/dev/null 2&gt;&amp;1; then=
 echo 1; else echo 0; fi),0)<br>
=C2=A0$(error &quot;The &#39;$(SPHINXBUILD)&#39; command was not found. Mak=
e sure you have Sphinx installed&quot;)<br>
@@ -17,7 +20,7 @@ endif<br>
=C2=A0help:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @$(SPHINXBUILD) -M help &quot;$(SOURCEDIR)&quot=
; &quot;$(BUILDDIR)&quot; $(SPHINXOPTS) $(O)<br>
<br>
-.PHONY: help Makefile clean publish<br>
+.PHONY: help Makefile clean publish epub latexpdf<br>
<br>
=C2=A0publish: Makefile html singlehtml<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf $(BUILDDIR)/$(DESTDIR)/<br>
@@ -26,10 +29,30 @@ publish: Makefile html singlehtml<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $(BUILDDIR)/singlehtml/index.html $(BUILDDIR=
)/$(DESTDIR)/singleindex.html<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s@index.html#@singleindex.html#@=
g&#39; $(BUILDDIR)/$(DESTDIR)/singleindex.html<br>
<br>
+# Build a list of SVG files to convert to PDFs<br>
+PDFs :=3D $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.pdf,$(wildcard $=
(SOURCEDIR)/$(dir)/*.svg)))<br>
+<br>
+# Build a list of SVG files to convert to PNGs<br>
+PNGs :=3D $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard $=
(SOURCEDIR)/$(dir)/*.svg)))<br>
+<br>
+# Pattern rule for converting SVG to PDF<br>
+%.pdf : %.svg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(SVG2PDF) --export-filename=3D$@ $&lt;<br>
+<br>
+# Pattern rule for converting SVG to PNG<br>
+%.png : %.svg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(SVG2PNG) --export-filename=3D$@ $&lt;<br>
+<br>
=C2=A0clean:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@rm -rf $(BUILDDIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@rm -rf $(BUILDDIR) $(PNGs) $(PDFs)<br>
+<br>
+epub: $(PNGs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@$(SPHINXBUILD) -M $@ &quot;$(SOURCEDIR)&quot; =
&quot;$(BUILDDIR)&quot; $(SPHINXOPTS) $(O)<br>
+<br>
+latexpdf: $(PDFs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@$(SPHINXBUILD) -M $@ &quot;$(SOURCEDIR)&quot; =
&quot;$(BUILDDIR)&quot; $(SPHINXOPTS) $(O)<br>
<br>
=C2=A0# Catch-all target: route all unknown targets to Sphinx using the new=
<br>
=C2=A0# &quot;make mode&quot; option.=C2=A0 $(O) is meant as a shortcut for=
 $(SPHINXOPTS).<br>
-%: Makefile<br>
+%:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @$(SPHINXBUILD) -M $@ &quot;$(SOURCEDIR)&quot; =
&quot;$(BUILDDIR)&quot; $(SPHINXOPTS) $(O)<br>
diff --git a/documentation/README b/documentation/README<br>
index 1e7b4f0e65..6b72f82441 100644<br>
--- a/documentation/README<br>
+++ b/documentation/README<br>
@@ -113,6 +113,8 @@ To install all required packages run:<br>
<br>
=C2=A0 $ pip3 install sphinx sphinx_rtd_theme pyyaml<br>
<br>
+Also install the &quot;inkscape&quot; package from your distribution.<br>
+<br>
=C2=A0To build the documentation locally, run:<br>
<br>
=C2=A0 $ cd documentation<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#1926): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/1926" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/1926</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/86117757/1279=
857" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/86117757/1279857</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicol=
as.dechesne@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000568f8105cdb03d8a--

