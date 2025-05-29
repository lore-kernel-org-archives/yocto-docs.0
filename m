Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B193C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 16:34:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.25638.1748536483847667258
 for <docs@lists.yoctoproject.org>;
 Thu, 29 May 2025 09:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K+mExYuy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cd6b511cso6989405e9.2
        for <docs@lists.yoctoproject.org>; Thu, 29 May 2025 09:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748536482; x=1749141282; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5r+QglQ3dteNGxZTmlhzj6nbPZTuKkMkZiYPygMUZcU=;
        b=K+mExYuyeiHr+Cm2GGyTDTxPJYxSm4terx83ju38QayBA5uAtsH3wViFhuNyGR++QB
         fH+GPPKNC19Cn/PYX6x0GZF94b2dTj0DVSIi41t01DHWsJFrDPAkJaUgrBtvl/byZOkH
         pdFNrMetJV1wCTlYUzzhv/rgHun3m/B1jPYBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748536482; x=1749141282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5r+QglQ3dteNGxZTmlhzj6nbPZTuKkMkZiYPygMUZcU=;
        b=k8DBbY/YPEh7tumU/7dhB9d+fax4T5Yl/G1txAOlhxT74xw7xdejPnLqCjlO+maxEb
         ZNPQu7b0/xJIVkFqdnDpVDaP7cwj8Z8PI65IlW4r4B/DEzzU+my7rmNLXEeXCu3BKpvk
         sHP/6lJALMsyzsAFR/OeVqATYoTRRnzOV5Gv1xprY9p2SqKk10WW37kECggFzJcwDK2h
         GiGIP9KcC35EIU7Nf0UBJ90CICj4aHQROomZEI4/KOvzxdSbxvbMpOvWlglZ2hGJ6nsO
         NJN4hnXmiEU78jlG2QJsAbwH0J/tPK85EmYo2/tN7nflyCoPY8U5+iEt/iVZww5D3x2Y
         dzDg==
X-Gm-Message-State: AOJu0YzGRqWi0DTQg/V9v8nQIFQS9nuBYYfJT8TqD9zwgfRarSoPc5mf
	0yuwkRsfjJN/Mf2KRAyabDvGhJ5fGVg+QREKqgzJubQ/tWGIJyKcZy9OitYytkuix/ded3kpVvY
	RdgHPZN0=
X-Gm-Gg: ASbGnctpOXSf7Wmrm8GFwcnncyjLA0JNj26opDJxeuPebW88C7YTR9awzUhOG+v0OR4
	JYOKWY3SW+IynqLUAJKhu7gr9MgFua232kHDs7biQi/iK8lUktuqh8Y84e8kbKhWdCJabWtnf6M
	ZcDjZHwIvDeOhxDHaX2pdZei5DGJ6LNI1N5Is7/i8HJ3IU7L6j9jnbXhZ/lY2VoCVVpWXx2luD9
	dL9iHtkbRXJ4lF9lNgCHLdoCGLYExUn6twRnNKvvgKaRU0lFFpTqm/FLo1nvDYSJIO14QCz3Hfu
	J4eApgZZfVusmhIhjK2BF4PXqVK7vurChe6qorgqfvEIP1Q8+SlfevN3MKkzkPv82mMZxCeDY4/
	r4w==
X-Google-Smtp-Source: AGHT+IGZSES5awAp51nPToxoMxeTWClyjWETCb6e0DjlYAE9PNSALtBqVdjGoygv36v8ld0zxa15sA==
X-Received: by 2002:a05:600c:c16b:b0:450:d00d:cc with SMTP id 5b1f17b1804b1-450d64bdff5mr4811305e9.2.1748536481811;
        Thu, 29 May 2025 09:34:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1a5e:81:40ad:9da7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f67sm2423129f8f.47.2025.05.29.09.34.40
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 09:34:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] brief-yoctoprojectqs/ref-manual: Switch to new CDN
Date: Thu, 29 May 2025 17:34:40 +0100
Message-ID: <20250529163440.3116537-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 May 2025 16:34:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6948

The project is switching the way handle our CDN provision of sstate objects,
update the URL accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/brief-yoctoprojectqs/index.rst | 2 +-
 documentation/ref-manual/variables.rst       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 48f81b16a..fed511c2b 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -253,7 +253,7 @@ an entire Linux distribution, including the toolchain, from source.
       file in the :term:`Build Directory`::
 
          BB_HASHSERVE_UPSTREAM = "wss://hashserv.yoctoproject.org/ws"
-         SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
+         SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
          BB_HASHSERVE = "auto"
          BB_SIGNATURE_HANDLER = "OEEquivHash"
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c697bdbbb..9768d8f5b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9117,7 +9117,7 @@ system and gives an overview of their function and contents.
       The Yocto Project actually shares the cache data objects built by its
       autobuilder::
 
-         SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
+         SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 
       As such binary artifacts are built for the generic QEMU machines
       supported by the various Poky releases, they are less likely to be

