Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web08.37469.1628865647670230783
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 07:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bm/Da5b8;
 spf=pass (domain: konsulko.com, ip: 209.85.222.169, mailfrom: trini@konsulko.com)
Received: by mail-qk1-f169.google.com with SMTP id n11so6151784qkk.1
        for <docs@lists.yoctoproject.org>; Fri, 13 Aug 2021 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FGtQOcEZY5vAie9eHKow+Fl7sFf5SuhR9jopME387rU=;
        b=bm/Da5b8KDo7L4UphXUS0mIK5jICF53mJEJ+ym0bgFJA16K6XTMJMui9Za8dBbmx5K
         b5z581Sv6Nwz1OaglNmhJMK38gG9DCvfrYWeB2hKtWbaFG4uTbgbC4Tr8KnCQBiPKuX6
         0UV4aRJBhANdkLEq4bJmiSo6vYo82+cQx2LhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FGtQOcEZY5vAie9eHKow+Fl7sFf5SuhR9jopME387rU=;
        b=EjebjGJdGCkBqC/DV3a2JAcc8NNCxLX09JfIZA1cE0aKa/pCgrRjPJavJlp9MH1BAp
         eYYc4SaO54LdmiOvwnbv4ztkxA58BmBxbIYyFq6Fi3PO2YDO8eZnh5gyEvJE2qjHQ3xf
         /InO3W+JE6DqQ5aCZnuTO30hG423pSIqshqEEGQn/S6yfAy6K8YhcFL7lTi7Q+kcFGtC
         hM5bUtgu2QLnMJUGEf0cbB+jfr60eYEggJ+J0OxQMZmkoh7xC2rrazWujycvMJ41yDsA
         UDqxgTDfJon0q6moqpJoN87qchbe3rxdGEGTDvKAsMtOBFYXGg4m7eXTEJgOdWPHUyfp
         KSXA==
X-Gm-Message-State: AOAM531webjeDO6oyNCieimxYPO7cchk6HbEbZYMU/E+NcQwRa+t5ELW
	kfZ1RLdkHzQMHOJizcWBMxfX3w==
X-Google-Smtp-Source: ABdhPJxBiKFxJVapDBOcjV+wET5MBknjkbTgWEVhHhFUDX6aO7x7O4B6IjMhyquLTL/So40Z6DEF2Q==
X-Received: by 2002:a05:620a:11b1:: with SMTP id c17mr2170348qkk.317.1628865646680;
        Fri, 13 Aug 2021 07:40:46 -0700 (PDT)
Return-Path: <trini@konsulko.com>
Received: from bill-the-cat (2603-6081-7b01-cbda-587f-642f-0e55-2e70.res6.spectrum.com. [2603:6081:7b01:cbda:587f:642f:e55:2e70])
        by smtp.gmail.com with ESMTPSA id m188sm1033861qkc.99.2021.08.13.07.40.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 07:40:46 -0700 (PDT)
Date: Fri, 13 Aug 2021 10:40:44 -0400
From: "Tom Rini" <trini@konsulko.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/3] common-tasks: Add an example of using bbappends to add a file
Message-ID: <20210813144044.GG858@bill-the-cat>
References: <20210812161027.580-1-trini@konsulko.com>
 <20210812161027.580-3-trini@konsulko.com>
 <20210813082740.ptt5tcfchhapfm67@fedora>
 <b03398f7-aa8a-469f-4329-c743d4e7592a@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <b03398f7-aa8a-469f-4329-c743d4e7592a@bootlin.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 13, 2021 at 11:15:13AM +0200, Michael Opdenacker wrote:
> Tom, thanks for the patch.
> Quentin, thanks for the review.
> 
> On 8/13/21 10:27 AM, Quentin Schulz wrote:
> > Hi Tom,
> >
> > On Thu, Aug 12, 2021 at 12:10:27PM -0400, Tom Rini wrote:
> >> Use the xserver-xf86-config_%.bbappend from meta-raspberrypi to provide
> >> an example of having a bbappend file add files to an existing recipe.
> >>
> >> Signed-off-by: Tom Rini <trini@konsulko.com>
> >> ---
> >>  documentation/dev-manual/common-tasks.rst | 61 +++++++++++++++++++++++
> >>  1 file changed, 61 insertions(+)
> >>
> >> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> >> index f15e72887c04..87abef9ad52f 100644
> >> --- a/documentation/dev-manual/common-tasks.rst
> >> +++ b/documentation/dev-manual/common-tasks.rst
> >> @@ -554,6 +554,67 @@ The end result of this ``.bbappend`` file is that on a Raspberry Pi, where
> >>  used during ``do_fetch`` and the test for a non-zero file size in
> >>  ``do_install`` will return true, and the file will be installed.
> >>  
> >> +Installing Additional Files Using Your Layer
> >> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> +
> >> +As another example, consider the main xserver-xf86-config recipe and a corresponding
> > s/xserver-xf86-config/``xserver-xf86-config``/
> >
> >> +xserver-xf86-config append file both from the :term:`Source Directory`.
> > s/xserver-xf86-config/``xserver-xf86-config``/
> >
> >> +Here is the main
> >> +xserver-xf86-config recipe, which is named ``xserver-xf86-config_0.1.bb`` and located in
> > s/xserver-xf86-config/``xserver-xf86-config``/

Whoops.

> >> +the "meta" layer at ``meta/recipes-graphics/xorg-xserver``::
> >> +
> >> +   SUMMARY = "X.Org X server configuration file"
> >> +   HOMEPAGE = "https://urldefense.proofpoint.com/v2/url?u=http-3A__www.x.org&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=XXgYJ9tKXtc_aBqPPa-9XgJe1nXbWkl8dkudu8oFs_Y&s=0zjLRjQF3x_Fv-B-gOPuwnCc_TfOzMJ50SOySYZMbys&e= "
> >> +   SECTION = "x11/base"
> >> +   LICENSE = "MIT-X"
> >> +   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> >> +   PR = "r33"
> >> +
> >> +   SRC_URI = "file://xorg.conf"
> >> +
> >> +   S = "${WORKDIR}"
> >> +
> >> +   CONFFILES:${PN} = "${sysconfdir}/X11/xorg.conf"
> >> +
> >> +   PACKAGE_ARCH = "${MACHINE_ARCH}"
> >> +   ALLOW_EMPTY:${PN} = "1"
> >> +
> >> +   do_install () {
> >> +	if test -s ${WORKDIR}/xorg.conf; then
> >> +		install -d ${D}/${sysconfdir}/X11
> >> +		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
> >> +	fi
> >> +   }
> >> +
> >> +Following is the append file, which is named ``xserver-xf86-config_%.bbappend``
> >> +and is from the Raspberry Pi BSP Layer named ``meta-raspberrypi``. The
> >> +file is in the layer at ``recipes-graphics/xorg-xserver``::
> >> +
> >> +   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> >> +
> >> +   SRC_URI:append:rpi = " \
> >> +       file://xorg.conf.d/98-pitft.conf \
> >> +       file://xorg.conf.d/99-calibration.conf \
> >> +   "
> >> +   do_install:append:rpi () {
> >> +       PITFT="${@bb.utils.contains("MACHINE_FEATURES", "pitft", "1", "0", d)}"
> >> +       if [ "${PITFT}" = "1" ]; then
> >> +           install -d ${D}/${sysconfdir}/X11/xorg.conf.d/
> >> +           install -m 0644 ${WORKDIR}/xorg.conf.d/98-pitft.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
> >> +           install -m 0644 ${WORKDIR}/xorg.conf.d/99-calibration.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
> >> +       fi
> >> +   }
> >> +
> >> +   FILES:${PN}:rpi += "${sysconfdir}/X11/xorg.conf ${sysconfdir}/X11/xorg.conf.d/*"
> >> +
> > Highly suspect this is wrong. It should be FILES:${PN}:append:rpi
> > instead, otherwise it's completely overriding FILES:${PN} for rpi (even
> > if the operator that is following is +=).

Yeah, it does.

> > I guess you took this from the bbappend within meta-raspberrypi so it
> > would probably  need fixing there.

Yup, copy/paste/indent of the current upstream recipe.

> >> +Building off of the previous example, we once again are setting the
> >> +:term:`FILESEXTRAPATHS` variable.  In this case we are also usine the
> > s/usine the/using/
> >
> >> +:term:`SRC_URI` to list additional source files to use when ``rpi`` is found in
> >> +the list of :term:`OVERRIDES`.  The ``do_install`` task will then perform a
> > s/``do_install``/:ref:`ref-tasks-install`/
> >
> >> +check for an additional :term:`MACHINE_FEATURES` that if set will cause these
> > "The do_install task will be extended, for ``rpi`` only, to perform..." instead?
> >
> >> +additional files to be installed.  These additional files are listed in
> >> +:term:`FILES` so that they will be packaged.
> >> +
> > Same, it's rpi-specific here.

What I was trying to convey here is that in the meta-raspberrypi layer,
all of the machines add "rpi" to the OVERRIDE list, for a common one.
At the high level, I was trying to find a simple example of using an
append to add files, but also didn't want to add another example layer
and it seems like meta-raspberrypi is what's used everywhere else.  I'll
see about re-wording things a bit more to be clearer / more consistent.

> Tom, it's probably better if you prepare a V2 by yourself.
> If you can prepare it against "master-next", that will even be easier
> for me, as the first two patches were merged there.

Agreed.  First up, I'm going to need to go and get meta-raspberrypi
fixed for this example, or switch to the u-boot example there, which I
avoided since it's doing two things.

Thanks for the review and feedback.

-- 
Tom
