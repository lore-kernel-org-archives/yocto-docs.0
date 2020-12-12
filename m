Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.9352.1607805433133599703
 for <docs@lists.yoctoproject.org>;
 Sat, 12 Dec 2020 12:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=btv8QMOQ;
 spf=pass (domain: konsulko.com, ip: 209.85.221.68, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f68.google.com with SMTP id r14so12537486wrn.0
        for <docs@lists.yoctoproject.org>; Sat, 12 Dec 2020 12:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=srHatZvvFxVkeVJrSV1g/wKYewSZv6Sf1Ev+s6fdqEk=;
        b=btv8QMOQi0knsIIk54Do6SmWcK596t7d1Vhydivn6nRncAgSsbf3mh/b4EG7oTa2f4
         Y5L0+sK2j0PWFNgVFIH0OKsf3+sXZWUdFv6ieCG3a3bdqdNWkiJBE/8LyiSQGWBdFuBc
         /d+0HxQ3jSBZnNasTZWqU/kPf8RCMGhGxHTQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=srHatZvvFxVkeVJrSV1g/wKYewSZv6Sf1Ev+s6fdqEk=;
        b=iHP4pmQKnE6ch8WQOn4qgb/C87leIq6MB8d45v8pp1ACM4nChwYn7ArHu38kPX85u9
         qQqZ8VadtVsgoanUeZxbB9ZecSGO4mH8QEnCUYIJlB+K1gtv1+Fz7h8olmVJeii4qafD
         Wca37u+CqFQWVOaRBsdupaPWDpdckCOvHLThlqndS2g5cGqdJ/4RK3WAtE3FNgt+ttvP
         ZV/Gw40KfF7clGzhni196gShMAFK4Vbn1GN5KXxHDhNqc9hi+Gpyzmkp5u1y9mWJfkBp
         cVS+uu+XYyhQA4FgOw4MMXxZWUf4bJXkbOAYZYW2FVkpL+7P7Q8Ff3+4Q5YTysiMMt6c
         wvdw==
X-Gm-Message-State: AOAM530X25z2DYjwo2ZZUebIUC2NkocWlcj1HvNt9aHIMIBNtO7kaWJ/
	KHHPbMMrLNvBuoCFMkpCaQqJDvDA+aAVKg==
X-Google-Smtp-Source: ABdhPJxeKMVYOjJJd2o/gDB8Jhp2YoQ2EGXGtfzgGl9NVibRnfIWMCTI82WRVFPVcvcvEEVo+7MIFw==
X-Received: by 2002:adf:9467:: with SMTP id 94mr10756413wrq.235.1607805431348;
        Sat, 12 Dec 2020 12:37:11 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id h83sm23065505wmf.9.2020.12.12.12.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 12:37:10 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 3/4] documentation: Simplify remaining yocto_home links
Date: Sat, 12 Dec 2020 20:37:06 +0000
Message-Id: <20201212203707.7428-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201212203707.7428-1-pbarker@konsulko.com>
References: <20201212203707.7428-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/conf.py                      |  2 +-
 documentation/dev-manual/common-tasks.rst  |  4 ++--
 documentation/overview-manual/concepts.rst | 15 ++++++---------
 documentation/profile-manual/usage.rst     |  5 ++---
 4 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 57b9b6fd6..3b198cd06 100644
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
index 79acb8671..30761c3c6 100644
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
index b51f2a6d1..01c0d5de5 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -141,11 +141,10 @@ hardware-specific configurations allows you to share other metadata by
 using a different layer where that metadata might be common across
 several pieces of hardware.
 
-Many layers exist that work in the Yocto Project development
-environment. The `Yocto Project Curated Layer
-Index <https://www.yoctoproject.org/software-overview/layers/>`__
-and :oe_layerindex:`OpenEmbedded Layer Index <>`
-both contain layers from which you can use or leverage.
+Many layers exist that work in the Yocto Project development environment. The
+:yocto_home:`Yocto Project Curated Layer Index </software-overview/layers/>`
+and :oe_layerindex:`OpenEmbedded Layer Index <>` both contain layers from
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
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 418f4e993..0da408443 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -1159,9 +1159,8 @@ e.g. 'perf help' or 'perf help record'.
 
 However, by default Yocto doesn't install man pages, but perf invokes
 the man pages for most help functionality. This is a bug and is being
-addressed by a Yocto bug: `Bug 3388 - perf: enable man pages for basic
-'help'
-functionality <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3388>`__.
+addressed by a Yocto bug: :yocto_bugs:`Bug 3388 - perf: enable man pages for
+basic 'help' functionality </show_bug.cgi?id=3388>`.
 
 The man pages in text form, along with some other files, such as a set
 of examples, can be found in the 'perf' directory of the kernel tree: ::
-- 
2.26.2

