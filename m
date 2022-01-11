Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B70C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:57:55 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.13276.1641931075005529515
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 11:57:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gTwzK1F/;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so765145pjb.5
        for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 11:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=51v2EJqexhGSHH01BZtisY43z/bUXwb2tP3rL/8uJWY=;
        b=gTwzK1F/ibEp1SOQ0FyYjjkfjRy1wQbI0dXwZhLTXjBBDBsNYo99+KN1fC+r4encK/
         4CNrt1Wdr/fRrFl3bFbu590bxeKeFVfQ0o7Y5aVtGEJK5Cq/TUXs30jmbZATsZTVgZSB
         CGjiI+CgXBgP4t+g6s5nneUZeRQAjmt3Fb+s7voOdF4h3caACNNf3CzFmKh45mj6rEWn
         aHZj7mFY+l/hUnO3hfAcvxAvQiJ2OUHLItT/TfLgy3x10jf3Oz0D8KAlKnFP9dDvnf65
         kKteYrMuxWLCSFw621ESQRBoX0tFgAE0xF+80efuhari+BmDMeFjnoEbryuNpQdMcLbp
         mVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=51v2EJqexhGSHH01BZtisY43z/bUXwb2tP3rL/8uJWY=;
        b=M6kBZoIPudPRKHe4Jc5U2S/zNke5EwbUC+kDY7XtyoLCVyIX99bdWLLZkCP/p95bAB
         W4ofEGNBgfBju9FxiiRx+DeqB3wzLtPWbld1xYGsG5nyVoEVMxOFFAQBAXcQQ9uK7k+I
         Tswuxpq57bd7wkfE1Hfb7Ryakg5o64E3RR/HpOzayrUgc3P4NWq/gjv324LtgAXECGA3
         N1epeaK7jVY7+z0FlZwAt8yLBeLiC35zncsC2SCr3uHGeMiICIE61yI/XDJwtz6HO5gu
         +Z7cU/etxpKkibhIvkxAVSk2pFmQFJVyHm/FDpKIJuf9zKmGnuzq0fTZDvXLEq5od0cM
         aVTQ==
X-Gm-Message-State: AOAM5328s2LaSUmIHJOU23dT/5sSD86ZpOx5cOeAgprQNvQFISI15dTU
	C8do+TFn1aXAGGONPgmGe6qUnflb8hk=
X-Google-Smtp-Source: 
 ABdhPJy1xrcyhLvxXNvUz9PO/V2qNKBJ3AxbyV0noL+FVpBudcHi2DGwczb/CVmI+fROUCnY05KGrw==
X-Received: by 2002:a63:6f07:: with SMTP id k7mr5312034pgc.574.1641931074175;
        Tue, 11 Jan 2022 11:57:54 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 b4sm12029319pfl.101.2022.01.11.11.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:57:53 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 3/3] ref-manual/classes.rst: add setuptools3-base
Date: Tue, 11 Jan 2022 11:57:42 -0800
Message-Id: <20220111195742.1921572-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220111195742.1921572-1-tim.orling@konsulko.com>
References: <20220111195742.1921572-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jan 2022 19:57:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2385

Add setuptools3-base class

Deprecate distutils3* classes.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/ref-manual/classes.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 99d9a7a3e..41360c965 100644
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
+that support building Python3 version 3.x extensions. If you need
+functionality that is not provided by the ``setuptools3`` class, you may
+want to ``inherit setuptools3-base``. Some recipes do not need the tasks
+in the ``setuptools3`` class and inherit this class instead.
+
 .. _ref-classes-sign_rpm:
 
 ``sign_rpm.bbclass``
-- 
2.30.2


