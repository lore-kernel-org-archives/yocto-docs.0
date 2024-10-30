Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B93ED6B6B3
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 17:04:20 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.20623.1730307846316555400
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 10:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZVQv6d+7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20c767a9c50so595675ad.1
        for <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 10:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730307845; x=1730912645; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXspxPi41P+7POOkfKJO/OD/z+I+Ms+MGS9yBeDeNdA=;
        b=ZVQv6d+7oPFSSuCu06z1cjLaeB5USfIcoJz3mFRlwgv2z2+jHAKaeIW7FyQDpJmYn7
         M7zPTdVRv6fmr7AjZCEhX8s0XgdFsnjxByfHTTQCR/KRtmTgF6l/s79cIN2nxP90x5Xy
         YUqhplIUOfKWeV6zC2SqJUGyOybh2Bv2X4DI2ncvTFOAT5O8LWKzR/88Z7QbB62j5f0i
         2v+sK9mpQulwvvxz6DIwkkcJX2MvFL+ZCuoXDKZcAcOrMzgahLxMl1b2w4R2pQfvHu8y
         7C9bSkOpUPIsysgtOLn8Y+rKR2RwZXo0OXREM3rqDK/s1UcdGcZlpM/s/EoHDQBB3z85
         P9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307845; x=1730912645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXspxPi41P+7POOkfKJO/OD/z+I+Ms+MGS9yBeDeNdA=;
        b=WEQwPYOUFxIizEYRnLcVeavp1NrdmZSX+COtyDs2Sep8wedPkVlJxDUGvNofRXKYaD
         +8TkuCu+KHU1r7dwD3h3OSD1lxls0BWfkZNbYkGeQ0OYcl0i+Kyavw9DSrtKtkPSnGNY
         AgeJ22Mq+g0xU/YRTyQ11ogQbsvxXpsXVoh8LkH5OxWOHw32ulBr14jx1tpXgmHtt5/N
         IjiyfI5xE9XJPiRpBh7LM5a/AW1Wa1ZZd6fOUpfFsTIknzciaWOCXj4lY41Zkc5+Thmj
         0r8tUMO7o3dg4+u4EVKcQEeK39TifqZAbjy4nLdZE+pszYt/k0RwAeJgE3wegHXNUcBq
         8Z2A==
X-Gm-Message-State: AOJu0YxSJmthF9Wvp3mxdtZJzI+6fffYzSYO/E0YTU49vx5GXicwtypq
	bDPE3xZCT5bJH9UYW3h7WdgWAOc5TBlpmFib8VWVShyXH1WdS3T4Np6IaksBdEO6hCbxEW35zON
	h
X-Google-Smtp-Source: AGHT+IGFkKArM1nYoj3wNrwPcGj4H+9Zjp78ESSpVMkgoo3/46+SBdz65kEM7fiLIT7uLzgq3FkeXA==
X-Received: by 2002:a17:903:234c:b0:20b:6edd:e95a with SMTP id d9443c01a7336-210c68ac4dbmr217006015ad.3.1730307845429;
        Wed, 30 Oct 2024 10:04:05 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc89f595dsm9284135a12.59.2024.10.30.10.04.04
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 10:04:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][kirkstone 1/1] release-notes-4.0,brief-yoctoprojectqs: update BB_HASHSERVE_UPSTREAM for new infrastructure
Date: Wed, 30 Oct 2024 10:04:00 -0700
Message-Id: <91d6f1efc5f4dac64f73c282ed9aeab7f11ba05c.1730307770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730307770.git.steve@sakoman.com>
References: <cover.1730307770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 17:04:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5625

Public hashserver is now at hashserv.yoctoproject.org:8686

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/brief-yoctoprojectqs/index.rst         | 2 +-
 documentation/migration-guides/release-notes-4.0.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index db17437aa..df9e7eadf 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -251,7 +251,7 @@ an entire Linux distribution, including the toolchain, from source.
       To use such mirrors, uncomment the below lines in your ``conf/local.conf``
       file in the :term:`Build Directory`::
 
-         BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
+         BB_HASHSERVE_UPSTREAM = "hashserv.yoctoproject.org:8686"
          SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
          BB_HASHSERVE = "auto"
          BB_SIGNATURE_HANDLER = "OEEquivHash"
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index 11206072a..005a299c2 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -22,7 +22,7 @@ New Features / Enhancements in 4.0
 
      BB_SIGNATURE_HANDLER = "OEEquivHash"
      BB_HASHSERVE = "auto"
-     BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
+     BB_HASHSERVE_UPSTREAM = "hashserv.yoctoproject.org:8686"
      SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 
 - The Python package build process is now based on `wheels <https://pythonwheels.com/>`__
-- 
2.34.1


