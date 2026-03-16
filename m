Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226E3F013FA
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 12:25:33 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48991.1773663923043061529
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 05:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=r2sdcP51;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5D5171A2E6C;
	Mon, 16 Mar 2026 12:25:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C2BC5FC4A;
	Mon, 16 Mar 2026 12:25:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9153B10369F44;
	Mon, 16 Mar 2026 13:25:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773663920; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qcDcqbXey7aXCseJ1UoJIYFgKflA8XrlZP8lphaXX18=;
	b=r2sdcP51Gjcp61MbGAuq2z/ncXB62eQGQZRy8vLlY5crV05Z6oAUUxsGBbJOnRC7vxjGDg
	JMrzUFF3quTtcqyf1L2wcNmXYUF0iMzsMteuuI43oZYdAsYZqdE/OlEINVR0wjC1P6c2Bx
	/pHg2HBQArYTUnen0ldU9JLwzBSDuHtZDj8obRj4PsRX4kiB/UmpZyNGQ06Uf25eqayDMH
	wIFgo5xBalci9sonB1l5aZSmf9yfz3JqoX+9IaBDUGrIVwvTw7G7jHDnX8dOS4ox7cu4Od
	XMTGx1SaRe+dHvaqZGOU/LOQ9wMeG7ZY1IGhZoVTCFB4tE4t3pN6btiR4rO0jA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 13:25:20 +0100
Message-Id: <DH47DWCO2IJG.2I5ATKCTSRRPU@bootlin.com>
Subject: Re: [docs] [PATCH 1/2] migration-guides: add release notes for
 5.0.16
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <chee.yang.lee@intel.com>, <docs@lists.yoctoproject.org>
References: <20260313095135.1177465-1-chee.yang.lee@intel.com>
In-Reply-To: <20260313095135.1177465-1-chee.yang.lee@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Mar 2026 12:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9082

Hi,

Please see reviews below.

On Fri Mar 13, 2026 at 10:51 AM CET, Lee Chee Yang via lists.yoctoproject.o=
rg wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  .../migration-guides/release-5.0.rst          |   1 +
>  .../migration-guides/release-notes-5.0.16.rst | 215 ++++++++++++++++++
>  2 files changed, 216 insertions(+)
>  create mode 100644 documentation/migration-guides/release-notes-5.0.16.r=
st
>
> diff --git a/documentation/migration-guides/release-5.0.rst b/documentati=
on/migration-guides/release-5.0.rst
> index 63b23edb1..b98e0141c 100644
> --- a/documentation/migration-guides/release-5.0.rst
> +++ b/documentation/migration-guides/release-5.0.rst
> @@ -22,3 +22,4 @@ Release 5.0 (scarthgap)
>     release-notes-5.0.13
>     release-notes-5.0.14
>     release-notes-5.0.15
> +   release-notes-5.0.16
> diff --git a/documentation/migration-guides/release-notes-5.0.16.rst b/do=
cumentation/migration-guides/release-notes-5.0.16.rst
> new file mode 100644
> index 000000000..d35335f59
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-5.0.16.rst
> @@ -0,0 +1,215 @@
> +Release notes for Yocto-5.0.16 (Scarthgap)
> +------------------------------------------
> +
> +This release breaks Ubuntu 20.04 compatibility. Ubuntu 20.04 lack kernel=
 header recent

"This release breaks support for Ubuntu 20.04 as a :ref:`compatible host
<ref-manual/system-requirements:Supported Linux Distributions>`. The Ubuntu=
 20.04
Linux kernel headers are not recent enough to support the latest :ref:`pseu=
do
<overview-manual/concepts:fakeroot and pseudo>` fixes".

> +enough to support the pseudo-native fixes.
> +Ubuntu 20.04 is End-of-Life since 31 May 2025. Impacted users are encour=
agded to upgrade
> +to a actively supported host ditribution.

Add "See :doc:`/ref-manual/system-requirements` for more information on
compatible hosts."

> +Alternatively, a fix has been merged to scarthgap branch and can be appl=
ied on top of this
> +release:
> +
> +-  https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&=
id=3Dfe2666749094e896736ff24d6885419905488723
> +-  https://git.yoctoproject.org/poky/commit/?h=3Dscarthgap&id=3D65c3ebea=
05dde5cbc9d249e7949fabbc0047313e

-  :oe_git:`/openembedded-core/commit/?h=3Dscarthgap&id=3Dfe2666749094e8967=
36ff24d6885419905488723`
-  :yocto_git:`/poky/commit/?h=3Dscarthgap&id=3D65c3ebea05dde5cbc9d249e7949=
fabbc0047313e`

> +
> +
> +Security Fixes in Yocto-5.0.16
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  curl: Fix :cve_nist:`2025-10148`, :cve_nist:`2025-14017`, :cve_nist:`=
2025-14524`,
> +   :cve_nist:`2025-14819`, :cve_nist:`2025-15079` and :cve_nist:`2025-15=
224`
> +-  dropbear: Fix :cve_nist:`2019-6111`
> +-  expat: Fix :cve_nist:`2026-24515` and :cve_nist:`2026-25210`
> +-  ffmpeg: Ignore :cve_nist:`2025-25469`
> +-  glib-2.0: Fix :cve_nist:`2025-13601`, :cve_nist:`2025-14087`, :cve_ni=
st:`2025-14512` and
> +   :cve_nist:`2026-0988`
> +-  glibc: FIx :cve_nist:`2025-15281`, :cve_nist:`2026-0861` and :cve_nis=
t:`2026-0915`
> +-  inetutils: Fix :cve_nist:`2026-24061`
> +-  libarchive: Fix :cve_nist:`2025-60753` (follow-up fix)
> +-  libpcap: Fix :cve_nist:`2025-11961` and :cve_nist:`2025-11964`
> +-  libpng: Fix :cve_nist:`2026-22695` and :cve_nist:`2026-22801`
> +-  libtasn1: Fix :cve_nist:`2025-13151`
> +-  libxml2: Fix :cve_nist:`2026-0989`, :cve_nist:`2026-0990` and :cve_ni=
st:`2026-0992`
> +-  python-urllib3: Fix for :cve_nist:`2026-21441`
> +-  python3: Fix :cve_nist:`2025-12084`, :cve_nist:`2025-13836` and :cve_=
nist:`2025-13837`
> +-  qemu: Ignore :cve_nist:`2025-54566` and :cve_nist:`2025-54567`
> +-  util-linux: Fix :cve_nist:`2025-14104`
> +-  zlib: Ignore :cve_nist:`2026-22184`
> +
> +
> +Fixes in Yocto-5.0.16
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +-  bitbake: knotty: Make sure getTerminalColumns() returns two integers
> +-  bitbake: knotty: fix TIOCGWINSZ call for Python 3.14 and later
> +-  build-appliance-image: Update to scarthgap head revision
> +-  contributor-guide/recipe-style-guide.rst: explain difference between =
layer and recipe license(s)
> +-  contributor-guide/submit-changes.rst: remove mention of Upstream-Stat=
us
> +-  cups: allow unknown directives in conf files
> +-  dev-manual/packages.rst: fix example recipe version
> +-  dev-manual/packages.rst: pr server: fix and explain why r0.X incremen=
ts on :term:`SRCREV` change
> +-  dev-manual/packages.rst: rename r0.0 to r0 when :term:`PR` server is =
not enabled
> +-  dev-manual/temporary-source-code.rst: fix definition of :term:`WORKDI=
R`
> +-  docbook-xml-dtd4: fix the fetching failure
> +-  docs: Add a new "Security" section
> +-  docs: Makefile: fix rsvg-convert --format capitalization
> +-  ffmpeg: upgrade to 6.1.4
> +-  glibc: stable 2.39 branch updates
> +-  improve_kernel_cve_report: add script for postprocesing of kernel CVE=
 data
> +-  libtheora: set :term:`CVE_PRODUCT`
> +-  lighttpd: Fix trailing slash on files in mod_dirlisting
> +-  meta/classes: fix missing vardeps for CVE status variables
> +-  migration-guides: add release notes for 4.0.32, 5.0.14 and 5.0.15
> +-  overview-manual/yp-intro.rst: change removed ECOSYSTEM to ABOUT
> +-  overview-manual/yp-intro.rst: fix SDK type in bullet list
> +-  overview-manual/yp-intro.rst: link to YP members and participants
> +-  overview-manual: convert YP-flow-diagram.png to SVG
> +-  pseudo: Add hard sstate dependencies for pseudo-native
> +-  pseudo: Update to 1.9.3 release
> +-  ref-manual/classes.rst: document the image-container class
> +-  ref-manual/release-process.rst: add a "Development Cycle" section
> +-  ref-manual/svg/releases.svg: mark styhead and walnascar EOL
> +-  ref-manual/svg/releases.svg: mark whinlatter as current release
> +-  ref-manual/variables.rst: document the :term:`CCACHE_TOP_DIR` variabl=
e
> +-  sdk-manual: appending-customizing: use none lexer for BitBake code bl=
ocks
> +-  sdk-manual: appendix-obtain: fix default path for eSDK installer scri=
pt
> +-  sdk-manual: appendix-obtain: replace directory structure PNG with a p=
arsed-literal block
> +-  sdk-manual: appendix-obtain: replace eSDK directory structure PNG wit=
h a parsed-literal block
> +-  sdk-manual: appendix-obtain: use parsed-literal block for naming conv=
ention of the installer scripts
> +-  sdk-manual: delete sdk-title PNG
> +-  sdk-manual: fix improper indent of general form of tarball installer =
scripts
> +-  sdk-manual: fix incorrect highlight language for console code-blocks
> +-  sdk-manual: fix incorrect highlight language for text code-blocks
> +-  sdk-manual: replace sdk-environment PNG with SVG
> +-  sdk-manual: using: fix SDK filename example
> +-  sdk-manual: working-projects: properly highlight code code-blocks
> +-  test-manual/ptest.rst: detail the exit code and output requirements
> +-  zlib: Add :term:`CVE_PRODUCT` to exclude false positives
> +-  zlib: cleanup obsolete CVE_STATUS[CVE-2023-45853]
> +
> +
> +Known Issues in Yocto-5.0.16
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The poky :term:`DISTRO_VERSION` was incorrectly left at 5.0.15. This is =
a minor
> +issue, if a workaround is needed please cherry-pick:
> +
> +- poky commit 06210079b2e10d6d3fb943afe87864267e329821, or
> +- meta-yocto commit 03f93c769ec99e5086e492d8145eb308a718e8d3.
> +

Change to links here as you did above with :oe_git: and :yocto_git:

> +
> +Contributors to Yocto-5.0.16
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Thanks to the following people who contributed to this release:
> +
> +-  Adarsh Jagadish Kamini
> +-  Amaury Couderc
> +-  Ankur Tyagi
> +-  Antonin Godard
> +-  Benjamin Robin (Schneider Electric)
> +-  Daniel Turull
> +-  Enrico Scholz
> +-  Fred Bacon
> +-  Het Patel
> +-  Hitendra Prajapati
> +-  Hugo SIMELIERE
> +-  Ken Kurematsu
> +-  Khai Dang
> +-  Lee Chee Yang
> +-  Paul Barker
> +-  Peter Marko
> +-  Quentin Schulz
> +-  Richard Purdie
> +-  Robert Yang
> +-  Vijay Anusuri
> +-  Yoann Congal
> +-  Zoltan Boszormenyi
> +
> +Repositories / Downloads for Yocto-5.0.16
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +yocto-docs
> +
> +-  Repository Location: :yocto_git:`/yocto-docs`
> +-  Branch: :yocto_git:`scarthgap </yocto-docs/log/?h=3Dscarthgap>`
> +-  Tag:  :yocto_git:`yocto-5.0.16 </yocto-docs/log/?h=3Dyocto-5.0.16>`
> +-  Git Revision: :yocto_git:`369f3307368eaea605983e80047377fd19ebd6bf </=
yocto-docs/commit/?id=3D369f3307368eaea605983e80047377fd19ebd6bf>`
> +-  Release Artefact: yocto-docs-369f3307368eaea605983e80047377fd19ebd6bf
> +-  sha: e8ea8e2d5da2bfad868178d6fb37093c4f9ff06553f68970f0f730d6fb5cbd26
> +-  Download Locations:
> +
> +   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/yocto-=
docs-369f3307368eaea605983e80047377fd19ebd6bf.tar.bz2
> +
> +   https://mirrors.edge.kernel.org/yocto/yocto/yocto-5.0.16/yocto-docs-3=
69f3307368eaea605983e80047377fd19ebd6bf.tar.bz2
> +
> +poky
> +
> +-  Repository Location: :yocto_git:`/poky`
> +-  Branch: :yocto_git:`scarthgap </poky/log/?h=3Dscarthgap>`
> +-  Tag:  :yocto_git:`yocto-5.0.16 </poky/log/?h=3Dyocto-5.0.16>`
> +-  Git Revision: :yocto_git:`1d54d1c4736a114e1cecbe85a0306e3814d5ce70 </=
poky/commit/?id=3D1d54d1c4736a114e1cecbe85a0306e3814d5ce70>`
> +-  Release Artefact: poky-1d54d1c4736a114e1cecbe85a0306e3814d5ce70
> +-  sha: efb75697fa7a8e35a3f46abcfa706400f56ae1d1b5e360b48d6ffa81f6a675e8
> +-  Download Locations:
> +
> +   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/poky-1=
d54d1c4736a114e1cecbe85a0306e3814d5ce70.tar.bz2
> +
> +   https://mirrors.edge.kernel.org/yocto/yocto/yocto-5.0.16/poky-1d54d1c=
4736a114e1cecbe85a0306e3814d5ce70.tar.bz2
> +
> +openembedded-core
> +
> +-  Repository Location: :oe_git:`/openembedded-core`
> +-  Branch: :oe_git:`scarthgap </openembedded-core/log/?h=3Dscarthgap>`
> +-  Tag:  :oe_git:`yocto-5.0.16 </openembedded-core/log/?h=3Dyocto-5.0.16=
>`
> +-  Git Revision: :oe_git:`a1f4ae4e569bc0e36c27c1e4651e502e54d63b28 </ope=
nembedded-core/commit/?id=3Da1f4ae4e569bc0e36c27c1e4651e502e54d63b28>`
> +-  Release Artefact: oecore-a1f4ae4e569bc0e36c27c1e4651e502e54d63b28
> +-  sha: 10eefd2296206e5cbaf138de7dbd0dbe7bfc413618e924a123cd3f7f9a8418e0
> +-  Download Locations:
> +
> +   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/oecore=
-a1f4ae4e569bc0e36c27c1e4651e502e54d63b28.tar.bz2
> +
> +   https://mirrors.edge.kernel.org/yocto/yocto/yocto-5.0.16/oecore-a1f4a=
e4e569bc0e36c27c1e4651e502e54d63b28.tar.bz2
> +
> +meta-yocto
> +
> +-  Repository Location: :yocto_git:`/meta-yocto`
> +-  Branch: :yocto_git:`scarthgap </meta-yocto/log/?h=3Dscarthgap>`
> +-  Tag:  :yocto_git:`yocto-5.0.16 </meta-yocto/log/?h=3Dyocto-5.0.16>`
> +-  Git Revision: :yocto_git:`9bb6e6e8b016a0c9dfe290369a6ed91ef4020535 </=
meta-yocto/commit/?id=3D9bb6e6e8b016a0c9dfe290369a6ed91ef4020535>`
> +-  Release Artefact: meta-yocto-9bb6e6e8b016a0c9dfe290369a6ed91ef4020535
> +-  sha: d9cfd2192d12ebc55553bc421f3ab00d1f49c5f5c4c70e48923da695d19e8e2a
> +-  Download Locations:
> +
> +   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/meta-y=
octo-9bb6e6e8b016a0c9dfe290369a6ed91ef4020535.tar.bz2
> +
> +   https://mirrors.edge.kernel.org/yocto/yocto/yocto-5.0.16/meta-yocto-9=
bb6e6e8b016a0c9dfe290369a6ed91ef4020535.tar.bz2
> +
> +meta-mingw
> +
> +-  Repository Location: :yocto_git:`/meta-mingw`
> +-  Branch: :yocto_git:`scarthgap </meta-mingw/log/?h=3Dscarthgap>`
> +-  Tag:  :yocto_git:`yocto-5.0.16 </meta-mingw/log/?h=3Dyocto-5.0.16>`
> +-  Git Revision: :yocto_git:`bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f </=
meta-mingw/commit/?id=3Dbd9fef71ec005be3c3a6d7f8b99d8116daf70c4f>`
> +-  Release Artefact: meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
> +-  sha: ab073def6487f237ac125d239b3739bf02415270959546b6b287778664f0ae65
> +-  Download Locations:
> +
> +   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/meta-m=
ingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f.tar.bz2
> +
> +   https://mirrors.edge.kernel.org/yocto/yocto/yocto-5.0.16/meta-mingw-b=
d9fef71ec005be3c3a6d7f8b99d8116daf70c4f.tar.bz2
> +
> +bitbake
> +
> +-  Repository Location: :oe_git:`/bitbake`
> +-  Branch: :oe_git:`2.8 </bitbake/log/?h=3D2.8>`
> +-  Tag:  :oe_git:`yocto-5.0.16 </bitbake/log/?h=3Dyocto-5.0.16>`
> +-  Git Revision: :oe_git:`10118785e4a670bce4980e1044c0888a8b6e84af </bit=
bake/commit/?id=3D10118785e4a670bce4980e1044c0888a8b6e84af>`
> +-  Release Artefact: bitbake-10118785e4a670bce4980e1044c0888a8b6e84af
> +-  sha: 601a16210d7dc9b7a7306240d3e7013b3f950db8953fdd972151d715e050cc39
> +-  Download Locations:
> +
> +   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.16/bitbak=
e-10118785e4a670bce4980e1044c0888a8b6e84af.tar.bz2
> +
> +   https://mirrors.edge.kernel.org/yocto/yocto/yocto-5.0.16/bitbake-1011=
8785e4a670bce4980e1044c0888a8b6e84af.tar.bz2
> +

Thanks,
Antonin

