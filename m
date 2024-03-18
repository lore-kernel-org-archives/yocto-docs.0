Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938B3C54E6A
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 15:02:25 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.46968.1710774136545437998
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 08:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XXpjhsCt;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a466f796fc1so569751166b.3
        for <docs@lists.yoctoproject.org>; Mon, 18 Mar 2024 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710774135; x=1711378935; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTpIZyRcBtAZeWSTWXzb1M8t+RwXfZkYYtxyTt0eHEk=;
        b=XXpjhsCtIujuWf9XN9ZmH2KJCN4/jTKOpCoC51iETX9rLLiQEpdruu8x+QoUIsb/Y6
         la1gS0ZYmY3UQlu5W2eW1V9dzwwCCYB3AyxZ4MkkcCM0O2gP5V+Nl2FWE6hRitSlchYR
         dav4Oh6kf9ZJYGLlm2ypyyyvwbgM9hiw/uOqO8oNxr9bDTVRkNignClOOIL91oOQoI+x
         JoppHaK0pN/aN9auxL1HavVGR2lS2LJbVS26sg3w8HGNnDKWh5MWFIT5EulxTXhVztI6
         GX+EJ1Svz2sbXGq7Co3NFPTBrPvncfQN35Vvrwo5GU0qiTlGVj4jxLAZwjRXSPWUWGo+
         HeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710774135; x=1711378935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTpIZyRcBtAZeWSTWXzb1M8t+RwXfZkYYtxyTt0eHEk=;
        b=Y/gAcWyWUMTBT2Fs0RcMf1yxvyxxfvHoW+V0qmY/CYXeivaHbqMNCX85//Z8CR5sNt
         KjZg8yNobXYpJtPKyI6W9QiMdq8N2H0pmp9erV0Zxpl77kJDJbAFVBF9JoKpa26+qIlH
         5Ul5oGZWEuBPdrt2oRpTacU+H6uCplKnZgPJfUY7v3KKiJPiu96ZTIVFtnB+UhECFSmq
         sjzlaDwFGcIxD84fT4ZW1QiJfHiBjAE9m6kpdXZi7GyRtsyYXviiIwRK0S2MXoWZjCkE
         IgPhL5zCmHY0krYhnSG9xBpQLkJR1bq9F2g9HJkcKZ4altEJ4FUhJyzivkEHrrc+04UT
         AzBA==
X-Gm-Message-State: AOJu0YwMvdApXKACek8YgvAZMiUn9BQcEvXpCzGgqmbRMrsbxGQkvIt8
	984JxZEo4BS4LelLsE458UOUX8+XWTrx1YpGnQVSF5X11oGd3aUePEmS+Kg5
X-Google-Smtp-Source: AGHT+IFy1rRpXAYCLi+YFHtMvbMfSojmKqh2koLtsNfh5iVT4NO+avAwxlHZHNdG7qWKQWKeZbi1nA==
X-Received: by 2002:a17:906:a415:b0:a46:1f6d:3047 with SMTP id l21-20020a170906a41500b00a461f6d3047mr8060691ejz.4.1710774134747;
        Mon, 18 Mar 2024 08:02:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id be7-20020a1709070a4700b00a46a9c38b16sm2635356ejc.138.2024.03.18.08.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 08:02:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] sdk-manual: correctly describe separate build-sysroots tasks in direct sdk workflows
Date: Mon, 18 Mar 2024 16:02:10 +0100
Message-Id: <20240318150211.1192651-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318150211.1192651-1-alex@linutronix.de>
References: <20240318150211.1192651-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Mar 2024 15:02:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4987

They were separated in
https://git.yoctoproject.org/poky/commit/?id=63e53fb8b60d38315015844bd3357fa1649cd639

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/sdk-manual/extensible.rst | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 05dd527469e..3f6a754d881 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -76,7 +76,7 @@ Setting up the Extensible SDK environment directly in a Yocto build
       $ bitbake meta-ide-support
       $ bitbake -c populate_sysroot gtk+3
       # or any other target or native item that the application developer would need
-      $ bitbake build-sysroots
+      $ bitbake build-sysroots -c build_native_sysroot && bitbake build-sysroots -c build_target_sysroot
 
 Setting up the Extensible SDK from a standalone installer
 ---------------------------------------------------------
@@ -1507,8 +1507,12 @@ In this scenario, the Yocto build tooling, e.g. ``bitbake``
 is directly accessible to build additional items, and it
 can simply be executed directly::
 
+   $ bitbake curl-native
+   # Add newly built native items to native sysroot
+   $ bitbake build-sysroots -c build_native_sysroot
    $ bitbake mesa
-   $ bitbake build-sysroots
+   # Add newly built target items to target sysroot
+   $ bitbake build-sysroots -c build_target_sysroot
 
 When using a standalone installer for the Extensible SDK
 --------------------------------------------------------
-- 
2.39.2


