Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.9394.1607805431585157763
 for <docs@lists.yoctoproject.org>;
 Sat, 12 Dec 2020 12:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mJWrJDAb;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id a6so10428318wmc.2
        for <docs@lists.yoctoproject.org>; Sat, 12 Dec 2020 12:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LIcvV57VQZvxU3LrwTAuL7+dihfAzlbqsv3pvl6JZU4=;
        b=mJWrJDAbt2NhHLX0tTfyVpWeIgZlicm6UZr4IiM5ugyAjpyqedYntdYx+jrNprwPk4
         NZg/0C9Cw1nVigu2+T1biGL+e4DgZaUhbjwmO3KBn5nokHvCGyI3oTCk6L+ny/I3NZ5O
         tFB5lMOT/87VkjLCv0Z2Bv7e8BOIqeQMwiw+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LIcvV57VQZvxU3LrwTAuL7+dihfAzlbqsv3pvl6JZU4=;
        b=uJEzG8d8gIxO6p2yCOyDpbEUMjDXjRl/MXp9xi1H1OyIz3G2FOhSjPZNaXyEJBgK7m
         1SA+UtYwXsGovE1fpmtEJkbkvsaKgQ5PMB3o/846MsUvlT8SILOAazDi+NjfP3Byl0B3
         Onf6jOhrOkiLPg+NKsaywztzQgoa/Rt8FwZAmXjSLdJdAKjwe6qf3t+nYg2ipShvzzMK
         ARIUm0eijYnhU7d1y4s04UEsBI6zwtY5PQ83oedVH/G8VOLCsDbCUE4nZmiQS0BRc2Eh
         SlXL0zrcC9cJeZX4XRD3lFmM7MI2QKepqbQvqpbXUHylh90DcEHvHcfxd6EHiBVlfplP
         ++1Q==
X-Gm-Message-State: AOAM533cRgiDWkgnsEOsb09VbHVeXCKAJhvSt0KYN6wfljGWuHTQMWRq
	3Q+ECEYa7SYw71ao+Sh2F9cmb3RzEi33Mw==
X-Google-Smtp-Source: ABdhPJw9IaVtSf77x8BXlpH0CLFAmF6j17rz4q0nRefN/ghwHED7443UEkKUHKQFSxT3d+Ey5Tr5Pw==
X-Received: by 2002:a1c:7c09:: with SMTP id x9mr20072908wmc.98.1607805429625;
        Sat, 12 Dec 2020 12:37:09 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id h83sm23065505wmf.9.2020.12.12.12.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 12:37:08 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 1/4] documentation: Simplify oe_wiki and oe_home links
Date: Sat, 12 Dec 2020 20:37:04 +0000
Message-Id: <20201212203707.7428-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
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

