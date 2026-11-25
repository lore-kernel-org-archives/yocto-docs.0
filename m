Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44549.1795621546520173603
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 07:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CjtGUANX;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: twoerner@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso880443766b.3
        for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 07:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621545; x=1796226345; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B7gTNQxPBgSRwbFsFtNL/fYO33GHbuwt40VqaM1Layk=;
        b=CjtGUANXMu+Nm6z1tewt7QdDPvjO4cvojYgN+x96kNwf9jcmu5z0OPp1xRq9WqjysA
         y2V3d3ljVilZTWh3JFQrjEakKtd6fnYBVfaSp32Uph+OBbzo/XcSxhVCMs7LtDbVKZRl
         PZPbT4mHhdlgn5DlK5pPNp4WYsvxXrd/A/p6xbJCGlbzSO5V9jgvv2L3Ph5ifQBnAiC4
         dFTOMfjxL4X0SwIO67VgN760OLarUxUnAU4refPHHMkmPeQ/nX2GhjbDKtMl3vX6Zpvr
         NAq/xye7Mt3yTCG65FM6cQ+MnFgBnlUb3+OiQjMWbkuwQza7whf6ctpmaRGkQg+ekN9x
         JqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621545; x=1796226345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B7gTNQxPBgSRwbFsFtNL/fYO33GHbuwt40VqaM1Layk=;
        b=NmmIL9at5BY8+blzKSucNtq40YQisdxbox8YH9hyK0wucF2/gDm4M4es+sdMUR73Jp
         1waejm8li8XDEjwUWP+JuFxGnv3T9l4KwrSPT0maczL2gxdyjisSzZH767oZxrZIszJD
         MR2GBffNHVHzqAmZq2Pz6TRcB5Xna/k8UnvmWBsH/hmxLF6yQTybeEZd6YmIulQd9elt
         9QNd4ILTwEW9/MGO59kZX0OfCjJ9dzK+pKf/NCnBmwM/ffOOqyEgrcPCkvv9zwJJeniz
         WSgeviyVDtZe9hDAhJ9Z5K/oRIzAhGzRm/E00y/nhISthmYzdE2FvLOXaCDdQHsmlNd1
         34mg==
X-Gm-Message-State: APuU4Z82NGLocyKIW4N8/DMpvH4UlVJu9fDraJjn60gPyelIZKCRWNi1
	I10LzszQAq/sxMCGdm4uMaBDE6oJ/U5/GJpYVLQyY/cPb8m6E7v+3V7rz4JEkA==
X-Gm-Gg: AZFdTZdIhj7mJI/tTXA44R0fwnoj0uWI3ZXtDQx59KRYTR7dDVNSdz0aLhT2ADjTDx9
	L/gHDS+j2AeudSNm7FGK0nHkzTRSOrUB19VvC3jeP9BJRjU/YgSdtJQtxm2QEnWOE5j9PQdQoVl
	qWeM5ahN+lLq9QRBYIMIp4lvRRC3ULx67VAbQ9G9bPRD7QvFlz0BNiP7jkSLza8bWypKJBDrbva
	baNufZWzAbwFPiG5PtIZcwqfOfJerQHDpSkpzVf/zn/ZIzJyV/HdqnwZNtAIo+Nc4IBH8A7Nat3
	0WWJnFkbPcKFta9jq1Y/750GaB4QJ9OS9L8j1XmrRx1UnFvPRiaHJ8FVC+HkeYydA2VjGk8JQkZ
	vldjP02l4Ieoo5qvi7509V/RLGLsvJ19Dp6PgPRKw2LAgyodFSIlcarEJxsoIUwu1FKTCBu9WrX
	z2uGEICz3AQWgu5gJ2Q5nrku9H6F/v/4ajuKfiG50pJv3D0hi2skuEOTPKs+tqUuJOSDPhw1h3/
	NjeguWyWrCnqc76r1VzmWXF2gvUlfCb5vHNbQTPmp/SjtMWYskILSAlgeSePzEw6WOdAqHlIhO3
	2HzKfbd78dKsCZqEui75QwHdU5e3f67zYxh9PsZmmx6Ne4B5WtetzWRs0G/Npn4mD8mck3Jd5eJ
	NgQLl1fZfdiEezC+8pXJb60dM29pKqEo=
X-Received: by 2002:a17:906:b854:b0:c49:cf3a:a324 with SMTP id a640c23a62f3a-c513a9b1c52mr1069649466b.22.1795621544424;
        Wed, 25 Nov 2026 07:45:44 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm651892066b.51.2026.11.25.07.45.43
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:45:43 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/7] sphinx: add a lexer for kernel metadata SCC files
Date: Wed, 25 Nov 2026 10:45:31 -0500
Message-ID: <20261125154535.3486104-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261125154535.3486104-1-twoerner@gmail.com>
References: <20261125154535.3486104-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 15:45:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10838
Content-Type: text/plain; charset="utf-8"

The kernel manual quotes SCC description files throughout, and none of them
can say what they are: Pygments has no lexer for the language and is
unlikely to want one, so they render as plain text.

SCC is bash. spp rewrites a few line-oriented directives, then scc
sources the result with one shell function declared per statement and
PATH unset. Description files use that freedom - conditionals on KARCH
are common in real metadata - so extend the bash lexer and mark the
vocabulary, read from the functions the tooling declares rather than
from the manual's reference section, which omits several.

AI-Generated: codex/claude-opus 5.5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/conf.py             |   3 +-
 documentation/sphinx/scc-lexer.py | 116 ++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 documentation/sphinx/scc-lexer.py

diff --git a/documentation/conf.py b/documentation/conf.py
index 95bb24002544..210b4ab60595 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -81,7 +81,8 @@ extensions = [
     'sphinxcontrib.rsvgconverter',
     'yocto-vars',
     'bitbake-lexer',
-    'bitbake-placeholder'
+    'bitbake-placeholder',
+    'scc-lexer'
 ]
 
 # current_version = "dev"
diff --git a/documentation/sphinx/scc-lexer.py b/documentation/sphinx/scc-lexer.py
new file mode 100644
index 000000000000..dd1166ca7014
--- /dev/null
+++ b/documentation/sphinx/scc-lexer.py
@@ -0,0 +1,116 @@
+"""Lexer for kernel metadata SCC description files.
+
+SCC describes a BSP or a kernel feature: which branch to build on, which
+patches to apply and which configuration fragments to queue. The tooling
+that reads it is ``yocto-kernel-tools``, and the shape of the language
+follows from how that tooling works rather than from how it looks. ``spp``
+rewrites a few line-oriented directives, and then ``scc`` *sources the
+result as a bash script*, having first defined one shell function per
+statement and unset ``PATH`` so nothing else can run.
+
+So an SCC file is not a dialect of bash but bash itself, under a
+preprocessor: the ``spp`` directives have their own, non-shell semantics -
+``#define`` is a comment as far as bash is concerned - while everything
+surviving that pass is ordinary shell with a fixed vocabulary of commands.
+Real metadata relies on it, with conditionals on ``KARCH`` in particular,
+and a lexer built from the manual's statement list rejects them. This one
+extends the bash lexer and marks the vocabulary, so the shell half is
+right by construction and only the command list has to be got right.
+
+That list comes from the implementation: the functions ``scc`` defines
+itself, the functions it sources from ``scc-cmds/*.cmd``, and the
+directives ``spp`` matches before any of that runs. It is wider than the
+"SCC Description File Reference" section of ``kernel-dev/advanced.rst``,
+which omits ``mark``, ``merge``, ``tag``, ``prefix``, and the flags.
+"""
+from pygments.lexer import bygroups, inherit, words
+from pygments.lexers.shell import BashLexer
+from pygments.token import Comment, Keyword, Name, Text, Whitespace
+
+__version__ = '2.0'
+
+# Statements, as the tooling defines them. ``spp`` handles include, patch
+# and kconf itself; the rest are shell functions declared by scc and by
+# scc-cmds/*.cmd before the file is sourced.
+_COMMANDS = (
+    'branch', 'define', 'git', 'include', 'kconf', 'mark', 'merge',
+    'patch', 'prefix', 'reloc_dir', 'set_kernel_version', 'tag',
+)
+
+# spp matches this before bash ever sees the file, so it is a directive
+# wearing a comment's clothes and needs its own rule.
+_DIRECTIVES = ('#define',)
+
+# Words that qualify a statement rather than starting one: the kconf
+# fragment classes kconf.cmd tests for, and the flags spp looks for on an
+# include line.
+_FLAGS = (
+    'as_module', 'hardware', 'non-hardware', 'nocfg', 'nopatch',
+    'optional', 'required',
+)
+
+# spp recognises these only immediately ahead of kconf, at the margin.
+_LEADERS = ('as_module', 'force')
+
+# A statement sits at the margin. Reaching it reliably needs the rule
+# below that stops a run of whitespace at the end of a line.
+_MARGIN = r'^[ \t]*'
+
+
+class SccLexer(BashLexer):
+    """Kernel metadata SCC description files."""
+
+    name = 'SCC'
+    aliases = ['scc']
+    filenames = ['*.scc']
+    mimetypes = []
+    url = 'https://docs.yoctoproject.org/kernel-dev/advanced.html'
+
+    tokens = {
+        'root': [
+            # Both spellings of define name a variable, so mark it.
+            (r'(' + _MARGIN + r')(' + '|'.join(_DIRECTIVES) +
+             r')([ \t]+)([A-Za-z_]\w*)',
+             bygroups(Whitespace, Comment.Preproc, Whitespace,
+                      Name.Variable)),
+            (r'(' + _MARGIN + r')(define)([ \t]+)([A-Za-z_]\w*)',
+             bygroups(Whitespace, Keyword, Whitespace, Name.Variable)),
+
+            # A statement only starts a line. Elsewhere the same word is
+            # an argument: "branch" is a command at the margin and a
+            # subcommand in "git branch pvr master".
+            (r'(' + _MARGIN + r')((?:' + '|'.join(_LEADERS) +
+             r')(?=[ \t]))?([ \t]*)('
+             + '|'.join(_COMMANDS) + r')(?=[ \t]|$)',
+             bygroups(Whitespace, Name.Builtin, Whitespace, Keyword)),
+
+            (words(_FLAGS, prefix=r'(?<=[ \t])', suffix=r'(?=[ \t]|$)'),
+             Name.Builtin),
+
+            # Keep whitespace runs from crossing a line ending, so the
+            # next statement is still at the margin when it is reached.
+            (r'[ \t]*\n', Whitespace),
+
+            # The bash lexer's own copy of this rule swallows the newline
+            # and the indent behind it, which would leave a statement
+            # inside a conditional no longer at the margin and so
+            # unmarked. Match the words alone and leave the rest.
+            (r'\b(if|fi|else|while|in|do|done|for|then|return|function|'
+             r'case|select|break|continue|until|esac|elif)\b', Keyword),
+
+            # Cosmetic: patch filenames conventionally lead with a
+            # sequence number, and bash would colour that as a number.
+            (r'\d+(?=[\w./+-])', Text),
+
+            inherit,
+        ],
+    }
+
+
+def setup(app):
+    app.add_lexer('scc', SccLexer)
+    return {
+        'version': __version__,
+        'parallel_read_safe': True,
+        'parallel_write_safe': True,
+    }
-- 
2.50.0.173.g8b6f19ccfc3a

