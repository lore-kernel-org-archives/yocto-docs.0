Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.5679.1622191218492278418
 for <docs@lists.yoctoproject.org>;
 Fri, 28 May 2021 01:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=b2tN25a+;
 spf=pass (domain: linaro.org, ip: 209.85.218.44, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f44.google.com with SMTP id ss26so4182243ejb.5
        for <docs@lists.yoctoproject.org>; Fri, 28 May 2021 01:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CGHQaog13ruhWMIAL0WfLqdx3JZxyU+bQAxyegzfwek=;
        b=b2tN25a+JvuVMN5L2G9oVGa15zK5Lply7KDiR185bPl6f0on5cdZMyTeB+VuC+ArI4
         WtfRkQpH01T6Ef9fcr8VvIskIzrHjZAw+TnD9VH1d2js50wKqa4rY9dJ4y9t3yUHxFEd
         VoqdbGz5IkcLvp921+qD9Qb54g4CWWumOZ5jNy1iQiruTUYVBklqzjPfa7JUHgHCyLnY
         C1bUEYheEG9HLno07lENDFAvVtQu7FVcpxEQEx2MP3tLLl73efMeFhVILy5KeXrlWfjZ
         QL5ehMC9QeJucCpkD1r6MKWqatKbVx/hiltcYrkAmOTjJU98II3A09ZTmW0j9KVnQDD1
         LsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CGHQaog13ruhWMIAL0WfLqdx3JZxyU+bQAxyegzfwek=;
        b=SOLVvySPyizQezHGtVOIj+ErOKg0bnCiYV4lnQyM1Fu1FqZBneJiR28uGe5woB3J9S
         C8YyB3n9G0i2U70WTFSx4IvJcVE6Nx5hEwdYexA11yEwC1hmoMOWDN40q8O8YTkFM4Kp
         PdspGtc6MqN2cG1xrYDYjfZxYov7aWicW7GN0ETUmvKu0K/R44blr2vuuFn3PHxLBUBi
         zIFAipHuV8u76SseOhqUZ9NPjBOFIv4Tez3zwgbZjBINhrMJZ9asFgiad/GyZfwpdtnp
         BWwreNVcvGG94vz4phaHvmIAJxxgM2cxkk9GOKyPZHptalfnmfZ3cGRZIEWwOP9WWHL2
         QJFQ==
X-Gm-Message-State: AOAM533lhv8aIPvuH+CUnMD5+SZsvE+L15RyHwGnAtvgITvIE+Gho1mB
	Y+FiWU9a6Y/wlntkYWcYxl/VT94qIudoAqgi+bxmUg==
X-Google-Smtp-Source: ABdhPJzYponP9bz2QwUe/rSLagjddfZ+em/W5HTbN10dnMvWzbRseQAMPLcKSVv7AhbI7cY41CEI+hWm5qNjzdpwG4M=
X-Received: by 2002:a17:906:b14f:: with SMTP id bt15mr8344495ejb.126.1622191216666;
 Fri, 28 May 2021 01:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210527183150.79497-1-foss@0leil.net> <08b82e87-ec3f-e713-8e0e-cf739b75efdd@bootlin.com>
In-Reply-To: <08b82e87-ec3f-e713-8e0e-cf739b75efdd@bootlin.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 28 May 2021 10:40:06 +0200
Message-ID: <CAP71Wjw6VH_wrEC+b3ps8CBPhQM=TDRiPtYS3=XyP4Rq1j57uA@mail.gmail.com>
Subject: Re: [docs] [PATCH] documentation: Makefile: turn warnings into errors by default
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Quentin Schulz <foss@0leil.net>, YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000003a3c4405c35fd3fa"

--0000000000003a3c4405c35fd3fa
Content-Type: text/plain; charset="UTF-8"

On Fri, May 28, 2021 at 10:35 AM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Quentin,
>
> On 5/27/21 8:31 PM, Quentin Schulz wrote:
> > -W is for turning warnings into errors, --keep-going to make sure the
> > whole documentation is built and all warnings will be printed before
> > failing.
> >
> > Since there's currently no warning, it's time to introduce it!
> >
> > Signed-off-by: Quentin Schulz <foss@0leil.net>
> > ---
> >  documentation/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/documentation/Makefile b/documentation/Makefile
> > index d40f390e2..996f01b7d 100644
> > --- a/documentation/Makefile
> > +++ b/documentation/Makefile
> > @@ -3,7 +3,7 @@
> >
> >  # You can set these variables from the command line, and also
> >  # from the environment for the first two.
> > -SPHINXOPTS    ?= -j auto
> > +SPHINXOPTS    ?= -W --keep-going -j auto
> >  SPHINXBUILD   ?= sphinx-build
> >  SOURCEDIR     = .
> >  BUILDDIR      = _build
>
>
> Thanks for the nice improvement. I tested that it builds the "html" and
> "latexpdf" targets just fine, but it aborts with "epub" as follows:
>
> writing mimetype file...
> writing META-INF/container.xml file...
> writing content.opf file...
> WARNING: unknown mimetype for .poky.yaml.cache, ignoring
> writing nav.xhtml file...
> writing toc.ncx file...
> writing TheYoctoProject.epub file...
> build finished with problems, 1 warning.
> make: *** [Makefile:35: epub] Error 1
>
> If I understood correctly, this happens because the .yaml file is not
> understood by Sphinx, as explained on
> https://github.com/sphinx-doc/sphinx/issues/3214. However, I don't
> understand why this only happens with "epub" output.
>

interesting.. I tested it yesterday, and it worked for me... So I tried
again today, and realized i was using Sphinx 3.3.1, I updated to 4.0.2 and
now it fails too..


>
> A workaround is to disable warnings for unknown project files:
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 5a2e25f7b2..6c6458fed7 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -92,6 +92,9 @@ intersphinx_mapping = {
>      'bitbake': ('https://docs.yoctoproject.org/bitbake/', None)
>  }
>
> +# Suppress "WARNING: unknown mimetype for ..."
> +suppress_warnings = ['epub.unknown_project_files']
> +
>  # -- Options for HTML output
> -------------------------------------------------
>
>  # The theme to use for HTML and HTML Help pages.  See the documentation
> for
>
>
> Would this be acceptable? I hope so, because I believe having your
> changes would be useful.
>
> Cheers,
>
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> 
>
>

--0000000000003a3c4405c35fd3fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 28, 2021 at 10:35 AM Mich=
ael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michae=
l.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi Quentin,<br>
<br>
On 5/27/21 8:31 PM, Quentin Schulz wrote:<br>
&gt; -W is for turning warnings into errors, --keep-going to make sure the=
<br>
&gt; whole documentation is built and all warnings will be printed before<=
br>
&gt; failing.<br>
&gt;<br>
&gt; Since there&#39;s currently no warning, it&#39;s time to introduce it=
!<br>
&gt;<br>
&gt; Signed-off-by: Quentin Schulz &lt;<a href=3D"mailto:foss@0leil.net" t=
arget=3D"_blank">foss@0leil.net</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/Makefile | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/documentation/Makefile b/documentation/Makefile<br>
&gt; index d40f390e2..996f01b7d 100644<br>
&gt; --- a/documentation/Makefile<br>
&gt; +++ b/documentation/Makefile<br>
&gt; @@ -3,7 +3,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # You can set these variables from the command line, and also<b=
r>
&gt;=C2=A0 # from the environment for the first two.<br>
&gt; -SPHINXOPTS=C2=A0 =C2=A0 ?=3D -j auto<br>
&gt; +SPHINXOPTS=C2=A0 =C2=A0 ?=3D -W --keep-going -j auto<br>
&gt;=C2=A0 SPHINXBUILD=C2=A0 =C2=A0?=3D sphinx-build<br>
&gt;=C2=A0 SOURCEDIR=C2=A0 =C2=A0 =C2=A0=3D .<br>
&gt;=C2=A0 BUILDDIR=C2=A0 =C2=A0 =C2=A0 =3D _build<br>
<br>
<br>
Thanks for the nice improvement. I tested that it builds the &quot;html&qu=
ot; and<br>
&quot;latexpdf&quot; targets just fine, but it aborts with &quot;epub&quot=
; as follows:<br>
<br>
writing mimetype file...<br>
writing META-INF/container.xml file...<br>
writing content.opf file...<br>
WARNING: unknown mimetype for .poky.yaml.cache, ignoring<br>
writing nav.xhtml file...<br>
writing toc.ncx file...<br>
writing TheYoctoProject.epub file...<br>
build finished with problems, 1 warning.<br>
make: *** [Makefile:35: epub] Error 1<br>
<br>
If I understood correctly, this happens because the .yaml file is not<br>
understood by Sphinx, as explained on<br>
<a href=3D"https://github.com/sphinx-doc/sphinx/issues/3214" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/sphinx-doc/sphinx/issues/3214</a=
>. However, I don&#39;t<br>
understand why this only happens with &quot;epub&quot; output.<br></blockq=
uote><div><br></div><div>interesting.. I tested it yesterday, and it worked=
 for me... So I tried again today, and realized i was using Sphinx 3.3.1, I=
 updated to 4.0.2 and now it fails too..=C2=A0</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
A workaround is to disable warnings for unknown project files:<br>
<br>
diff --git a/documentation/conf.py b/documentation/conf.py<br>
index 5a2e25f7b2..6c6458fed7 100644<br>
--- a/documentation/conf.py<br>
+++ b/documentation/conf.py<br>
@@ -92,6 +92,9 @@ intersphinx_mapping =3D {<br>
=C2=A0 =C2=A0 =C2=A0&#39;bitbake&#39;: (&#39;<a href=3D"https://docs.yocto=
project.org/bitbake/" rel=3D"noreferrer" target=3D"_blank">https://docs.yoc=
toproject.org/bitbake/</a>&#39;, None)<br>
=C2=A0}<br>
<br>
+# Suppress &quot;WARNING: unknown mimetype for ...&quot;<br>
+suppress_warnings =3D [&#39;epub.unknown_project_files&#39;]<br>
+<br>
=C2=A0# -- Options for HTML output ---------------------------------------=
----------<br>
<br>
=C2=A0# The theme to use for HTML and HTML Help pages.=C2=A0 See the docum=
entation for<br>
<br>
<br>
Would this be acceptable? I hope so, because I believe having your<br>
changes would be useful.<br>
<br>
Cheers,<br>
<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https=
://bootlin.com</a><br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000003a3c4405c35fd3fa--
