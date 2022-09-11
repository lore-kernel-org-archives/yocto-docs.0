Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7936C6FA83
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 17:26:36 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.714.1662917187243934684
 for <docs@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 10:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YgzPKAZh;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id o5so1534510wms.1
        for <docs@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 10:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=uS2DgCFAj1RqRAIc0X5m3/7IrwX7V6ml5+QGx+Ny4Ms=;
        b=YgzPKAZhQvw1TrZCdRC3l8X1tcYtpdLcWiG3V80mDzaoj+0JmRdJcQLHOObf57B1KW
         tOrTJGBv3g8YKTqLsTlqAT5tki622mScmrE3zCM5LjFNQ5VLbCyjJ95PawAjOApApOB9
         triINQDeVC7PS7pG70LvjTxRdp1Xh6ZurG7EDv0oXLvqd0Vo34wTJ8VQVI41UtnA5gGG
         q6nnZbZCTUGt4pXdJ9Qk342ULYbcNP7f09qg3c6QGjqsMAVifHy6olYgDLDTwx3lcYul
         V5pA++tnuPZSsBcd8tQwbE45srZVsmbagxntfxo7JFa10Ikoxnw71ppzZ2TtfDSt9TJg
         FFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uS2DgCFAj1RqRAIc0X5m3/7IrwX7V6ml5+QGx+Ny4Ms=;
        b=0Z7hhaNKjGfJi5kooGZr3oprYOzxr7ZjP/CSxnjACfiiAlxYBQSY+bKJBcVeyU+sCb
         g27PedKcbIz4kR7LQhIvY/YWByk2AfdFXDYaNfySsghW/SoQVA3Fp2mlQMZrCKhvaSNP
         arPehQwESRJrukkR4yZ7TWzF27yYOeCY5RNf0D4idjnDkp3Ej8Bjz0gmIaVMBdV7yDBp
         dSso4AxnbdTX8pI3H8V2vRp51S6e6KxSDA8qCcw/yWQVdi0PHouYw3Y1tiAkyX9ooJBn
         rPAab/dFBL1bita0TbsnQFKPfrZaIWIS7Zb2f5/e7TMnX+7ObMyZwdKh32k4bIPH1Yxh
         bpgA==
X-Gm-Message-State: ACgBeo1cKNQgWN7snKlvezowe1jNF1nHkG2iB8z/KIZ/jpJw918ldh+B
	/qZLySWhQZlzo6Y4CokUTl5ZZe0S4fk=
X-Google-Smtp-Source: 
 AA6agR6mPLZ3By2w3eP6XfEo4nQxqSVTTMbiXZ03X02+L5KF2jvsFxywGdvkLzHPjU0B0rIQyHzCWw==
X-Received: by 2002:a05:600c:4fcb:b0:3a5:f2cc:2f19 with SMTP id
 o11-20020a05600c4fcb00b003a5f2cc2f19mr11173780wmq.142.1662917185780;
        Sun, 11 Sep 2022 10:26:25 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a5d4885000000b00228de58ae2bsm5280395wrq.12.2022.09.11.10.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 10:26:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/5] common-tasks.rst: describe the newly added layer setup
 and template config commands
Date: Sun, 11 Sep 2022 19:26:06 +0200
Message-Id: <20220911172608.2542076-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220911172608.2542076-1-alex@linutronix.de>
References: <20220911172608.2542076-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 11 Sep 2022 17:26:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3149

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/dev-manual/common-tasks.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index c2afec946..4d19bd921 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -728,6 +728,17 @@ The following list describes the available commands:
 
 -  ``create-layer``: Creates a basic layer.
 
+-  ``save-build-conf``: Saves the currently active build configuration
+   (conf/local.conf, conf/bblayers.conf) as a template into a layer.
+   This template can later be used for setting up builds via TEMPLATECONF.
+   For information about saving and usinc configuration templates, see
+   ":ref:`dev-manual/common-tasks:creating a custom template configuration directory`".
+
+-  ``create-layers-setup``: Writes out a configuration file and/or a script that
+   can replicate the directory structure and revisions of the layers in a current build.
+   For more information, see ":ref:`dev-manual/common-tasks:saving and restoring the layers setup`".
+
+
 Creating a General Layer Using the ``bitbake-layers`` Script
 ------------------------------------------------------------
 
-- 
2.30.2


