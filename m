Return-Path: <ypa.takayasu.ito@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD6CC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 11:05:08 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.9275.1704884700370511706
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jan 2024 03:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wfpyr6yE;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: ypa.takayasu.ito@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-6daf9d5f111so2557328b3a.0
        for <docs@lists.yoctoproject.org>; Wed, 10 Jan 2024 03:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704884699; x=1705489499; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tqePgoJuk5wpqwI3SlHYc9dy0tkbjMcxK6J7lTjVfW0=;
        b=Wfpyr6yErlZbzaFpozAyrK8nmRIy3wKNhVAqnlY4qB/mzzayK16tPse1OB8qPEdCec
         gzSvGkAEaEOmSu4cKwf0QaIP6rrPm0BQlCtk3H4I7W40H36eOBGion7ITKKhXCuKhE7Z
         DMFr3wg6hi/29kdk5bSmTJRnqIGKdfOxvLF2bxK50K9fwYLs2Mc3K9f8eEJPsan306I3
         OO4tYpC2CLt3q994dtAfX8k9HCGsUFmmspUzeUvu7oBcc42yOyipsqgOlLe0Hl8dzB+m
         /yg7l63WLyUh9q7urTGl+DeoGnwhO+5yMSmB19mEyU7rw/1qJ11npKBNmUxFBnqiXrC/
         45NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704884699; x=1705489499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tqePgoJuk5wpqwI3SlHYc9dy0tkbjMcxK6J7lTjVfW0=;
        b=GvTJ3LOjl4pAGjtzpt8+PdC7HpJmdemc3iV+6rcUFz5KSVbuScx2miX/9ENx+iKT9R
         /gl76WHxTYWDEhlZrs8ZlPDuQ4bktZYEE2rfDXwef47CpU/6dulzZUhNfCZ/+gauUUPr
         RxoZtcgRUkCUsRJ5tgLIStQ6+FJRyuHx8KILKN4Hnp7EU301tlU03M2SX2GFZQ/4aEEk
         +pypTD7J3JRkimdfGTIGwLvDFaw04s3yBRlOT34TyUTaV4pexIJsrBB3Wue4cNX0tmH5
         UOU8Bg4FRgn/nW/Yn56gfZaHcuveu60tkWHXPIGf8NUeDvGqdezk6/y8SuN8i5uDsvn7
         WNRA==
X-Gm-Message-State: AOJu0YxoFiLalRunyo+Kl8Dv4YiaB/i/l86jgRHEZsH+VMowIUhv/A9n
	Aiyo5hiACGnC2VSmbe0gmLIEpeZ9+LN/Dw==
X-Google-Smtp-Source: AGHT+IHA6fLuJ8+1HKjaVRhQAhAmQfk4blPt6v0z2XLwep+8VxlPsui1oiDuzalV90LYZ4Fl2jIQHA==
X-Received: by 2002:a05:6a00:9397:b0:6d9:b5ce:f17e with SMTP id ka23-20020a056a00939700b006d9b5cef17emr1055253pfb.5.1704884699104;
        Wed, 10 Jan 2024 03:04:59 -0800 (PST)
Received: from ?IPV6:2400:2412:6a60:8500:45d4:49e0:c4dc:20d0? ([2400:2412:6a60:8500:45d4:49e0:c4dc:20d0])
        by smtp.gmail.com with ESMTPSA id q19-20020aa79833000000b006d9bfb8a6casm3248316pfl.27.2024.01.10.03.04.58
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 03:04:58 -0800 (PST)
Message-ID: <a435ccb2-e6a3-4bd2-b516-db4ec10812a0@gmail.com>
Date: Wed, 10 Jan 2024 20:04:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] migration-guide: add release notes for 4.3.2
To: docs@lists.yoctoproject.org
References: <20240109124804.616460-1-chee.yang.lee@intel.com>
Content-Language: en-US
From: Takayasu Ito <ypa.takayasu.ito@gmail.com>
In-Reply-To: <20240109124804.616460-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Jan 2024 11:05:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4759

Hi Lee

Although not publicly available in the NVD database, there is a fix for CVE-2023-44446 in gst-plugins-bad.

https://gstreamer.freedesktop.org/releases/1.22/#1.22.8

https://gstreamer.freedesktop.org/security/


On 2024/01/09 21:48, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.3.rst          |   1 +
>   .../migration-guides/release-notes-4.3.2.rst  | 246 ++++++++++++++++++
>   2 files changed, 247 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.3.2.rst
>
> diff --git a/documentation/migration-guides/release-4.3.rst b/documentation/migration-guides/release-4.3.rst
> index 5b651a2ef..3adb5b620 100644
> --- a/documentation/migration-guides/release-4.3.rst
> +++ b/documentation/migration-guides/release-4.3.rst
> @@ -8,3 +8,4 @@ Release 4.3 (nanbield)
>      migration-4.3
>      release-notes-4.3
>      release-notes-4.3.1
> +   release-notes-4.3.2
> diff --git a/documentation/migration-guides/release-notes-4.3.2.rst b/documentation/migration-guides/release-notes-4.3.2.rst
> new file mode 100644
> index 000000000..8e6795d5b
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-4.3.2.rst
> @@ -0,0 +1,246 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release notes for Yocto-4.3.2 (Nanbield)
> +----------------------------------------
> +
> +Security Fixes in Yocto-4.3.2
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  avahi: Fix :cve:`2023-1981`, :cve:`2023-38469`, :cve:`2023-38470`, :cve:`2023-38471`, :cve:`2023-38472` and :cve:`2023-38473`
> +-  curl: Fix :cve:`2023-46218`
> +-  ghostscript: Fix :cve:`2023-46751`
> +-  grub: fix :cve:`2023-4692` and :cve:`2023-4693`
> +-  linux-yocto/6.1: Ignore :cve_mitre:`2023-39197`, :cve:`2023-39198`, :cve:`2023-5090`, :cve:`2023-5633`, :cve:`2023-6111`, :cve:`2023-6121` and :cve:`2023-6176`
> +-  linux-yocto/6.5: Ignore :cve:`2022-44034`, :cve_mitre:`2023-39197`, :cve:`2023-39198`, :cve:`2023-5972`, :cve:`2023-6039`, :cve:`2023-6111` and :cve:`2023-6176`
> +-  perl: fix :cve:`2023-47100`
> +-  python3-urllib3: Fix :cve:`2023-45803`
> +-  rust: Fix :cve:`2023-40030`
> +-  vim: Fix :cve:`2023-48231`, :cve:`2023-48232`, :cve:`2023-48233`, :cve:`2023-48234`, :cve:`2023-48235`, :cve:`2023-48236` and :cve:`2023-48237`
> +-  xserver-xorg: Fix :cve:`2023-5367` and :cve:`2023-5380`
> +-  xwayland: Fix :cve:`2023-5367`
> +
> +
> +Fixes in Yocto-4.3.2
> +~~~~~~~~~~~~~~~~~~~~
> +
> +-  base-passwd: Upgrade to 3.6.2
> +-  bind: Upgrade to 9.18.20
> +-  binutils: stable 2.41 branch updates
> +-  bitbake: command: Make parseRecipeFile() handle virtual recipes correctly
> +-  bitbake: lib/bb: Add workaround for libgcc issues with python 3.8 and 3.9
> +-  bitbake: toastergui: verify that an existing layer path is given
> +-  bluez5: fix connection for ps5/dualshock controllers
> +-  build-appliance-image: Update to nanbield head revision
> +-  cmake: Upgrade to 3.27.7
> +-  contributor-guide: add License-Update tag
> +-  contributor-guide: fix command option
> +-  cups: Add root,sys,wheel to system groups
> +-  cve-update-nvd2-native: faster requests with API keys
> +-  cve-update-nvd2-native: increase the delay between subsequent request failures
> +-  cve-update-nvd2-native: make number of fetch attemtps configurable
> +-  cve-update-nvd2-native: remove unused variable CVE_SOCKET_TIMEOUT
> +-  dev-manual: Discourage the use of SRC_URI[md5sum]
> +-  dev-manual: layers: update link to YP Compatible form
> +-  dev-manual: runtime-testing: fix test module name
> +-  devtool: finish/update-recipe: restrict mode srcrev to recipes fetched from SCM
> +-  devtool: fix update-recipe dry-run mode
> +-  ell: Upgrade to 0.60
> +-  enchant2: Upgrade to 2.6.2
> +-  ghostscript: Upgrade to 10.02.1
> +-  glib-2.0: Upgrade to 2.78.1
> +-  glibc: stable 2.38 branch updates
> +-  gstreamer1.0: Upgrade to 1.22.7
> +-  gtk: Add rdepend on printbackend for cups
> +-  harfbuzz: Upgrade to 8.2.2
> +-  json-c: fix icecc compilation
> +-  kern-tools: bump :term:`SRCREV` for queue processing changes
> +-  kern-tools: make lower context patches reproducible
> +-  kern-tools: update :term:`SRCREV` to include SECURITY.md file
> +-  kernel-arch: use ccache only for compiler
> +-  kernel-yocto: improve metadata patching
> +-  lib/oe/buildcfg.py: Include missing import
> +-  lib/oe/buildcfg.py: Remove unused parameter
> +-  lib/oe/patch: ensure os.chdir restoring always happens
> +-  lib/oe/path: Deploy files can start only with a dot
> +-  libgcrypt: Upgrade to 1.10.3
> +-  libjpeg-turbo: Upgrade to 3.0.1
> +-  libnewt: Upgrade to 0.52.24
> +-  libnsl2: Upgrade to 2.0.1
> +-  libsolv: Upgrade to 0.7.26
> +-  libxslt: Upgrade to 1.1.39
> +-  linux-firmware: add audio topology symlink to the X13's audio package
> +-  linux-firmware: add missing depenencies on license packages
> +-  linux-firmware: add new fw file to ${PN}-rtl8821
> +-  linux-firmware: add notice file to sdm845 modem firmware
> +-  linux-firmware: create separate packages
> +-  linux-firmware: package Qualcomm Venus 6.0 firmware
> +-  linux-firmware: package Robotics RB5 sensors DSP firmware
> +-  linux-firmware: package firmware for Qualcomm Adreno a702
> +-  linux-firmware: package firmware for Qualcomm QCM2290 / QRB4210
> +-  linux-firmware: Upgrade to 20231030
> +-  linux-yocto-rt/6.1: update to -rt18
> +-  linux-yocto/6.1: cfg: restore CONFIG_DEVMEM
> +-  linux-yocto/6.1: drop removed IMA option
> +-  linux-yocto/6.1: Upgrade to v6.1.68
> +-  linux-yocto/6.5: cfg: restore CONFIG_DEVMEM
> +-  linux-yocto/6.5: cfg: split runtime and symbol debug
> +-  linux-yocto/6.5: drop removed IMA option
> +-  linux-yocto/6.5: fix AB-INT: QEMU kernel panic: No irq handler for vector
> +-  linux-yocto/6.5: Upgrade to v6.5.13
> +-  linux/cve-exclusion6.1: Update to latest kernel point release
> +-  log4cplus: Upgrade to 2.1.1
> +-  lsb-release: use https for :term:`UPSTREAM_CHECK_URI`
> +-  manuals: brief-yoctoprojectqs: align variable order with default local.conf
> +-  manuals: fix URL
> +-  meson: use correct targets for rust binaries
> +-  migration-guide: add release notes for 4.0.14, 4.0.15, 4.2.4, 4.3.1
> +-  migration-guides: release 3.5 is actually 4.0
> +-  migration-guides: reword fix in release-notes-4.3.1
> +-  msmtp: Upgrade to 1.8.25
> +-  oeqa/selftest/tinfoil: Add tests that parse virtual recipes
> +-  openssl: improve handshake test error reporting
> +-  package_ipk: Fix Source: field variable dependency
> +-  patchtest: shorten patch signed-off-by test output
> +-  perf: lift :term:`TARGET_CC_ARCH` modification out of security_flags.inc
> +-  perl: Upgrade to 5.38.2
> +-  perlcross: Upgrade to 1.5.2
> +-  poky.conf: bump version for 4.3.2 release
> +-  python3-ptest: skip test_storlines
> +-  python3-urllib3: Upgrade to 2.0.7
> +-  qemu: Upgrade to 8.1.2
> +-  ref-manual: Fix reference to MIRRORS/PREMIRRORS defaults
> +-  ref-manual: releases.svg: update nanbield release status
> +-  useradd_base: sed -i destroys symlinks
> +-  rootfs-postcommands: sed -i destroys symlinks
> +-  sstate: Ensure sstate searches update file mtime
> +-  strace: backport fix for so_peerpidfd-test
> +-  systemd-boot: Fix build issues on armv7a-linux
> +-  systemd-compat-units.bb: fix postinstall script
> +-  systemd: fix DynamicUser issue
> +-  systemd: update :term:`LICENSE` statement
> +-  tcl: skip async and event tests in run-ptest
> +-  tcl: skip timing-dependent tests in run-ptest
> +-  test-manual: add links to python unittest
> +-  test-manual: add or improve hyperlinks
> +-  test-manual: explicit or fix file paths
> +-  test-manual: resource updates
> +-  test-manual: text and formatting fixes
> +-  test-manual: use working example
> +-  testimage: Drop target_dumper and most of monitor_dumper
> +-  testimage: Exclude wtmp from target-dumper commands
> +-  tzdata: Upgrade to 2023d
> +-  update_gtk_icon_cache: Fix for GTK4-only builds
> +-  useradd_base: Fix sed command line for passwd-expire
> +-  vim: Upgrade to 9.0.2130
> +-  xserver-xorg: Upgrade to 21.1.9
> +-  xwayland: Upgrade to 23.2.2
> +
> +
> +Known Issues in Yocto-4.3.2
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +- N/A
> +
> +Contributors to Yocto-4.3.2
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  Adam Johnston
> +-  Alexander Kanavin
> +-  Anuj Mittal
> +-  Bastian Krause
> +-  Bruce Ashfield
> +-  Chen Qi
> +-  Deepthi Hemraj
> +-  Dhairya Nagodra
> +-  Dmitry Baryshkov
> +-  Fahad Arslan
> +-  Javier Tia
> +-  Jermain Horsman
> +-  Joakim Tjernlund
> +-  Julien Stephan
> +-  Justin Bronder
> +-  Khem Raj
> +-  Lee Chee Yang
> +-  Marco Felsch
> +-  Markus Volk
> +-  Marta Rybczynska
> +-  Massimiliano Minella
> +-  Michael Opdenacker
> +-  Paul Barker
> +-  Peter Kjellerstedt
> +-  Peter Marko
> +-  Randy MacLeod
> +-  Rasmus Villemoes
> +-  Richard Purdie
> +-  Ross Burton
> +-  Shubham Kulkarni
> +-  Simone Weiß
> +-  Steve Sakoman
> +-  Sundeep KOKKONDA
> +-  Tim Orling
> +-  Trevor Gamblin
> +-  Vijay Anusuri
> +-  Viswanath Kraleti
> +-  Vyacheslav Yurkov
> +-  Wang Mingyu
> +-  William Lyu
> +-  Zoltán Böszörményi
> +
> +Repositories / Downloads for Yocto-4.3.2
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +poky
> +
> +-  Repository Location: :yocto_git:`/poky`
> +-  Branch: :yocto_git:`nanbield </poky/log/?h=nanbield>`
> +-  Tag:  :yocto_git:`yocto-4.3.2 </poky/log/?h=yocto-4.3.2>`
> +-  Git Revision: :yocto_git:`f768ffb8916feb6542fcbe3e946cbf30e247b151 </poky/commit/?id=f768ffb8916feb6542fcbe3e946cbf30e247b151>`
> +-  Release Artefact: poky-f768ffb8916feb6542fcbe3e946cbf30e247b151
> +-  sha: 21ca1695d70aba9b4bd8626d160111feab76206883cd14fe41eb024692bdfd7b
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3.2/poky-f768ffb8916feb6542fcbe3e946cbf30e247b151.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-4.3.2/poky-f768ffb8916feb6542fcbe3e946cbf30e247b151.tar.bz2
> +
> +openembedded-core
> +
> +-  Repository Location: :oe_git:`/openembedded-core`
> +-  Branch: :oe_git:`nanbield </openembedded-core/log/?h=nanbield>`
> +-  Tag:  :oe_git:`yocto-4.3.2 </openembedded-core/log/?h=yocto-4.3.2>`
> +-  Git Revision: :oe_git:`ff595b937d37d2315386aebf315cea719e2362ea </openembedded-core/commit/?id=ff595b937d37d2315386aebf315cea719e2362ea>`
> +-  Release Artefact: oecore-ff595b937d37d2315386aebf315cea719e2362ea
> +-  sha: a7c6332dc0e09ecc08221e78b11151e8e2a3fd9fa3eaad96a4c03b67012bfb97
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3.2/oecore-ff595b937d37d2315386aebf315cea719e2362ea.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-4.3.2/oecore-ff595b937d37d2315386aebf315cea719e2362ea.tar.bz2
> +
> +meta-mingw
> +
> +-  Repository Location: :yocto_git:`/meta-mingw`
> +-  Branch: :yocto_git:`nanbield </meta-mingw/log/?h=nanbield>`
> +-  Tag:  :yocto_git:`yocto-4.3.2 </meta-mingw/log/?h=yocto-4.3.2>`
> +-  Git Revision: :yocto_git:`49617a253e09baabbf0355bc736122e9549c8ab2 </meta-mingw/commit/?id=49617a253e09baabbf0355bc736122e9549c8ab2>`
> +-  Release Artefact: meta-mingw-49617a253e09baabbf0355bc736122e9549c8ab2
> +-  sha: 2225115b73589cdbf1e491115221035c6a61679a92a93b2a3cf761ff87bf4ecc
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3.2/meta-mingw-49617a253e09baabbf0355bc736122e9549c8ab2.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-4.3.2/meta-mingw-49617a253e09baabbf0355bc736122e9549c8ab2.tar.bz2
> +
> +bitbake
> +
> +-  Repository Location: :oe_git:`/bitbake`
> +-  Branch: :oe_git:`2.6 </bitbake/log/?h=2.6>`
> +-  Tag:  :oe_git:`yocto-4.3.2 </bitbake/log/?h=yocto-4.3.2>`
> +-  Git Revision: :oe_git:`72bf75f0b2e7f36930185e18a1de8277ce7045d8 </bitbake/commit/?id=72bf75f0b2e7f36930185e18a1de8277ce7045d8>`
> +-  Release Artefact: bitbake-72bf75f0b2e7f36930185e18a1de8277ce7045d8
> +-  sha: 0b6ccd4796ccd211605090348a3d4378358c839ae1bb4c35964d0f36f2663187
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-4.3.2/bitbake-72bf75f0b2e7f36930185e18a1de8277ce7045d8.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-4.3.2/bitbake-72bf75f0b2e7f36930185e18a1de8277ce7045d8.tar.bz2
> +
> +yocto-docs
> +
> +-  Repository Location: :yocto_git:`/yocto-docs`
> +-  Branch: :yocto_git:`nanbield </yocto-docs/log/?h=nanbield>`
> +-  Tag: :yocto_git:`yocto-4.3.2 </yocto-docs/log/?h=yocto-4.3.2>`
> +-  Git Revision: :yocto_git:`fac88b9e80646a68b31975c915a718a9b6b2b439 </yocto-docs/commit/?id=fac88b9e80646a68b31975c915a718a9b6b2b439>`
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4755): https://lists.yoctoproject.org/g/docs/message/4755
> Mute This Topic: https://lists.yoctoproject.org/mt/103618589/7581020
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [ypa.takayasu.ito@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
Takayasu Ito
Yocto Project Ambassador
ypa.takayasu.ito@gmail.com


