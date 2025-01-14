Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF10AC02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 20:08:42 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.4049.1736885320707734573
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 12:08:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pz2oSypD;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38a88ba968aso4890574f8f.3
        for <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 12:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736885319; x=1737490119; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqhyXDLF63DQEMYCKoX1WU8/kbOjoS3pZYIn83cjfoE=;
        b=Pz2oSypDvt4usq8gg/9TkWpU6q42KhGokpRyfnoPkchjbauTUmAu02sg2NZydgQ3RM
         5paIQcC1E4zGNRsID5cm7WGT9gWU9IsgEN/DC/zgYgebKiWePKe41KDZCFT2AYHu5fI+
         Z21I/hmw0EpY2PPJeRIUZUrHcSJmdJg1m8dhCniQ//IpmxZdsHZoA5fa+nQT4Fcdqvqm
         2isi7tmTlgo6GM2M+KmfbIcsIPGqsm5aTC84bdlDNSHfDLxcwU0XSeOHtZyBPRz0v5JK
         bEF+kLsceHHVqMPlhzLxgwA3yxdYq1Er+/QrOLL473tpfsgXOTbv3oYKouh2VRnAwz1L
         OiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885319; x=1737490119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqhyXDLF63DQEMYCKoX1WU8/kbOjoS3pZYIn83cjfoE=;
        b=pDTQiLCuagCZeKauCFk7wBaKCHEd5iOq3lLniotU2y4ul3tAzFTsRorL8mzsq2bz/A
         qXIzfK/QjbFgB4FO4Nhadtv+VQa1vG5CPNYtoxfTcV8xPKmI7r9BadBgb6NZuCGBRzvg
         GzohPpf3zIVSSXou39VfX6pEb6Et6fjMAzEb07rdWN20+Ta5dAPF8H6KHl3EmlQZr+WQ
         LscdaMFMzQL8gzHlByLNifhegz6QNQ8Zolwtf83Tfn6LqlW9OJkO36GObazNH0RY0+hh
         xo0+HUpGiLqURV5gjZ/g2Ql4OQ5H7ETC6jY2O1KOA+EGxnuDD4L6dP2dbMNs+StDZEpd
         iWBw==
X-Gm-Message-State: AOJu0Yz+1FCsMHlrtgp0Jzg4XTzpLVakisDRC3+LQRBCnOFw872IcxCd
	8a9rXLrB5mpS9DZrr67kK2hvoY0wrbWLaVwosVsBndL8FT7nfa6sEglaQg0l
X-Gm-Gg: ASbGncvIHM84pigTgwFj9C9zq+6RpxmboU6KqPLlYE7639tBzILBiaV7858aY6BtX8J
	dMw8bweLgz+lGXE2mzuz5R+T2Hei8bb21tVKaAmxpdFYLoBQtu5LR/ZHJLGd9K8IorA5hYNxK36
	lMmhXSe3mfPZbT4VpCd5Dj0l/jSviG2Q/Y+Qbbqlv7V6yXg9wpodzdv/q2w/iskP/w7GNPQQygc
	reZ/w8A0MMx1E/VinnG2rmlHd7v0ZQCB4MJyT9z+Hk+ZCN8EZHxaYZmJkFF2+pb3yjDQnp/1WrQ
	c+E=
X-Google-Smtp-Source: AGHT+IHDQIt2oEbHjMf08t4F5Si+TOLsRJH7qeRTynEustrWGTqakMTlEro8evhXGw/fwbsj6C3xTw==
X-Received: by 2002:adf:a3d2:0:b0:38a:88f8:aac6 with SMTP id ffacd0b85a97d-38a88f8ac78mr21230238f8f.41.1736885318185;
        Tue, 14 Jan 2025 12:08:38 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c76esm15463787f8f.47.2025.01.14.12.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:08:37 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 2/4] sdk-manual: extensible.rst: update devtool ide-sdk
Date: Tue, 14 Jan 2025 21:07:12 +0100
Message-ID: <20250114200734.4191354-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114200734.4191354-1-adrian.freihofer@siemens.com>
References: <20250114200734.4191354-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 20:08:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6108

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Replace
  devtool ide-sdk --debug-build-config
by
  devtool modify --debug-build

This change was introduced with commit
https://git.yoctoproject.org/poky/commit/?id=1f7eb26c947dde14698ae6e2ab88f0637027f4cb

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/sdk-manual/extensible.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 9a50d7fc54c..3733997fac4 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -669,7 +669,8 @@ The extensible SDK supports two different development modes.
       IMAGE_INSTALL:append = " my-recipe"
 
    Assuming the BitBake environment is set up correctly and a workspace has
-   been created for the recipe using ``devtool modify my-recipe``, the
+   been created for the recipe using ``devtool modify my-recipe`` or probably
+   even better by using ``devtool modify my-recipe --debug-build``, the
    following command can create the SDK and the configuration for VSCode in
    the recipe workspace::
 
@@ -786,8 +787,8 @@ The extensible SDK supports two different development modes.
    .. code-block:: sh
 
       # Create the SDK
-      devtool modify cmake-example
-      devtool ide-sdk cmake-example core-image-minimal -c --debug-build-config --ide=none
+      devtool modify cmake-example --debug-build
+      devtool ide-sdk cmake-example core-image-minimal -c --ide=none
 
       # Install the firmware on a target device or start QEMU
       runqemu
-- 
2.47.1


