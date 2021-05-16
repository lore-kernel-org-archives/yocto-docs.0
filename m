Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.11250.1621203189408208747
 for <docs@lists.yoctoproject.org>;
 Sun, 16 May 2021 15:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uXGA+bbf;
 spf=pass (domain: linaro.org, ip: 209.85.218.49, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f49.google.com with SMTP id u21so6266113ejo.13
        for <docs@lists.yoctoproject.org>; Sun, 16 May 2021 15:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H6OxXT8o5KJbZUqgrmWLFUww43HN3epDkNuTDLdh07M=;
        b=uXGA+bbfztawiIltA1J1q0etvpMplqqrWiP9GKL3MB7h5rwEIxIkwwR18O0zGwWmrv
         yKxNQcnDdpD5jtlzIEL5bo0xyfjATVKxdptHU/SLW8Pr1EpDXesu82LxnEIx37LnYt/M
         3JGdX8B0qBLnSbjEMiOs/AYh8GLPDLrSMt80vgySqUzUuZV+Vd3f0ECw/fGjwsRrBl/a
         LxIK3hxWWJ8+nV61ZsasLjmkxlq0Fu07GWTMabiPy4wFrKawetFU9Sjih8tXHEn9TIaj
         5FPNQlgMztB7Bz4YQDuFMuyTM8Ksvi/m6ujVdLnaf1m6OUrzgdgQa5ySYpyjehZwWUHa
         307A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H6OxXT8o5KJbZUqgrmWLFUww43HN3epDkNuTDLdh07M=;
        b=RyIaqt05brg4xwDuzQeeJW17xahNbFyEgGbUhxwPrlY5HUjvjEhde0B5d3YRtc0tpx
         Noic7nDP4iNPiSSQdhmJK5cg/D6RaO437PoKtA3lmiKZtPwijUQctUbkbWMYi4x/M3ZQ
         feRXHZrhEUKpOoRQ1VFXdfeuQMG8Yyrh3dTrN79gqmU0JEKLBylIDqJvYPcmY21zt0Q6
         voW6s8g3iP8AiRoUjaQPxS/QfNxM8aVgQQWPD3IGVcURE+k/g8HQXeCt51a8ftP9DTO/
         RJyu1XNPBP6bKHQ8VGD1HBmOjtCb719BhgEN/BFP4p6yDdN+guhTmODkVSe1lyMAwXp0
         guyw==
X-Gm-Message-State: AOAM533sQfyBIEZOUaCFenj5GviHeQW1a5NINkUrVBcsU21bzWnm/Hnq
	M7+6+qG6uXoscuiw5FA5Z490+RrZ1jEAuH3iTBmOJ0jRtT4=
X-Google-Smtp-Source: ABdhPJwJsczcm10DfxuQ1xb7EGW0tV3pyo3QxaJUaGTRxCiForbcREi4AUN6Jai4bM7zElv8YFifUSuS6ee7u9zA8p0=
X-Received: by 2002:a17:906:c0c6:: with SMTP id bn6mr57308523ejb.436.1621203187851;
 Sun, 16 May 2021 15:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210515071219.307241-1-michael.opdenacker@bootlin.com> <20210515071219.307241-2-michael.opdenacker@bootlin.com>
In-Reply-To: <20210515071219.307241-2-michael.opdenacker@bootlin.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 17 May 2021 00:12:57 +0200
Message-ID: <CAP71Wjy+5HU9ZHWfiWKNu8wArLP8x4FMFmQURvrqubHZsr1JCQ@mail.gmail.com>
Subject: Re: [docs] [RFC 1/3] Makefile: allow epub and latexpdf outputs to use diagrams from SVG sources
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000001ef40905c279c8fa"

--0000000000001ef40905c279c8fa
Content-Type: text/plain; charset="UTF-8"

On Sat, May 15, 2021 at 9:12 AM Michael Opdenacker <
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
> otherwise it was also catching my SVG to PNG and SVG to PDF targets.
> Any suggest to avoid having to do this?
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/.gitignore |  2 ++
>  documentation/Makefile   | 29 ++++++++++++++++++++++++++---
>  2 files changed, 28 insertions(+), 3 deletions(-)
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
> index d40f390e2b..acb09726cd 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -6,8 +6,11 @@
>  SPHINXOPTS    ?= -j auto
>  SPHINXBUILD   ?= sphinx-build
>  SOURCEDIR     = .
> +IMAGEDIRS     = */svg
>  BUILDDIR      = _build
>  DESTDIR       = final
> +SVG2PNG       = inkscape
> +SVG2PDF       = inkscape
>

It is a new host dependency, we need to update the README and have a
meaningful error message.


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
> --
> 2.25.1
>
>
> 
>
>

--0000000000001ef40905c279c8fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 15, 2021 at 9:12 AM Micha=
el Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael=
.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">html output is great when directly using SVG<br>
epub output has to use exported PNG because of issues using SVG directly<b=
r>
latexpdf output cannot use SVG, it needs exported PDF instead<br>
<br>
This adds rules to generate PNG and PDF formats from new SVG sources.<br>
<br>
Newly added diagrams have be stored in svg/ subdirectories<br>
so that PNG and PDF files generated from SVG can be &quot;gitignored&quot;=
<br>
without ignoring the original PNG diagrams that have no SVG source.<br>
<br>
Note: had to remove the dependency to &quot;Makefile&quot; in the final &q=
uot;catch-all&quot; target,<br>
otherwise it was also catching my SVG to PNG and SVG to PDF targets.<br>
Any suggest to avoid having to do this?<br>
<br>
Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker=
@bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
---<br>
=C2=A0documentation/.gitignore |=C2=A0 2 ++<br>
=C2=A0documentation/Makefile=C2=A0 =C2=A0| 29 ++++++++++++++++++++++++++--=
-<br>
=C2=A02 files changed, 28 insertions(+), 3 deletions(-)<br>
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
index d40f390e2b..acb09726cd 100644<br>
--- a/documentation/Makefile<br>
+++ b/documentation/Makefile<br>
@@ -6,8 +6,11 @@<br>
=C2=A0SPHINXOPTS=C2=A0 =C2=A0 ?=3D -j auto<br>
=C2=A0SPHINXBUILD=C2=A0 =C2=A0?=3D sphinx-build<br>
=C2=A0SOURCEDIR=C2=A0 =C2=A0 =C2=A0=3D .<br>
+IMAGEDIRS=C2=A0 =C2=A0 =C2=A0=3D */svg<br>
=C2=A0BUILDDIR=C2=A0 =C2=A0 =C2=A0 =3D _build<br>
=C2=A0DESTDIR=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D final<br>
+SVG2PNG=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D inkscape<br>
+SVG2PDF=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D inkscape<br></blockquote><div><br><=
/div><div>It is a new host dependency, we need to update the README and hav=
e a meaningful error message.=C2=A0</div><div>=C2=A0<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0ifeq ($(shell if which $(SPHINXBUILD) &gt;/dev/null 2&gt;&amp;1; the=
n echo 1; else echo 0; fi),0)<br>
=C2=A0$(error &quot;The &#39;$(SPHINXBUILD)&#39; command was not found. Ma=
ke sure you have Sphinx installed&quot;)<br>
@@ -17,7 +20,7 @@ endif<br>
=C2=A0help:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @$(SPHINXBUILD) -M help &quot;$(SOURCEDIR)&quo=
t; &quot;$(BUILDDIR)&quot; $(SPHINXOPTS) $(O)<br>
<br>
-.PHONY: help Makefile clean publish<br>
+.PHONY: help Makefile clean publish epub latexpdf<br>
<br>
=C2=A0publish: Makefile html singlehtml<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf $(BUILDDIR)/$(DESTDIR)/<br>
@@ -26,10 +29,30 @@ publish: Makefile html singlehtml<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $(BUILDDIR)/singlehtml/index.html $(BUILDDI=
R)/$(DESTDIR)/singleindex.html<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s@index.html#@singleindex.html#=
@g&#39; $(BUILDDIR)/$(DESTDIR)/singleindex.html<br>
<br>
+# Build a list of SVG files to convert to PDFs<br>
+PDFs :=3D $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.pdf,$(wildcard =
$(SOURCEDIR)/$(dir)/*.svg)))<br>
+<br>
+# Build a list of SVG files to convert to PNGs<br>
+PNGs :=3D $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard =
$(SOURCEDIR)/$(dir)/*.svg)))<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@$(SPHINXBUILD) -M $@ &quot;$(SOURCEDIR)&quot;=
 &quot;$(BUILDDIR)&quot; $(SPHINXOPTS) $(O)<br>
+<br>
+latexpdf: $(PDFs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@$(SPHINXBUILD) -M $@ &quot;$(SOURCEDIR)&quot;=
 &quot;$(BUILDDIR)&quot; $(SPHINXOPTS) $(O)<br>
<br>
=C2=A0# Catch-all target: route all unknown targets to Sphinx using the ne=
w<br>
=C2=A0# &quot;make mode&quot; option.=C2=A0 $(O) is meant as a shortcut fo=
r $(SPHINXOPTS).<br>
-%: Makefile<br>
+%:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @$(SPHINXBUILD) -M $@ &quot;$(SOURCEDIR)&quot;=
 &quot;$(BUILDDIR)&quot; $(SPHINXOPTS) $(O)<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000001ef40905c279c8fa--
