Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.257.1627385919898744425
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 04:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AROKu4aC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id z4so2949227wrv.11
        for <docs@lists.yoctoproject.org>; Tue, 27 Jul 2021 04:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=i4EhNxJO1MkgYrjG6M30ARB94LItQmAukuMdZI3zTIk=;
        b=AROKu4aCtkGvZD5Ulw1j/cedU7c15lNvTljUMiqoPI/DLoBDtrx4/Mt+1+INGcCqrt
         UPpOdpZF6umupnO64X9bFAfJhqcojT/5ANVOblkTeDaQmDz7Gz9eWlUMfP6bbZDtjrTR
         ePHEzEoD84QMTVb/u+7p9wIeiutKjo7mkif2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=i4EhNxJO1MkgYrjG6M30ARB94LItQmAukuMdZI3zTIk=;
        b=pSiyExNyd2EZIPd8YlKB1tKjVXMobnzHIQiBbi8kssh45c6FYvZNcV1qqfsC3X9lFW
         k1Qvyj5vwKnOGp/8ZR0F/Gm2yqqXKPusKYp45rKH0qpoT1xe3p119Ps6bLL3O3+kQ7Bo
         vvKmV9Au4jfYRHP9B2vp9FRPhp11Q3C/Jl/j7XcIiYoeFzOrsvw/3M4Cl+daGakytfC1
         hEwq5IIZ9CQRqkZu27DISfVlka76YTXz1KOtzQca1ffbUBSDear8NjfnhppqyjmNnAUP
         08QENXRSuvVW7UIRXgz6ETDAFXHteHIRU2SCY1VwAIloZRdJ7cm7oyAL3dOoX5hEouso
         Iigw==
X-Gm-Message-State: AOAM5335je8WAdOq2p9gdgnJdhKd1YA6TNg3XqaWwYNUvVZqoAZ3Bhiq
	yaj58oRV3XKOJmv1LbfHNspLPQ==
X-Google-Smtp-Source: ABdhPJxJkdgl2ccyKb8UjjMq9BeGsQWug0U7FIMqcBXJpvMJWBCgFC4vxkz16qWTJjgDvB8T/hYd2w==
X-Received: by 2002:a05:6000:154c:: with SMTP id 12mr24278932wry.393.1627385918338;
        Tue, 27 Jul 2021 04:38:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8722:e8c0:4ebc:1cd4? ([2001:8b0:aba:5f3c:8722:e8c0:4ebc:1cd4])
        by smtp.gmail.com with ESMTPSA id n5sm2946856wrp.80.2021.07.27.04.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 04:38:38 -0700 (PDT)
Message-ID: <4c34e5320bb80e9234ca68c1e110e0581853766e.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] ref-manual: remove unused example recipe source files
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, Michael
 Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
Date: Tue, 27 Jul 2021 12:38:34 +0100
In-Reply-To: <20210727112302.spzqyqnu3k2sskxi@fedora>
References: <16959EEB5BD85597.12821@lists.yoctoproject.org>
	 <e17cad88-9b81-68fe-66c3-9305aa494f17@bootlin.com>
	 <20210727112302.spzqyqnu3k2sskxi@fedora>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-07-27 at 13:23 +0200, Quentin Schulz wrote:
> Hi Michael,
> 
> On Tue, Jul 27, 2021 at 12:29:41PM +0200, Michael Opdenacker wrote:
> > Hello Quentin,
> > 
> > On 7/27/21 12:26 PM, Michael Opdenacker wrote:
> > > These files are not used to build to documentation
> > > 
> > > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > > ---
> > >  .../examples/hello-autotools/hello_2.10.bb      |  9 ---------
> > >  .../examples/hello-single/files/helloworld.c    |  8 --------
> > >  .../ref-manual/examples/hello-single/hello.bb   | 17 -----------------
> > >  .../ref-manual/examples/libxpm/libxpm_3.5.6.bb  | 14 --------------
> > >  .../examples/mtd-makefile/mtd-utils_1.0.0.bb    | 15 ---------------
> > >  5 files changed, 63 deletions(-)
> > >  delete mode 100644 documentation/ref-manual/examples/hello-autotools/hello_2.10.bb
> > >  delete mode 100644 documentation/ref-manual/examples/hello-single/files/helloworld.c
> > >  delete mode 100644 documentation/ref-manual/examples/hello-single/hello.bb
> > >  delete mode 100644 documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
> > >  delete mode 100644 documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb
> > > 
> > > diff --git a/documentation/ref-manual/examples/hello-autotools/hello_2.10.bb b/documentation/ref-manual/examples/hello-autotools/hello_2.10.bb
> > > deleted file mode 100644
> > > index aa2beb9a9b..0000000000
> > > --- a/documentation/ref-manual/examples/hello-autotools/hello_2.10.bb
> > > +++ /dev/null
> > > @@ -1,9 +0,0 @@
> > > -DESCRIPTION = "GNU Helloworld application"
> > > -SECTION = "examples"
> > > -LICENSE = "GPLv3"
> > > -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> > > -
> > > -SRC_URI = "${GNU_MIRROR}/hello/hello-${PV}.tar.gz"
> > > -SRC_URI[sha256sum] = "31e066137a962676e89f69d1b65382de95a7ef7d914b8cb956f41ea72e0f516b"
> > > -
> > > -inherit autotools-brokensep gettext
> > > diff --git a/documentation/ref-manual/examples/hello-single/files/helloworld.c b/documentation/ref-manual/examples/hello-single/files/helloworld.c
> > > deleted file mode 100644
> > > index fc7169b7b8..0000000000
> > > --- a/documentation/ref-manual/examples/hello-single/files/helloworld.c
> > > +++ /dev/null
> > > @@ -1,8 +0,0 @@
> > > -#include <stdio.h>
> > > -
> > > -int main(void)
> > > -{
> > > -	printf("Hello world!\n");
> > > -
> > > -	return 0;
> > > -}
> > > diff --git a/documentation/ref-manual/examples/hello-single/hello.bb b/documentation/ref-manual/examples/hello-single/hello.bb
> > > deleted file mode 100644
> > > index 90d3aefd86..0000000000
> > > --- a/documentation/ref-manual/examples/hello-single/hello.bb
> > > +++ /dev/null
> > > @@ -1,17 +0,0 @@
> > > -DESCRIPTION = "Simple helloworld application"
> > > -SECTION = "examples"
> > > -LICENSE = "MIT"
> > > -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> > > -
> > > -SRC_URI = "file://helloworld.c"
> > > -
> > > -S = "${WORKDIR}"
> > > -
> > > -do_compile() {
> > > -	${CC} ${LDFLAGS} helloworld.c -o helloworld
> > > -}
> > > -
> > > -do_install() {
> > > -	install -d ${D}${bindir}
> > > -	install -m 0755 helloworld ${D}${bindir}
> > > -}
> > > diff --git a/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb b/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
> > > deleted file mode 100644
> > > index c0c8986405..0000000000
> > > --- a/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
> > > +++ /dev/null
> > > @@ -1,14 +0,0 @@
> > > -require recipes-graphics/xorg-lib/xorg-lib-common.inc
> > > -
> > > -DESCRIPTION = "X11 Pixmap library"
> > > -LICENSE = "X-BSD"
> > > -LIC_FILES_CHKSUM = "file://COPYING;md5=3e07763d16963c3af12db271a31abaa5"
> > > -DEPENDS += "libxext"
> > > -PR = "r2"
> > > -PE = "1"
> > > -
> > > -XORG_PN = "libXpm"
> > > -
> > > -PACKAGES =+ "sxpm cxpm"
> > > -FILES_cxpm = "${bindir}/cxpm"
> > > -FILES_sxpm = "${bindir}/sxpm"
> > > diff --git a/documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb b/documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb
> > > deleted file mode 100644
> > > index 5d05a437a4..0000000000
> > > --- a/documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb
> > > +++ /dev/null
> > > @@ -1,15 +0,0 @@
> > > -DESCRIPTION = "Tools for managing memory technology devices."
> > > -SECTION = "base"
> > > -DEPENDS = "zlib"
> > > -HOMEPAGE = "https://urldefense.proofpoint.com/v2/url?u=http-3A__www.linux-2Dmtd.infradead.org_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=eyb4BYFT9E-HdgVPGQm8pJMdNlXGefc8FzxjWoAmrcs&s=rDxXZI7Evhz9_J8vJmFmp7sfSRycLIHpvHm2-rhxYYQ&e= "
> > > -LICENSE = "GPLv2"
> > > -LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> > > -                    file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
> > > -
> > > -SRC_URI = "https://urldefense.proofpoint.com/v2/url?u=ftp-3A__ftp.infradead.org_pub_mtd-2Dutils_mtd-2Dutils-2D-24-257BPV-257D.tar.gz&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=eyb4BYFT9E-HdgVPGQm8pJMdNlXGefc8FzxjWoAmrcs&s=iW6rRvnv1zLX6sYtZjtYVLji9LdaUjp64SzvLGJhKC0&e= "
> > > -
> > > -CFLAGS_prepend = "-I ${S}/include "
> > > -
> > > -do_install() {
> > > -	oe_runmake install DESTDIR=${D}
> > > -}
> > > 
> > 
> > This is probably a controversial commit. Rather than asking a question,
> > I preferred to send a patch.
> > 
> > Apparently, you were the last one to touch these files, so don't
> > hesitate to stop me and let us know why we should keep these files.
> > Maybe to make sure that our examples still compile? However, I found at
> > least one file that is not in sync with the contents of the documentation.
> > 
> 
> I wouldn't remove them as I find example recipes to be very welcomed as
> real life examples of what can/needs to be done. It shows also some
> gotchas and what a minimal recipe should look like.
> 
> What I have to complain about those files currently is that they are not
> built and they weren't working for a while, which is a bit of a shame
> for example recipes :)
> 
> I don't think keeping them in the yocto-docs is something we want to
> push for (at least I won't), but I feel like we should keep them
> somewhere they are built so we maintain them along other recipes.
> 
> I can see that we have a recipe for an out-of-tree kernel drievr recipe
> available in poky/meta-skeleton layer (called hello-mod). I guess this
> is a place we could put the examples you want to remove from yocto-docs?

If they were in meta-skeleton we could build/test them...

Cheers,

Richard

