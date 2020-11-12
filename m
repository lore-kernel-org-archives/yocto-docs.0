Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
 by mx.groups.io with SMTP id smtpd.web12.2113.1605174642615168785
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 01:50:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iWJO7aOV;
 spf=pass (domain: linaro.org, ip: 209.85.219.195, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f195.google.com with SMTP id l14so629050ybq.3
        for <docs@lists.yoctoproject.org>; Thu, 12 Nov 2020 01:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eyDdyS6pZesHhD5fnHe03FIcWAp9JBg0fJ2GheH9Za8=;
        b=iWJO7aOVnvGTZaV+ek8UtRuozkCikKSKVuvBjf76o637hd+yrPJDxuQd5f2DX+3mkf
         7AbogK8sYmeM/31DdPMUlJEnyC+CTdjeeNAWj/sjsw3K4mufyHk7ppXwfCjUc6nY8UAg
         aoxWm2E2fIOu0gXNwDiygb3BcFkghYvJ2BFDCzzt3CwaR9OSusNtnM7Wz5mvLA0w65/d
         LXDpcquAV9zzzvcM+2YKur+WoLa3hBGODpGBO84NSQw/eH+xH0Jxyzrw5vhOdFn92Lpb
         37qiRP9VY+3SWDeWSadEVXk8c0qxq/vY0H/pRyFrSDs/O+j2bZ+bI193a7TO8n0gFQip
         xUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eyDdyS6pZesHhD5fnHe03FIcWAp9JBg0fJ2GheH9Za8=;
        b=RIIBWZo7CJDb12umXu1w1U6W5Y1QPhBMXMhNBvOcZUq1ELI9Otl4Lv3OefjZBX/s9W
         dMdDqSEdopB1bl9wpxlVjl2W1ompRlH2738EmAzcCHAqKlYIV7GDcLDbsI8RMPAc8rnk
         4NS3gAAV9/YIBKAsvwHgpYwKYfOQ1oENuNe+1hEwOFAgXN9OKqHIUf9TZeLMUaY4QFzI
         OdD4XhffnCpCmUgkr2varRbXOUNw/8qlvBfTl1lHne9jju2jVGfFbeY+q6DjSgxAGIGg
         hPL7AN2KhoFuGNGdkD6PcL1XAcr+tj0pPBHACCQTiwfDIWVRspCD+2/kzj/JBhDmlWQn
         i4Cw==
X-Gm-Message-State: AOAM531+D0xm+Q03DUsY7anjK1RSX+skB3DVtBQKfijDj7IfVQw0y0M7
	oZ3MJL6hZmm1EeBDRL7ejtY4xHMwjC3JNjAyW/xsJvLxErEStg==
X-Google-Smtp-Source: ABdhPJy6U6sF0a2LYTpix8piQnLIE2/BQub3/VbbEgrjC7WyQU0et8WNrr4AJCVg0ec1ap6uNDoyJqssY8FoKIHQzRY=
X-Received: by 2002:a25:e54:: with SMTP id 81mr35652493ybo.201.1605174641487;
 Thu, 12 Nov 2020 01:50:41 -0800 (PST)
MIME-Version: 1.0
References: <20201112075206.113124-1-nicolas.dechesne@linaro.org>
 <20201112075206.113124-2-nicolas.dechesne@linaro.org> <20201112093431.zjubhoxishftddsd@qschulz>
In-Reply-To: <20201112093431.zjubhoxishftddsd@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 12 Nov 2020 10:50:30 +0100
Message-ID: <CAP71WjwpXKO61qXrp5CwsX3nqWHJib5V7UdbV-s+Az0_=YfEpQ@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 1/2] poky.yaml: remove unused variables
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2020 at 10:34 AM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Nicolas,
>
> On Thu, Nov 12, 2020 at 08:52:05AM +0100, Nicolas Dechesne wrote:
> > There are plenty of variables in poky.yaml which are not used anywhere
> > in the docs. So let's remove them. We can always add the one we need
> > later.
> >
> > Note ORGEMAIL could be used in boilerplate.rst, however this file is
> > not parsed but included, and somehow the yocto-vars.py exenstion does
> > not process this file, so we cannot use a variable there.
> >
> > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > ---
> >  documentation/poky.yaml | 47 -----------------------------------------
> >  1 file changed, 47 deletions(-)
> >
> > diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> > index e39c403fe..85f42cf07 100644
> > --- a/documentation/poky.yaml
> > +++ b/documentation/poky.yaml
> > @@ -1,62 +1,15 @@
> >  DISTRO : "3.1"
> > -DISTRO_COMPRESSED : "31"
> >  DISTRO_NAME_NO_CAP : "dunfell"
> >  DISTRO_NAME : "Dunfell"
> >  DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> > -DISTRO_NAME_MINUS_ONE : "Zeus"
> >  YOCTO_DOC_VERSION : "3.1"
> >  YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
> >  DISTRO_REL_TAG : "yocto-3.1"
> > -METAINTELVERSION : "12.0"
> > -REL_MONTH_YEAR : "April 2020"
> > -META_INTEL_REL_TAG : "&METAINTELVERSION;-&DISTRO_NAME_NO_CAP;-&YOCTO_DOC_VERSION;"
> >  POKYVERSION : "23.0.0"
> > -POKYVERSION_COMPRESSED : "2300"
> >  YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
> > -COPYRIGHT_YEAR : "2010-2020"
> > -ORGNAME : "The Yocto Project"
> > -ORGEMAIL : "docs@lists.yoctoproject.org"
> >  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
> > -YOCTO_HOME_URL : "https://www.yoctoproject.org"
> > -YOCTO_LISTS_URL : "https://lists.yoctoproject.org"
> > -YOCTO_BUGZILLA_URL : "https://bugzilla.yoctoproject.org"
> > -YOCTO_WIKI_URL : "https://wiki.yoctoproject.org"
> >  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
> > -YOCTO_GIT_URL : "https://git.yoctoproject.org"
> > -YOCTO_ADTREPO_URL : "http://adtrepo.yoctoproject.org"
> > -OE_HOME_URL : "https://www.openembedded.org"
> > -OE_LISTS_URL : "https://lists.openembedded.org"
> > -OE_DOCS_URL : "https://docs.openembedded.org"
> > -OH_HOME_URL : "http://o-hand.com"
> > -BITBAKE_HOME_URL : "http://developer.berlios.de/projects/bitbake/"
> > -YOCTO_DOCS_URL : "&YOCTO_HOME_URL;/docs"
> > -YOCTO_SOURCES_URL : "&YOCTO_HOME_URL;/sources/"
> > -YOCTO_AB_PORT_URL : "https://autobuilder.yocto.io/"
> > -YOCTO_AB_NIGHTLY_URL : "&YOCTO_AB_PORT_URL;/pub/nightly/"
> > -YOCTO_POKY_URL : "&YOCTO_DL_URL;/releases/poky/"
> >  YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
> > -YOCTO_TOOLCHAIN_DL_URL : "&YOCTO_RELEASE_DL_URL;/toolchain/"
> > -YOCTO_ADTINSTALLER_DL_URL : "&YOCTO_RELEASE_DL_URL;/adt-installer"
> > -YOCTO_POKY_DL_URL : "&YOCTO_RELEASE_DL_URL;/&YOCTO_POKY;.tar.bz2"
> > -YOCTO_MACHINES_DL_URL : "&YOCTO_RELEASE_DL_URL;/machines"
> > -YOCTO_QEMU_DL_URL : "&YOCTO_MACHINES_DL_URL;/qemu"
> > -YOCTO_PYTHON-i686_DL_URL : "&YOCTO_DL_URL;/releases/miscsupport/python-nativesdk-standalone-i686.tar.bz2"
> > -YOCTO_PYTHON-x86_64_DL_URL : "&YOCTO_DL_URL;/releases/miscsupport/python-nativesdk-standalone-x86_64.tar.bz2"
> > -YOCTO_DOCS_QS_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/yocto-project-qs/yocto-project-qs.html"
> > -YOCTO_DOCS_REF_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/ref-manual/ref-manual.html"
> > -YOCTO_DOCS_BSP_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/bsp-guide/bsp-guide.html"
> > -YOCTO_DOCS_DEV_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/dev-manual/dev-manual.html"
> > -YOCTO_DOCS_KERNEL_DEV_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/kernel-dev/kernel-dev.html"
> > -YOCTO_DOCS_PROF_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/profile-manual/profile-manual.html"
> > -YOCTO_DOCS_MM_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/mega-manual/mega-manual.html"
> > -YOCTO_DOCS_BB_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/bitbake-user-manual/bitbake-user-manual.html"
> > -YOCTO_DOCS_TOAST_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/toaster-manual/toaster-manual.html"
> > -YOCTO_DOCS_SDK_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/sdk-manual/sdk-manual.html"
> > -YOCTO_DOCS_OM_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/overview-manual/overview-manual.html"
> > -YOCTO_DOCS_BRIEF_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/brief-yoctoprojectqs/brief-yoctoprojectqs.html"
> > -YOCTO_ADTPATH_DIR : "/opt/poky/&DISTRO;"
> > -YOCTO_POKY_TARBALL : "&YOCTO_POKY;.tar.bz2"
> > -OE_INIT_PATH : "&YOCTO_POKY;/oe-init-build-env"
>
> That's a lot of variables removed... Are you sure they are never used?
> (compile with and without this change, and diff the html).

yes ;)

I think a lot of them where used in the docbook files for cross
references between 'manuals', which we do with :ref: now, and extlinks
as well. But as far as I can (and I did diff'd the html) this change
is a no-op.

>
> Just to be sure I didn't misunderstood the usecase for those variables:
> it is so we can have "dynamic" values in litteral blocks (:: and maybe
> others?), because those in yocto-vars.py don't work IIRC (they are not
> "translated", i.e. :yocto_git:`/` will be put as isin the litteral block).

Right. you are correct. In litteral blocks, you cannot 'nest' roles. I
tried to get rid of them initially, and use the built-in substitutions
mechanisms, but not being to use them in literal blocks was really a
blocker. At least we get rid of many of them by using new Sphinx
mechanisms (ref and extlinks).

>
> Quentin
