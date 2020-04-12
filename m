Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.13015.1586703703982528572
 for <docs@lists.yoctoproject.org>;
 Sun, 12 Apr 2020 08:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gXtBAx8t;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id p8so3394332pgi.5
        for <docs@lists.yoctoproject.org>; Sun, 12 Apr 2020 08:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=sXJS2h5WGb/uejcKOJZnTg25JLi/+Vpa8K69S2UemEA=;
        b=gXtBAx8taN3WmSky33r7CI/FZsyRN2l7caeXMiabyfgsqHWMkX5OcwghWsGtPsTzf4
         X238SUWmyqPTsDMdJh5uapZ95AMVbVZ1SF5fkiF+ap2NIWGbI81DIC1ITIpGVx+asPON
         zcm5J9HXyuHxayGmEU7d/VxRYhkCN2I7rMdwcdXSoTZthloNvrEluMpcEMOXBuA2i+cF
         4AAsIkMNqYbq0eVVTfDbn/WBcuG9pof3O8BdB4ew8Np7xE7qyLneVcC6+DE1Mv7ajIhj
         yAWWtcdFOSx68+1HqAz9IH42SUgcvkoL8URM3XlWCrigPd91XXoSpDFM2S4st0dVvD4E
         1xFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=sXJS2h5WGb/uejcKOJZnTg25JLi/+Vpa8K69S2UemEA=;
        b=Ft0+AJwcTVIrKC5srTV35RkkfWpP+FbvImWIv13AcglbcSztT+7x8QF+IsPsV+3Qs4
         547I31dRclgzcULBTilOwHElXdq4J7GqCHgRNKnlregt2rGf+MC5wzqxCw0E/R0UCDwc
         QD5zl5o3ZWx4elXCdzba+rKksAHxNC83pieBPDtFwFfAkauHlWPsqBLdtKuhyP6dVt5V
         5YiiJLGnRXBAHenc34cCpXz5OddYxLEcLrMuB2swmynNRt03hwKNzunkivK/v+eeUjsr
         xQdWQwv36BQgWXOJgtgHeFDzWHa5FcTLPC33r5s++woWirslijU8a5AoaGVTBzVso2Bq
         h9YQ==
X-Gm-Message-State: AGi0Pua/WE7FAFKBOLD3zoYh7/gCRgmo7AUP38OULpL0SikGDrmESV2f
	bJ+k0jU9sZ/LSS1stHKKeT3QN5JmrwQ=
X-Google-Smtp-Source: APiQypKctmxHT9kF644DE9wRFxb8UL+gf2XL1e7EZdGDuZmMcYNtvir8bgtYuwQilBK/2ggFPgM0rA==
X-Received: by 2002:a63:4d5e:: with SMTP id n30mr5930185pgl.154.1586703702816;
        Sun, 12 Apr 2020 08:01:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e49d:5859:161:36cd])
        by smtp.gmail.com with ESMTPSA id g185sm573014pfb.6.2020.04.12.08.01.41
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 08:01:42 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] Makefile: Remove denzil and edison branches.
Date: Sun, 12 Apr 2020 08:01:40 -0700
Message-Id: <20200412150140.19716-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

time to clean out old branchs no longer in support

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/Makefile | 91 ++----------------------------------------
 1 file changed, 3 insertions(+), 88 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index 1a33c771f..e59b9bb07 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -4,9 +4,6 @@
 # in any manuals must be .PNG files and live in the individual book's figures
 # directory as well as in the figures directory for the mega-manual.
 #
-# Note that the figures for the Yocto Project Development Tasks Manual
-# differ depending on the BRANCH being built.
-#
 # The Makefile has these targets:
 #    all:       If you leave off the target then "all" is implied.
 #               You will generate HTML and a tarball of files.
@@ -25,37 +22,23 @@
 # of all the individual Yocto Project manuals.  You can generate these two manuals
 # in HTML form only.  The variable DOC indicates the folder name for a given manual.
 # The variable VER represents the distro version of the Yocto Release for which the
-# manuals are being generated.  The variable BRANCH is used to indicate the
-# branch (edison or denzil) and is used only when DOC=dev-manual or
-# DOC=mega-manual.  If you do not specify a BRANCH, the default branch used
-# will be for the latest Yocto Project release.  If you build for either
-# edison or denzil, you must use BRANCH. You do not need to use BRANCH for
-# any release beyond denzil.
+# manuals are being generated. 
 #
 # To build a manual, you must invoke Makefile with the DOC argument.  If you
 # are going to publish the manual, then you must invoke Makefile with both the
-# DOC and the VER argument.  Furthermore, if you are building or publishing
-# the edison or denzil versions of the Yocto Project Development Tasks Manual or
-# the mega-manual, you must also use the BRANCH argument.
+# DOC and the VER argument.
 #
 # Examples:
 #
 #     make DOC=bsp-guide
 #     make html DOC=brief-yoctoprojectqs
 #     make pdf DOC=ref-manual
-#     make DOC=dev-manual BRANCH=edison
-#     make DOC=mega-manual BRANCH=denzil
 #
 # The first example generates the HTML version of the BSP Guide.
 # The second example generates the HTML version only of the Quick Start.  Note
 # that the Quick Start only has an HTML version available.  So, the
 # 'make DOC=brief-yoctoprojectqs' command would be equivalent. The third example
 # generates just the PDF version of the Yocto Project Reference Manual.
-# The fourth example generates the HTML 'edison' version of the YP Development
-# Tasks Manual.  The last example
-# generates the HTML version of the mega-manual and uses the 'denzil'
-# branch when choosing figures for the tarball of figures.  Any example that does
-# not use the BRANCH argument builds the current version of the manual set.
 #
 # The publish target pushes the generated manuals to the Yocto Project
 # website.  Unless you are a developer on the YP team, you will not succeed in
@@ -66,15 +49,10 @@
 #
 #    make publish DOC=bsp-guide VER=1.7
 #    make publish DOC=adt-manual VER=1.6
-#    make publish DOC=dev-manual VER=1.1.1 BRANCH=edison
-#    make publish DOC=dev-manual VER=1.2 BRANCH=denzil
 #
 # The first example publishes the 1.7 version of both the PDF and HTML versions of
 # the BSP Guide.  The second example publishes the 1.6 version of both the PDF and
-# HTML versions of the ADT Manual. The third example publishes the 1.1.1 version of
-# the PDF and HTML YP Development Tasks Manual for the 'edison' branch.  The fourth
-# example publishes the 1.2 version of the PDF and HTML YP Development Tasks Manual
-# for the 'denzil' branch.
+# HTML versions of the ADT Manual. 
 #
 # IN MEMORIAM: This comment is to remember Scott Rifenbark (scottrif), whom we lost
 # in January, 2020. Scott was the primary technical writer for the Yocto Project for
@@ -129,40 +107,10 @@ endif
 ifeq ($(DOC),dev-manual)
 XSLTOPTS = --xinclude
 ALLPREQ = html tarball
-#
-# Note that the tarfile might produce the "Cannot stat: No such file or
-# directory" error message for .PNG files that are not present when building
-# a particular branch.  The list of files is all-inclusive for all branches.
-# Note, if you don't provide a BRANCH option, it defaults to the latest stuff.
-# This would be appropriate for "master" branch.
-#
-
-	ifeq ($(BRANCH),edison)
-TARFILES = dev-style.css dev-manual.html \
-           figures/app-dev-flow.png figures/bsp-dev-flow.png \
-           figures/dev-title.png figures/git-workflow.png \
-           figures/index-downloads.png figures/kernel-dev-flow.png \
-           figures/kernel-example-repos-edison.png \
-           figures/kernel-overview-1.png figures/kernel-overview-2.png \
-           figures/kernel-overview-3-edison.png \
-           figures/source-repos.png figures/yp-download.png \
-           figures/wip.png
-	else ifeq ($(BRANCH),denzil)
-TARFILES = dev-style.css dev-manual.html \
-           figures/app-dev-flow.png figures/bsp-dev-flow.png \
-           figures/dev-title.png figures/git-workflow.png \
-           figures/index-downloads.png figures/kernel-dev-flow.png \
-           figures/kernel-example-repos-denzil.png \
-           figures/kernel-overview-1.png figures/kernel-overview-2.png \
-           figures/kernel-overview-3-denzil.png \
-           figures/source-repos.png figures/yp-download.png \
-           figures/wip.png
-        else
 TARFILES = dev-style.css dev-manual.html figures/buildhistory-web.png \
            figures/dev-title.png figures/buildhistory.png \
            figures/recipe-workflow.png figures/bitbake-build-flow.png \
            figures/multiconfig_files.png figures/cute-files-npm-example.png
-	endif
 
 MANUALS = $(DOC)/$(DOC).html
 FIGURES = figures
@@ -177,38 +125,6 @@ XSLTOPTS = --stringparam html.stylesheet mega-style.css \
            --stringparam  section.label.includes.component.label 1 \
            --xinclude
 ALLPREQ = html tarball
-
-	ifeq ($(BRANCH),edison)
-TARFILES = mega-manual.html mega-style.css figures/yocto-environment.png \
-        figures/building-an-image.png  \
-	figures/using-a-pre-built-image.png \
-	figures/poky-title.png \
-	figures/adt-title.png figures/bsp-title.png \
-	figures/kernel-title.png figures/kernel-architecture-overview.png \
-	figures/app-dev-flow.png figures/bsp-dev-flow.png \
-        figures/dev-title.png figures/git-workflow.png \
-        figures/index-downloads.png figures/kernel-dev-flow.png \
-	figures/kernel-example-repos-edison.png \
-	figures/kernel-overview-1.png figures/kernel-overview-2.png \
-	figures/kernel-overview-3-edison.png \
-	figures/source-repos.png figures/yp-download.png \
-	figures/wip.png
-	else ifeq ($(BRANCH),denzil)
-TARFILES = mega-manual.html mega-style.css figures/yocto-environment.png \
-        figures/building-an-image.png  \
-	figures/using-a-pre-built-image.png \
-	figures/poky-title.png \
-	figures/adt-title.png figures/bsp-title.png \
-	figures/kernel-title.png figures/kernel-architecture-overview.png \
-	figures/app-dev-flow.png figures/bsp-dev-flow.png \
-        figures/dev-title.png figures/git-workflow.png \
-        figures/index-downloads.png figures/kernel-dev-flow.png \
-	figures/kernel-example-repos-denzil.png \
-	figures/kernel-overview-1.png figures/kernel-overview-2.png \
-	figures/kernel-overview-3-denzil.png \
-	figures/source-repos.png figures/yp-download.png \
-	figures/wip.png
-        else
 TARFILES = mega-manual.html mega-style.css \
         figures/YP-flow-diagram.png \
 	figures/using-a-pre-built-image.png \
@@ -266,7 +182,6 @@ TARFILES = mega-manual.html mega-style.css \
 	figures/sdk-devtool-upgrade-flow.png figures/bitbake-build-flow.png figures/bypqs-title.png \
 	figures/overview-manual-title.png figures/sdk-autotools-flow.png figures/sdk-makefile-flow.png \
 	figures/bb_multiconfig_files.png figures/bitbake-title.png figures/cute-files-npm-example.png
-	endif
 
 MANUALS = $(DOC)/$(DOC).html
 FIGURES = figures
-- 
2.17.1

