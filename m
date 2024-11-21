Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074C9D6ED1A
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 12:32:43 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.9602.1732192353358516058
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 04:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TLvzIEvP;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso6572545e9.1
        for <docs@lists.yoctoproject.org>; Thu, 21 Nov 2024 04:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732192352; x=1732797152; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8fPj8DP3GcWupGdGkXM9dF6OVFtC6EYjGK6sPTvpDg=;
        b=TLvzIEvPMkJIahz9udijMo2Q28av4eCtAEeTcLFlIqwcp51r6xw59uKynab8/EioB9
         tKkjrck/v7KkXl3LuC87codEdJZ65MjdM9LQggxBPuRjzP9PGo7GjxAQn72uuBlZ127/
         D8QKszeUDQjDVswErrUbb1afHB+BBxyFlBw331FVTkkyIacTmAiqwQjKm5Z7JQ5rVr0J
         N2VQdrPsZnzR5FrcsFTVx/pEDmsqMu7nDjYAizm+d/p70porl/GV7xJoiHaWpYr6D9/Z
         wS8zjZslwzTwJF+NBaB7UnjIJjJ4m1sBnQQutYZ5P/HzJNI/ftnu1TgyhIa+R6sxF2Ha
         Oi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732192352; x=1732797152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8fPj8DP3GcWupGdGkXM9dF6OVFtC6EYjGK6sPTvpDg=;
        b=W5FnU9EGSAD/J1fs/gaRd+0+jF0VNXy3/W/Qj8W6fdNT5NLU/E8p5pQFP7czpWD0vf
         em4igPwj2nrAIFJr1f5R8e3Wdd8CxfZ83d0aaBqC9y0QBM8t9wqmT8fnyFfGbmnhRTRa
         FNN82tm1FpFVYOZ1jp4mhAsZ8bb97ZhW7a2Gp29EzlEYviPEwUjfF2e9igegalo1aOp5
         eW4uZEIHOBahnN2cSiSw7XOXIiJwHJZUqVzRbN2WecQqgQUjzCGYplovOJVBT4ncM8On
         rFJxvLLS40nfPVVf/4iNn+WjLHtDy4iVIRoddvKs44bGFJRkqDzrQt5BGpe/RZXHbZoy
         CDJA==
X-Gm-Message-State: AOJu0YzO1ARCF+HidX+VkhUyO5L4PPTwXXkCrwBp/N83I8PAKTdWqp4G
	UmF3VDYh1S96Y9pl9Mdcv5v4KfDUd0flab7Tm4inVfPTQJW1kVw3+YtkrQ==
X-Gm-Gg: ASbGncv8oP1y0hRe+XJGZcPOc4oNciHJjHeYyfbs/762PVSHyprd9l2RxJLVFNzPu8d
	eheCK2pP//cri2T+WEf5La6htr1tIjnjqp+cX20lhln7coci7W2brqrL+1wkh1yJDlEBUs1UjB3
	FR6urv9nsjexrowiwxC5KDqJofI568xYFw+dJfwL3aklgxGwm6UIusWY/qo6d2PCL94+wrG1Vwo
	CC/KFBVpuLX3oj2HPa5QdLVa4bw+q+UHVNsbTbJczFQchSYHd4lTSYHLJVjDsaUZCWphcCzvwb/
	0fQzIUu/B18=
X-Google-Smtp-Source: AGHT+IEphnWDu4m2yZapgH/MNe2VWh/Av7b0eVVam/AU/pUvZ6o9yJr0gmn4Q+UZFH3uovkpUAJU2g==
X-Received: by 2002:a05:6000:1843:b0:382:2349:5a7b with SMTP id ffacd0b85a97d-38254ae4ca3mr5490023f8f.16.1732192351415;
        Thu, 21 Nov 2024 04:32:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493eee6sm4869213f8f.101.2024.11.21.04.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 04:32:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] ref-manual: merge two separate descriptions of RECIPE_UPGRADE_EXTRA_TASKS
Date: Thu, 21 Nov 2024 13:32:26 +0100
Message-Id: <20241121123227.681233-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Nov 2024 12:32:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5781

The second description was added due to confusion over the variable rename in oe-core.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/ref-manual/variables.rst | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 43f4d7966..30887f12c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7130,11 +7130,6 @@ system and gives an overview of their function and contents.
       in the ":ref:`ref-manual/devtool-reference:checking on the upgrade status of a recipe`"
       section.
 
-   :term:`RECIPE_UPGRADE_EXTRA_TASKS`
-      When upgrading a recipe with ``devtool upgrade``, the variable
-      :term:`RECIPE_UPGRADE_EXTRA_TASKS` specifies a space-delimited list of
-      tasks to run after the new sources have been unpacked.
-
    :term:`RECIPE_SYSROOT`
       This variable points to the directory that holds all files populated from
       recipes specified in :term:`DEPENDS`. As the name indicates,
@@ -7165,7 +7160,11 @@ system and gives an overview of their function and contents.
       The default value is ``"${WORKDIR}/recipe-sysroot-native"``.
       Do not modify it.
 
-   :term:`RECIPE_UPDATE_EXTRA_TASKS`
+   :term:`RECIPE_UPGRADE_EXTRA_TASKS`
+      When upgrading a recipe with ``devtool upgrade``, the variable
+      :term:`RECIPE_UPGRADE_EXTRA_TASKS` specifies a space-delimited list of
+      tasks to run after the new sources have been unpacked.
+
       For some recipes, after the new source has been unpacked, additional tasks
       may need to be run during an upgrade. A good example of this is recipes
       which inherit :ref:`ref-classes-cargo-update-recipe-crates`, where the
-- 
2.39.5


