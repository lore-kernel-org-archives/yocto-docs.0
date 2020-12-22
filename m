Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.9566.1608631085178237555
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 01:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Y35RamzP;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id t30so13942479wrb.0
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 01:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pe1MLu9pbcIb+PypRFuP6QrOfFDr4MoaXTFUwGKDIO4=;
        b=Y35RamzP6iZyhrMmuj1xpYuAZO9xGEhGAf0Nm0trqrW+yNDXcqnmEhV3zDTratke2g
         W15IBfe/4kJ0KURzMS/4JgC+9w9oR7VOOxOiOzYhAKGhIg3t85RqD2qfYlj+GfbN0w0S
         pVPmkpVlNeVJlwkH1l9LqfE2o6eZJw2kiXnQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pe1MLu9pbcIb+PypRFuP6QrOfFDr4MoaXTFUwGKDIO4=;
        b=LG4sB1+e37KOZSD/6etRd9ABgHupjOomnjj3+R5clho4dZE3ANwMtjMSBvRBeYQRR2
         PhVvBwSlFXECgUxUg5w6IPn+xPLDDueQCxjgbh7oAX648ZUKjrSfMEtU8BCSe6ewTBQo
         RuOltdverB4736IQvZb5UFfrC7GH/Csr4SLHLcZOB5Ag5c9OLUVVHXK/QzBy9t9THgYm
         FYmAr8GKQ84VE3DFgReSLIYZlAsfQlaEJ3kDuPBp154yXcw9jRBGemFwdzNxskq7uiie
         Oajlw/BDNE1kpRL/bFjuB0k+PUCjyIZGIxrbPGi0lsb/QikP03qnVX11bBsej9V4VGcd
         cyQg==
X-Gm-Message-State: AOAM533KceUNVDZoZlokOcT1fgElGk2CCqbPvXWKuz5dGt49aT2NnDvJ
	b7M9BlGQq9bJQFzQ8zRWOu40w/EUV4rn4Q==
X-Google-Smtp-Source: ABdhPJxzmvONIo8fqwx0yIvZu1oAkD3sAYbWOi7hZJ0ZR2T0OKpy/Wr/StKjEGNrewuBdmS5jt1rTg==
X-Received: by 2002:a5d:4e89:: with SMTP id e9mr22963609wru.201.1608631083505;
        Tue, 22 Dec 2020 01:58:03 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id o125sm27291772wmo.30.2020.12.22.01.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 01:58:03 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 3/6] documentation: Simplify remaining yocto_home links
Date: Tue, 22 Dec 2020 09:57:55 +0000
Message-Id: <20201222095758.7411-4-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201222095758.7411-1-pbarker@konsulko.com>
References: <20201222095758.7411-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/conf.py                      |  2 +-
 documentation/dev-manual/common-tasks.rst  |  4 ++--
 documentation/overview-manual/concepts.rst | 15 ++++++---------
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 68eb92b0a..407ea3292 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -68,7 +68,7 @@ rst_prolog = """
 
 # external links and substitutions
 extlinks = {
-    'yocto_home': ('https://yoctoproject.org%s', None),
+    'yocto_home': ('https://www.yoctoproject.org%s', None),
     'yocto_wiki': ('https://wiki.yoctoproject.org/wiki%s', None),
     'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
     'yocto_lists': ('https://lists.yoctoproject.org%s', None),
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index b2f433e1d..bd8ceedc7 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -321,7 +321,7 @@ Logo for your layer and application. The process consists of two parts:
    successful compatibility registration.
 
 2. Completion of an application acceptance form, which you can find at
-   https://www.yoctoproject.org/webform/yocto-project-compatible-registration.
+   :yocto_home:`/webform/yocto-project-compatible-registration`.
 
 To be granted permission to use the logo, you need to satisfy the
 following:
@@ -345,7 +345,7 @@ application, you can use the Yocto Project Compatibility Logo with your
 layer and the application that uses your layer.
 
 To access the form, use this link:
-https://www.yoctoproject.org/webform/yocto-project-compatible-registration.
+:yocto_home:`/webform/yocto-project-compatible-registration`.
 Follow the instructions on the form to complete your application.
 
 The application consists of the following sections:
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 98c7b4f6b..916412e2c 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -141,11 +141,10 @@ hardware-specific configurations allows you to share other metadata by
 using a different layer where that metadata might be common across
 several pieces of hardware.
 
-Many layers exist that work in the Yocto Project development
-environment. The `Yocto Project Curated Layer
-Index <https://www.yoctoproject.org/software-overview/layers/>`__
-and :oe_layer:`OpenEmbedded Layer Index <>`
-both contain layers from which you can use or leverage.
+Many layers exist that work in the Yocto Project development environment. The
+:yocto_home:`Yocto Project Curated Layer Index </software-overview/layers/>`
+and :oe_layer:`OpenEmbedded Layer Index <>` both contain layers from
+which you can use or leverage.
 
 By convention, layers in the Yocto Project follow a specific form.
 Conforming to a known structure allows BitBake to make assumptions
@@ -2093,10 +2092,8 @@ The capability to run tasks in a fake root environment is known as
 the BitBake keyword/variable flag that requests a fake root environment
 for a task.
 
-In the :term:`OpenEmbedded Build System`,
-the program that
-implements fakeroot is known as
-`Pseudo <https://www.yoctoproject.org/software-item/pseudo/>`__. Pseudo
+In the :term:`OpenEmbedded Build System`, the program that implements
+fakeroot is known as :yocto_home:`Pseudo </software-item/pseudo/>`. Pseudo
 overrides system calls by using the environment variable ``LD_PRELOAD``,
 which results in the illusion of running as root. To keep track of
 "fake" file ownership and permissions resulting from operations that
-- 
2.26.2

