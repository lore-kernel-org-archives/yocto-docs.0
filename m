Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13816.1795092105694567558
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2026 04:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=q6R5HtW4;
 spf=pass (domain: gmail.com, ip: 209.85.222.53, mailfrom: otavio.salvador@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99e0b348a05so607764241.1
        for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2026 04:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092104; x=1795696904; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cHE9Kv9URXch8iGFCoi7AhOdsMuI3s1Mk+9yxsWtOoY=;
        b=q6R5HtW4Q+asvScbf0xRooK7/fCQ12D3cbSBC7YPWWsBhS06YxuQKGp9LZ85GmiKCK
         UqqXzudf6hjqk4DzvQZ2M5w3CrlIk3wcLF1lvZNqfs3QGY0F7xzUztaTr1k1FM2ncVl8
         afuyi9jhQrLWlpb8TNtYCL3NQXdckn3QTHRzXcDmOG3urKxR2gvn6oK7q5smAqLc/XYw
         hhjR+9xdaExbtymBIJs+SWW4mf4P0cBigE1oYWvhAISQJ5p/afrewjMrxQfmx3Urctss
         q6VujCXs6WJvur3CZeI/l22ztjJVRv7GLOmwequb/5spggRdKg65wuIMX20a+C7jHu3+
         BOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092104; x=1795696904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHE9Kv9URXch8iGFCoi7AhOdsMuI3s1Mk+9yxsWtOoY=;
        b=0pjSkR7m+777XhWsbvfrnL7AG9jiBaC5gZul5ErrMwO1gd5rlTWwdEPCQn4etuNkVI
         c+S0BWQUbSJheFvsIRz3cEy+9vg6aupo6cYbdRxRoNT6pH+ZiQ7hYwR0iQ8NMRuykfyM
         1Xw4HEybgTz+GIBdUa57ztEmm7OOPvXt+d3SbwFG2IZ0CoXiPTelAjQc0rUqM5rPHfLb
         Chw0Q5g8PswC7S4m9ikKtbkMOXAexzY443VTZiPHImHRv3DVehFY1LlxUrbwDbPrl5rn
         YVt/gvGuU+26+Nx3XG6JO0f3ivUDBHETJVC9h4VW9JV9nQYAIuYxGiyAiEbffzkVqPGe
         2y2A==
X-Gm-Message-State: APuU4Z8ZKutdPdZ3IsIzuuIUsl2W9gwQEB/5mF24cMu1KxOxSXAAGKdY
	htGFOBJs63g5DkrAQd/p+Vw0xe3gdgtWo6LXCDq9+2JtiZpmjYEUnsNQcg3T4zB6
X-Gm-Gg: AYBFou2wuJ/136aAoQe2lTkZ8w1xcYA4y1VJadzU6E4By6jB4Krk7zZHbIgXx/jeXGW
	Espqrir81vYfa0DH0BFwmQD4ba9ZKGKlJs4nAb4tgrlA6M+YB7L3jY4xw9BzBNcfie+mztssR92
	egpLtUq1TgbwAGm36jvTLy2QejsKEQ1NBAbezutfBsznReHcYbzk2jIUl9nVLr2u2J5OW8Ei2Z+
	2+0WUyhNilA8JfNURkx2S6LnRT1E7M//eACzzowV8dxINfkibKFOOabu5Dq8bcHHGuHYhfpXrga
	nhEIhYmt8Do0Pk0GBv38KT2LPXCPko4a7KBLI2RhpzvhdmWjAQag3YxOrCF5IqJ688yKiggc9Rj
	cJUYrYjsj+11Gz1sd37Cd2sdNEL1lgIQm5ICKh/9cpIGNLghB6qoZm4kQBqZfOAKJ/rnPORLm1Z
	qbleU6DE3cEWaNoynyz1ghUYFzhVBHjOD/0KkNT0HPfE1TewDWGxdImAsUDAfebQRhsI3OANgNi
	XJeNbKFbMH+p7rOLehp+4nkEoIG09nawoOW1XqhAfwQ6O/tQWj1flNx2PscwxlnbV57CnQVj3A6
	pqo4xOv41pQavVje0epVu8QT07Z4TBup5W0WufepVF0RCvvgX2Xh2CO1c6Gzk+75NoZRA23yl02
	O2eAG54aAQWAtBdBWCVp6qV4Mref1dj+vue49w9Gy/BwCCLMEtzaHvZYJt9WD470R/xhJ+Ek65l
	mHJwAYyJxg+gKnlKj1gP4axZZck3ucgsO7cUpJ49uEbgKJ6YLRWg==
X-Received: by 2002:a05:6102:1612:b0:7cb:288a:b66d with SMTP id ada2fe7eead31-7d6ba40e058mr2043314137.20.1795092104356;
        Thu, 19 Nov 2026 04:41:44 -0800 (PST)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([201.89.183.192])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9139b74sm4330572137.4.2026.11.19.04.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:41:43 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio.salvador@ossystems.tech>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.tech>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH yocto-docs v3] dev-manual: Document yocto-check-layer --run-tests
Date: Thu, 19 Nov 2026 09:41:40 -0300
Message-ID: <20261119124140.2024131-1-otavio@ossystems.tech>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119122700.1695957-1-otavio@ossystems.tech>
References: <20261119122700.1695957-1-otavio@ossystems.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2026 12:41:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10802
Content-Type: text/plain; charset="utf-8"

yocto-check-layer can now run a subset of its tests with --run-tests,
for example to split a long check of a BSP layer over several runs.
Document the option, and that a PASS from such a run doesn't make a
layer Yocto Project Compatible: that needs a single run with all the
tests and, for a BSP layer, all its machines.

AI-Generated: Claude Code, Opus 5.5
Signed-off-by: Otavio Salvador <otavio@ossystems.tech>
---
Changes in v3:
- Explain <module>[.<class>[.<name>]], list the module and class of each
  test file with a link to it, and add an example running single tests
  (Quentin Schulz).

Changes in v2:
- Use the same address for the author and the Signed-off-by.

 documentation/dev-manual/layers.rst | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 5c8bf32b4..66877089d 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -405,6 +405,42 @@ argument should be passed as part of the command::
 These machines are the ones present in your BSP layer, in the ``conf/machine/``
 directory.
 
+To run only some of the tests, for example to split a long check over
+several runs, pass them to the ``--run-tests`` argument as
+``<module>[.<class>[.<name>]]``: a module runs all its tests, a module and
+a class all the tests of that class, and a full name a single test. The
+modules are the files in the :oe_git:`scripts/lib/checklayer/cases
+</openembedded-core/tree/scripts/lib/checklayer/cases>` directory, each
+with one class:
+
+-  ``common``: ``CommonCheckLayer``, in :oe_git:`common.py
+   </openembedded-core/tree/scripts/lib/checklayer/cases/common.py>`.
+
+-  ``bsp``: ``BSPCheckLayer``, in :oe_git:`bsp.py
+   </openembedded-core/tree/scripts/lib/checklayer/cases/bsp.py>`.
+
+-  ``distro``: ``DistroCheckLayer``, in :oe_git:`distro.py
+   </openembedded-core/tree/scripts/lib/checklayer/cases/distro.py>`.
+
+For example, to run all the BSP tests::
+
+   $ source oe-init-build-env
+   $ yocto-check-layer --run-tests bsp --machines <machine1> <machine2> ... -- your_layer_directory
+
+Or to run only the ``test_world`` test listed below as
+``common.test_world``, and the ``test_machine_signatures`` one::
+
+   $ source oe-init-build-env
+   $ yocto-check-layer --run-tests common.CommonCheckLayer.test_world \
+         bsp.BSPCheckLayer.test_machine_signatures \
+         --machines <machine1> <machine2> ... -- your_layer_directory
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

