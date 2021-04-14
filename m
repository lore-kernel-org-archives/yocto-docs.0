Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.8928.1618378433492006094
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 22:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nDd3hjHE;
 spf=pass (domain: linaro.org, ip: 209.85.208.52, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f52.google.com with SMTP id h10so22096790edt.13
        for <docs@lists.yoctoproject.org>; Tue, 13 Apr 2021 22:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bo/qkg10kFGnv1I6yhgOXN+3RzQRgyjNM8IHW2URiWw=;
        b=nDd3hjHEYJFHX/E9Xy3lIvNO8AF15KJjSLcL0kTCqms/4YSVr4NFRVhbJE4sadeBTY
         3UxcyMFnxmCxRz6c8phs7gWZYbOtUvWQjeE2/5Dm1WXIpYdKilzRQj2cAHQC4kQRq+bu
         Uio7DS7l/epNTpLxWVTut2oMOfyWTLCYdQtb5Ispw3E1EDxD3hC9MBkeTPATL8MNn25G
         WF+X8h9MRgRkbTipnSTOOrASfjddP6opaqk3NM+0Qj1bnZLVGDeNxLCo402gHr8+SXpQ
         u0o5GwfjPGLgpmyalpnK8+mdA0fAAKNj64ncU3TDCOA/du9HmEEm6x3PyAqS8/Em0zGT
         ltAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bo/qkg10kFGnv1I6yhgOXN+3RzQRgyjNM8IHW2URiWw=;
        b=CZ3tSqyBsjH5HoDCIrnujerF2lhubdFyWAS5f6BopazqycFN+O63hcVEsUGG+OaVWB
         gugyQ8Za1B2w4Z2/RdRwbj1XBBjANwItApDoDuafxrkQtCuLSqe+zG8wBwXG1TjQaHFo
         AFBZtRbX78jCMjp9eYq4wFLFfS12IOjLrS0SDD3XWRZX6uclVVQdODBfKqpWFBBn8IgO
         259AiiSJlAp/BYic2JI3GpHRJWy61srBTlCoijRQpTaDsE0dcgF8iJi7PoM1jCMkENDi
         Q6EFM7HB4wWwe7MLQepOoQ03KSHbygxpAYeXXW95yllPrOsAIiNob1PxVFnP+afnOtqr
         KtOA==
X-Gm-Message-State: AOAM533iGOM5DXWP4c58xfuIsRj/7FrJy27eSnPiD7jIAQD4a7jaIzU1
	O0MPOpSKyvAWKWm4i8UEyzzTrQC84UvcHtYiWVs51A==
X-Google-Smtp-Source: ABdhPJwmiOeZKnxnbFwmSz3b5ogFMIe61YkDgNEQ8sIUGeSG3JZOSvyvuMn+/zHnojPLHGbuRMjMZYarGPBGAdu9d+U=
X-Received: by 2002:a05:6402:5203:: with SMTP id s3mr39527723edd.79.1618378431759;
 Tue, 13 Apr 2021 22:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <7ff7831f-4539-8e5c-cfc6-d081651374f2@bootlin.com> <4706379.0VBMTVartN@linc>
In-Reply-To: <4706379.0VBMTVartN@linc>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 14 Apr 2021 07:33:41 +0200
Message-ID: <CAP71WjzS-a9MNtyDeOwDV6oqhp8mNpNWmnoeuUyf2w_Qu+t2gg@mail.gmail.com>
Subject: Re: [docs] ref-manual: reverse the order of migration guides?
To: Paul Eggleton <bluelightning@bluelightning.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>, 
	"Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000008996a505bfe81766"

--0000000000008996a505bfe81766
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 14, 2021 at 2:15 AM Paul Eggleton <
bluelightning@bluelightning.org> wrote:

> Hi Michael
>
> On Wednesday, 14 April 2021 06:03:26 NZST Michael Opdenacker wrote:
> > Wouldn't it make sense to reverse the order of migration guides in the
> > reference manual
> > (
> https://www.yoctoproject.org/docs/3.0/ref-manual/ref-manual.html#migration
> )
> > ?
> >
> > I guess it would be easier to start mentioning the migration path from
> > the most recent release, as version 1.3 looks ancient.
> >
> > Would it make sense? If so, it's easy to propose a patch...
>
> I guess the thinking was that you would start at the point in the
> documentation where you are currently at and then follow it downwards to
> the
> current version. Whether that's the most logical I'm not sure, but if
> we're
> changing it we should give some thought to how it will be used. People do
> often go a while between upgrades, but I'll definitely agree 1.3 is much
> further back than most people would need.
>
> Robert suggests moving it out, I'm wondering if it's worth considering
> going a
> step further and turning our release notes into a proper document, to
> which
> this content would be added - I've often felt that the current text-only
> format is a bit restrictive. That would mean there would be a separate
> document per release, which is how many other software packages do it
> (e.g.
> Django). However, I'm not sure if that would cause us too much overhead or
> hassle with the other places where we currently post the release notes
> e.g.
> announcements on the mailing list - thoughts? (For clarity I wouldn't
> propose
> changing this until the next release.)
>

I have had this thought already, and like it! Especially now that we have a
'unified' doc website, having a 'release notes' manual/section in the left
side navigation bar would be good. Here is an example I have seen with
another project:
https://projectacrn.github.io/latest/release_notes/index.html


>
> Cheers
> Paul
>
>
>
> 
>
>

--0000000000008996a505bfe81766
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 14, 2021 at 2:15 AM Paul =
Eggleton &lt;<a href=3D"mailto:bluelightning@bluelightning.org">bluelightni=
ng@bluelightning.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi Michael<br>
<br>
On Wednesday, 14 April 2021 06:03:26 NZST Michael Opdenacker wrote:<br>
&gt; Wouldn&#39;t it make sense to reverse the order of migration guides i=
n the<br>
&gt; reference manual<br>
&gt; (<a href=3D"https://www.yoctoproject.org/docs/3.0/ref-manual/ref-manu=
al.html#migration" rel=3D"noreferrer" target=3D"_blank">https://www.yoctopr=
oject.org/docs/3.0/ref-manual/ref-manual.html#migration</a>)<br>
&gt; ?<br>
&gt; <br>
&gt; I guess it would be easier to start mentioning the migration path fro=
m<br>
&gt; the most recent release, as version 1.3 looks ancient.<br>
&gt; <br>
&gt; Would it make sense? If so, it&#39;s easy to propose a patch...<br>
<br>
I guess the thinking was that you would start at the point in the <br>
documentation where you are currently at and then follow it downwards to t=
he <br>
current version. Whether that&#39;s the most logical I&#39;m not sure, but=
 if we&#39;re <br>
changing it we should give some thought to how it will be used. People do =
<br>
often go a while between upgrades, but I&#39;ll definitely agree 1.3 is mu=
ch <br>
further back than most people would need.<br>
<br>
Robert suggests moving it out, I&#39;m wondering if it&#39;s worth conside=
ring going a <br>
step further and turning our release notes into a proper document, to whic=
h <br>
this content would be added - I&#39;ve often felt that the current text-on=
ly <br>
format is a bit restrictive. That would mean there would be a separate <br=
>
document per release, which is how many other software packages do it (e.g=
. <br>
Django). However, I&#39;m not sure if that would cause us too much overhea=
d or <br>
hassle with the other places where we currently post the release notes e.g=
. <br>
announcements on the mailing list - thoughts? (For clarity I wouldn&#39;t =
propose <br>
changing this until the next release.)<br></blockquote><div><br></div><div=
>I have had this thought already, and like it! Especially now that we have =
a &#39;unified&#39; doc website, having a &#39;release notes&#39; manual/se=
ction in the left side navigation bar would be good. Here is an example I h=
ave seen with another project:</div><div><a href=3D"https://projectacrn.git=
hub.io/latest/release_notes/index.html">https://projectacrn.github.io/lates=
t/release_notes/index.html</a></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Cheers<br>
Paul<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000008996a505bfe81766--
