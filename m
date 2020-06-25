Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.2569.1593053274860499867
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 19:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ogOAevvH;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: twoerner@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id w16so4437822ejj.5
        for <docs@lists.yoctoproject.org>; Wed, 24 Jun 2020 19:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nDzykqHsQNI8Rh8rQay5R1lJpPOvgMGnJB90mYoPVfc=;
        b=ogOAevvHFYwS7DUjoHP033NqZxH030K0mmUZQSSp4dosldV8zW2GcdRpB1bKM8rWJb
         GeLnmNaSmdiAGQefajseri0YqINYc52ivsHGNNxV/OpnqYCBDV6AB8B6VNJP+QC3aTXC
         nCsO4k4AQFewzkwT9+5S0k8mQFY3pkIJCEE4zvap1Vh1EiNDrEE/i0ANBOJPd94g/6Ow
         sF5iKIjYCGgYjQcUXFonfLnGjI1t+Cg4V4zjiNq4LYPVOTnV2ZhxeTozA5SzcviYYmiB
         AO2qZxfKo0CEsv0OIzcQW4/T3zDnUjhs6XjPUK8kUFEV/X/fed5OKwlmt1260laXLlx/
         VX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nDzykqHsQNI8Rh8rQay5R1lJpPOvgMGnJB90mYoPVfc=;
        b=DpmD/R1hBMD7oVsOPeLl/uNGrg3aFDe9zR1DgwjTMw8u6evNxM55Q8SJWDLqOiWX5B
         sXiwnmhFsLwWTnRXaR7dng+eCZMfzvViYAWO3ZyorHwXw3P6S9Co54g/iu0kI9v21Qte
         URBBhQnIBSENR5SrUIbue+G1t+okPY+RWg0mJk7aLMpISszloa+lRAEg/yuEpLTkbV8Y
         XBch+PlRMcwB6Ms9ffkp/tBXKnrwSu4km8BdcU8mu9s36UnfcvaPbN9OrWYkaK0jOrnJ
         gtgmgX+t5F/xeZoIXUEccOmkYzDgu6NIEt4FOLNoCO53ryDUSwpsxW+lgATXBypvIlTC
         Kfyg==
X-Gm-Message-State: AOAM531gOQOPipqJxY/LerVoyusOU7Dnn0bW/jvag+5HCAp77IJyvt6q
	e0xn9bta50mE7+mi75liu2GXz3bGJtthzkQV5bA=
X-Google-Smtp-Source: ABdhPJyhQvXqk8gcpNBtxyVBHhbybFPcWhKpFX9t0nx1lz4reRqjjPazr1Xw+52S036u1+GwN1s87S/EbLS2dheOTcw=
X-Received: by 2002:a17:906:27c9:: with SMTP id k9mr22200149ejc.74.1593053273385;
 Wed, 24 Jun 2020 19:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200616211450.8079-1-mark.morton@windriver.com>
 <4279ef01cf93105bdea2e3d56e8df50db18350d2.camel@linuxfoundation.org>
 <DM6PR11MB367626B3068F92C3DD31D883E59D0@DM6PR11MB3676.namprd11.prod.outlook.com>
 <CAHUNapR1azgOund7LtARa-N8mAzm-5H7fnv2==gfNS2yGagq8w@mail.gmail.com>
 <CAHUNapTPp1pnArEserQKzej4chvOnmf21rwcXu_tn-PrfpmC4Q@mail.gmail.com>
 <DM6PR11MB3676665C903900BF80D5125DE5950@DM6PR11MB3676.namprd11.prod.outlook.com>
 <161BA835F254A781.17138@lists.yoctoproject.org>
In-Reply-To: <161BA835F254A781.17138@lists.yoctoproject.org>
From: "Trevor Woerner" <twoerner@gmail.com>
Date: Wed, 24 Jun 2020 22:47:41 -0400
Message-ID: <CAHUNapScmPJKK5+ZoL8QcDEGVPx106G=1vvBQkJgS+m5HWYg9w@mail.gmail.com>
Subject: Re: [docs] [PATCH] New source files and Makefile update for Test Manual
To: Trevor Woerner <twoerner@gmail.com>
Cc: "Morton, Mark" <Mark.Morton@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000077ed4705a8df9edf"

--00000000000077ed4705a8df9edf
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 24, 2020 at 10:24 PM Trevor Woerner via lists.yoctoproject.org
<twoerner=gmail.com@lists.yoctoproject.org> wrote:

> Again, not sure if this is just happening to me or not but in the pdf the
> diagram isn't included.
>

Hmm... I just noticed the diagram(s) aren't showing up in my kernel-devl
pdf manual either. Perhaps something on my side?

--00000000000077ed4705a8df9edf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Jun 24, 2020 at 10:24 PM Trevor Woerner via <a href=3D"http:=
//lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;twoerner=3D<a href=
=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Again, not sure if this is just happening to me or not but in the pdf the=
<br>
diagram isn&#39;t included.<br></blockquote><div><br></div><div>Hmm... I ju=
st noticed the diagram(s) aren&#39;t showing up in my kernel-devl pdf manua=
l either. Perhaps something on my side? <br></div></div></div>

--00000000000077ed4705a8df9edf--
