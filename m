Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3617.1795043611329864158
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2026 15:13:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Lv3mTjHv;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: otavio.salvador@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38431138772so224289eec.1
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2026 15:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795043610; x=1795648410; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLeDc90v2lyBmhfJuv6GUIg2S5Lsb1xeaqBTbfzBK6A=;
        b=Lv3mTjHvbmXB1zFjnwGmD4fWfnNYhdFcnZphy+pMUC8k8ulypEzB6ARSHzQ8wMwsk/
         5f9vFqD3bCa8o6yFpF2YiJVq8rZhUbXfnOlvQlXbb2U3WnoagQWK3fMwEw/0RtCX3iTB
         2KhHEwyYpcO16GYNOVMQXU+HWKZvhW0wCkhqDyfHNUzz6i4WqVSLg+VtcGJcCiIg0IS+
         GKMXAOYijeMP8HgJzAJlOPYMqH/HR5+QoU5gXo/gPwQ2vRy/hWLGjLIVL6DVMyfXvo86
         WFlCAQMst4LO589h/Vt1PpFUUQ572Ph5pH6TR+eywy7G7oINFQaVIZEmQeWbKoENGsVl
         oJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043610; x=1795648410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLeDc90v2lyBmhfJuv6GUIg2S5Lsb1xeaqBTbfzBK6A=;
        b=lII7EtQ80LiAb90J40eVjhaHmsGB1NlpojyGHQNLsgYpg3mQftGQhwnyosl11p/gSS
         CJdO6GrK/ntKi26U9SXhDfQ0HIbEpJXWn4VtXDCEV0QxTlndF/gVX5AlDgF2OUB4Etjr
         xpK5D43y9/rTBZbfEj6RlJKAL7xpuzmFYyomNKNt6A+sFZ2iwMWHqHB+CedI5lrLIHPC
         iGuLitpk2If3IyIJKc2EQfrTz5QBjooBPZouknfiKmsm5bNC+iRAetvaKb9h8hqecvY/
         0d+3ojQ9YYGInktIVb/SSfEZlovhKCaA2Vg5XLZlFRV5ZzxoUZLw/SZgYo7uCtvCHej/
         75bQ==
X-Gm-Message-State: APuU4Z8RucH26ZEZkRSn0ctNLqqfhvXQKTMPf5J3Am6//D67vGa6TGIB
	7HaqoI3umqnbLU7GKAzQnXUUxWHbILUcmMS/S+2YX18QEBKgtK9GxFhDOzM+Vzaa
X-Gm-Gg: AZFdTZf2nKB5a/Z02m2TrGzVzS/avLAedDv3Jt2e37eZ3EN/tFMAm6SrYBLd8Ko5g6T
	RhKFGI9ozjvhJ//zH+EUH3UNmernhWR1pte7J8IOQv6FyCJm9MABgj1eQaNkdtbk1HenyyqG4c2
	I/03nmmBEQIhHtdsAc9m1SQKbYXe+POMvoXnYWcOXPT6YjsiFLpy9O2gc3StZQVSdOXkKfxqj08
	EgKAr6iqCA8Ze5KcYBFEeDI2iptnZCo27RjoemT4eIejCaaGxuA4AgaS4yI/FhxUYWIyeWQbeK1
	+Yyq1Ud2vXK/LRDHhAOFu3rrQUgx78nk9CY9BOdWmrIfRZ5kPSqzxfJslFhkJkkqLXDYecgB5oW
	n92wiu0QP5XHfht2jjrQ9eo2usFL94/bMzMeePhpW2xjzoteq16ki+Ud2bQMSJTF/T2dUFAz8em
	fMm3pzra2icRFx8SsISdM19NoIw7txhbWrF+QrO020Ci9Tb4FPOKcHBWDsaNhy3r+sEDkMjSOIX
	sS2JU86FDaIjAmNP6zk0ICwNrmfo0iyVmVS/RsjXIVUB3lnAo097LiNyPJkrG+w30mCrwAv+Grq
	1YZI8k5PKRCV86eE8sXt2JuvMKxD3myazoVFxiBYdIeXmXE4UwXHiy/iboepww1ohNZZ30cj9kA
	/YsmNboGmp/pmcMpXhoMNH31PcD9wPFBTQu/tlHfmJa6fewaCADRVOSWZswNZyvmgwIhJmAUj0B
	wM5o0YmXgrfRWgmb92dHjUljshoeROog==
X-Received: by 2002:a05:7301:430b:b0:382:c1cf:163b with SMTP id 5a478bee46e88-382c1cf2034mr3114268eec.32.1795043610118;
        Wed, 18 Nov 2026 15:13:30 -0800 (PST)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([201.89.183.192])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm16147377eec.5.2026.11.18.15.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:13:29 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio.salvador@ossystems.tech>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>,
	Otavio Salvador <otavio@ossystems.tech>
Subject: [PATCH yocto-docs] dev-manual: Document yocto-check-layer --run-tests
Date: Wed, 18 Nov 2026 20:13:26 -0300
Message-ID: <20261118231326.3121089-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2026 23:13:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10793
Content-Type: text/plain; charset="utf-8"

yocto-check-layer can now run a subset of its tests with --run-tests,
for example to split a long check of a BSP layer over several runs.
Document the option, and that a PASS from such a run doesn't make a
layer Yocto Project Compatible: that needs a single run with all the
tests and, for a BSP layer, all its machines.

AI-Generated: Claude Code, Opus 5.5
Signed-off-by: Otavio Salvador <otavio@ossystems.tech>
---
 documentation/dev-manual/layers.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 5c8bf32b4..5a6577fd1 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -405,6 +405,19 @@ argument should be passed as part of the command::
 These machines are the ones present in your BSP layer, in the ``conf/machine/``
 directory.
 
+To run only some of the tests, for example to split a long check over
+several runs, pass their names to the ``--run-tests`` argument, as
+``<module>[.<class>[.<name>]]``::
+
+   $ source oe-init-build-env
+   $ yocto-check-layer --run-tests bsp --machines <machine1> <machine2> ... -- your_layer_directory
+
+.. note::
+
+   A "PASS" from such a run only covers the tests and machines it ran. A
+   layer is Yocto Project Compatible only if a single run with all the
+   tests, and with all the machines of a BSP layer, passes.
+
 Entering the command causes the script to determine the type of layer
 and then to execute a set of specific tests against the layer.
 
-- 
2.54.0

