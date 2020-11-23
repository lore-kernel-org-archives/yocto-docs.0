Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.39361.1606154545114317673
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 10:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sFHWa6DL;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id 23so19466883wrc.8
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 10:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WYxfQaDfXiGuH3vmiqdoAkzpN1iK4TGc14i/p6vxqac=;
        b=sFHWa6DL1Wb3su7eOu1ybEDfJIFM2A4zt/zEbW3+zmYSO07sfsZhm9U6nUTaGyoXmG
         7AeS6pwabxIFxAuvtoWINgCJ1OaBa74rT6Vzb5pZ3JAynQUW3zqqT+yAW+TBDlmF1USd
         1lP1TP9sU3vJ0qxMEBu6BD75Z9K2IDqZgLVJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WYxfQaDfXiGuH3vmiqdoAkzpN1iK4TGc14i/p6vxqac=;
        b=JAg1KA8T6bt+eNz3nQLE0PwknxewG0bUZgrQmXfbeFQixqWAUuNtwtpNO69qewMnOf
         6pA2DQg3zx+F0+2fmTa7IIJl/matAw9qtW2083qvmuDS9UP6hgwMIrzt/xk60yAZD7ye
         UArLZgAgcEJK0nE5ZdvbHZ4RSpHnUSCHThExJvPFoMIA9HdVDjeKKm6ydpCVFp68FXqQ
         2Q0tkpE4IX1k/CXVeIsdZrhHIi4qewLu4F943C2kLdwOlgHE8rEU5x+aEJktobAzGCHI
         fyW8Cq39LwFM2akIi7/nc171G7WRJQ+z6i9Rkaa4fblv2EuyWqJ2Fm0x/jlOVvUe3mrT
         UM2w==
X-Gm-Message-State: AOAM532rmpdionXlUOUGbkU4Uds12EKSk61QQeUkhTpJP9lJoNGuzehx
	y4bVI3zyFeIwLpQravngcf9fWrYqmBjlQA==
X-Google-Smtp-Source: ABdhPJx3EH6lOQiQrPMvZlKVZHZfddsqc0Yd9Fm5BLL5OnWXYVlW9HI4DvtvUC4fPKsf5T6RjzAYaQ==
X-Received: by 2002:adf:90d0:: with SMTP id i74mr934873wri.288.1606154543284;
        Mon, 23 Nov 2020 10:02:23 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id v8sm117315wmg.28.2020.11.23.10.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 10:02:22 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v3 1/7] dev-manual-common-tasks: Fix refs to testing branches
Date: Mon, 23 Nov 2020 18:02:13 +0000
Message-Id: <20201123180219.1966-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123180219.1966-1-pbarker@konsulko.com>
References: <20201123180219.1966-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After discussions on IRC with Ross we concluded that the `ross/mut`
branch shouldn't really be listed in the docs as it's more of a personal
test branch. Instead we should list the -next branches for
openembedded-core and poky.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../dev-manual/dev-manual-common-tasks.rst    | 33 ++++++++++++-------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 201e187c3..e2957f479 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10666,18 +10666,27 @@ to a contribution repository that is upstream. See the ":ref:`gs-git-workflows-a
 section in the Yocto Project Overview and Concepts Manual for additional
 concepts on working in the Yocto Project development environment.
 
-Two commonly used testing repositories exist for OpenEmbedded-Core:
-
--  *"ross/mut" branch:* The "mut" (master-under-test) tree exists in the
-   ``poky-contrib`` repository in the
-   :yocto_git:`Yocto Project source repositories <>`.
-
--  *"master-next" branch:* This branch is part of the main "poky"
-   repository in the Yocto Project source repositories.
-
-Maintainers use these branches to test submissions prior to merging
-patches. Thus, you can get an idea of the status of a patch based on
-whether the patch has been merged into one of these branches.
+Maintainers commonly use ``-next`` branches to test submissions prior to
+merging patches. Thus, you can get an idea of the status of a patch based on
+whether the patch has been merged into one of these branches. The commonly
+used testing branches for OpenEmbedded-Core are as follows:
+
+-  *openembedded-core "master-next" branch:* This branch is part of the
+   :oe_git:`openembedded-core </openembedded-core/>` repository and contains
+   proposed changes to the core metadata.
+
+-  *poky "master-next" branch:* This branch is part of the
+   :yocto_git:`poky </cgit/cgit.cgi/poky/>` repository and combines proposed
+   changes to bitbake, the core metadata and the poky distro.
+
+Similarly, stable branches maintained by the project may have corresponding
+``-next`` branches which collect proposed changes. For example,
+``&DISTRO_NAME_NO_CAP;-next`` and ``&DISTRO_NAME_NO_CAP_MINUS_ONE;-next``
+branches in both the "openembdedded-core" and "poky" repositories.
+
+Other layers may have similar testing branches but there is no formal
+requirement or standard for these so please check the documentation for the
+layers you are contributing to.
 
 .. note::
 
-- 
2.20.1

