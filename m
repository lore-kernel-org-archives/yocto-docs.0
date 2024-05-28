Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7BDC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 17:52:33 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.29062.1716918748747655632
 for <docs@lists.yoctoproject.org>;
 Tue, 28 May 2024 10:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yRuvJpWn;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35502a992c9so1183641f8f.3
        for <docs@lists.yoctoproject.org>; Tue, 28 May 2024 10:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1716918747; x=1717523547; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dw9syWhlP6Qvkvp9T3eGJeCUvTQMUJc9fP3VlmIuLhQ=;
        b=yRuvJpWnIrdk+ZxmMtHDGrj3dym/R68GZzrunFVFGUNLM3J2wAcq/75mIELca6l2yv
         92/+g61iiXsCzEBWxZK6ZEdCLIrDfEY0YomFZwBhTmnsbOMvcS3fRlt74tjyZP0SOQb/
         KxbpYKibVNFJWgFvU8QJENrx1OWhfaew6tE5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716918747; x=1717523547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dw9syWhlP6Qvkvp9T3eGJeCUvTQMUJc9fP3VlmIuLhQ=;
        b=uIoU0D2tTA/q8BHTdpm/lMJw/voKUst0omcRwwF2ftaHEG0mVGjDcbEDrOnno1aYqN
         YImKMRCVjrziYCQuNX7TIWKGgMGqO1tKHknwKUIWODJ8onw9KY2xD7bUGEdEZxG43+8x
         YZn6YTHzuyqL3Qxya+YzWACmJGODfeW4I8ygTDeagXF1eKnQleSmfWgf1PQVVLRVD3J2
         tpsrNzmdLXWEO+aaTTls6MpmTDVAQP9co2emaVOYamGXUkWqZmj7MP3oVsVWVLijFx6H
         7PrdcMCqTra6H2xKbPhWDA0mNw4a4iO2/7LO9sCKUs12Z8D1zt80CxROqrxjgmkx9hJv
         cneg==
X-Gm-Message-State: AOJu0Yy24Sl8H5E1ck/ZQWX7bEL77afhLo5bf0gKvGWXDk5eOtebUuj+
	kM3LIfbfH8O1/svQUtsf/nKnz8frcywZFr9VzZkLL5BWTOfZk2arHek2RHNL91miTmbHnHcHHsa
	S
X-Google-Smtp-Source: AGHT+IFOS2U7URgftJt/JufbEGYea6MxWRM4CnWa333rnI/uuhzjW4i7z+h69LRe0HjSGIsiKlAF8Q==
X-Received: by 2002:a5d:408d:0:b0:355:4cb:5048 with SMTP id ffacd0b85a97d-3552fe02949mr11188635f8f.43.1716918746851;
        Tue, 28 May 2024 10:52:26 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a08abd8sm12307765f8f.32.2024.05.28.10.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 10:52:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [master-next][PATCH] migration-5.1: add the recommended pattern for S/UNPACKDIR definition
Date: Tue, 28 May 2024 19:52:07 +0200
Message-Id: <20240528175207.369758-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 May 2024 17:52:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5264

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/migration-guides/migration-5.1.rst | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
index c1cc711a4..b43fecc2d 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -59,9 +59,14 @@ Previously, :term:`S` was always created but after the recent changes it is no
 longer the case. This means the check in ``do_unpack_qa`` triggers where
 :term:`S` is not created by a recipe while it didn't happen before. This can
 require to add an :term:`S` definition to a recipe that only uses
-``file://`` :term:`SRC_URI` entries. Building C files from :term:`UNPACKDIR`
-without setting :term:`S` to point at it does not work as the debug prefix
-mapping doesn't handle that.
+``file://`` :term:`SRC_URI` entries. To be consistent, the following pattern is
+recommended::
+
+    S = "${WORKDIR}/sources"
+    UNPACKDIR = "${S}"
+
+Building C files from :term:`UNPACKDIR` without setting :term:`S` to point at
+it does not work as the debug prefix mapping doesn't handle that.
 
 ``devtool``  and ``recipetool`` have been updated to handle this and their
 support for ``S = WORKDIR`` and ``oe-local-files`` has been removed.

