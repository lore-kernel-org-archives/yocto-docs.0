Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.13021.1608651037172691508
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 07:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=twxIsv6P;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id r7so14907173wrc.5
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 07:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UfGFESX1XrrMjie3slsyZfcLm3FPTXhcb10Zd+waF8U=;
        b=twxIsv6PpxWSGPIx1durHfk/3FyG0C06ZWF4DO9eaNuLK8JxIfVEd3PgUi4XBe6061
         xZV5B89o3YaArmELWNeHtNig+tuFEtOScWwcgOYldU0hmvEXezn/DK0Tdcvj6d6MncSM
         v6SmU5Honwri2FEcHMxsm4856cj8qJH9BUR4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UfGFESX1XrrMjie3slsyZfcLm3FPTXhcb10Zd+waF8U=;
        b=NEx0goEwbiKWOmuBiF7qfXlToJeM2ZVWLJ2FOSv7/dcG9C+DSObImZYZv81jiVibK/
         BUxBLRjMp8TmKurwjydpaNpIGKv61ePnyLU+Gq+MVpFCNwjSLh76HF8cnh2O9ILNQssr
         U23A3nenY2wy16c54Lm+xLgXEsSJsOJ5yQ38KXmaPYreDB6F+qIO5R39ZLoQHHxKg5xu
         b+2hRWhccZx+pp+ZnavHas/lg6lEZA1YgmNUJ1niZoqzb2A53l9wWfC/nGBBCGAfM/ut
         tFa4TN9KQK8wsBFCxH9D8xxz9gbh58NwkxKqvxkPovr0CeZyIzPM1OxSnldHd4F+XNfD
         /u4g==
X-Gm-Message-State: AOAM532VxwODxDWFNBIIOhK5vjQN7E3biQUB+JIz1JcNatULZAR4w3EF
	caEsKmMBSajH+X/YTtt1SdDP0J///0+nfA==
X-Google-Smtp-Source: ABdhPJxXkx7xmPdRddfQ5OrmGEZmeWbVOpUya5hqOP2vPjTZMB8g6SDq/DoH3x/D6kR59ePiC4YVZQ==
X-Received: by 2002:adf:f605:: with SMTP id t5mr24355880wrp.39.1608651035231;
        Tue, 22 Dec 2020 07:30:35 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id g192sm27808276wme.48.2020.12.22.07.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 07:30:34 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3 1/6] documentation: Simplify oe_wiki and oe_home links
Date: Tue, 22 Dec 2020 15:30:27 +0000
Message-Id: <20201222153032.6909-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201222153032.6909-1-pbarker@konsulko.com>
References: <20201222153032.6909-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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

