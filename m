Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44554.1795621552095457597
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 07:45:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oyCOFLcL;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: twoerner@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c513a854320so106047666b.0
        for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 07:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621550; x=1796226350; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=095YauQbPBD4KFi9Tq8ouZrN6H1Gyzpl3CIotwnN3Uc=;
        b=oyCOFLcLoNqCLsGPGLcnlBSvzcNXNeo/O3GwJyejjj80v4ggtxXa1QECD3uFMh3EK8
         w+zxHqbS6R4AOCAa7z6UQJg2EPM1xrgoydktxpLO1qh3bX2lHB0+ODH/a1H0uxIHRWYx
         Vc+PIBA6jH/cNKHqEi/pO6mgs9JEO0NDqUMvqcuG+QcJFaFvk+yB9u/0FBV8is1xM92h
         0vFfe54LBqGs3ETx7BwBLsVdO64JNbOUCQCcYxJUbS58oTnLvvSAVrhaX0WauRrtw1q6
         C7JORwIN+0ZSEDnxMtEIvLSmkLO1pKkFQhKYzn+iWTMmvDtneWxYLkRfueW271P45TUD
         OSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621550; x=1796226350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=095YauQbPBD4KFi9Tq8ouZrN6H1Gyzpl3CIotwnN3Uc=;
        b=2RQgzvkdoAyBwBOk6p1QiM1opM0qm2XnWJwUAGewKQ+vRADOkzRHMbQXlaE4RnCODv
         JTNmJTMiUT4R2cshkmD/VOOTrGGt+xWhaK+k2kDNCqlrCQFsvjDwpS9zwKgR7IurLPXh
         GeRRm+uHOqKrCLBt43B6gXmJZ0w4aaczR57Ysge1UEKHB6au24OpJRXzXRNQSqMMINWN
         JZ7HsyWbeoX64PODAlurm/o7pElltRR5/vIvav3Pb+mTtcDoubszLWnI0YT96he50DcK
         dm9cGKwSSwh08ia4EL8RGMlZmvloEj2Aucd0urmmPzdYScZTh3a7jtHy4n7gOXgutQ9V
         zHCQ==
X-Gm-Message-State: APuU4Z+RVVfbsiGCHeeL7fythwrI72pEbrlRfFc1oToMVEa32axNG/qT
	Gi9I9m4m2Weprbn4s6sROppXeQBju57aUXYaDKmJw/H1le7/AQfjfSa0ox9jjA==
X-Gm-Gg: AZFdTZfZP+WnSTLcjdsRcGsS8xSGUN1RE8lQhQb2CxfRpNtk0R6RTGW2gVTN6jThTB4
	v9PG+M3Xc+CqSRg4Uvh1FXHSi5NOXGvlB6qBvU1rxVaQMpBmhRoar5sCWGvGP53t51p6DmKZ0zW
	nd/MeBGA/eK1ghbCc9JG3vcLQkWjh8Amen7FeL/fjEpAp4OSciGgITLKNjkKiItqrwa1gvJhdmN
	6p/zkyWWDVNEt9NtZdMDEQ8uH66qKjKaL12DY5FstuKRMm7nJ/RkzctjabhPW8KMmtU3PZlcVyg
	0j0z2m8rPXiZg6BfSqEkB0+XQr+YGPJMUZs/qmPXY//UB3QDB31+hWukQOv6fajP+U8hwgvzKwW
	vlwS9ftCzVMKVQ6170b9jTiS5KHOp9oV2P3u/hau65KW8l/EQthr0o8BAwt6ZBQ+ak2GcxYqMSZ
	5YT6WDIbLlPV3wVYwIKdWhx89Jaczz8I9LPtd5cTytcQIBmCUc4zwfFYy4FzOsYZh7OIV+ajcVZ
	6fhSXKbBf0fjpzGDZjd7Jbh+SKaMKT4tuLbLlG7zAYF2pjmenT4mseRBzy4BmkxWXJAVCZ7U3O7
	NlNrr/jltjjKrAHjxsewZJjtO7ajEmQnGqBDnankr/eGzdxfjlh6OhZWXir/o+VzgG8WWJQE3qq
	y1sFdgG2VvmYscO1cjKc3hd0pZO4pdNo=
X-Received: by 2002:a17:906:2445:b0:c51:257b:6c3e with SMTP id a640c23a62f3a-c513a84d6dbmr1164632166b.10.1795621548546;
        Wed, 25 Nov 2026 07:45:48 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm651892066b.51.2026.11.25.07.45.46
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:45:46 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 5/7] sphinx: add a lexer for pydevshell sessions
Date: Wed, 25 Nov 2026 10:45:33 -0500
Message-ID: <20261125154535.3486104-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261125154535.3486104-1-twoerner@gmail.com>
References: <20261125154535.3486104-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 15:45:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10840
Content-Type: text/plain; charset="utf-8"

The development manual shows a session in BitBake's Python development
shell, and no lexer reads it: console wants a prompt ending in $, #, or
%, pycon wants >>>, and both mark the whole block as program output,
which the theme greys. The prompt cannot be changed to suit them either,
since devshell.bbclass is what sets it.

Teach a session lexer the prompt instead, with Python inside it, so the
expressions the reader types are highlighted as Python and the results
are not.

AI-Generated: codex/claude-opus 5.5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/conf.py                    |  3 +-
 documentation/sphinx/pydevshell-lexer.py | 48 ++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 documentation/sphinx/pydevshell-lexer.py

diff --git a/documentation/conf.py b/documentation/conf.py
index f89926549d20..3a7e3c920fc4 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -83,7 +83,8 @@ extensions = [
     'bitbake-lexer',
     'bitbake-placeholder',
     'scc-lexer',
-    'wks-lexer'
+    'wks-lexer',
+    'pydevshell-lexer'
 ]
 
 # current_version = "dev"
diff --git a/documentation/sphinx/pydevshell-lexer.py b/documentation/sphinx/pydevshell-lexer.py
new file mode 100644
index 000000000000..a0dd7c9fa684
--- /dev/null
+++ b/documentation/sphinx/pydevshell-lexer.py
@@ -0,0 +1,48 @@
+"""Lexer for ``bitbake -c pydevshell`` sessions.
+
+The development manual shows a session in BitBake's Python development
+shell: expressions typed at a ``pydevshell> `` prompt with their results
+beneath. No existing lexer reads it. ``console`` is a shell session and
+wants a prompt ending in ``$``, ``#``, or ``%``; ``pycon`` wants ``>>>``.
+Both mark the whole block as program output, which the theme renders in
+grey, so the block ends up dimmer than the prose around it and no better
+told apart.
+
+The prompt is not ours to change: ``devshell.bbclass`` sets
+``ps1 = "pydevshell> "``, so what the manual shows is what the reader
+sees. That leaves teaching a lexer the prompt as the only way to render
+one of these correctly.
+
+``ShellSessionBaseLexer`` does the work once ``_ps1rgx`` matches: it
+splits the typed line from its output and hands the typed part to an inner
+lexer, which here is Python.
+"""
+import re
+
+from pygments.lexers.python import PythonLexer
+from pygments.lexers.shell import ShellSessionBaseLexer
+
+__version__ = '1.0'
+
+
+class PyDevShellSessionLexer(ShellSessionBaseLexer):
+    """A session in BitBake's Python development shell."""
+
+    name = 'BitBake pydevshell session'
+    aliases = ['pydevshell']
+    filenames = []
+    mimetypes = []
+    url = 'https://docs.yoctoproject.org/dev-manual/python-development-shell.html'
+
+    _innerLexerCls = PythonLexer
+    _ps1rgx = re.compile(r'^(pydevshell> )(.*\n?)')
+    _ps2 = '... '
+
+
+def setup(app):
+    app.add_lexer('pydevshell', PyDevShellSessionLexer)
+    return {
+        'version': __version__,
+        'parallel_read_safe': True,
+        'parallel_write_safe': True,
+    }
-- 
2.50.0.173.g8b6f19ccfc3a

