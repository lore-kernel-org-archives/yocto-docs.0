Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1938C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 09:04:18 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.11725.1738227848852818774
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Jan 2025 01:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N8T0Zihp;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385df53e559so402029f8f.3
        for <docs@lists.yoctoproject.org>; Thu, 30 Jan 2025 01:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738227847; x=1738832647; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jg0+G7IvnOZdXWOcIQrkiZaBb8sDoYSa2vxWTCCNowE=;
        b=N8T0ZihpNYGhvTJ/LlXZZeUjFr+dFrxbfn6WgMqJ6+FbwS7xIIim+38hkoitbGRkN6
         mrOLQ4TqU5T4LMzgUDoedKD3UfDZvcJ2sPrXe9YOsR6FCmPMub5cR8GhD/6en4WPGONS
         XfyDjFsXPyFj03Lt8oWomKtDARoz/ZQlTHsQ/39MrcuRWJOS7TfSRry1c4q9X6g/f1ll
         5pkJOG4pvTKQxe0i7p5D0JlmcrWe3uuwdSRLIC84N2xVMxlEuOnBOvdMuOoLBwav0WyF
         IhNwTruhg1A3Zr2NmtyNeDgbR2sStd7MK7z1srdLSHZnsGpebvIkzKaY0Jb4aXKa9eHD
         tnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738227847; x=1738832647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jg0+G7IvnOZdXWOcIQrkiZaBb8sDoYSa2vxWTCCNowE=;
        b=WduKonxJicq91k/WZraNcQNamTp3SkfWjQ+xcz07HjKtxGxpl87miioPMBV8fVWFXe
         ssY7YOcNV8OnGpzK1E9eZTQ/amDmAEbRA3UGBIviSaZU0fdi0C/+Gh349D0O6WqM/I7A
         qJ0Vey2qnzdHPmWBOS/0XiWPUzzP4u7jZ2YQofO7Bx0ptbawXkJiCjMpe/PNqLrV0NEw
         NV/1ggt3D7k089YT3PLFMv6a0MSGc9wvCKtAkU5ULmhhgBxOGzdN7LCx08Vg4zB9WPYZ
         f6FYjcUUebZ4CIv9+A6VKYBoI0m8MJQked0m0uywCYgglllpBcBR9GXtW6TzWaDqJ98Z
         YnAQ==
X-Gm-Message-State: AOJu0YwAtI4Jniq5UQxCC41gSL9vq7zzpPJkBEDocX45DncHXX004Bye
	JzxYqh88e6BwUmohiGFlKOeh1lhSVf0DPD0T7CD9QK/a4cpLyQOhHo9zrg==
X-Gm-Gg: ASbGncsfUA9VALYg4vDDLWLnKNBiPltQGnLiljBdDFODqeQQnRQBiB932ekM1caQY+E
	XegheYJtxuMpvpzkcwuI+VcG3aJ34ibAPTQT5ZMmExU6H5/4ldMzmgUxY5F8gKHnyY7+QpS3bLO
	0XMpvsfd4t5e61Qsd4hLOBzEJ3HsVeaJnUoAvK6siXtXqLsqWNFfRvPuduB4E2Jv6BJNHNKD0wf
	3jUqjH3I2CVRz2pXa4dFi7qGNI8ODqo6J3GsnJxApUHyuo/98/yimsZ1ehOXhKqKHvLeCTUi2Kh
	ROeOjjjdsqEuYpR48sdCtFX8/gqya6TCGKtmo6L/X0HHWg==
X-Google-Smtp-Source: AGHT+IH82XCiLwC9mhtcH7NBI3ucdHkGvrT+1MGSdes5EfEvp4JdeP3rpkuZGzK+hxXU+WmAo9t1WA==
X-Received: by 2002:a05:6000:1788:b0:385:fb8d:8658 with SMTP id ffacd0b85a97d-38c52090799mr6083008f8f.40.1738227846797;
        Thu, 30 Jan 2025 01:04:06 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c12191dsm1367255f8f.51.2025.01.30.01.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 01:04:06 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2] dev-manual/packages: add information about signing changes
Date: Thu, 30 Jan 2025 10:04:03 +0100
Message-ID: <20250130090403.2471098-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <D7EOLBIP4NGZ.2873VJSZNHBXI@bootlin.com>
References: <D7EOLBIP4NGZ.2873VJSZNHBXI@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Jan 2025 09:04:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6214

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 documentation/dev-manual/packages.rst | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 4ba2dcae3..8845bf2fa 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -819,9 +819,19 @@ to use signed package feeds (repositories) when doing a build.
 Signing RPM Packages
 --------------------
 
-To enable signing RPM packages, you must set up the following
-configurations in either your ``local.config`` or ``distro.config``
-file::
+To enable signing RPM packages, you must modify the ``rpm``
+recipe configuration to include support for OpenPGP signing.
+That may be done either in a ``.bbappend`` for the ``rpm`` recipe::
+
+   PACKAGECONFIG:append = " sequoia"
+
+or in a :term:`Configuration File`::
+
+   PACKAGECONFIG:append:pn-rpm-native = " sequoia"
+   PACKAGECONFIG:append:pn-rpm = " sequoia"
+
+You must also set up the following settings in a
+:term:`Configuration File`::
 
    # Inherit sign_rpm.bbclass to enable signing functionality
    INHERIT += " sign_rpm"
-- 
2.48.1


