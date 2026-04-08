Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A5F1073CBC
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 13:05:48 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105900.1775653541563313991
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 06:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=grJv0kff;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b982b0889d8so810182766b.2
        for <docs@lists.yoctoproject.org>; Wed, 08 Apr 2026 06:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775653540; x=1776258340; darn=lists.yoctoproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjB/A1ldI92O0P9/xq3i80cS7Pc1MHlxySpCSX8uTcQ=;
        b=grJv0kffk1kMt0gepiSyBBiFV3utmRkQSpJwsMNu4bywjXD8VuFLRqvT+G/Kr9ZkY2
         /qNQGyvXydlFDS/dQo+gFq+SQVFycJGRtdNigvKkz4Z3J+cucCnlQJ6wWM68oQUqJ2It
         t3+c2xlfH7aJjQnGtYSQpkrkp5adqdFZyQpljNiyy/N+VHAPR1YW3bcG1YJokayBTAG2
         qZMEVueKlTmPuwQitpB6HdeFeDPjr2lps72UHyH5s/5gmaQkSyqhSkdQsO8WSWidwSLp
         EkwYR7guE/cERb3jt0k/GVKc3J9lwMo3JBI1IZ8vu5PKn2m8ybJ1ZhQ7FVzf/M6RXE56
         ajPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653540; x=1776258340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VjB/A1ldI92O0P9/xq3i80cS7Pc1MHlxySpCSX8uTcQ=;
        b=pju7dAEyTIHfY/sJsUIzmyxAnPV7A0IXVnx+DlG5/RDI+IyjT15o6sjci6EaLXt+Bb
         DUdcZOSfoeDxK3i1QhSrBD+JykC7witX1D31rlaeCcOlhQHMliQRzstmNenfA+JUwpWh
         VdiwR8WU0BLBlVd2zce5d+7Ywr8FlF5EQUnpYIffw4RHOF7N3kcYYvDB4sUGOLoEtDZI
         5711dN2lsRRQMvxOIDp/3nSaYyIZVSd+tACwBD6pLg9rLPkrBb6IpxaVKEIaouE9GbUv
         Waa+uc+Is7Zs9cur5Z3uLX3RpLmVP3p7Q8qsrMpRQGOitLuhsVn2s62Q8AHEKTspvAW4
         hq9g==
X-Gm-Message-State: AOJu0YwvwLuHK+NyqqeyAnH+ekJyFVe1wrvbQGi2zVbnsF3SWuF4pq/E
	LIfFfh61VFsABLv+2oOwMKbzwsHVN/h7pZzuxL7oSoh1jrsLIca1qIiioFDNWg==
X-Gm-Gg: AeBDies+FJLpSM3s/42xSdE3dnbZGqQAtOxPf60b0NkjbxAY+7NJ53DddUW3rdqSRNR
	bCT/GljBAEvjyYLjSgEQZaKRLMYHmI7F5J8GfYFU7A4wqKZVo5uHNOFlRf0o5LGpC/NcMAnaZjM
	IoM7N39I5so4EaCSPWkfaREwedJPmCd6DsJpOyRH2UF3dTsKkcVybdeXkkSJuwXhMi3SQYx0DZ2
	jQ5OzDrZL8oKVllCqjlG+r/uWI0kX15N7I77cSHX6NlyqMetXh7q1nwfTRVdfg6yTl86O3QM8PH
	AgQXQzFmlSbeU8RoKF6zI7NctVHGBj45kLNWNJh9RGr+AK+c0h+ZZbiT4S0BI4xLDjBHC9bBzYR
	lavM764pPbMUFNd/nP5urAXEPkgyRlRPRHVc04SnmgxprwBUjebV3zufJ82x35g3SfSY5fjb77s
	miJRJYHR3JD8yo3hwj4atJVK5pxnGSnKqLVPpBI+Q2
X-Received: by 2002:a17:907:9c07:b0:b9d:1a1c:a667 with SMTP id a640c23a62f3a-b9d1a1d39d9mr299788066b.11.1775653539681;
        Wed, 08 Apr 2026 06:05:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:dab4:c153:72eb:4100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca94715sm656643166b.21.2026.04.08.06.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:05:39 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Wed, 08 Apr 2026 15:05:28 +0200
Subject: [PATCH 4/6] ref-manual/variables.rst: update RECIPE_SYSROOT*
 descriptions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-staging_and_packaging_vars-v1-4-387f482308e5@gmail.com>
References: <20260408-staging_and_packaging_vars-v1-0-387f482308e5@gmail.com>
In-Reply-To: <20260408-staging_and_packaging_vars-v1-0-387f482308e5@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775653534; l=2284;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=cQXQZuiLQhiLadE8K9imywyIkc8FhmVN2t1yelb87fk=;
 b=CoaTOLwBdy3uG6PqoYi/QchqVQbQHvoOoFjf4IVxgP1yPnEZX4V1K/2vwoCv7NgQxCN0sfRWN
 HeCRxdrybgHCzA5DBSlfDDltki9FnsmE13ZedLgldTQCw9ujK00/RDq
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Apr 2026 13:05:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9203

Slightly reword to emphasise the order of steps during staging.
Further clarify those variables' relation to STAGING_DIR* variables.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/ref-manual/variables.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 7d3aa8ccf..aa142a701 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8345,13 +8345,13 @@ system and gives an overview of their function and contents.
       section.
 
    :term:`RECIPE_SYSROOT`
-      This variable points to the directory that holds all files populated from
+      This variable points to the directory populated with all files provided by
       recipes specified in :term:`DEPENDS`. As the name indicates,
-      think of this variable as a custom root (``/``) for the recipe that will be
+      think of this variable as a custom root (``/``) for the recipe, that will be
       used by the compiler in order to find headers and other files needed to complete
       its job.
 
-      This variable is related to :term:`STAGING_DIR_HOST` or :term:`STAGING_DIR_TARGET`
+      This variable is used to define :term:`STAGING_DIR_HOST` or :term:`STAGING_DIR_TARGET`
       according to the type of the recipe and the build target.
 
       To better understand this variable, consider the following examples:
@@ -8365,11 +8365,11 @@ system and gives an overview of their function and contents.
       Do not modify it.
 
    :term:`RECIPE_SYSROOT_NATIVE`
-      This is similar to :term:`RECIPE_SYSROOT` but the populated files are from
-      ``-native`` recipes. This allows a recipe built for the target machine to
-      use ``native`` tools.
+      This is similar to :term:`RECIPE_SYSROOT` but files in it are provided by
+      native recipes. This allows a recipe built for the target machine to
+      use native tools.
 
-      This variable is related to :term:`STAGING_DIR_NATIVE`.
+      This variable is used to define :term:`STAGING_DIR_NATIVE`.
 
       The default value is ``"${WORKDIR}/recipe-sysroot-native"``.
       Do not modify it.

-- 
2.43.0


