Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.1109.1616695963398302782
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Mar 2021 11:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cOU5j51N;
 spf=pass (domain: linaro.org, ip: 209.85.128.45, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f45.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso1722064wmi.0
        for <docs@lists.yoctoproject.org>; Thu, 25 Mar 2021 11:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qu98X6V2bnJyYxrdC2DQb918tH9SfghL1RKe/aPubyU=;
        b=cOU5j51Nf9ZBc8zVyEeGkNkeyVs6mF0g72jNyqnHGIA9xFKKNTpk9nI6lKp+oEBzpe
         mAQha+/udZDQGfpnzBi2aE48kSiDXmCjCc5CzsFiEMlV7zEtQl7NbeGoXpK6WfzOik/D
         HfdPfqps3xIT8ynrNsigmKV/nBW1AO9EcPkCYFwLgWBK9OzK3THYdkZF/H1HORS7q2vd
         hS0YknbDLzO7PlAleBovexWeYViu/X1IOFEbgyujrszxwXJ32NXX6B3giC2qh6OnNk4G
         Hb6RsZ1Q6um+utoEzQXtB/DNmcGNHEEj42UW/++bGNMosoXuCWNH6mWopisTRLGH4Pe9
         IkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qu98X6V2bnJyYxrdC2DQb918tH9SfghL1RKe/aPubyU=;
        b=Yj0jYIsbpacSdnmp88OOS0utz6hOYhV9Kw0i3qEUcJZX4ySSqMEtfycWr9FJjdE5eM
         w7OZIEJQNMbKp31HvLvU+aNjwXs5LS3kBAY5wjmvPEgY2XuFn9VsWD5hwh/N5SPwD5Rm
         O7GgOUFOtSr17qFbKdsY/rDQI5x/kUtozoqIEH4jwdW0AfLw65av2lw49E4laBYrHnMo
         mue7zQugN/ZmKzLenG3caQ/CG9RQwRT5N/Wn9gR5MgWACKlEiYTF8RJ1uJ8UM5e9Xo7m
         F7Cd3Ud7xz6eO7+oAFffCGySqekMKqrwRgF5PdvhTqKoLOxSAnMs0E//goDYHDH8UetG
         AQ0A==
X-Gm-Message-State: AOAM530r+UPn5iPdjMk/4ik/WcXoA9du2SRwiOLNOxelBZDCicGcawrs
	GXroduUoc9qpgJ/WGCV84GFZYA==
X-Google-Smtp-Source: ABdhPJyCU3P2rzI192K9R5he0J1Ly7SOAd1pNGSuajF65uvJhAYifCtnF0O+KV7HdCC0QThOA6kCzg==
X-Received: by 2002:a1c:a543:: with SMTP id o64mr9324365wme.107.1616695961806;
        Thu, 25 Mar 2021 11:12:41 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:bf7c:ed85:7b13:75ef])
        by smtp.gmail.com with ESMTPSA id c16sm9383506wrs.81.2021.03.25.11.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 11:12:41 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: yocto@lists.yoctoproject.org,
	richard.purdie@linuxfoundation.org
Cc: docs@lists.yoctoproject.org,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 2/2] scripts/run-docs-build: publish docs for 3.1.6 and 3.2.2
Date: Thu, 25 Mar 2021 19:12:11 +0100
Message-Id: <20210325181211.59332-2-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325181211.59332-1-nicolas.dechesne@linaro.org>
References: <20210325181211.59332-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: #14308

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 scripts/run-docs-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index e8e081c..9c7ec8d 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -77,7 +77,7 @@ for branch in dunfell gatesgarth; do
 done
 
 # Yocto Project releases/tags
-for tag in 3.1.5 3.2 3.2.1; do
+for tag in 3.1.5 3.1.6 3.2 3.2.1 3.2.2; do
     cd $ypdocs
     git checkout yocto-$tag
     make clean
-- 
2.31.0

