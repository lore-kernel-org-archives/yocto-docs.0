Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.14169.1608656333017874350
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 08:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZMMAoLYT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id z12so1609639pjn.1
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 08:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=y3s++O9CgauWKbMD+xcZFsJ8Mb8DFHkYY2g4KraCjpo=;
        b=ZMMAoLYTbdEWbBgwgUaELN0TwWbLQA7cfQZJowUfj3EkVYQsBDbmjsIqSBPbAp9ALG
         chAAFrXDhcOMHuQWb3zPnMBJr9AZFWm7/XwrNqnOAu7qK0ASXxx5sQymHAvXZVQyb9dh
         SIYOVJ1oxzDQ+bXLXU2sZGabES+JCCy+OfQW9GEaM5W9c4FzQjDdn8T7YFIAwsO+0mGP
         Iyh/xDi79lss4/e00OeQpBgbDAfpSZX4mIy1/pXNXib+5cqErv3kVJPVjv0wpHzijcpV
         1cGLNEPapY/LSheAXyfMRUZJjKuRvlZulaOrUtsFsZQWmuQo2XmfHdPCB/dymG2Tw0di
         o0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=y3s++O9CgauWKbMD+xcZFsJ8Mb8DFHkYY2g4KraCjpo=;
        b=kAEpMXV+0lhtbmudUHdtOXPYPIVPAC/ISClBoHZZBNXDDR9+x97Sr8Iw3jmxG3Suey
         s1qYEnw1BsFxeGZoMtiyuYFqE6UQUG6Ghm5mOPqtDC+fZ8NMLQ+MNlCDhsZQmwYEibdy
         DeaUB4p1CpGtNQJvwpvhq4Z5Ii4loLmASojx8Ps6cVeUYU2pMPCFvTMa5uoZRdNPplaP
         mfK4gjcfMil+CIHofWMEbs/DkGCW8apPL7Y/BMNIPQw6UuElmGkXsA2l1KHP6wWxSJy+
         mLAkxp9/Mu+E6rW3b7DUboh4LHUwIMVBZnBiIi/XKEdKdjgmU/PGntvBpOqx1wWOViV4
         fwiQ==
X-Gm-Message-State: AOAM532qF6k+j3HB4AVeAJlj6rXwWzp/gKE1MYEC5A5pEuH57t4Nm1U+
	YZi08vNFQF999YRo1FlacJx4jefrwqmADnR+
X-Google-Smtp-Source: ABdhPJxsHUjRMdLCOlHBIvRyTd3QRPq1GNCvQVzsXICb3MP6wx5Iq8Xn9Qrw3SV8DK70zjAjQT6aeA==
X-Received: by 2002:a17:902:7b98:b029:db:fab3:e74b with SMTP id w24-20020a1709027b98b02900dbfab3e74bmr21545111pll.27.1608656331389;
        Tue, 22 Dec 2020 08:58:51 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id m8sm20216716pjr.39.2020.12.22.08.58.49
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 08:58:50 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 00/48] Pull request (cover letter only)
Date: Tue, 22 Dec 2020 06:58:41 -1000
Message-Id: <cover.1608656278.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 8910ac1c7425bf6f3e1309571c620960d4456033:

  Documenation: Prepared for the 3.1.4 release (2020-11-13 17:02:30 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/dunfell-next
  http://git.yoctoproject.org/cgit.cgi/yocto-docs/log/?h=contrib/dunfell-next

Joshua Watt (3):
  ref-variables: Given example for naming sources
  ref-manual: Document wic --offset option
  documentation: Add Pipenv support

Naoki Hayama (1):
  dev/test/ref-manual: Fix typos

Nicolas Dechesne (12):
  sphinx: import docs
  sphinx: undo (ref-system-requirements: update supported hosts lists)
  sphinx: reintroduce changes for 3.1.1, 3.1.2, 3.1.3 and 3.1.4
  sphinx: remove test-manual
  sphinx: fix up some trademark and branding issues
  sphinx: remove DocBook files
  sphinx: rename Makefile.sphinx
  sdk-manual: use built-in footnotes
  sphinx: add 3.1.3 and 3.0.4 release in the switcher
  poky.yaml: remove unused variables
  Makefile: enable parallel build
  conf.py: set version to 3.1.4

Paul Barker (1):
  conf.py: Improve TOC and Outline depth in PDF output

Paul Eggleton (5):
  ref-manual: add reference anchors for each QA check
  ref-manual: fix for features_check class change
  ref-manual: add IMAGE_VERSION_SUFFIX variable
  ref-manual: add IMAGE_NAME_SUFFIX variable
  ref-manual: add IMAGE_LINK_NAME

Quentin Schulz (20):
  docs: ref-manual: ref-variables: fix one-letter pointer links in
    glossary
  docs: ref-manual: ref-variables: fix alphabetical order in glossary
  docs: ref-manual: ref-variables: add links to terms in glossary
  docs: poky.yaml: use HTTPS for links
  docs: ref-manual: indentation, links and highlights fixes
  docs: remove OE_INIT_FILE variable
  docs: ref-manual: fix typos
  docs: ref-manual: migration-2.3: specify 2.3 version instead of DISTRO
  docs: ref-manual: ref-classes: remove dropped tinderclient class
  docs: ref-manual: ref-system-requirements: update requirements to
    build Sphinx docs
  docs: sphinx: yocto-vars: rebuild files when poky.yaml has changed
  docs: poky.yaml: fix identation in host packages variables
  docs: dev-manual-common-tasks: remove paragraph about race when
    missing DEPENDS
  docs: dev-manual-common-tasks: update python webserver example to
    python3
  docs: dev-manual: fix typos, highlights, indentation and links
  docs: ref-manual: ref-terms: add links to terms in glossary
  docs: bsp-guide: bsp: fix typos, highlights and links
  docs: kernel-dev: fix typos, highlights and links
  docs: kernel-dev-common: add .patch file extension to SRC_URI files
  docs: kernel-dev-faq: update outdated RDEPENDS_kernel-base

Richard Purdie (3):
  docs: Fix license CC-BY-2.0-UK -> CC-BY-SA-2.0-UK
  ref-manual/faq: Add entry for why binaries are changed in images
  dev-manual: Add a note about prelink changing prebuild binaries

Robert P. J. Day (3):
  ref-manual/ref-variables: "PACKAGE_FEEDS_ARCHS" ->
    "PACKAGE_FEED_ARCHS"
  README: "yocto-project-qs" -> "brief-yoctoprojectqs"
  adt-manual: delete obsolete ADT manual, and related content

 .gitignore                                    |    52 +-
 documentation/.gitignore                      |     2 +
 documentation/Makefile                        |   448 +-
 documentation/Pipfile                         |    14 +
 documentation/README                          |   308 +-
 documentation/_templates/breadcrumbs.html     |    14 +
 documentation/_templates/footer.html          |    12 +
 documentation/_templates/layout.html          |     7 +
 documentation/adt-manual/adt-command.xml      |   265 -
 documentation/adt-manual/adt-intro.xml        |   180 -
 .../adt-manual/adt-manual-customization.xsl   |    27 -
 .../adt-manual-eclipse-customization.xsl      |    35 -
 documentation/adt-manual/adt-manual-intro.xml |    33 -
 documentation/adt-manual/adt-manual.xml       |   140 -
 documentation/adt-manual/adt-package.xml      |   102 -
 documentation/adt-manual/adt-prepare.xml      |   999 -
 documentation/adt-manual/adt-style.css        |   984 -
 .../adt-manual/figures/adt-title.png          |   Bin 13498 -> 0 bytes
 .../figures/using-a-pre-built-image.png       |   Bin 12733 -> 0 bytes
 documentation/boilerplate.rst                 |    18 +
 .../brief-yoctoprojectqs-customization.xsl    |    24 -
 .../brief-yoctoprojectqs-style.css            |   989 -
 .../brief-yoctoprojectqs-titlepage.xsl        |  3820 ----
 .../brief-yoctoprojectqs.rst                  |   430 +
 .../brief-yoctoprojectqs.xml                  |   576 -
 .../bsp-guide/bsp-guide-customization.xsl     |    27 -
 documentation/bsp-guide/bsp-guide.rst         |    16 +
 documentation/bsp-guide/bsp-guide.xml         |   221 -
 documentation/bsp-guide/bsp-style.css         |   987 -
 documentation/bsp-guide/bsp.rst               |  1531 ++
 documentation/bsp-guide/bsp.xml               |  2258 ---
 documentation/bsp-guide/history.rst           |    85 +
 documentation/conf.py                         |   131 +
 .../dev-manual/dev-manual-common-tasks.rst    | 11687 +++++++++++
 .../dev-manual/dev-manual-common-tasks.xml    | 16022 ---------------
 .../dev-manual/dev-manual-customization.xsl   |    27 -
 documentation/dev-manual/dev-manual-intro.rst |    61 +
 documentation/dev-manual/dev-manual-intro.xml |   103 -
 documentation/dev-manual/dev-manual-qemu.rst  |   477 +
 documentation/dev-manual/dev-manual-qemu.xml  |   690 -
 documentation/dev-manual/dev-manual-start.rst |   925 +
 documentation/dev-manual/dev-manual-start.xml |  1287 --
 documentation/dev-manual/dev-manual.rst       |    19 +
 documentation/dev-manual/dev-manual.xml       |   214 -
 documentation/dev-manual/dev-style.css        |   988 -
 documentation/dev-manual/history.rst          |    79 +
 .../figures/yp-how-it-works-new-diagram.png   |   Bin 0 -> 249657 bytes
 documentation/genindex.rst                    |     3 +
 documentation/index.rst                       |    52 +
 documentation/kernel-dev/history.rst          |    70 +
 .../kernel-dev/kernel-dev-advanced.rst        |   957 +
 .../kernel-dev/kernel-dev-advanced.xml        |  1256 --
 .../kernel-dev/kernel-dev-common.rst          |  2031 ++
 .../kernel-dev/kernel-dev-common.xml          |  2729 ---
 .../kernel-dev/kernel-dev-concepts-appx.rst   |   425 +
 .../kernel-dev/kernel-dev-concepts-appx.xml   |   621 -
 .../kernel-dev/kernel-dev-customization.xsl   |    26 -
 documentation/kernel-dev/kernel-dev-faq.rst   |    80 +
 documentation/kernel-dev/kernel-dev-faq.xml   |   142 -
 documentation/kernel-dev/kernel-dev-intro.rst |   182 +
 documentation/kernel-dev/kernel-dev-intro.xml |   259 -
 .../kernel-dev/kernel-dev-maint-appx.rst      |   239 +
 .../kernel-dev/kernel-dev-maint-appx.xml      |   356 -
 documentation/kernel-dev/kernel-dev-style.css |   988 -
 documentation/kernel-dev/kernel-dev.rst       |    21 +
 documentation/kernel-dev/kernel-dev.xml       |   206 -
 .../mega-manual/figures/YP-flow-diagram.png   |   Bin 185562 -> 0 bytes
 .../mega-manual/figures/add-variable.png      |   Bin 110712 -> 0 bytes
 .../analysis-for-package-splitting.png        |   Bin 68434 -> 0 bytes
 .../mega-manual/figures/bash-oecore.png       |   Bin 138198 -> 0 bytes
 .../figures/bb_multiconfig_files.png          |   Bin 19991 -> 0 bytes
 .../figures/bitbake-build-flow.png            |   Bin 49242 -> 0 bytes
 .../mega-manual/figures/bitbake-title.png     |   Bin 5086 -> 0 bytes
 .../mega-manual/figures/bsp-dev-flow.png      |   Bin 52657 -> 0 bytes
 .../mega-manual/figures/bsp-title.png         |   Bin 17388 -> 0 bytes
 .../figures/build-workspace-directory.png     |   Bin 29627 -> 0 bytes
 .../mega-manual/figures/buildhistory-web.png  |   Bin 49966 -> 0 bytes
 .../mega-manual/figures/buildhistory.png      |   Bin 44900 -> 0 bytes
 .../mega-manual/figures/building-an-image.png |   Bin 14891 -> 0 bytes
 .../mega-manual/figures/bypqs-title.png       |   Bin 14312 -> 0 bytes
 .../mega-manual/figures/compatible-layers.png |   Bin 163081 -> 0 bytes
 .../figures/concepts-manual-title.png         |   Bin 11920 -> 0 bytes
 .../configuration-compile-autoreconf.png      |   Bin 70877 -> 0 bytes
 .../figures/cross-development-toolchains.png  |   Bin 82633 -> 0 bytes
 .../figures/cute-files-npm-example.png        |   Bin 26248 -> 0 bytes
 .../mega-manual/figures/define-generic.png    |   Bin 623 -> 0 bytes
 .../mega-manual/figures/dev-title.png         |   Bin 15950 -> 0 bytes
 .../mega-manual/figures/git-workflow.png      |   Bin 26586 -> 0 bytes
 .../mega-manual/figures/hosted-service.png    |   Bin 13552 -> 0 bytes
 .../mega-manual/figures/image-generation.png  |   Bin 123348 -> 0 bytes
 documentation/mega-manual/figures/images.png  |   Bin 32674 -> 0 bytes
 .../mega-manual/figures/import-layer.png      |   Bin 139108 -> 0 bytes
 .../mega-manual/figures/index-downloads.png   |   Bin 18142 -> 0 bytes
 .../figures/kernel-architecture-overview.png  |   Bin 40748 -> 0 bytes
 .../mega-manual/figures/kernel-dev-flow.png   |   Bin 53197 -> 0 bytes
 .../mega-manual/figures/kernel-dev-title.png  |   Bin 13453 -> 0 bytes
 .../mega-manual/figures/kernel-overview-1.png |   Bin 35839 -> 0 bytes
 .../figures/kernel-overview-2-generic.png     |   Bin 49230 -> 0 bytes
 .../mega-manual/figures/kernel-title.png      |   Bin 13970 -> 0 bytes
 .../mega-manual/figures/kernelshark-all.png   |   Bin 89316 -> 0 bytes
 .../figures/kernelshark-choose-events.png     |   Bin 57372 -> 0 bytes
 .../figures/kernelshark-i915-display.png      |   Bin 98765 -> 0 bytes
 .../figures/kernelshark-output-display.png    |   Bin 204454 -> 0 bytes
 .../mega-manual/figures/key-dev-elements.png  |   Bin 20424 -> 0 bytes
 .../mega-manual/figures/layer-input.png       |   Bin 62330 -> 0 bytes
 .../mega-manual/figures/mega-title.png        |   Bin 10536 -> 0 bytes
 .../mega-manual/figures/multiconfig_files.png |   Bin 18611 -> 0 bytes
 .../mega-manual/figures/new-project.png       |   Bin 73760 -> 0 bytes
 .../figures/oprofileui-busybox.png            |   Bin 98334 -> 0 bytes
 .../figures/oprofileui-copy-to-user.png       |   Bin 105661 -> 0 bytes
 .../figures/oprofileui-downloading.png        |   Bin 37301 -> 0 bytes
 .../figures/oprofileui-processes.png          |   Bin 95741 -> 0 bytes
 .../figures/overview-manual-title.png         |   Bin 17387 -> 0 bytes
 .../mega-manual/figures/package-feeds.png     |   Bin 42239 -> 0 bytes
 .../mega-manual/figures/patching.png          |   Bin 57414 -> 0 bytes
 .../figures/perf-probe-do_fork-profile.png    |   Bin 59078 -> 0 bytes
 .../figures/perf-report-cycles-u.png          |   Bin 171368 -> 0 bytes
 .../figures/perf-systemwide-libc.png          |   Bin 136826 -> 0 bytes
 .../mega-manual/figures/perf-systemwide.png   |   Bin 140616 -> 0 bytes
 .../perf-wget-busybox-annotate-menu.png       |   Bin 22364 -> 0 bytes
 .../perf-wget-busybox-annotate-udhcpc.png     |   Bin 171529 -> 0 bytes
 .../figures/perf-wget-busybox-debuginfo.png   |   Bin 174971 -> 0 bytes
 .../perf-wget-busybox-dso-zoom-menu.png       |   Bin 23735 -> 0 bytes
 .../figures/perf-wget-busybox-dso-zoom.png    |   Bin 101685 -> 0 bytes
 .../perf-wget-busybox-expanded-stripped.png   |   Bin 95140 -> 0 bytes
 .../figures/perf-wget-flat-stripped.png       |   Bin 178919 -> 0 bytes
 ...get-g-copy-from-user-expanded-stripped.png |   Bin 138550 -> 0 bytes
 ...wget-g-copy-to-user-expanded-debuginfo.png |   Bin 102790 -> 0 bytes
 ...er-expanded-stripped-unresolved-hidden.png |   Bin 110101 -> 0 bytes
 ...-wget-g-copy-to-user-expanded-stripped.png |   Bin 102812 -> 0 bytes
 .../figures/poky-reference-distribution.png   |   Bin 23784 -> 0 bytes
 .../mega-manual/figures/poky-title.png        |   Bin 11592 -> 0 bytes
 .../mega-manual/figures/profile-title.png     |   Bin 12799 -> 0 bytes
 .../figures/pybootchartgui-linux-yocto.png    |   Bin 36366 -> 0 bytes
 .../pychart-linux-yocto-rpm-nostrip.png       |   Bin 98053 -> 0 bytes
 .../figures/pychart-linux-yocto-rpm.png       |   Bin 81053 -> 0 bytes
 .../mega-manual/figures/recipe-workflow.png   |   Bin 48276 -> 0 bytes
 .../figures/sched-wakeup-profile.png          |   Bin 123810 -> 0 bytes
 .../figures/sdk-autotools-flow.png            |   Bin 50443 -> 0 bytes
 .../figures/sdk-devtool-add-flow.png          |   Bin 181699 -> 0 bytes
 .../figures/sdk-devtool-modify-flow.png       |   Bin 171676 -> 0 bytes
 .../figures/sdk-devtool-upgrade-flow.png      |   Bin 138917 -> 0 bytes
 .../mega-manual/figures/sdk-environment.png   |   Bin 42098 -> 0 bytes
 .../mega-manual/figures/sdk-generation.png    |   Bin 60574 -> 0 bytes
 ...sdk-installed-extensible-sdk-directory.png |   Bin 66753 -> 0 bytes
 .../sdk-installed-standard-sdk-directory.png  |   Bin 39099 -> 0 bytes
 .../mega-manual/figures/sdk-makefile-flow.png |   Bin 47197 -> 0 bytes
 .../mega-manual/figures/sdk-title.png         |   Bin 31039 -> 0 bytes
 documentation/mega-manual/figures/sdk.png     |   Bin 49804 -> 0 bytes
 .../mega-manual/figures/set-variable.png      |   Bin 111430 -> 0 bytes
 .../figures/simple-configuration.png          |   Bin 10789 -> 0 bytes
 .../mega-manual/figures/source-fetching.png   |   Bin 46896 -> 0 bytes
 .../mega-manual/figures/source-input.png      |   Bin 51170 -> 0 bytes
 .../mega-manual/figures/source-repos.png      |   Bin 167009 -> 0 bytes
 .../mega-manual/figures/sysprof-callers.png   |   Bin 145043 -> 0 bytes
 .../figures/sysprof-copy-from-user.png        |   Bin 132976 -> 0 bytes
 .../figures/sysprof-copy-to-user.png          |   Bin 132074 -> 0 bytes
 .../mega-manual/figures/toaster-title.png     |   Bin 9277 -> 0 bytes
 .../figures/user-configuration.png            |   Bin 51171 -> 0 bytes
 .../figures/using-a-pre-built-image.png       |   Bin 12733 -> 0 bytes
 .../mega-manual/figures/variable-added.png    |   Bin 112163 -> 0 bytes
 .../figures/yocto-project-transp.png          |   Bin 8626 -> 0 bytes
 .../mega-manual/figures/yp-download.png       |   Bin 82939 -> 0 bytes
 .../mega-manual/mega-manual-customization.xsl |    42 -
 documentation/mega-manual/mega-manual.xml     |   382 -
 documentation/mega-manual/mega-style.css      |   989 -
 documentation/overview-manual/history.rst     |    40 +
 .../overview-manual-concepts.rst              |  2185 ++
 .../overview-manual-concepts.xml              |  3234 ---
 .../overview-manual-customization.xsl         |    27 -
 ...verview-manual-development-environment.rst |   672 +
 ...verview-manual-development-environment.xml |   953 -
 .../overview-manual/overview-manual-intro.rst |    74 +
 .../overview-manual/overview-manual-intro.xml |   112 -
 .../overview-manual/overview-manual-style.css |   988 -
 .../overview-manual-yp-intro.rst              |   941 +
 .../overview-manual-yp-intro.xml              |  1332 --
 .../overview-manual/overview-manual.rst       |    19 +
 .../overview-manual/overview-manual.xml       |   149 -
 documentation/poky.ent                        |    89 -
 documentation/poky.yaml                       |    41 +
 documentation/profile-manual/history.rst      |    70 +
 .../profile-manual/profile-manual-arch.rst    |    29 +
 .../profile-manual/profile-manual-arch.xml    |    45 -
 .../profile-manual-customization.xsl          |    27 -
 .../profile-manual-examples.rst               |    24 +
 .../profile-manual-examples.xml               |    39 -
 .../profile-manual/profile-manual-intro.rst   |    79 +
 .../profile-manual/profile-manual-intro.xml   |   106 -
 .../profile-manual/profile-manual-style.css   |   984 -
 .../profile-manual/profile-manual-usage.rst   |  2624 +++
 .../profile-manual/profile-manual-usage.xml   |  2985 ---
 .../profile-manual/profile-manual.rst         |    19 +
 .../profile-manual/profile-manual.xml         |   199 -
 .../examples/hello-autotools/hello_2.10.bb    |     9 +
 .../examples/hello-autotools/hello_2.3.bb     |     8 -
 .../examples/libxpm/libxpm_3.5.6.bb           |     2 +-
 documentation/ref-manual/faq.rst              |   464 +
 documentation/ref-manual/faq.xml              |   835 -
 documentation/ref-manual/history.rst          |    86 +
 documentation/ref-manual/migration-1.3.rst    |   195 +
 documentation/ref-manual/migration-1.4.rst    |   237 +
 documentation/ref-manual/migration-1.5.rst    |   353 +
 documentation/ref-manual/migration-1.6.rst    |   416 +
 documentation/ref-manual/migration-1.7.rst    |   223 +
 documentation/ref-manual/migration-1.8.rst    |   183 +
 documentation/ref-manual/migration-2.0.rst    |   281 +
 documentation/ref-manual/migration-2.1.rst    |   436 +
 documentation/ref-manual/migration-2.2.rst    |   450 +
 documentation/ref-manual/migration-2.3.rst    |   523 +
 documentation/ref-manual/migration-2.4.rst    |   327 +
 documentation/ref-manual/migration-2.5.rst    |   310 +
 documentation/ref-manual/migration-2.6.rst    |   457 +
 documentation/ref-manual/migration-2.7.rst    |   180 +
 documentation/ref-manual/migration-3.0.rst    |   320 +
 documentation/ref-manual/migration-3.1.rst    |   276 +
 .../ref-manual/migration-general.rst          |    54 +
 documentation/ref-manual/migration.rst        |    30 +
 documentation/ref-manual/migration.xml        |  7300 -------
 documentation/ref-manual/ref-classes.rst      |  2909 +++
 documentation/ref-manual/ref-classes.xml      |  3893 ----
 .../ref-manual/ref-devtool-reference.rst      |   631 +
 .../ref-manual/ref-devtool-reference.xml      |   841 -
 documentation/ref-manual/ref-features.rst     |   350 +
 documentation/ref-manual/ref-features.xml     |   460 -
 documentation/ref-manual/ref-images.rst       |   138 +
 documentation/ref-manual/ref-images.xml       |   169 -
 documentation/ref-manual/ref-kickstart.rst    |   216 +
 documentation/ref-manual/ref-kickstart.xml    |   334 -
 .../ref-manual/ref-manual-customization.xsl   |    29 -
 documentation/ref-manual/ref-manual.rst       |    31 +
 documentation/ref-manual/ref-manual.xml       |   252 -
 documentation/ref-manual/ref-qa-checks.rst    |   568 +
 documentation/ref-manual/ref-qa-checks.xml    |  1199 --
 .../ref-manual/ref-release-process.rst        |   191 +
 .../ref-manual/ref-release-process.xml        |   255 -
 documentation/ref-manual/ref-structure.rst    |   874 +
 documentation/ref-manual/ref-structure.xml    |  1122 --
 documentation/ref-manual/ref-style.css        |  1032 -
 .../ref-manual/ref-system-requirements.rst    |   446 +
 .../ref-manual/ref-system-requirements.xml    |   578 -
 documentation/ref-manual/ref-tasks.rst        |   858 +
 documentation/ref-manual/ref-tasks.xml        |  1130 --
 documentation/ref-manual/ref-terms.rst        |   394 +
 documentation/ref-manual/ref-terms.xml        |   524 -
 documentation/ref-manual/ref-variables.rst    |  8739 ++++++++
 documentation/ref-manual/ref-variables.xml    | 16700 ----------------
 documentation/ref-manual/ref-varlocality.rst  |   166 +
 documentation/ref-manual/ref-varlocality.xml  |   198 -
 documentation/ref-manual/resources.rst        |   197 +
 documentation/ref-manual/resources.xml        |   297 -
 documentation/releases.rst                    |   188 +
 documentation/sdk-manual/history.rst          |    52 +
 .../sdk-appendix-customizing-standard.rst     |    34 +
 .../sdk-appendix-customizing-standard.xml     |    58 -
 .../sdk-manual/sdk-appendix-customizing.rst   |   377 +
 .../sdk-manual/sdk-appendix-customizing.xml   |   514 -
 .../sdk-manual/sdk-appendix-obtain.rst        |   321 +
 .../sdk-manual/sdk-appendix-obtain.xml        |   443 -
 documentation/sdk-manual/sdk-extensible.rst   |  1356 ++
 documentation/sdk-manual/sdk-extensible.xml   |  1846 --
 documentation/sdk-manual/sdk-intro.rst        |   224 +
 documentation/sdk-manual/sdk-intro.xml        |   352 -
 .../sdk-manual/sdk-manual-customization.xsl   |    26 -
 documentation/sdk-manual/sdk-manual.rst       |    22 +
 documentation/sdk-manual/sdk-manual.xml       |   178 -
 documentation/sdk-manual/sdk-style.css        |   988 -
 documentation/sdk-manual/sdk-using.rst        |   159 +
 documentation/sdk-manual/sdk-using.xml        |   200 -
 .../sdk-manual/sdk-working-projects.rst       |   423 +
 .../sdk-manual/sdk-working-projects.xml       |   510 -
 .../sphinx-static/YoctoProject_Logo_RGB.jpg   |   Bin 0 -> 49299 bytes
 documentation/sphinx-static/switchers.js      |   233 +
 .../sphinx-static/theme_overrides.css         |   164 +
 documentation/sphinx/yocto-vars.py            |    86 +
 documentation/template/Vera.xml               |     1 -
 documentation/template/VeraMoBd.xml           |     1 -
 documentation/template/VeraMono.xml           |     1 -
 documentation/template/component.title.xsl    |    39 -
 documentation/template/division.title.xsl     |    24 -
 documentation/template/embedded_video.xsl     |    22 -
 documentation/template/fop-config.xml         |    58 -
 .../template/formal.object.heading.xsl        |    21 -
 documentation/template/gloss-permalinks.xsl   |    14 -
 documentation/template/permalinks.xsl         |    25 -
 documentation/template/poky-db-pdf.xsl        |    64 -
 documentation/template/qa-code-permalinks.xsl |    23 -
 documentation/template/section.title.xsl      |    55 -
 .../template/titlepage.templates.xml          |  1227 --
 documentation/toaster-manual/history.rst      |    58 +
 .../toaster-manual-customization.xsl          |    28 -
 .../toaster-manual/toaster-manual-intro.rst   |   105 +
 .../toaster-manual/toaster-manual-intro.xml   |   164 -
 .../toaster-manual-reference.rst              |   662 +
 .../toaster-manual-reference.xml              |   836 -
 .../toaster-manual-setup-and-use.rst          |   651 +
 .../toaster-manual-setup-and-use.xml          |   843 -
 .../toaster-manual/toaster-manual-start.rst   |    57 +
 .../toaster-manual/toaster-manual-start.xml   |   115 -
 .../toaster-manual/toaster-manual-style.css   |   984 -
 .../toaster-manual/toaster-manual.rst         |    19 +
 .../toaster-manual/toaster-manual.xml         |   178 -
 documentation/tools/eclipse-help.sed          |    18 -
 documentation/tools/mega-manual.sed           |    36 -
 documentation/tools/poky-docbook-to-pdf       |    51 -
 documentation/tools/update-documentation-conf |    16 +-
 .../transitioning-to-a-custom-environment.rst |   116 +
 documentation/what-i-wish-id-known.rst        |   226 +
 308 files changed, 54740 insertions(+), 97884 deletions(-)
 create mode 100644 documentation/.gitignore
 create mode 100644 documentation/Pipfile
 create mode 100644 documentation/_templates/breadcrumbs.html
 create mode 100644 documentation/_templates/footer.html
 create mode 100644 documentation/_templates/layout.html
 delete mode 100644 documentation/adt-manual/adt-command.xml
 delete mode 100644 documentation/adt-manual/adt-intro.xml
 delete mode 100644 documentation/adt-manual/adt-manual-customization.xsl
 delete mode 100644 documentation/adt-manual/adt-manual-eclipse-customization.xsl
 delete mode 100644 documentation/adt-manual/adt-manual-intro.xml
 delete mode 100644 documentation/adt-manual/adt-manual.xml
 delete mode 100644 documentation/adt-manual/adt-package.xml
 delete mode 100644 documentation/adt-manual/adt-prepare.xml
 delete mode 100644 documentation/adt-manual/adt-style.css
 delete mode 100644 documentation/adt-manual/figures/adt-title.png
 delete mode 100644 documentation/adt-manual/figures/using-a-pre-built-image.png
 create mode 100644 documentation/boilerplate.rst
 delete mode 100644 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs-customization.xsl
 delete mode 100644 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs-style.css
 delete mode 100644 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs-titlepage.xsl
 create mode 100644 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
 delete mode 100644 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml
 delete mode 100644 documentation/bsp-guide/bsp-guide-customization.xsl
 create mode 100644 documentation/bsp-guide/bsp-guide.rst
 delete mode 100755 documentation/bsp-guide/bsp-guide.xml
 delete mode 100644 documentation/bsp-guide/bsp-style.css
 create mode 100644 documentation/bsp-guide/bsp.rst
 delete mode 100644 documentation/bsp-guide/bsp.xml
 create mode 100644 documentation/bsp-guide/history.rst
 create mode 100644 documentation/conf.py
 create mode 100644 documentation/dev-manual/dev-manual-common-tasks.rst
 delete mode 100644 documentation/dev-manual/dev-manual-common-tasks.xml
 delete mode 100644 documentation/dev-manual/dev-manual-customization.xsl
 create mode 100644 documentation/dev-manual/dev-manual-intro.rst
 delete mode 100644 documentation/dev-manual/dev-manual-intro.xml
 create mode 100644 documentation/dev-manual/dev-manual-qemu.rst
 delete mode 100644 documentation/dev-manual/dev-manual-qemu.xml
 create mode 100644 documentation/dev-manual/dev-manual-start.rst
 delete mode 100644 documentation/dev-manual/dev-manual-start.xml
 create mode 100644 documentation/dev-manual/dev-manual.rst
 delete mode 100755 documentation/dev-manual/dev-manual.xml
 delete mode 100644 documentation/dev-manual/dev-style.css
 create mode 100644 documentation/dev-manual/history.rst
 create mode 100644 documentation/figures/yp-how-it-works-new-diagram.png
 create mode 100644 documentation/genindex.rst
 create mode 100644 documentation/index.rst
 create mode 100644 documentation/kernel-dev/history.rst
 create mode 100644 documentation/kernel-dev/kernel-dev-advanced.rst
 delete mode 100644 documentation/kernel-dev/kernel-dev-advanced.xml
 create mode 100644 documentation/kernel-dev/kernel-dev-common.rst
 delete mode 100644 documentation/kernel-dev/kernel-dev-common.xml
 create mode 100644 documentation/kernel-dev/kernel-dev-concepts-appx.rst
 delete mode 100644 documentation/kernel-dev/kernel-dev-concepts-appx.xml
 delete mode 100644 documentation/kernel-dev/kernel-dev-customization.xsl
 create mode 100644 documentation/kernel-dev/kernel-dev-faq.rst
 delete mode 100644 documentation/kernel-dev/kernel-dev-faq.xml
 create mode 100644 documentation/kernel-dev/kernel-dev-intro.rst
 delete mode 100644 documentation/kernel-dev/kernel-dev-intro.xml
 create mode 100644 documentation/kernel-dev/kernel-dev-maint-appx.rst
 delete mode 100644 documentation/kernel-dev/kernel-dev-maint-appx.xml
 delete mode 100644 documentation/kernel-dev/kernel-dev-style.css
 create mode 100644 documentation/kernel-dev/kernel-dev.rst
 delete mode 100755 documentation/kernel-dev/kernel-dev.xml
 delete mode 100644 documentation/mega-manual/figures/YP-flow-diagram.png
 delete mode 100644 documentation/mega-manual/figures/add-variable.png
 delete mode 100644 documentation/mega-manual/figures/analysis-for-package-splitting.png
 delete mode 100644 documentation/mega-manual/figures/bash-oecore.png
 delete mode 100644 documentation/mega-manual/figures/bb_multiconfig_files.png
 delete mode 100644 documentation/mega-manual/figures/bitbake-build-flow.png
 delete mode 100644 documentation/mega-manual/figures/bitbake-title.png
 delete mode 100644 documentation/mega-manual/figures/bsp-dev-flow.png
 delete mode 100644 documentation/mega-manual/figures/bsp-title.png
 delete mode 100644 documentation/mega-manual/figures/build-workspace-directory.png
 delete mode 100644 documentation/mega-manual/figures/buildhistory-web.png
 delete mode 100644 documentation/mega-manual/figures/buildhistory.png
 delete mode 100755 documentation/mega-manual/figures/building-an-image.png
 delete mode 100644 documentation/mega-manual/figures/bypqs-title.png
 delete mode 100644 documentation/mega-manual/figures/compatible-layers.png
 delete mode 100644 documentation/mega-manual/figures/concepts-manual-title.png
 delete mode 100644 documentation/mega-manual/figures/configuration-compile-autoreconf.png
 delete mode 100644 documentation/mega-manual/figures/cross-development-toolchains.png
 delete mode 100644 documentation/mega-manual/figures/cute-files-npm-example.png
 delete mode 100644 documentation/mega-manual/figures/define-generic.png
 delete mode 100644 documentation/mega-manual/figures/dev-title.png
 delete mode 100644 documentation/mega-manual/figures/git-workflow.png
 delete mode 100644 documentation/mega-manual/figures/hosted-service.png
 delete mode 100644 documentation/mega-manual/figures/image-generation.png
 delete mode 100644 documentation/mega-manual/figures/images.png
 delete mode 100644 documentation/mega-manual/figures/import-layer.png
 delete mode 100755 documentation/mega-manual/figures/index-downloads.png
 delete mode 100755 documentation/mega-manual/figures/kernel-architecture-overview.png
 delete mode 100644 documentation/mega-manual/figures/kernel-dev-flow.png
 delete mode 100644 documentation/mega-manual/figures/kernel-dev-title.png
 delete mode 100644 documentation/mega-manual/figures/kernel-overview-1.png
 delete mode 100644 documentation/mega-manual/figures/kernel-overview-2-generic.png
 delete mode 100644 documentation/mega-manual/figures/kernel-title.png
 delete mode 100644 documentation/mega-manual/figures/kernelshark-all.png
 delete mode 100644 documentation/mega-manual/figures/kernelshark-choose-events.png
 delete mode 100644 documentation/mega-manual/figures/kernelshark-i915-display.png
 delete mode 100644 documentation/mega-manual/figures/kernelshark-output-display.png
 delete mode 100644 documentation/mega-manual/figures/key-dev-elements.png
 delete mode 100644 documentation/mega-manual/figures/layer-input.png
 delete mode 100644 documentation/mega-manual/figures/mega-title.png
 delete mode 100644 documentation/mega-manual/figures/multiconfig_files.png
 delete mode 100644 documentation/mega-manual/figures/new-project.png
 delete mode 100644 documentation/mega-manual/figures/oprofileui-busybox.png
 delete mode 100644 documentation/mega-manual/figures/oprofileui-copy-to-user.png
 delete mode 100644 documentation/mega-manual/figures/oprofileui-downloading.png
 delete mode 100644 documentation/mega-manual/figures/oprofileui-processes.png
 delete mode 100644 documentation/mega-manual/figures/overview-manual-title.png
 delete mode 100755 documentation/mega-manual/figures/package-feeds.png
 delete mode 100644 documentation/mega-manual/figures/patching.png
 delete mode 100644 documentation/mega-manual/figures/perf-probe-do_fork-profile.png
 delete mode 100644 documentation/mega-manual/figures/perf-report-cycles-u.png
 delete mode 100644 documentation/mega-manual/figures/perf-systemwide-libc.png
 delete mode 100644 documentation/mega-manual/figures/perf-systemwide.png
 delete mode 100644 documentation/mega-manual/figures/perf-wget-busybox-annotate-menu.png
 delete mode 100644 documentation/mega-manual/figures/perf-wget-busybox-annotate-udhcpc.png
 delete mode 100644 documentation/mega-manual/figures/perf-wget-busybox-debuginfo.png
 delete mode 100644 documentation/mega-manual/figures/perf-wget-busybox-dso-zoom-menu.png
 delete mode 100644 documentation/mega-manual/figures/perf-wget-busybox-dso-zoom.png
 delete mode 100644 documentation/mega-manual/figures/perf-wget-busybox-expanded-stripped.png
 delete mode 100644 documentation/mega-manual/figures/perf-wget-flat-stripped.png
 delete mode 100644 documentation/mega-manual/figures/perf-wget-g-copy-from-user-expanded-stripped.png
 delete mode 100644 documentation/mega-manual/figures/perf-wget-g-copy-to-user-expanded-debuginfo.png
 delete mode 100644 documentation/mega-manual/figures/perf-wget-g-copy-to-user-expanded-stripped-unresolved-hidden.png
 delete mode 100644 documentation/mega-manual/figures/perf-wget-g-copy-to-user-expanded-stripped.png
 delete mode 100644 documentation/mega-manual/figures/poky-reference-distribution.png
 delete mode 100644 documentation/mega-manual/figures/poky-title.png
 delete mode 100644 documentation/mega-manual/figures/profile-title.png
 delete mode 100644 documentation/mega-manual/figures/pybootchartgui-linux-yocto.png
 delete mode 100644 documentation/mega-manual/figures/pychart-linux-yocto-rpm-nostrip.png
 delete mode 100644 documentation/mega-manual/figures/pychart-linux-yocto-rpm.png
 delete mode 100644 documentation/mega-manual/figures/recipe-workflow.png
 delete mode 100644 documentation/mega-manual/figures/sched-wakeup-profile.png
 delete mode 100644 documentation/mega-manual/figures/sdk-autotools-flow.png
 delete mode 100644 documentation/mega-manual/figures/sdk-devtool-add-flow.png
 delete mode 100644 documentation/mega-manual/figures/sdk-devtool-modify-flow.png
 delete mode 100644 documentation/mega-manual/figures/sdk-devtool-upgrade-flow.png
 delete mode 100644 documentation/mega-manual/figures/sdk-environment.png
 delete mode 100644 documentation/mega-manual/figures/sdk-generation.png
 delete mode 100644 documentation/mega-manual/figures/sdk-installed-extensible-sdk-directory.png
 delete mode 100644 documentation/mega-manual/figures/sdk-installed-standard-sdk-directory.png
 delete mode 100644 documentation/mega-manual/figures/sdk-makefile-flow.png
 delete mode 100644 documentation/mega-manual/figures/sdk-title.png
 delete mode 100644 documentation/mega-manual/figures/sdk.png
 delete mode 100644 documentation/mega-manual/figures/set-variable.png
 delete mode 100644 documentation/mega-manual/figures/simple-configuration.png
 delete mode 100644 documentation/mega-manual/figures/source-fetching.png
 delete mode 100644 documentation/mega-manual/figures/source-input.png
 delete mode 100644 documentation/mega-manual/figures/source-repos.png
 delete mode 100644 documentation/mega-manual/figures/sysprof-callers.png
 delete mode 100644 documentation/mega-manual/figures/sysprof-copy-from-user.png
 delete mode 100644 documentation/mega-manual/figures/sysprof-copy-to-user.png
 delete mode 100644 documentation/mega-manual/figures/toaster-title.png
 delete mode 100644 documentation/mega-manual/figures/user-configuration.png
 delete mode 100644 documentation/mega-manual/figures/using-a-pre-built-image.png
 delete mode 100644 documentation/mega-manual/figures/variable-added.png
 delete mode 100755 documentation/mega-manual/figures/yocto-project-transp.png
 delete mode 100644 documentation/mega-manual/figures/yp-download.png
 delete mode 100644 documentation/mega-manual/mega-manual-customization.xsl
 delete mode 100755 documentation/mega-manual/mega-manual.xml
 delete mode 100644 documentation/mega-manual/mega-style.css
 create mode 100644 documentation/overview-manual/history.rst
 create mode 100644 documentation/overview-manual/overview-manual-concepts.rst
 delete mode 100644 documentation/overview-manual/overview-manual-concepts.xml
 delete mode 100644 documentation/overview-manual/overview-manual-customization.xsl
 create mode 100644 documentation/overview-manual/overview-manual-development-environment.rst
 delete mode 100644 documentation/overview-manual/overview-manual-development-environment.xml
 create mode 100644 documentation/overview-manual/overview-manual-intro.rst
 delete mode 100644 documentation/overview-manual/overview-manual-intro.xml
 delete mode 100644 documentation/overview-manual/overview-manual-style.css
 create mode 100644 documentation/overview-manual/overview-manual-yp-intro.rst
 delete mode 100644 documentation/overview-manual/overview-manual-yp-intro.xml
 create mode 100644 documentation/overview-manual/overview-manual.rst
 delete mode 100755 documentation/overview-manual/overview-manual.xml
 delete mode 100755 documentation/poky.ent
 create mode 100644 documentation/poky.yaml
 create mode 100644 documentation/profile-manual/history.rst
 create mode 100644 documentation/profile-manual/profile-manual-arch.rst
 delete mode 100644 documentation/profile-manual/profile-manual-arch.xml
 delete mode 100644 documentation/profile-manual/profile-manual-customization.xsl
 create mode 100644 documentation/profile-manual/profile-manual-examples.rst
 delete mode 100644 documentation/profile-manual/profile-manual-examples.xml
 create mode 100644 documentation/profile-manual/profile-manual-intro.rst
 delete mode 100644 documentation/profile-manual/profile-manual-intro.xml
 delete mode 100644 documentation/profile-manual/profile-manual-style.css
 create mode 100644 documentation/profile-manual/profile-manual-usage.rst
 delete mode 100644 documentation/profile-manual/profile-manual-usage.xml
 create mode 100644 documentation/profile-manual/profile-manual.rst
 delete mode 100755 documentation/profile-manual/profile-manual.xml
 create mode 100644 documentation/ref-manual/examples/hello-autotools/hello_2.10.bb
 delete mode 100644 documentation/ref-manual/examples/hello-autotools/hello_2.3.bb
 create mode 100644 documentation/ref-manual/faq.rst
 delete mode 100644 documentation/ref-manual/faq.xml
 create mode 100644 documentation/ref-manual/history.rst
 create mode 100644 documentation/ref-manual/migration-1.3.rst
 create mode 100644 documentation/ref-manual/migration-1.4.rst
 create mode 100644 documentation/ref-manual/migration-1.5.rst
 create mode 100644 documentation/ref-manual/migration-1.6.rst
 create mode 100644 documentation/ref-manual/migration-1.7.rst
 create mode 100644 documentation/ref-manual/migration-1.8.rst
 create mode 100644 documentation/ref-manual/migration-2.0.rst
 create mode 100644 documentation/ref-manual/migration-2.1.rst
 create mode 100644 documentation/ref-manual/migration-2.2.rst
 create mode 100644 documentation/ref-manual/migration-2.3.rst
 create mode 100644 documentation/ref-manual/migration-2.4.rst
 create mode 100644 documentation/ref-manual/migration-2.5.rst
 create mode 100644 documentation/ref-manual/migration-2.6.rst
 create mode 100644 documentation/ref-manual/migration-2.7.rst
 create mode 100644 documentation/ref-manual/migration-3.0.rst
 create mode 100644 documentation/ref-manual/migration-3.1.rst
 create mode 100644 documentation/ref-manual/migration-general.rst
 create mode 100644 documentation/ref-manual/migration.rst
 delete mode 100644 documentation/ref-manual/migration.xml
 create mode 100644 documentation/ref-manual/ref-classes.rst
 delete mode 100644 documentation/ref-manual/ref-classes.xml
 create mode 100644 documentation/ref-manual/ref-devtool-reference.rst
 delete mode 100644 documentation/ref-manual/ref-devtool-reference.xml
 create mode 100644 documentation/ref-manual/ref-features.rst
 delete mode 100644 documentation/ref-manual/ref-features.xml
 create mode 100644 documentation/ref-manual/ref-images.rst
 delete mode 100644 documentation/ref-manual/ref-images.xml
 create mode 100644 documentation/ref-manual/ref-kickstart.rst
 delete mode 100644 documentation/ref-manual/ref-kickstart.xml
 delete mode 100644 documentation/ref-manual/ref-manual-customization.xsl
 create mode 100644 documentation/ref-manual/ref-manual.rst
 delete mode 100755 documentation/ref-manual/ref-manual.xml
 create mode 100644 documentation/ref-manual/ref-qa-checks.rst
 delete mode 100644 documentation/ref-manual/ref-qa-checks.xml
 create mode 100644 documentation/ref-manual/ref-release-process.rst
 delete mode 100644 documentation/ref-manual/ref-release-process.xml
 create mode 100644 documentation/ref-manual/ref-structure.rst
 delete mode 100644 documentation/ref-manual/ref-structure.xml
 delete mode 100644 documentation/ref-manual/ref-style.css
 create mode 100644 documentation/ref-manual/ref-system-requirements.rst
 delete mode 100644 documentation/ref-manual/ref-system-requirements.xml
 create mode 100644 documentation/ref-manual/ref-tasks.rst
 delete mode 100644 documentation/ref-manual/ref-tasks.xml
 create mode 100644 documentation/ref-manual/ref-terms.rst
 delete mode 100644 documentation/ref-manual/ref-terms.xml
 create mode 100644 documentation/ref-manual/ref-variables.rst
 delete mode 100644 documentation/ref-manual/ref-variables.xml
 create mode 100644 documentation/ref-manual/ref-varlocality.rst
 delete mode 100644 documentation/ref-manual/ref-varlocality.xml
 create mode 100644 documentation/ref-manual/resources.rst
 delete mode 100644 documentation/ref-manual/resources.xml
 create mode 100644 documentation/releases.rst
 create mode 100644 documentation/sdk-manual/history.rst
 create mode 100644 documentation/sdk-manual/sdk-appendix-customizing-standard.rst
 delete mode 100644 documentation/sdk-manual/sdk-appendix-customizing-standard.xml
 create mode 100644 documentation/sdk-manual/sdk-appendix-customizing.rst
 delete mode 100644 documentation/sdk-manual/sdk-appendix-customizing.xml
 create mode 100644 documentation/sdk-manual/sdk-appendix-obtain.rst
 delete mode 100644 documentation/sdk-manual/sdk-appendix-obtain.xml
 create mode 100644 documentation/sdk-manual/sdk-extensible.rst
 delete mode 100644 documentation/sdk-manual/sdk-extensible.xml
 create mode 100644 documentation/sdk-manual/sdk-intro.rst
 delete mode 100644 documentation/sdk-manual/sdk-intro.xml
 delete mode 100644 documentation/sdk-manual/sdk-manual-customization.xsl
 create mode 100644 documentation/sdk-manual/sdk-manual.rst
 delete mode 100755 documentation/sdk-manual/sdk-manual.xml
 delete mode 100644 documentation/sdk-manual/sdk-style.css
 create mode 100644 documentation/sdk-manual/sdk-using.rst
 delete mode 100644 documentation/sdk-manual/sdk-using.xml
 create mode 100644 documentation/sdk-manual/sdk-working-projects.rst
 delete mode 100644 documentation/sdk-manual/sdk-working-projects.xml
 create mode 100644 documentation/sphinx-static/YoctoProject_Logo_RGB.jpg
 create mode 100644 documentation/sphinx-static/switchers.js
 create mode 100644 documentation/sphinx-static/theme_overrides.css
 create mode 100644 documentation/sphinx/yocto-vars.py
 delete mode 100644 documentation/template/Vera.xml
 delete mode 100644 documentation/template/VeraMoBd.xml
 delete mode 100644 documentation/template/VeraMono.xml
 delete mode 100644 documentation/template/component.title.xsl
 delete mode 100644 documentation/template/division.title.xsl
 delete mode 100644 documentation/template/embedded_video.xsl
 delete mode 100644 documentation/template/fop-config.xml
 delete mode 100644 documentation/template/formal.object.heading.xsl
 delete mode 100644 documentation/template/gloss-permalinks.xsl
 delete mode 100644 documentation/template/permalinks.xsl
 delete mode 100644 documentation/template/poky-db-pdf.xsl
 delete mode 100644 documentation/template/qa-code-permalinks.xsl
 delete mode 100644 documentation/template/section.title.xsl
 delete mode 100644 documentation/template/titlepage.templates.xml
 create mode 100644 documentation/toaster-manual/history.rst
 delete mode 100644 documentation/toaster-manual/toaster-manual-customization.xsl
 create mode 100644 documentation/toaster-manual/toaster-manual-intro.rst
 delete mode 100644 documentation/toaster-manual/toaster-manual-intro.xml
 create mode 100644 documentation/toaster-manual/toaster-manual-reference.rst
 delete mode 100644 documentation/toaster-manual/toaster-manual-reference.xml
 create mode 100644 documentation/toaster-manual/toaster-manual-setup-and-use.rst
 delete mode 100644 documentation/toaster-manual/toaster-manual-setup-and-use.xml
 create mode 100644 documentation/toaster-manual/toaster-manual-start.rst
 delete mode 100644 documentation/toaster-manual/toaster-manual-start.xml
 delete mode 100644 documentation/toaster-manual/toaster-manual-style.css
 create mode 100644 documentation/toaster-manual/toaster-manual.rst
 delete mode 100755 documentation/toaster-manual/toaster-manual.xml
 delete mode 100644 documentation/tools/eclipse-help.sed
 delete mode 100644 documentation/tools/mega-manual.sed
 delete mode 100755 documentation/tools/poky-docbook-to-pdf
 create mode 100644 documentation/transitioning-to-a-custom-environment.rst
 create mode 100644 documentation/what-i-wish-id-known.rst

-- 
2.17.1

