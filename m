Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC77ECE79DF
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 14:52:12 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.41811.1695221531981347959
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 07:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LEBy85rC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-32003aae100so725651f8f.0
        for <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 07:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695221530; x=1695826330; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VGoq+V2qSaUTnYo3WnH83INBXWF0NobLP1qoHEFroPU=;
        b=LEBy85rCEYGcx165ewjNq2vmESUvrvarxLH2up47zwWAbbOEad8jDdDBZxWbh8pjpF
         PgDtA/O7uh3+7Vku1Qk3ROxqJIxR2eMXgKHzXPmhop3866LebTT5guCmjHCNynQpV18a
         XFC/Igpn8AheC/qQxhBViib0BIHu+B1lvK+68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695221530; x=1695826330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGoq+V2qSaUTnYo3WnH83INBXWF0NobLP1qoHEFroPU=;
        b=m9GkWfYmxVAnLbAAtTsTHn9o+NaXV6T8Ofg9q/VKIQTe1et0QKJM+pINF1gaM3FOov
         o/EBlxgjmuLSaFvpaIaic866CuDuDOXx0nUsFWOM1gX9f9ABWvLhhlqC6wsD8fl2cyr7
         Jx7SzjBcUvnCHi8tOGS5Mszn6QYmWKq2fOUYRKFYAyEBbpI9C73Ds6Wm/r/JucWc0Kyu
         MV17iTMSkjLplsw82+/V/BtE5j+XE6RSRPdV9G6K3/mHASU3fek5o0iOIH+nIQxLrpbT
         CR1iZtRAYuJN9h0kyX9TfyU5NcBIv8GueZ2fhl5FUZRzcHMPby+eNxeM3xtSEA95RYcW
         esKQ==
X-Gm-Message-State: AOJu0YyU7vK9zIAIGb1RpmQvVe7Y1SQDsfFztguYoojQSC8tRbLwkWyr
	M0vsboV2GysyaRlNKmqROFj6beqmeDryqq7wtys=
X-Google-Smtp-Source: AGHT+IGfyc4a7ex/tf/Z0LopeJdwZmkeswGlW9+4mmHiVnHD/yvadMuRpgdU2zQ4FSTt7xhIZhvpdA==
X-Received: by 2002:adf:f30c:0:b0:31f:c89b:91fc with SMTP id i12-20020adff30c000000b0031fc89b91fcmr4735226wro.7.1695221530000;
        Wed, 20 Sep 2023 07:52:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id r4-20020adfdc84000000b0031753073abcsm18599033wrj.36.2023.09.20.07.52.09
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 07:52:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] contributor-guide/style-guide: Refer to recipes, not packages
Date: Wed, 20 Sep 2023 15:52:08 +0100
Message-Id: <20230920145208.1054570-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 14:52:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4274

Whilst often referred to as packages by people we should use the more
accurate term in documentation, 'recipe' instead of 'packages'.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../contributor-guide/recipe-style-guide.rst      | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 99105179a..1a1c1c6ee 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -7,17 +7,18 @@ Recipe Naming Conventions
 =========================
 
 In general, most recipes should follow the naming convention
-``recipes-category/package/packagename_version.bb``. Recipes for related
-projects may share the same package directory. ``packagename``, ``category``,
-and ``package`` may contain hyphens, but hyphens are not allowed in ``version``.
+``recipes-category/recipename/recipename_version.bb``. Recipes for related
+projects may share the same recipe directory. ``recipename`` and ``category``
+may contain hyphens, but hyphens are not allowed in ``version``.
 
 If the recipe is tracking a Git revision that does not correspond to a released
-version of the software, ``version`` may be ``git`` (e.g. ``packagename_git.bb``)
+version of the software, ``version`` may be ``git`` (e.g. ``recipename_git.bb``)
+and the recipe would set :term:`PV`.
 
 Version Policy
 ==============
 
-Our versions follow the form ``<package epoch>:<package version>-<package revision>``
+Our versions follow the form ``<epoch>:<version>-<revision>``
 or in BitBake variable terms ${:term:`PE`}:${:term:`PV`}-${:term:`PR`}. We
 generally follow the `Debian <https://www.debian.org/doc/debian-policy/ch-controlfields.html#version>`__
 version policy which defines these terms.
@@ -26,7 +27,7 @@ In most cases the version :term:`PV` will be set automatically from the recipe
 file name. It is recommended to use released versions of software as these are
 revisions that upstream are expecting people to use.
 
-Package versions should always compare and sort correctly so that upgrades work
+Recipe versions should always compare and sort correctly so that upgrades work
 as expected. With conventional versions such as ``1.4`` upgrading ``to 1.5``
 this happens naturally, but some versions don't sort. For example,
 ``1.5 Release Candidate 2`` could be written as ``1.5rc2`` but this sorts after
@@ -62,7 +63,7 @@ Version Number Changes
 
 The :term:`PR` variable is used to indicate different revisions of a recipe
 that reference the same upstream source version. It can be used to force a
-new version of a package to be installed onto a device from a package feed.
+new version of a recipe to be installed onto a device from a package feed.
 These once had to be set manually but in most cases these can now be set and
 incremented automatically by a PR Server connected with a package feed.
 
-- 
2.39.2


