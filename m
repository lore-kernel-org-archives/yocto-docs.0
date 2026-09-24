Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FBBC98321
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 17:29:09 +0000 (UTC)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3791.1790270942109989960
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 10:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QW/VZP1d;
 spf=pass (domain: gmail.com, ip: 74.125.227.43, mailfrom: twoerner@gmail.com)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78569cf871bso34304137.2
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 10:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270941; x=1790875741; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZgknoNaeY1U6y4e9i/tOum1bSbLBHrd3kT3cn1m0yRo=;
        b=QW/VZP1db/+FzUutf7Uah0umPmVkM/3K8dv+QkXZE3O5CKVY5Ki0w6GdoGZqGf8lAh
         Sr4A3q7av6WiveMFxVFaVmzbovPGdPNQoVJml5c/JfXIL0Q4vuRwj94QyKz5iVcwee1B
         9mYjd5QQf9/YOv/Unqm1EpwdZ6uMNk4Pbc8guiESE4xQTbnbixyv5Pt/IcyVmI6wMmjT
         aNPr3G4kwpi6ftZu2GeQNN8om93llaLnMQvof9kHwUiNk3MPX/fS2X/V2IphqyXR4+vr
         mOs6yc3nrY0tNpQO6zPv2VzU/YYHgBXd6Lwbuee81bu/OPhbjsH97fkcL0LSntLCDg5V
         9RaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270941; x=1790875741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZgknoNaeY1U6y4e9i/tOum1bSbLBHrd3kT3cn1m0yRo=;
        b=k+Po2OeVb6VgKg3l+H2vwR169JOHy0rg4G+Azi1g2uzTe6N2MzhSIcGFSM3RiytBWk
         Xn7H/04HI8nQdUVpVvBitzKXxuZ+WNfJ1vYXjKyNkzTEqHcZjh4o0mWl4Ma+XGfS8g6O
         NG1S7CDMdFbq+gcu9o1fqvT3PD+0RPXGzUN/l5MpJwrPwCyME8i/CtaoGwPXFg3jXtVr
         50XL1kycxeT4UqL1mWzJqKEkaDqsL8L0t8EjxErRYul+b5/T+PZbnEpuwGUscauCzpPI
         eAEJr4CXrg9/3c3sFuwKe6BI7qiuIbDzt8MzYeij1C2p9KLcfJt84vUWAUh6EzWlJq4t
         6JpQ==
X-Gm-Message-State: AFuF++keM6Ra9+bLi5WipP5GtSFFAPhHo+3/nmPlMWEnpKm5qeUEAfaO
	dD4F2h7nZ6eSlaS4UyVlDvO6DllnMHZGdM46FUHI/Ef9hJwu7C0adIjKzmoJgw==
X-Gm-Gg: AYBFou3wBlvnUSds/yrv4wUlFZFhvPuDNok51MS0ZYnZOVq8UdH8RNE2hpHAS1FG0xY
	qBH4LejSnDs0q9KwZHLiPd6N2WL1ga97O9mRqOdv+UF6VgJKkV7oEg1N2btV0T3RCJ8jl1X6CuF
	zbkh2QFNXXkRpfO0l3DT/i3EBIC5/Am554/MNSewK/CIzS6xMBbozABRTuN01IbveSbHORsc4hA
	PIu4itUdP3IMcM5nW3CK3GDBaf9RuBsTPmQuwKPiXSMMR4cvPdYbp0mdwJL7nVpkFG6JvvsxDcp
	GSaXp9koLGS0H1lB9AlcPT12O0k4pXWWRvG7TiHyB4BbM6gLFhXL7aiUZ26CFgrXYhPEJH1l8KT
	TQO5jFkYt7v36Ayq9bKdav1yGR0I3tIbGWYGvYVPCDK9WoFeAPGI/Dpwl7YjHi4wGcgzSJ0Y0Hh
	w8vUFjf43t8aDHCTjs7etV4rvfbs73Dl7MiOpOlvx/PZ+ZYiGpKfcGMW7db6/q01RLqgEZZ95TU
	NVU2ZSjY08woaO44EvdBjkRCrb1Jnf2IkqN6W25
X-Received: by 2002:a05:6102:358d:b0:79e:2b00:b4da with SMTP id ada2fe7eead31-7af1c692c06mr1815068137.6.1790270940164;
        Thu, 24 Sep 2026 10:29:00 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98530725838sm1797974241.0.2026.09.24.10.28.58
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:28:59 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3 02/10] docs: copy only the command from a console block
Date: Thu, 24 Sep 2026 13:28:45 -0400
Message-ID: <20260924172853.2665062-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260924172853.2665062-1-twoerner@gmail.com>
References: <20260924172853.2665062-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 17:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10625

The copy button matches the literal "$ " prompt, so on a block prompted
any other way it matches nothing and falls back to copying every line,
prompt, and output included. Match a pattern covering each prompt shape
the manuals use instead, so the button gives the command alone whatever
the prompt looks like.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- the comment is shorter and no longer contradicts itself about scope
- a ">>> " alternative covers the one Python interpreter example
- a "(gdb) " alternative. The console lexer already marks that prompt,
  so a selection skipped it while the button copied it; the two now
  agree

changes in v2:
- dropped the stylesheet change, so a mouse selection keeps the output
- the comment now says this governs the copy button only, and only
  reaches a block the console lexer has read
---
 documentation/conf.py | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 48d28a686807..d2252d5ab966 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -242,4 +242,21 @@ intersphinx_mapping = {
 # -- sphinx_copybutton configuration -----------------------------------------
 
 # sphinx-copybutton configuration
-copybutton_prompt_text = "$ "
+# Applies to the copy button only; a mouse selection is untouched.
+# Not scoped to console blocks, so every alternative has to be safe in a
+# BitBake or configuration example too.
+# No rule for a bare "#": it opens a comment, a root prompt, and a
+# line of program output alike.
+copybutton_prompt_text = "|".join((
+    r"^(?:\S+[@:]\S*)?\$\s+",   # "$ ", and "user@host:~$ "
+    r"^\S+[@:]\S*#\s+",         # "root@machine:~# ", a root prompt
+    r"^[A-Za-z]:\\[^>]*>\s*",   # "C:\WINDOWS\system32>", cmd.exe
+    r"^DISKPART>\s*",           # diskpart prints a prompt of its own
+    r"^pydevshell>\s+",         # bitbake -c pydevshell
+    r"^>>> ",                   # a Python interpreter session
+    r"^\(gdb\)\s+",             # a gdb session
+))
+copybutton_prompt_is_regexp = True
+copybutton_only_copy_prompt_lines = True
+copybutton_remove_prompts = True
+copybutton_line_continuation_character = "\\"
-- 
2.50.0.173.g8b6f19ccfc3a


