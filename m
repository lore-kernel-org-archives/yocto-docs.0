Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.9848.1608631083456282585
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 01:58:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=swbYpH/i;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id c5so13889181wrp.6
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 01:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LIcvV57VQZvxU3LrwTAuL7+dihfAzlbqsv3pvl6JZU4=;
        b=swbYpH/in2OOezB2jYs0CmcLr5YDSaiuGg1xIym80kfPugusXGCnIBFkQETdNyExuj
         bvIKpRWX2jHZBJ0acdK5bxsrhhyxkn1cAU0vtGaHB6Q8xigBtcr0C6ZocKdTMYoEsOpK
         tFKmDsJpL+3TiiOeOYZ/oq2tvMxtvJCEtsd2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LIcvV57VQZvxU3LrwTAuL7+dihfAzlbqsv3pvl6JZU4=;
        b=tNas4J+m0CV6WPSsCiMvhK2AE1DzGJtTym9Nk+cUXUOzZAdaVujFlh9yrEvf1OGv9a
         mi7ZdKOttzt+t30/4VxT4Inx1cYnKv2s9stUhx5fZzUwPklmnuluv/qLYpd+HHZTOCcO
         LISRxTFqgQM++k+iDuTdQs37EawAqCEDI7qJlyXxt1nrNkYzZp1Xu2KeY2UQ7CpT+qcz
         AttTLNCHMDhT0+mbeq9I309ooGv1ioAXey200CRK1dw8VURUDSDHn+dZMgA4SIFjH5Wn
         /1XzE4V9FZlTytJyfjp6QPswowVAt0Ey2DUrXTQhHz7vmrgAihLsMwZyE8+JrlXsP8x3
         UCOg==
X-Gm-Message-State: AOAM5302UK4JL98+2+Vi1feeHoS/VJs6KpAKO524jPVEoYg8Xqd/4ONx
	qyx+AK9TICDBsbRAtHOds8JcD+YN+U382A==
X-Google-Smtp-Source: ABdhPJyhKmL1HRhKKtciW03UqM9YsF+kyGOufdsSJbbm/IQM1r8VJaFFmFZFLNnZehw1XQcSxyzFtA==
X-Received: by 2002:adf:a201:: with SMTP id p1mr16179597wra.65.1608631081786;
        Tue, 22 Dec 2020 01:58:01 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id o125sm27291772wmo.30.2020.12.22.01.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 01:58:01 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 1/6] documentation: Simplify oe_wiki and oe_home links
Date: Tue, 22 Dec 2020 09:57:53 +0000
Message-Id: <20201222095758.7411-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201222095758.7411-1-pbarker@konsulko.com>
References: <20201222095758.7411-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/bsp-guide/bsp.rst            | 4 ++--
 documentation/conf.py                      | 1 +
 documentation/dev-manual/common-tasks.rst  | 2 +-
 documentation/kernel-dev/intro.rst         | 3 +--
 documentation/overview-manual/yp-intro.rst | 3 +--
 documentation/ref-manual/resources.rst     | 3 +--
 6 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 068ab6c80..93e918249 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -894,8 +894,8 @@ Yocto Project:
    ``recipes-*`` subdirectories specific to the recipe's function, or
    within a subdirectory containing a set of closely-related recipes.
    The recipes themselves should follow the general guidelines for
-   recipes used in the Yocto Project found in the "`OpenEmbedded Style
-   Guide <http://openembedded.org/wiki/Styleguide>`__".
+   recipes used in the Yocto Project found in the ":oe_wiki:`OpenEmbedded
+   Style Guide </Styleguide>`".
 
 -  *License File:* You must include a license file in the
    ``meta-bsp_root_name`` directory. This license covers the BSP
diff --git a/documentation/conf.py b/documentation/conf.py
index a626b1f14..b5351599d 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -79,6 +79,7 @@ extlinks = {
     'oe_home': ('https://www.openembedded.org%s', None),
     'oe_lists': ('https://lists.openembedded.org%s', None),
     'oe_git': ('https://git.openembedded.org%s', None),
+    'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
 }
 
 # Intersphinx config to use cross reference with Bitbake user manual
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index ada3bac7e..39db6563c 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2540,7 +2540,7 @@ Following Recipe Style Guidelines
 ---------------------------------
 
 When writing recipes, it is good to conform to existing style
-guidelines. The :oe_home:`OpenEmbedded Styleguide </wiki/Styleguide>` wiki page
+guidelines. The :oe_wiki:`OpenEmbedded Styleguide </Styleguide>` wiki page
 provides rough guidelines for preferred recipe style.
 
 It is common for existing recipes to deviate a bit from this style.
diff --git a/documentation/kernel-dev/intro.rst b/documentation/kernel-dev/intro.rst
index c95d2f7cb..f6c9b9713 100644
--- a/documentation/kernel-dev/intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -72,8 +72,7 @@ tools with your own kernel sources.
 
 The remainder of this manual provides instructions for completing
 specific Linux kernel development tasks. These instructions assume you
-are comfortable working with
-`BitBake <https://openembedded.org/wiki/Bitbake>`__ recipes and basic
+are comfortable working with :oe_wiki:`BitBake </Bitbake>` recipes and basic
 open-source development tools. Understanding these concepts will
 facilitate the process of working with the kernel recipes. If you find
 you need some additional background, please be sure to review and
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 66a88c952..456bfc549 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -531,8 +531,7 @@ targets:
    Debian Package (dpkg) in operation.
 
    Opkg is intended for use on embedded Linux devices and is used in
-   this capacity in the
-   `OpenEmbedded <http://www.openembedded.org/wiki/Main_Page>`__ and
+   this capacity in the :oe_home:`OpenEmbedded <>` and
    `OpenWrt <https://openwrt.org/>`__ projects, as well as the Yocto
    Project.
 
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index 77c367809..2c49c4e87 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -118,8 +118,7 @@ Here is a list of resources you might find helpful:
    distribution from which the Yocto Project derives its build system
    (Poky) and to which it contributes.
 
--  :oe_home:`BitBake </wiki/BitBake>`\ *:* The tool
-   used to process metadata.
+-  :oe_wiki:`BitBake </BitBake>`\ *:* The tool used to process metadata.
 
 -  :doc:`BitBake User Manual <bitbake:index>`\ *:* A comprehensive
    guide to the BitBake tool. If you want information on BitBake, see
-- 
2.26.2

