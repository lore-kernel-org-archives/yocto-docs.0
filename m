Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67421CAC59A
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 13:21:01 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.28772.1758460853725216401
 for <docs@lists.yoctoproject.org>;
 Sun, 21 Sep 2025 06:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l+DzrT92;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: bhstalel@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45f2a662690so5975145e9.1
        for <docs@lists.yoctoproject.org>; Sun, 21 Sep 2025 06:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758460852; x=1759065652; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFMkdHesWRpkfekSRG4pXT79sj3S9ue+a7RDR6OVyC0=;
        b=l+DzrT922f5S+docm4Z2C/jO7MA0AgHXcMGmnYP7RPDf75tI4GXgyvj83T9SzOjflJ
         FEisHXPABQL9mMNewLA6szVDjJJ77rJvIHHvQVqe/7AmVT+6aRYEURcN4GUEezP/dQ7w
         J3Aqh33BhC0YdW2ntvPVEfvi56WEgmiYgB7j+GHEjUD6agq84sGtRPYqslEj+Ktdl3ED
         aUyrwxHsCXVpQRleP3jBbiSRG2dnGcafMoyw+/gW+QE0HOBQn+m4Re29bJatUdeEZMv3
         hPsOpIpgc/9+cCvCvg5jNZGar9D4Lk7ojO0hie5pEM/1Yd6QJ2L8q1M7pgzlb1/lFnBP
         YA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758460852; x=1759065652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFMkdHesWRpkfekSRG4pXT79sj3S9ue+a7RDR6OVyC0=;
        b=uIhvxHg7yrMgDPKZ8zJyOr9g0GDFTNIw9CACiAgFP78Kzz9KETs5XQ6EYP8Dl8Immc
         91x63QZ49J6+oJ8NyfU3d+dx4y+awyJzhnAQ0+ChYq+VQcRKKbvTj8tWCJR23BirvKov
         OuxyVBkHWi/4SK965XyueNRRi/AW+5KbsIGau8aVInGlxgqeK1ZhKY3Ux/yUDjTXxbed
         7UzVammz+UgWRK30NLtd4UfqY9+8Ij7zw8dv16EZuDpbUG25FB2OjSI3X2WQ9oy/h77O
         H7LturaSOypkzvSgWf5N+EvrW4PeND+EAO1QENZAT5BuvIP8cwNIfWtFw08LtUjH1Oku
         gVeA==
X-Gm-Message-State: AOJu0YxXIr9NcMQvRUDpV5cxB4xcmcGjahvhVZAkDEDcHhsYlXG6Bl1c
	Z6y+qXnERzKf/hdbVTh6hn7ED3nE2A9HAUppOPZRDZmwJvzI5Pt9uriAahRqtA==
X-Gm-Gg: ASbGnctFgX7kAUo+iKs9kRWX6U7Gn+8NIKAyKg+4cjHUf/FQVDNkYX+y/LcnHDDR9By
	DbMWenpSxgoQGbI6M/B4dFyXOR6KKMjXKAYXGgfiBQ/JUicqFk1DghiXg0jB3RoQPXyPa5aZI/9
	tOoGDGYoc98sgnwNtIut0JOmADM2jt3A9DarEiHnbGSc6K8F+jA+r59tscb1JcxC3hGPWtYZDo7
	HE4pgUflElTXx4qQZvf0tHGScM6gFdHlE6q3uC8Ysq+bLlbCw0DdER2vag5pGQ/We/KNS2TJcv0
	IXdEJumiajvxqJk8suPCK5voSPgb5xlaqxVqVwun+Mdz0zWitytLD6pmXboc3iHvkY19aRJoiGw
	Gwp7UjA3DTln2pAshXXyT05jWi5Zg8Q==
X-Google-Smtp-Source: AGHT+IHkxhkMDgOK0x+RuN/qKZegf9oIZK0ME/4DgXR0ZSnwpMi2HvkFpGidtqJS3C0QkIbH4IbRSQ==
X-Received: by 2002:a05:600c:4fc4:b0:45d:d5bb:5b8c with SMTP id 5b1f17b1804b1-4682c93f450mr41480365e9.0.1758460851758;
        Sun, 21 Sep 2025 06:20:51 -0700 (PDT)
Received: from techleef ([102.104.117.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac3fdsm157558025e9.1.2025.09.21.06.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 06:20:51 -0700 (PDT)
From: Talel BELHAJ SALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJ SALEM <bhstalel@gmail.com>
Subject: [PATCH 1/2] dev-manual/building.rst: add note about globally inheriting externalsrc class
Date: Sun, 21 Sep 2025 14:20:32 +0100
Message-ID: <20250921132033.31644-2-bhstalel@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921132033.31644-1-bhstalel@gmail.com>
References: <20250921132033.31644-1-bhstalel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 21 Sep 2025 13:21:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7566

Signed-off-by: Talel BELHAJ SALEM <bhstalel@gmail.com>
---
 documentation/dev-manual/building.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 04c150094..8d00d908e 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -736,6 +736,13 @@ are the statements to put in your ``local.conf`` file::
    INHERIT += "externalsrc"
    EXTERNALSRC:pn-myrecipe = "path-to-your-source-tree"
 
+.. note::
+
+   When you inherit :ref:`ref-classes-externalsrc` class globally make
+   sure to set the :term:`EXTERNALSRC` and :term:`EXTERNALSRC_BUILD`
+   variables to specific recipes, not doing that will redirect
+   all recipes to one external source directory.
+
 This next example shows how to accomplish the same thing by setting
 :term:`EXTERNALSRC` in the recipe itself or in the recipe's append file::
 
-- 
2.51.0


