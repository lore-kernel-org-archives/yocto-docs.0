Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF32CAC586
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 14:01:04 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.14460.1757340058244767522
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 07:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QVuBa9Cq;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dda7d87faso19872125e9.2
        for <docs@lists.yoctoproject.org>; Mon, 08 Sep 2025 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1757340057; x=1757944857; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qk7NQMcUd4UShJFMtYhJyWPlGGnMmwt/BhIlZOat6Sk=;
        b=QVuBa9CqSFXRZ8NvpxnP8MXW47ES/IDgKuyjIbu7cM5HiUh+FAwot9cHkCvcjUoJ+6
         cc4JDCLREpYF5t882x7lP+QQJBX7q6s1EmyxzzT6QpAEAT17jX29SaVwVQ/w8OzLROq6
         Ax1WyIzAxagRVbvBoT2c07r499Yc4Kbvis6dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757340057; x=1757944857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qk7NQMcUd4UShJFMtYhJyWPlGGnMmwt/BhIlZOat6Sk=;
        b=XilVQQQE003BT6yP/oUgRUyMPu+ZTFd5szJ3Rnc7HzlPZWj1F5wTgfpGQXceAbmBfI
         sNv45eCAXkbw18/GeHvYO42xj1EDHbOy1CCmo7jOEYxQlXxQH2Z9qOraqEbS0m3eCSAo
         bPvumOI8J9BarE1ZwFcthATQ981LS8XPVPAAo6figfNOhA2am+WN+YsgXWBLszbaiJur
         lpqY49BBky9yESdoq2x6NG9HrQmK1o84ljAW4t+WL8rnfle6Z36+TSbBC81WWJ+gR6C+
         UF9I4AvPn+84RmXfU67kuGIBgnc0UDxjIqWU0i5nuxDUc4JtJKPasmWOX59holqpQLZ7
         8e0A==
X-Gm-Message-State: AOJu0YzXXI35QlhSbwymzzcZnpv76mx/6FO+N610AbRDZssgHFxaNXza
	efcU/UYDWMDV7XXXLkKp6Nl9LbZVnPRIuxU6I1S+HUI6XfQGtSWZHp6Skxy1hh5l4XUO+Kyq9XI
	WHqMp
X-Gm-Gg: ASbGnctXlcqtER+JCafpyt8YKqDDU1WxfMmnFPeIRJNeApGITkztCVHQQ/NFnoxDfcU
	n8jZbysEa52jNgqURib0gTkuOBeAgujdCBZXmUp10KszueUECXf9NCJAQTLxWqSd6hfyXsM1/b+
	v19qweanBHVT+FMBf2rB4ROMqSAjXxzmA06RmhSJ2Oe1/Z0CxWq1+Hw+jLgssqcn2HOu1NYgfLL
	rAHNTy2h3i8lPjkAotCOmswqjTIddHlR1LesKV4zrLR5ycfsqBQa/Gujxb7SYkh9+35/kbQTaTh
	sNWytw/yeKNm1Z3Yq7oy0v9aUTZ/qpI0MH1yVqSU85cAqzg6Y+iqr8Czqa60ZoYVusYMRAuaS3R
	BkA9IM/09Tvoqj8sBc9UF+phejbuwR8tbVAvZ7xY0NqWGyxgmWxFYpHXph1pYgcZ+h3mSY5gTYR
	ARwxBg2S+9hKgbRrLf7nBOFwS1dFe3SYHn6/ylLr0e
X-Google-Smtp-Source: AGHT+IE8vGkFHtjS5oS9IJhjfLxaMzcTCLNayxzm93e3PB8uMbDXaOckkcXkkgqqpWecKfHF0dyllg==
X-Received: by 2002:a05:600c:1f91:b0:45d:d5df:ab2d with SMTP id 5b1f17b1804b1-45dddeef92cmr64447285e9.26.1757340054939;
        Mon, 08 Sep 2025 07:00:54 -0700 (PDT)
Received: from localhost.localdomain (2a01cb000301bd0008156b32089b8a82.ipv6.abo.wanadoo.fr. [2a01:cb00:301:bd00:815:6b32:89b:8a82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3dc1cd4a7d2sm21938924f8f.33.2025.09.08.07.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 07:00:54 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: docs@lists.yoctoproject.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/3] migration-guides/release-notes-5.3.rst: new wic option extra-partition-space
Date: Mon,  8 Sep 2025 16:00:48 +0200
Message-Id: <20250908140048.352088-3-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908140048.352088-1-pierre-loup.gosse@smile.fr>
References: <20250908140048.352088-1-pierre-loup.gosse@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Sep 2025 14:01:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7489

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

After commit c7f51c23fd268 ("wic: add --extra-partition-space option to
set unused space") in openembedded-core, document the new Wic-specific
option extra-partition-space.

CC: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
---
 documentation/migration-guides/release-notes-5.3.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index f32c6162d..cb6c32555 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -363,6 +363,9 @@ New Features / Enhancements in |yocto-ver|
          :term:`BitBake` variables. This directory is usually found in
          :term:`STAGING_DIR`.
 
+   - Add the Wic-specific option ``--extra-partiton-space`` to add extra empty
+     space after the space filled by the filesystem in the partition.
+
 -  SDK-related changes:
 
    -  Include additional information about Meson setting in the SDK environment
-- 
2.34.1


