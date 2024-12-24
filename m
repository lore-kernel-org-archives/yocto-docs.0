Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044D8C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 14:03:14 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.33682.1735048989008793627
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 06:03:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BaIqTS/p;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso35084175e9.0
        for <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 06:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735048987; x=1735653787; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrwPgD6nqQAL9/HyYvdw+CiavcBtwuqw9sGZW8U2oHI=;
        b=BaIqTS/pLb+x8e5XnRJnU279So7sOuA2QuQ2QkJWvbKH8vkbS8fIQfrQaJkh52cFiT
         QFCztGGIZLLANFNNDDb09oeirJbA5ViitQB3JJ5Ht1VvQPz9/pvj7MYxyuwLEVt6ZlE5
         fmm371j/kWeZySYBb9swWfVBtz26rBgreJvqcM/peEnoSXEjEUrWfyKS8q7Ywb73viAK
         ehukNCOCA/TwKfjPXwLGGK3uQj4MeSN2v9uRVePGVmHhVkEnyOj0yr+QkjN5HyjQyOHU
         haRo4SApGMQjrmbIMM4kP7nXrHEkHixi15p9r3ub3tVc17BgR7/yFM4XYr8jsDqnW5Ny
         mVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735048987; x=1735653787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrwPgD6nqQAL9/HyYvdw+CiavcBtwuqw9sGZW8U2oHI=;
        b=Xro5pCVQIy92jMNijkJdLJ2DFBmvxFjc9jt84FDDBNlyTgLxvd+sOnPkOcWoi46c2E
         9Jv0eq7Dl0zZw4r786eCzrolO2TjJ3sYAo/O+yxKQOh77KOP/24hSDqJqe3FU8ort+Rs
         QXmUKnHA/xxmvA3gkueiLRybdaE1V82OuiI7cBy7IKEU3Sz+m+bsHpoYWH73O59cFIga
         bQpggSZuvUV4pidzzHKafqoEEjlAYXMzIwvcJ/H91/ptwUNcl3ITFyOpKGLNwy39eIyd
         DfSDKnkwP91HaYBciRMgKlEIaTjXrCyg3qPo3dW2bDXPc+Vfl74XBez2b4zuiwV6ypxb
         8wtQ==
X-Gm-Message-State: AOJu0YwMS8rJDp1W3fnx4ybeKpBab+xhMqDlNY0uxDauLnojnGB0EaWq
	38lNGQ2Fr4vLVxhaycewOgBmfxguWnDzaZQhmH6lPw2hOAcxinMnPerCgA==
X-Gm-Gg: ASbGncucy53TdpFEo2J3oPtsUzi0AChy05+sn2ZNrnk2Zq921fhxDxpIypBmVI7REzq
	L0yI/21sfhaUBAAjcXnRTxiAXF5Yeo7EnOLj3a43rDeJUlj99SxncdyMGFQk9XJ2rdAIHQnTI2s
	Iar12/AKemVQwpWhQaM+AxG8Wg5HMStLCYL5Edb3uSuZKQ2Lhcwff+WLPsoFuBDvmwT+RIq+K3J
	vc759QhNjvrW9ZD6c92YxMWVkAlaopIUSiV7AFbEsgKFVVj10/H99aODnyGMAKFjBzkRk8Ms6Q3
	xos1
X-Google-Smtp-Source: AGHT+IEKUg4S20ZGl4/56nWfYl3P2avIL5qurL99A3FYJF35jbsSJY7jqSdKf2aq+I3ckoO0cGWNmA==
X-Received: by 2002:a05:600c:3b86:b0:434:a1d3:a326 with SMTP id 5b1f17b1804b1-4366854848dmr134962075e9.6.1735048987024;
        Tue, 24 Dec 2024 06:03:07 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847214sm14204033f8f.46.2024.12.24.06.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 06:03:06 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/3] sdk-manual: extensible.rst: update devtool ide-sdk
Date: Tue, 24 Dec 2024 15:02:15 +0100
Message-ID: <20241224140251.24389-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241224140251.24389-1-adrian.freihofer@siemens.com>
References: <20241224140251.24389-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 14:03:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6022

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
index 9a50d7fc5..3733997fa 100644
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


