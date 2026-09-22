Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A1BC98308
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 18:33:06 +0000 (UTC)
Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2903.1790101977165731000
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 11:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MQY30+/L;
 spf=pass (domain: gmail.com, ip: 74.125.230.235, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-532db7db0c6so1637541cf.2
        for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 11:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101976; x=1790706776; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WetUozgnRYIabk9vSEXZizqXFXJI9IsYrZY3EqMWYvo=;
        b=MQY30+/LIBf6eEZEqcV1bkDwXmd20J+KNxSwHeFtiwROOQx2giDjqDi+OyqLdCMgns
         3rv5citZiL/m7+TFu4w9QdFKQ5tOHfVWMqUo+bThfNmzDa5en7L8W89wcOGbVaMjNEE5
         +S4JivqxU1UbDgdeBK+rogmhAkb/BPRrNgNIBH+p2O0Qa4d3m/96ahQxpa3zm6ZN+tFZ
         zn+vv8Cbz0sJ61FC8Fx+i7xBmcTMGMs40NNESGis0kmpt4oBfNZLfp3YYeaRjtkGtRJ+
         twyg/TszqbrHnjOkn3pBVWbPlLtE2Jj1tH043SNrjNLYucIAf4lecmplx05j9Zpgh2hI
         /Irw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101976; x=1790706776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WetUozgnRYIabk9vSEXZizqXFXJI9IsYrZY3EqMWYvo=;
        b=sxdL/pirFiiU95wktGUv/+5qjL+0WhFADOcnpKQt/QdFkQvsUCltbzA+oqlD5zU6FF
         r/bHwZiaVwA8K/kScI3Zi3IcxqRx3jM9rev/v3AdjDVk0fkrhxV87tL23mfSAeAiYFpA
         JmHXGFZYuWLlMML0kynj4vH9qjb8M6lQ4TFYqm8ILrv/pBYROPxlWSm1RXVxFA76Y62J
         KdHWgz5aLNLMLLXtyZW+pMBy1LW/Gfu+HIDM1AsmwKg4NvFgOOn93T9cvGyN3fRIy8ZM
         jEm8iqHMdpaMZjHAyKbAeDiVI6+Gff2Li62R78tGEbQXb+uqHy0tRs3P3gR3cKsxTKSR
         V4Cg==
X-Gm-Message-State: AFuF++nkwianC0TSgxO2k3YYYRO6eW6jMa9gzLdVMzg49Wk+J0dzQX6T
	8RQSfoc7rL9Tg1Kup1ecDbVJHm1YQ8zGoBAomHgToWlj5zYehBKrvxrACByk2A==
X-Gm-Gg: AYBFou2pf3Tl8UFlnveaIbtcnHf/sjSBY/2jYS/ZRHlsQMURhXz+Ds3+imrOQtCCgOb
	l0B8tQS2hnC9sZu0aZ1w2fLGQyl1hKaTZXwbgblSJgTzef+PbXi/N/nincHVbXrAYpzW3znV4PQ
	GkkJT+/2aKuYop+OjsB7YoMUq6qhpppNozy9z2h3w9uuNjKWHFD1FRbRnnj01qr5T4OXjpxUpQs
	SCNtpf43W3JGiAFAh8CicNFRzfXdU3j3TEU5ko/SclO9qIc73e184ff5KwYrIdqh4fXHbMZMGjM
	oYhO1XbSukCHnPy1PDfo7FnMEyeVAEXC3j+lE7kuxymLE09wMSVNdh1G2TqaCgMenLmbVvE0otc
	ZE511JaYDACQTe6YuuVex4qJHkin+kAb5kKBrdkEIf9ocmIGKhhk3pYca01dfhdeSDwO7/3ULpo
	r2NFDhealLMkcmYIy7z7KN0B3w+omBoUayTAH6bL8N6GFRyLF6zc1uMT0fSGhuxT1Yl6USueDZ/
	+0+W/ER+W5CZPpPUnIXIj6EPtPpxCtkWUwHqyFAVL7YYTG/um0=
X-Received: by 2002:a05:622a:17ce:b0:530:f73a:90ae with SMTP id d75a77b69052e-532eacd59d5mr6340761cf.48.1790101976065;
        Tue, 22 Sep 2026 11:32:56 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3396f6sm3112821cf.19.2026.09.22.11.32.55
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:32:55 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 2/8] docs: copy only the command from a console block
Date: Tue, 22 Sep 2026 14:32:43 -0400
Message-ID: <20260922183249.2433345-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260922183249.2433345-1-twoerner@gmail.com>
References: <20260922183249.2433345-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 18:33:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10591

The copy button matches the literal "$ " prompt, so on a block prompted
any other way it matches nothing and falls back to copying every line,
prompt and output included. Match a pattern covering each prompt shape
the manuals use instead, so the button gives the command alone whatever
the prompt looks like.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- dropped the stylesheet change, so a mouse selection keeps the output
- the comment now says this governs the copy button only, and only
  reaches a block the console lexer has read
---
 documentation/conf.py | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 48d28a686807..313cabec05bb 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -242,4 +242,30 @@ intersphinx_mapping = {
 # -- sphinx_copybutton configuration -----------------------------------------
 
 # sphinx-copybutton configuration
-copybutton_prompt_text = "$ "
+# This governs the copy button only. A mouse selection is a separate
+# mechanism and takes whatever the theme leaves selectable, which is the
+# command and its output; Sphinx already excludes the prompt itself.
+#
+# It also only reaches a block the console lexer read, since that is what
+# marks a prompt as a prompt.
+#
+# Strip the prompt from a copied line wherever the prompt cannot be
+# confused with content. The pattern is not scoped to console blocks, so
+# every alternative has to stay safe inside a BitBake or configuration
+# example as well; measured over the built manuals, each one matches only
+# lines the lexer itself marks as a prompt.
+#
+# A bare "#" is deliberately absent. It opens a root prompt, a comment and
+# a line of program output alike, and nothing distinguishes them - which is
+# why the root prompts are given a preamble before this is switched on.
+copybutton_prompt_text = "|".join((
+    r"^(?:\S+[@:]\S*)?\$\s+",   # "$ ", and "user@host:~$ "
+    r"^\S+[@:]\S*#\s+",         # "root@qemux86-64:~# ", a root prompt
+    r"^[A-Za-z]:\\[^>]*>\s*",   # "C:\WINDOWS\system32>", cmd.exe
+    r"^DISKPART>\s*",           # diskpart prints a prompt of its own
+    r"^pydevshell>\s+",         # bitbake -c pydevshell
+))
+copybutton_prompt_is_regexp = True
+copybutton_only_copy_prompt_lines = True
+copybutton_remove_prompts = True
+copybutton_line_continuation_character = "\\"
-- 
2.50.0.173.g8b6f19ccfc3a


