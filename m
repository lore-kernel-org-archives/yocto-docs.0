Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.11197.1605120131169919953
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 10:42:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qm9X1oUR;
 spf=pass (domain: linaro.org, ip: 209.85.128.44, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f44.google.com with SMTP id 19so3204196wmf.1
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 10:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f8AlkCAW8YIS0B24LiSpmiEdDZzBImJg4cSUoAGODVQ=;
        b=qm9X1oURfQwEW0PK+hLxB7H8KOpFcxlw7G3Chm+aqMAA0L8AVTZfq7Ca31cOasseMm
         LjtLd0P7eq1F9yM46tMKN0/UVIeGMIzHbAMiZRa4vLJ0VYDAncLrKKBoTOkMMtNPlNEO
         wzwRBNbeyponjNWl+3WDTj680z5n8mKBsJFz9X6ngywKXq5dvhnzXGKOwappOtnvf5oO
         VxpnVgB3SXsUOyMZ6j6qL9sE5Dn1r2hK602hRvI1IOKo5bVS9n9aURZ3Lbn3ZeoLozRx
         j0pZzPJj6wLUt9VEk8GzLUb+uSPVx5h9vgNWXrCctKPaZ7eMPo7Zr63St85A8zQIwUyZ
         uqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f8AlkCAW8YIS0B24LiSpmiEdDZzBImJg4cSUoAGODVQ=;
        b=eAFvv1PwPGThsoEEdfEgwAuoN6m9RmdsYYYZ6Hd9DL0Jygb8ddzDN0oc+e1ShL03qL
         xGDevyhhMR3edG5D1CNoM2zukIfm2grsZZDQxA2mv8W9uJGV+V4ZNSLlrv3WHKbgBYFH
         pfW4PvuM9ygBQhztGvZOTFVW6iboi70rgN/Yfu/Qp7Cnmbvy8Iyd1X8crM9l7vaQOqkQ
         xcnyjtAgzvPG029cLDri82fRoOPYWVydOy6SXVAGvQU29q2ZnjoHYjznzGLOzXYcXscM
         4YDqUWhkWTqeJprMqqpw0O/t8g9QpJjs+zS4HPaeRw5cHDHxMP2rZHufALvqKRuUa35K
         ld9g==
X-Gm-Message-State: AOAM533b21oxQB8z/uO99iuclIQ5bmAQIEodMx4jaif7d/WARYnpVHbK
	41OE4hKqnk6H1j9a96C+5FqVFxJv0687+cUY
X-Google-Smtp-Source: ABdhPJyTmpQ82dpX15UVZ4Hc2PA9SYF7A0KuTdM20hoVvhlyH0wHP/6Ont1pQMJc1VXZKt75VexpXA==
X-Received: by 2002:a1c:8150:: with SMTP id c77mr5867100wmd.26.1605120129304;
        Wed, 11 Nov 2020 10:42:09 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id v67sm3673657wma.17.2020.11.11.10.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 10:42:08 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 1/2] poky.yaml: remove unused variables
Date: Wed, 11 Nov 2020 19:42:00 +0100
Message-Id: <20201111184201.104015-2-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111184201.104015-1-nicolas.dechesne@linaro.org>
References: <20201111184201.104015-1-nicolas.dechesne@linaro.org>
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

