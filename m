Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.1242.1605167544559763925
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 23:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ToRuOA83;
 spf=pass (domain: linaro.org, ip: 209.85.215.170, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-pg1-f170.google.com with SMTP id f27so3508026pgl.1
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 23:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f8AlkCAW8YIS0B24LiSpmiEdDZzBImJg4cSUoAGODVQ=;
        b=ToRuOA83WLQ5HYYFciI5O5bGTGM0KayTBBllDm0tVGVFnVa2V3q9caWOkwMjNOzMEl
         fyc1EsDicCu2/g8e8NFOPM9VakC9mu//A2Gf+TYI0RuwAgMj/e2+YfQTL07iybt9jY8a
         AJEqEAzFXF+jrOYQg87v2PxJEi9A0zdIeNJKqlyjXRs9qDzo0cUDuD2xaAg2u9ll+TPZ
         A8HLF8hh/9O7KZWvxalRQX0yUeMndrQg+YnnIWR5Whmm28onrSipGZRmTgJShiG/1B0S
         u2k9crnlNZBaUIQm/n2zdVuZ1WJ4luRFXDJC8MsOBa9O3hxD/dTrZSe82gurSAw2oQ2V
         Nc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f8AlkCAW8YIS0B24LiSpmiEdDZzBImJg4cSUoAGODVQ=;
        b=iQGQUih6nri7W36dnJAsfI985yk9aRsr6l+UF1XWYXYZbp2lVsRfoY2t35VzcFUSsC
         wcCY4GVomGBEa3kEJkBnp9qtO8PDAM1vSBpGwtu2o/3tbYyDNsHFJhza7xcLvwD2ZJ0+
         LKMIxNht2SNRhTff7a5hoX3P8fZncFDEc/BPYwevYIqFgDqmOmZWzCa8c8V4Ym1ZNqjt
         6TBa1EcuaeRE2Va93DFCKrzrXNHn8smkMeEc14DLRhPHV33Nk0elb7cUNx9tjUCQlKLH
         enSuvgM6NttiSej8Gc9Pj4OwGwrMR+mVPlKU+L/vdDLs/ZSt2+xQ2A7g1fQpI94z9aQa
         W+ew==
X-Gm-Message-State: AOAM531izOSYKt0795xtUpzoIeQgjR/Dice/3f4FhCiGoks3l6cKwkJr
	eDOnmaORGAhaA2Ya6pj9Mi/98Oi5FfBDfSjj
X-Google-Smtp-Source: ABdhPJwdraDtYPWOHe1NOoexNS0dZuuiPeS86yoKF7JNLLj4nTB1q+fziaO0gRgVe2W8shtL0FTCew==
X-Received: by 2002:a05:6a00:1506:b029:18b:5a31:ed87 with SMTP id q6-20020a056a001506b029018b5a31ed87mr22922461pfu.55.1605167543772;
        Wed, 11 Nov 2020 23:52:23 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id c28sm5720323pfj.108.2020.11.11.23.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 23:52:23 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH v2 1/2] poky.yaml: remove unused variables
Date: Thu, 12 Nov 2020 08:52:05 +0100
Message-Id: <20201112075206.113124-2-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112075206.113124-1-nicolas.dechesne@linaro.org>
References: <20201112075206.113124-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are plenty of variables in poky.yaml which are not used anywhere
in the docs. So let's remove them. We can always add the one we need
later.

Note ORGEMAIL could be used in boilerplate.rst, however this file is
not parsed but included, and somehow the yocto-vars.py exenstion does
not process this file, so we cannot use a variable there.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/poky.yaml | 47 -----------------------------------------
 1 file changed, 47 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index e39c403fe..85f42cf07 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,62 +1,15 @@
 DISTRO : "3.1"
-DISTRO_COMPRESSED : "31"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-DISTRO_NAME_MINUS_ONE : "Zeus"
 YOCTO_DOC_VERSION : "3.1"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
 DISTRO_REL_TAG : "yocto-3.1"
-METAINTELVERSION : "12.0"
-REL_MONTH_YEAR : "April 2020"
-META_INTEL_REL_TAG : "&METAINTELVERSION;-&DISTRO_NAME_NO_CAP;-&YOCTO_DOC_VERSION;"
 POKYVERSION : "23.0.0"
-POKYVERSION_COMPRESSED : "2300"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
-COPYRIGHT_YEAR : "2010-2020"
-ORGNAME : "The Yocto Project"
-ORGEMAIL : "docs@lists.yoctoproject.org"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
-YOCTO_HOME_URL : "https://www.yoctoproject.org"
-YOCTO_LISTS_URL : "https://lists.yoctoproject.org"
-YOCTO_BUGZILLA_URL : "https://bugzilla.yoctoproject.org"
-YOCTO_WIKI_URL : "https://wiki.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-YOCTO_GIT_URL : "https://git.yoctoproject.org"
-YOCTO_ADTREPO_URL : "http://adtrepo.yoctoproject.org"
-OE_HOME_URL : "https://www.openembedded.org"
-OE_LISTS_URL : "https://lists.openembedded.org"
-OE_DOCS_URL : "https://docs.openembedded.org"
-OH_HOME_URL : "http://o-hand.com"
-BITBAKE_HOME_URL : "http://developer.berlios.de/projects/bitbake/"
-YOCTO_DOCS_URL : "&YOCTO_HOME_URL;/docs"
-YOCTO_SOURCES_URL : "&YOCTO_HOME_URL;/sources/"
-YOCTO_AB_PORT_URL : "https://autobuilder.yocto.io/"
-YOCTO_AB_NIGHTLY_URL : "&YOCTO_AB_PORT_URL;/pub/nightly/"
-YOCTO_POKY_URL : "&YOCTO_DL_URL;/releases/poky/"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
-YOCTO_TOOLCHAIN_DL_URL : "&YOCTO_RELEASE_DL_URL;/toolchain/"
-YOCTO_ADTINSTALLER_DL_URL : "&YOCTO_RELEASE_DL_URL;/adt-installer"
-YOCTO_POKY_DL_URL : "&YOCTO_RELEASE_DL_URL;/&YOCTO_POKY;.tar.bz2"
-YOCTO_MACHINES_DL_URL : "&YOCTO_RELEASE_DL_URL;/machines"
-YOCTO_QEMU_DL_URL : "&YOCTO_MACHINES_DL_URL;/qemu"
-YOCTO_PYTHON-i686_DL_URL : "&YOCTO_DL_URL;/releases/miscsupport/python-nativesdk-standalone-i686.tar.bz2"
-YOCTO_PYTHON-x86_64_DL_URL : "&YOCTO_DL_URL;/releases/miscsupport/python-nativesdk-standalone-x86_64.tar.bz2"
-YOCTO_DOCS_QS_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/yocto-project-qs/yocto-project-qs.html"
-YOCTO_DOCS_REF_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/ref-manual/ref-manual.html"
-YOCTO_DOCS_BSP_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/bsp-guide/bsp-guide.html"
-YOCTO_DOCS_DEV_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/dev-manual/dev-manual.html"
-YOCTO_DOCS_KERNEL_DEV_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/kernel-dev/kernel-dev.html"
-YOCTO_DOCS_PROF_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/profile-manual/profile-manual.html"
-YOCTO_DOCS_MM_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/mega-manual/mega-manual.html"
-YOCTO_DOCS_BB_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/bitbake-user-manual/bitbake-user-manual.html"
-YOCTO_DOCS_TOAST_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/toaster-manual/toaster-manual.html"
-YOCTO_DOCS_SDK_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/sdk-manual/sdk-manual.html"
-YOCTO_DOCS_OM_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/overview-manual/overview-manual.html"
-YOCTO_DOCS_BRIEF_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/brief-yoctoprojectqs/brief-yoctoprojectqs.html"
-YOCTO_ADTPATH_DIR : "/opt/poky/&DISTRO;"
-YOCTO_POKY_TARBALL : "&YOCTO_POKY;.tar.bz2"
-OE_INIT_PATH : "&YOCTO_POKY;/oe-init-build-env"
 UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git-core diffstat unzip texinfo gcc-multilib \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
-- 
2.29.2

