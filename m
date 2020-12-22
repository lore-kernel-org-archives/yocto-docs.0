Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.13023.1608651039173430793
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 07:30:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=M2mu97Q0;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id q18so14929799wrn.1
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 07:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s2vVPa4so5J3CvKHqNRQoX62Ub0DHR9qvbtizzPB8dU=;
        b=M2mu97Q0LzXAXMlY5+wqTpc7CfPlNbBIUCyYoKECdHio2qYJ6T+P12NPNmztfSq1Hy
         pp7LGVeZzU7G6mqUVBhdepbfs6u5w2J+p+az4s2iSCP5aLfNsB+H6lo1nAeh/zgGvEA5
         xlqQq5sR7Nkhqs+ZGGt/xbJjPlbsmEQAnKt8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s2vVPa4so5J3CvKHqNRQoX62Ub0DHR9qvbtizzPB8dU=;
        b=IrY+HKWTmSeIB7xAuGbqS2Lv2aq2kI/hez9+VbUWr+9V2n+lyCEZdS6mcUVBy8yVzq
         z45VcldamLl8EZjRM9B1gS1HJ9MQy7AbduPBwyPr4l3EKOwzocIRGKQ4oQx9/2fBi0IQ
         uzhBuHTf48bER0omSkzvaxALcCIBYfv00UNQzk660Lk2XyOabjKrUGrLbUHs5Cv9CsK6
         +GgpOK57wRvdRCtRizEv+m/hCacqPC1KjivO495vB+4OUfvxqs/kmZ8et195auf7NbZu
         pce71r9YsyhUOvPKYGJpfXJSbRPcf7cda1ZpVtct3vUVQoWGNYowOy58J+o76rbYzDqv
         d7Mg==
X-Gm-Message-State: AOAM532EJgpnGDHTXyQiucecOpSgI9qeRkfzSLzpOisE14kr5viTc2tB
	Y+vsekAm4klLDbULFd+VvdShijEGW3K0fA==
X-Google-Smtp-Source: ABdhPJxFuCoKJE/EFwFrgLezLFUSiiQ5gIK6aXZKuzGGuZ0xidzYpLNDZJA/RZ3Naba5SV0zGXzKdQ==
X-Received: by 2002:adf:e547:: with SMTP id z7mr24005799wrm.283.1608651037503;
        Tue, 22 Dec 2020 07:30:37 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id g192sm27808276wme.48.2020.12.22.07.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 07:30:36 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3 3/6] documentation: Simplify remaining yocto_home links
Date: Tue, 22 Dec 2020 15:30:29 +0000
Message-Id: <20201222153032.6909-4-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201222153032.6909-1-pbarker@konsulko.com>
References: <20201222153032.6909-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
index 221d5e104..257de44ec 100644
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
-- 
2.26.2

