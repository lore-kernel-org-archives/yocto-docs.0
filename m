Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.6953.1605779936002882750
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 01:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JXTl7brb;
 spf=pass (domain: linaro.org, ip: 209.85.128.43, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f43.google.com with SMTP id x13so456771wmj.1
        for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2020 01:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FPqzuClM6aQxlaS7qKoOK5m74q3wZx7q5c2tbg/nc9k=;
        b=JXTl7brbqRiXSWFgYUQ2WiEWjnoog0wq+R+jLfTE5rv4eUi2WYLYDt/LupJ/fea0KJ
         DagieX6/po2Xy/y07y/UVNu3Je8wvrg3zi5MLgLs29VdAjUhGRJh/nTBra46Vzr4g0Se
         TDqbDOhxz400Bxvd+6Ux+xIvsA5zg/wnl1KwBsJS1yazFYlqIsGap13J1hbn0c8LeReU
         eay5AVgeC5TgYrnOJ1IdnqnX/pOFoYJFKGaec9tYI7Ul94Iozi6s4rmUVxl4Lj3yPPkU
         m7SOla2oD0kbf+66HGbZ5d550Qzwa63AyyqQUfh1pTwh6tWv/Tq8Y0GZti/FYfhOMiWx
         iaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FPqzuClM6aQxlaS7qKoOK5m74q3wZx7q5c2tbg/nc9k=;
        b=EzpgRNHdH7MRRiansm4MNQ41JewBchdGgtRBNl7CPWcbKtCj+BcD9NsYEQ48oTtTiF
         VMSmZrUSiLhpX/6oOaXi6FRGEfOZ71n6eai3PC5J2nv5xkZMj3m+yN8QwDd4Uv/h3rcz
         xgd8FkFnsRWBNa3J4FfhlZUMsYTqPpoS4OwOnMi7LXBRfBVTBqOXO3WT9m2lpZ9sGTd2
         WW/BVz8dBh+MX/2KE2+jf9PjOUgSeVF3CA+jSxy3wUKBlc9Bp7sUYd8LXolDHyaUihEh
         2enSVqzw15y9kGmTb5JvO3KLHEnejfe/rh597fvIksq1HisrfLKEI2gjh1Z42eKjGGD1
         obiQ==
X-Gm-Message-State: AOAM532DPE3BLMFWZ32o274jSBWGihvDK8p9CfBD8Kah+syoacR0ti1A
	IcBZBTqLDC7ModVQoEu1n//LQW78uZyKWgZe
X-Google-Smtp-Source: ABdhPJy1sJBbV+P8J58NDAwNA0bnkTLHVhJ4B3TqRUQZip42FeeHgVHPwfu8vqnw9Wk17i5SEx56hA==
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr3602517wmd.20.1605779934114;
        Thu, 19 Nov 2020 01:58:54 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id o14sm34725288wrw.4.2020.11.19.01.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 01:58:53 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 05/11] kernel-dev: replace labels with references to section title
Date: Thu, 19 Nov 2020 10:58:28 +0100
Message-Id: <20201119095834.284864-6-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
References: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/kernel-dev/kernel-dev-advanced.rst | 4 ++--
 documentation/kernel-dev/kernel-dev-intro.rst    | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/kernel-dev/kernel-dev-advanced.rst b/documentation/kernel-dev/kernel-dev-advanced.rst
index 444037c3a..b1537ccbe 100644
--- a/documentation/kernel-dev/kernel-dev-advanced.rst
+++ b/documentation/kernel-dev/kernel-dev-advanced.rst
@@ -245,7 +245,7 @@ two files: ``smp.scc`` and ``smp.cfg``. You can find these files in the
       CONFIG_X86_BIGSMP=y
 
 You can find general information on configuration
-fragment files in the ":ref:`creating-config-fragments`" section.
+fragment files in the ":ref:`kernel-dev/kernel-dev-common:creating configuration fragments`" section.
 
 Within the ``smp.scc`` file, the
 :term:`KFEATURE_DESCRIPTION`
@@ -559,7 +559,7 @@ You can see that in the BeagleBone example with the following:
    include beaglebone.scc
 
 For information on how to break a complete ``.config`` file into the various
-configuration fragments, see the ":ref:`creating-config-fragments`" section.
+configuration fragments, see the ":ref:`kernel-dev/kernel-dev-common:creating configuration fragments`" section.
 
 Finally, if you have any configurations specific to the hardware that
 are not in a ``*.scc`` file, you can include them as follows:
diff --git a/documentation/kernel-dev/kernel-dev-intro.rst b/documentation/kernel-dev/kernel-dev-intro.rst
index 5679a0ab8..971420b22 100644
--- a/documentation/kernel-dev/kernel-dev-intro.rst
+++ b/documentation/kernel-dev/kernel-dev-intro.rst
@@ -28,8 +28,8 @@ newly-supported platforms. Previous recipes in the release are refreshed
 and supported for at least one additional Yocto Project release. As they
 align, these previous releases are updated to include the latest from
 the Long Term Support Initiative (LTSI) project. You can learn more
-about Yocto Linux kernels and LTSI in the ":ref:`Yocto Project Kernel
-Development and Maintenance <kernel-big-picture>`" section.
+about Yocto Linux kernels and LTSI in the
+":ref:`kernel-dev/kernel-dev-concepts-appx:yocto project kernel development and maintenance`" section.
 
 Also included is a Yocto Linux kernel development recipe
 (``linux-yocto-dev.bb``) should you want to work with the very latest in
@@ -38,7 +38,7 @@ upstream Yocto Linux kernel development and kernel Metadata development.
 .. note::
 
    For more on Yocto Linux kernels, see the
-   ":ref:`Yocto Project Kernel Development and Maintenance <kernel-big-picture>`"
+   ":ref:`kernel-dev/kernel-dev-concepts-appx:yocto project kernel development and maintenance`"
    section.
 
 The Yocto Project also provides a powerful set of kernel tools for
@@ -167,7 +167,7 @@ general information and references for further information.
    ``menuconfig`` and you have saved them, you can directly compare the
    resulting ``.config`` file against an existing original and gather
    those changes into a
-   :ref:`configuration fragment file <creating-config-fragments>` to be
+   :ref:`configuration fragment file <kernel-dev/kernel-dev-common:creating configuration fragments>` to be
    referenced from within the kernel's ``.bbappend`` file.
 
    Additionally, if you are working in a BSP layer and need to modify
-- 
2.29.2

