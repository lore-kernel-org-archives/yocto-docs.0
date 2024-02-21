Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47ABAC48BEB
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 23:03:23 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.568.1708556601111866144
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Feb 2024 15:03:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HBYzI88/;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e3ffafa708so4414003b3a.1
        for <docs@lists.yoctoproject.org>; Wed, 21 Feb 2024 15:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708556600; x=1709161400; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6INHuupTPPfisFINlFw0Ngv392YZtkAeWsNcej2hsKk=;
        b=HBYzI88/rzwmGqpgndbB2qb2twEohhnojYeriXLA1h9Tvrghm85L+U13tIc29lOtxt
         F+JXBm9/cVoT2P1DcO2Pbfl5vbbwZ1LX98SxrkjSnvS5vw5IKaBejYS0fLrMvPGSOGco
         QA3fETxYQc7gLupt7Ge6TkGNlfAVikMgzb0xr6w6Z/AHmci3X5Dn8iNWh49kuKi/30ny
         ta2Hz+7LitG91AaImOVz0E420zzLdlthgj0GzRw7tbrlFz8PghylUGNkSXsE22jPrCQz
         jxI8E3WxfwJJHWpZNvz7RdRf1wBEOyDXLLMI7jXDaENVQ3up46AfwKZyYwuLvmsw8bSX
         4C3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708556600; x=1709161400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6INHuupTPPfisFINlFw0Ngv392YZtkAeWsNcej2hsKk=;
        b=Wsjs9t7KvZIt7XtRNLhSoUV9kCs8lja3rpk8bTTFJCReKqKgmqQRQ10DDxkakh6goj
         9EY14AAJ7DfwWWycT0LdmL6mRX04OW+1ZaHiM3Pk4011lycxuSek+rWPqheD2NEkvikg
         ae3WCyAgn+YdvBuEGzUT0vGdLb4W9yAVYiFvESFXz9SI3UQcRkFHrQCKt6JTTrtIVdJN
         g+7hOPmhrvUBP1m7G6XOMlYNlBx136PWhB8HBAMhEv1bxBn488TVQvvu9ElLLWjsVo5q
         buMe/5AbnD7JvAxJ/S2Z6Q8dJqAIXr0htH4V1Xwt0CmiVrOUqg7TJ/p4GlA3hJ/KEllh
         mWTQ==
X-Gm-Message-State: AOJu0YwW8tbn3pGcLwk8zzTyVianIJh+ABIOlYtosafKLC6NyiBkpcDm
	V9ic5cRc+Jffh9hDHRbKkiYdA5/d7kRoLXYX8qTGbbKeYY9JjxMnGosR4KxnCpc=
X-Google-Smtp-Source: AGHT+IHmimFykLfYrFKmGopZj0cki6fZ8GosmNvDKk9i7BslRNBJKLi0RpMNVBGRLC8YK1m/d3ixfg==
X-Received: by 2002:aa7:8455:0:b0:6e4:148e:2946 with SMTP id r21-20020aa78455000000b006e4148e2946mr10882646pfn.25.1708556600232;
        Wed, 21 Feb 2024 15:03:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::67c2])
        by smtp.gmail.com with ESMTPSA id q18-20020a62ae12000000b006e3e362b180sm7914377pff.114.2024.02.21.15.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 15:03:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] docs: Remove PYTHON_PN from reference
Date: Wed, 21 Feb 2024 15:02:57 -0800
Message-ID: <20240221230257.3551066-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Feb 2024 23:03:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4857

PYTHON_PN is on its way out, therefore its good to remove it from
documentation so its used is not promoted anymore.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 documentation/ref-manual/variables.rst | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6f7d6ff01ee..b319753445b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6813,20 +6813,6 @@ system and gives an overview of their function and contents.
       names used when installing the Python headers and libraries in
       sysroot (e.g. ``.../python3.3m/...``).
 
-   :term:`PYTHON_PN`
-      When used by recipes that inherit the :ref:`ref-classes-setuptools3`
-      class, specifies the major Python version being built. For Python 3.x,
-      :term:`PYTHON_PN` would be "python3". You do not have to set this
-      variable as the OpenEmbedded build system automatically sets it for you.
-
-      The variable allows recipes to use common infrastructure such as the
-      following::
-
-         DEPENDS += "${PYTHON_PN}-native"
-
-      In the previous example,
-      the version of the dependency is :term:`PYTHON_PN`.
-
    :term:`QA_EMPTY_DIRS`
       Specifies a list of directories that are expected to be empty when
       packaging; if ``empty-dirs`` appears in :term:`ERROR_QA` or
-- 
2.43.2


