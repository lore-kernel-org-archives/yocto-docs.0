Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64D4C982FD
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 02:03:53 +0000 (UTC)
Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1332.1790042628664592383
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Sep 2026 19:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MyasJVqB;
 spf=pass (domain: gmail.com, ip: 74.125.230.233, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfa7b2093so202713585a.1
        for <docs@lists.yoctoproject.org>; Mon, 21 Sep 2026 19:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042627; x=1790647427; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oP7OgWbkWWkl0sIrr/QpF7zywJLfaDz8nXaCeB/UiK0=;
        b=MyasJVqBu1+ISZTSIJfpOHITGoLcObCjH2ECS9PUIOxpwpIfXVDLt5oWf5ZIdfk9Oi
         LWrM+GL8fRSwHPvNG4b7jWvas8l26Kd1sfFi/WC8qfYkMHheo4XZWwG2+lpmFKOJJwBz
         FmYj6y4GjS2lWpS+XWilVXpNDFMmq31f82p0kaIl0/depB39t2TMop4fwzKpYYZuFprG
         UxC/wxhVLP1vOAMevkEyIezbuZnknQvBhHo5B55Qc7vqVmRyFFCmlEvM5WYHWvulIBk1
         WN9hAEGoxi98LDAqa4ufRYg1YXbXBBB/zn/UmiUsuSnwU6OepTmp1wHElLI1DwgiVMlB
         FKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042627; x=1790647427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oP7OgWbkWWkl0sIrr/QpF7zywJLfaDz8nXaCeB/UiK0=;
        b=q/eQdsFo5/R+Fj8ieq10Rkf1hNSCQo83ikTECIJnqZBhpndbesatpzZE0YyOfp4BF1
         yEzc3wZYHB1sheVPKmE0TYx19p1ew9EX7GHTGGperLS1h9uqbaoao9Xm75ZLpJQ3hxfM
         yGlsRXeIldIwta4goqyyyorLn6OKJKmIl1X0FVrLpsUr5AqzfhmKjD9cBC+/BvLwdeFw
         fjJlZ8u2ArZuIehCdqa+pK420BvJ91eqRKO5bfDVm7KjPtoFZKe7e3clEPLDTkKfTVOa
         2kmTcQeESmeJ/ayY0MEAhA3NxmF389HPiVSREhVfWobzMadc0N7PDAm/RB8T5EnDP286
         SfHQ==
X-Gm-Message-State: AFuF++m7JJJAa9qBZ3KwmegneTUgqZyfZHeURLwWTojffRYwdGJCyjxQ
	fMUB73bACtvPxso1uh8PhxI2S8miZoGCLWYu60LqRdE+c3+ISGlsvY50TNPXYQ==
X-Gm-Gg: AYBFou0qNoIq/yIXyeQekzKscJkOvtmdXeyy+hVoU+aO1jLm3vkp4UiMYwDOl4tRwEv
	7DjPX5uyKKHqvfSy5WEtsjvz2pScJBWkeIKrNHdQIchpNAZGvWa8dOj+Q2FmDHWIjG1iUbC1Zj9
	IpOrJsniFLWtt3GWVxxJ02+eGd2g6JWeB+jxpauzcmjg3ppdmiZtJKkSCQj6F5mL5L7cJoMyb0v
	0BrHFFuQd5PQt5/dNHjXOCuZRn3eUVkwloMSlTj5AYBGUnjr/U57sqVAKWDM9KNxKg8/WTicJaw
	TBsO4nU6qmhX7Q5dAb/s5kxDdG12An8/YvniO/4kurf/+Ch7Om0zAq2ZFmMZvNSZyLAW/LLcRfE
	0s7Uoq1jplpUhErVxgeT2o3Psj6PTmIXs3vW2qD8dtv9XFEq9YiecJqSQG0oCBx68LsNm6QC7vA
	khstBk3d0Hdg0KGFQeolNo28ywTD+04bBtCwSzItDrcd9PBURYOtfR4XUhpLObg3+/O97ZP5cDq
	8BsV/4/xvnw94YkUGciYL5Nh7804yDHWGQHCyTa
X-Received: by 2002:a05:620a:4412:b0:939:46d7:4b4e with SMTP id af79cd13be357-93c15d76553mr343539685a.7.1790042627551;
        Mon, 21 Sep 2026 19:03:47 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d253165sm16817185a.46.2026.09.21.19.03.45
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:03:46 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 02/10] docs: copy only the command from a console block
Date: Mon, 21 Sep 2026 22:03:31 -0400
Message-ID: <20260922020339.481929-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260922020339.481929-1-twoerner@gmail.com>
References: <20260922020339.481929-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 02:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10561

The copy button matches the literal "$ " prompt, so on a block prompted
any other way it matches nothing and falls back to copying every line,
output included. Match a pattern covering each prompt shape the manuals
use instead, and stop the mouse selecting the output, so both ways of
copying give the commands alone.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/conf.py                         | 21 ++++++++++++++++++-
 .../sphinx-static/theme_overrides.css         |  9 ++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 48d28a686807..ccec27e60165 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -242,4 +242,23 @@ intersphinx_mapping = {
 # -- sphinx_copybutton configuration -----------------------------------------
 
 # sphinx-copybutton configuration
-copybutton_prompt_text = "$ "
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
diff --git a/documentation/sphinx-static/theme_overrides.css b/documentation/sphinx-static/theme_overrides.css
index f9e067239b8e..1a439e9faf69 100644
--- a/documentation/sphinx-static/theme_overrides.css
+++ b/documentation/sphinx-static/theme_overrides.css
@@ -107,6 +107,15 @@ section#welcome-to-the-yocto-project-documentation p.caption {
    display: none;
 }
 
+/* Sphinx already excludes the prompt from a selection; do the same for the
+   output, so selecting a session block gives what the copy button gives */
+.highlight span.go {
+    user-select: none;
+    -webkit-user-select: none;
+    -moz-user-select: none;
+    -ms-user-select: none;
+}
+
 @media screen {
     .wy-nav-content {
        max-width: 1000px;
-- 
2.50.0.173.g8b6f19ccfc3a


