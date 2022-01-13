Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DA6C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 15:39:08 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.10455.1642088347670346220
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Jan 2022 07:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m4R0Qr7z;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so19283682pja.1
        for <docs@lists.yoctoproject.org>;
 Thu, 13 Jan 2022 07:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3IOj4YbRcsx1gu+CMcTPcxDfVcLkIrlFnoCORelzh9Q=;
        b=m4R0Qr7zRt22gJBGGhfNEoJRcvu2mmWEaVKyeHkKirQdSwypo6QsXrI/n2zTRECrqL
         RFyyQV0BUHqCfBfpB1AiX2X1cY2C2BvlXh0JWcmq0SI5FtvakU+u0MTiZdDTVg+QcRL1
         5OLawF/n+EFQ1NmtYzYTIE2p0q/wrYU7KT5M0hY40A/ZNJM9RDhPM0VrauNMBywXFUM9
         Bf24/RrEMkS+n3kKCXCONGnrfNQmPwlT1zBmC3QtqZ+MMgOTo7yNm4HQUB5O2orqOMgt
         76Ldu9j0JMHKxv5LYPIUhQ+BDso41pgu/2/P/8mMoRttsCcfdVmY0nn3+pQtEN0k5cki
         0fHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3IOj4YbRcsx1gu+CMcTPcxDfVcLkIrlFnoCORelzh9Q=;
        b=cqbB5pxvjl4uzIuCIyP4bh59LqT1rBp9PxMJPodh1R0GycCc1+9N5fmx70BBGO4uRs
         PITU8DypHngy1ydIPMhNhbqcvrUpkaH7vvXFu4vH182bk/rhdXeMqCncqAg7HFUCsBii
         kPHmF1P5IHxKJXa14Szi57Pzy8ZPCuGRjjnwkOJ8CwM0uKj44L1fPkjRnR+uP0UxMUAD
         YGI+fIiCokmp/jXtvQJ0ED3Lpmf+NEUuDOBQYypL51/ShDXralYLQBnPoZIZlbOfOOcc
         gKvXKiGWxTvDK+6N+FdqhBAhGUzNK8bLycrX8ssj0J/QTLgHe1+t8jICnCvcYlLs3q0A
         AbVw==
X-Gm-Message-State: AOAM531UW+cMIVd+xv5dugDOzSVX1GQkT9ReYZwyHpF6cDyfbWxy8rpe
	p1eBG777O2QXWhkO0R/1pAoCS4Koe1M=
X-Google-Smtp-Source: 
 ABdhPJzJuOEfj9isZuOxoLImiwZFTngniIQOdkDf9DDqS+1aCkf4VyDsv6G3oO17U8TuTD/rqOIzOg==
X-Received: by 2002:a17:90a:c098:: with SMTP id
 o24mr5707859pjs.145.1642088346942;
        Thu, 13 Jan 2022 07:39:06 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:bf73:e59:4f56:2dd4])
        by smtp.gmail.com with ESMTPSA id
 q12sm3278507pfk.136.2022.01.13.07.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 07:39:06 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 3/3] ref-manual/classes.rst: add setuptools3-base
Date: Thu, 13 Jan 2022 07:38:43 -0800
Message-Id: <20220113153843.2544066-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220113153843.2544066-1-tim.orling@konsulko.com>
References: <20220113153843.2544066-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Jan 2022 15:39:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2408

Add setuptools3-base class

Deprecate distutils3* classes.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
  - fix whitespace errors
  - add ref-classes-setuptools3 links

 documentation/ref-manual/classes.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 99d9a7a3e..12a9fd83a 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -515,6 +515,14 @@ used.
 -  Extensions that use ``distutils``-based build systems require the
    ``distutils`` class in their recipes.
 
+   .. note::
+
+      ``distutils`` has been deprecated in Python 3.10 and will be removed
+      in Python 3.12. For this reason the ``distutils3*`` classes are now
+      deprecated and will be removed from core in the near future. Instead,
+      use the ``setuptools3*`` classes.
+
+
 -  Extensions that use build systems based on ``setuptools3`` require
    the :ref:`setuptools3 <ref-classes-setuptools3>` class in their
    recipes.
@@ -2376,6 +2384,17 @@ The ``setuptools3`` class supports Python version 3.x extensions that
 use build systems based on ``setuptools``. If your recipe uses these
 build systems, the recipe needs to inherit the ``setuptools3`` class.
 
+.. _ref-classes-setuptools3-base:
+
+``setuptools3-base.bbclass``
+============================
+
+The ``setuptools3-base`` class provides a reusable base for other classes
+that support building Python version 3.x extensions. If you need
+functionality that is not provided by the :ref:`setuptools3<ref-classes-setuptools3` class, you may
+want to ``inherit setuptools3-base``. Some recipes do not need the tasks
+in the :ref:`setuptools3<ref-classes-setuptools3` class and inherit this class instead.
+
 .. _ref-classes-sign_rpm:
 
 ``sign_rpm.bbclass``
-- 
2.30.2


