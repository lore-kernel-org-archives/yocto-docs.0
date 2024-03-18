Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83290C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 15:02:25 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.46835.1710774136274875608
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 08:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TwfZ+1qb;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-568aa3096e9so5308809a12.0
        for <docs@lists.yoctoproject.org>; Mon, 18 Mar 2024 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710774134; x=1711378934; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1yqsSaV4giw36xVx8dxhuSNPdyZIEEEJcpLD29R2LpM=;
        b=TwfZ+1qbgRoQRv+LdwGnkrB7n7d7EJRLBkrTTBQ++/HrOhFJudOThP6Z90eJxp5Qa5
         RvxJWwSaCV0lRG1rZ41GFEBD15gwueXUEihZEowjMFcn83Mzw6Fg78YVSD0pzcu8ZaxC
         mbwMiE4piRrPu2xcceRXcCMWzjhTjEhXfhpCLg9fiT0NO5nRhYz5WP/ihqpJO/HbUwq7
         Q8FEjOz4FA2KyiIiRz3Vk4HwHtsC9RlXctzHcg2yXaiRyy2Sylg1oMjMs1EFr0nCWZNx
         f6wRVCHoSr9wp38tK4hj5VqZxFjuarOtouLt1claDg8lh99tcpupthLxghToIOxEbVnr
         CzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710774134; x=1711378934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yqsSaV4giw36xVx8dxhuSNPdyZIEEEJcpLD29R2LpM=;
        b=LQdx0pCkW19s/fFYrwI+pYkhnePOAfCVDCPHk7DqFxff/DMiAUyXtys8vRnWM+zq3B
         pWKw7iCoYjz5HWyUTCsOZrNqRSUQc4P2hTjo+1qf6GfwXbk6/czSFHWzZqyi1xNPCwta
         eKcH2eObNU9n5MUS22fv1FHp0AVkwE831kwn3PBpnO873gSVMVXefXg5Px8+tLjGHvvP
         U9cT9onY4th8tY2FaUe2c0ezvSBiiTSIXofSNbGm6LHSOVeVbXqKr/1zRhC7/0IvsGUb
         1yBuBXTrJ2896wxSUOVvCUtvvOgKRpBggrGpP0rETaQfwpMW7mmhbeeNMi/rukpAbGRs
         PhcA==
X-Gm-Message-State: AOJu0Yw99VXWEqCywehkK6Pg5pY8ADoKuHZlpU+woS+Hp5ag58kssuLu
	x8nFxh2AyrxHkFcx/JkUrDrljgchDZxSfHAXpO6G8i0jIe/o6Yu133bQgp4M
X-Google-Smtp-Source: AGHT+IFZuryNUJodBk2gIcUH4T0fzomphPk0OT3tJLRettjUGqxOGXB2Woi1bWGYbSW6s7c5mnwZWw==
X-Received: by 2002:a17:907:7283:b0:a46:b43e:fa3c with SMTP id dt3-20020a170907728300b00a46b43efa3cmr4245943ejc.15.1710774134239;
        Mon, 18 Mar 2024 08:02:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id be7-20020a1709070a4700b00a46a9c38b16sm2635356ejc.138.2024.03.18.08.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 08:02:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] dev-manual: improve descriptions of 'bitbake -S printdiff'
Date: Mon, 18 Mar 2024 16:02:09 +0100
Message-Id: <20240318150211.1192651-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Mar 2024 15:02:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4986

Try to particularly emphasize that it can be used to find
out why something rebuilds when it shouldn't.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/dev-manual/building.rst  |  7 +++----
 documentation/dev-manual/debugging.rst | 13 ++++++++++---
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 7fcac33b754..e0d0aae85d0 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -775,10 +775,9 @@ your tunings to best consider build times and package feed maintenance.
       in the script for information on how to use the tool.
 
    -  *BitBake's "-S printdiff" Option:* Using this option causes
-      BitBake to try to establish the closest signature match it can
-      (e.g. in the shared state cache) and then run ``bitbake-diffsigs``
-      over the matches to determine the stamps and delta where these two
-      stamp trees diverge.
+      BitBake to try to establish the most recent signature match it can
+      (e.g. in the shared state cache) and then compare matched signatures
+      to determine the stamps and delta where these two stamp trees diverge.
 
 Building Software from an External Source
 =========================================
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index ce29815e9f5..9f87f48cec8 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -339,7 +339,10 @@ BitBake has determined by doing the following:
    :term:`BB_BASEHASH_IGNORE_VARS`
    information.
 
-There is also a ``bitbake-diffsigs`` command for comparing two
+Debugging signature construction and unexpected task executions
+===============================================================
+
+There is a ``bitbake-diffsigs`` command for comparing two
 ``siginfo`` or ``sigdata`` files. This command can be helpful when
 trying to figure out what changed between two versions of a task. If you
 call ``bitbake-diffsigs`` with just one file, the command behaves like
@@ -356,8 +359,12 @@ BitBake command-line options::
 .. note::
 
    Two common values for `SIGNATURE_HANDLER` are "none" and "printdiff", which
-   dump only the signature or compare the dumped signature with the cached one,
-   respectively.
+   dump only the signature or compare the dumped signature with the most recent one,
+   respectively. "printdiff" will try to establish the most recent
+   signature match it can (e.g. in the sstate cache) and then
+   compare the matched signatures to determine the stamps and delta
+   where these two stamp trees diverge. This can be used to determine why
+   tasks need to be re-run in situations where that is not expected.
 
 Using BitBake with either of these options causes BitBake to dump out
 ``sigdata`` files in the ``stamps`` directory for every task it would
-- 
2.39.2


