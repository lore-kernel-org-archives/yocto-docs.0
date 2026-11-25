Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44550.1795621547890201652
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 07:45:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rh34aoaT;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: twoerner@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e30c26a4so1308072766b.0
        for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 07:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621546; x=1796226346; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3i6iSUgd2MzLFqmIEN9G9gxArQmrtP67tGo6d3Tq/6A=;
        b=rh34aoaTOfigNLWjs9qIbRO4yyI/ExLCKpz00jZgk4X/AOsTFntiUBd37JdH6W51VA
         AgJ/hP/Tuq710aHP2AlYaW0jn3pZOwDjxaaBKpFsx8kBpwejkCCPCixmGnCoD+InZOyt
         gEbiPDg5rZCboHqv1LLXIifjFWNnoMFf4LFdpim9h05+PG5hCQipxymJpK4v53v7BBGi
         jIqeuPZCMzBt6FW01eK8MEevXRXrO+1wGOLVm0Wi7q5k7OG3JfT9o01frP1bXF3V9OLp
         HNAz+5BQz3OUv6Gn6ALFpU1P/qzBaBRP8+KpLidiY/x6bUEXYys2IP3CF0bKCVW1cGn6
         C3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621546; x=1796226346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3i6iSUgd2MzLFqmIEN9G9gxArQmrtP67tGo6d3Tq/6A=;
        b=Og5LolShlVjZWIM4hWtBa9+RrkrbswFqhHRzQRCZug/bREeFx9lFTn+bPQZD5JEEyP
         IX0bQuQRxBxeX6RasQnkAdTXxfE+PdAUMmzbZnZ5G3wasIgdNnOpXPvtLmH+QJLDzY8a
         fEMb5vOL9WgWjEnKCMEj8ABAV3VUIFuWERYWHjt9x+Ne3XHytsV2fxNYQHJMeU/QqFUj
         ggv3CsmwX4k+j1Y0gh/YIaoai6RSFHOoJMuUNLndckMgEiKCyAe1j0sIPLAwYLUjJtP+
         RTJ9GHydCJITr/tfdU6FB2RtB7QDrg1I8f0gFRk5Ui9XFU03aygJIZ17QITUpK2I4BNm
         ShHA==
X-Gm-Message-State: APuU4Z/wvxCSzQmpOaHQgev6l74INNJ6LOF/7/wBKSLxmViwePv+tPYk
	tejXMX/HNA0O8av+kFxRVpVkH8fbZZGQZ8OB9ElPgELPcY78K+MxTYm99D104Q==
X-Gm-Gg: AZFdTZeMtjEVgOBHRJDQVW8LHjZUeeX56xt0ruf5LicHs5iN+weNAXXbLtfpclRgA+W
	iFAKYmANA1g+FYfFdn/ZdpmOt9E6QK0VKolZZNp+HBK5VdsUOGzfVZtnmfriCLxQJAjL6Fo7oRH
	aXe62vPcNPdTtO4Bh8vZolbROBPLuYD9XE59rucv9kf4r/HJTAdq8hta3yRJcI7UkLC7vlYImDT
	Ja3i+h0Wt87Z5s/eKqvzuUPF5Lvp8ZbJ/u3JYUr5lHClngwft1u0Mkr8OouE9TLfvmTM42Y4MkC
	L6wRN+fX6o82bgT/L+bkvKgAE5W4/gxhfFRp0EVxjxDHdYTznx5eSjR+h1Mtd1wMxM110jt6Afw
	DJF1PziCxZcGheAf3lmqptdt2qgvlYpJibim5F/yszRgDpiSPAHOBHLZR70h3Sj1ed+yqNifzD5
	xVuMBrGQw6cRllcxvbcDyGSn6OP4f5kwqMfqzzQw3k1I11tYMrL6rAzWGHblaiyW/VWWvvnCNcZ
	TryrtG2T8VCaPVTFrzZ0uwFbvrjmlaeVqE+4618GWsd1fRrCfj2VGyUQ9BuJnT7abSF4Fy6AROH
	6TrfZfHfgF9hpNqn1m2mtr3aUIOaUMVIEuUyvttp9OKlCkMF7NfNy3d7y6y+8jER9tKalqFcj6M
	wItbVa5fOyajf4JQy2Gb3pvzQlA22zuc=
X-Received: by 2002:a17:906:4fd1:b0:c46:7de7:e41d with SMTP id a640c23a62f3a-c51318a03d9mr1655566966b.18.1795621545976;
        Wed, 25 Nov 2026 07:45:45 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm651892066b.51.2026.11.25.07.45.44
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:45:44 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 4/7] sphinx: add a lexer for wic kickstart files
Date: Wed, 25 Nov 2026 10:45:32 -0500
Message-ID: <20261125154535.3486104-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261125154535.3486104-1-twoerner@gmail.com>
References: <20261125154535.3486104-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 15:45:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10839
Content-Type: text/plain; charset="utf-8"

The manuals show .wks files in several places and have no language for
them, so they are tagged text, tagged shell, or left to the default.
Shell comes closest, because wic splits each line with shlex and expands
${VAR} before parsing, but it does not know the vocabulary: the "part"
opening a line and every option come out as ordinary text.

This extends the bash lexer to mark the statements and long options that
wic's own parser registers.

AI-Generated: codex/claude-opus 5.5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/conf.py             |  3 +-
 documentation/sphinx/wks-lexer.py | 60 +++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 documentation/sphinx/wks-lexer.py

diff --git a/documentation/conf.py b/documentation/conf.py
index 210b4ab60595..f89926549d20 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -82,7 +82,8 @@ extensions = [
     'yocto-vars',
     'bitbake-lexer',
     'bitbake-placeholder',
-    'scc-lexer'
+    'scc-lexer',
+    'wks-lexer'
 ]
 
 # current_version = "dev"
diff --git a/documentation/sphinx/wks-lexer.py b/documentation/sphinx/wks-lexer.py
new file mode 100644
index 000000000000..1e5e5ec1e5b9
--- /dev/null
+++ b/documentation/sphinx/wks-lexer.py
@@ -0,0 +1,60 @@
+"""A lexer for wic kickstart (.wks) files.
+
+wic reads a .wks file line by line: a line whose first non-blank
+character is ``#`` is a comment, and every other line is split with
+``shlex.split`` and handed to ``argparse``, after ``${VAR}`` has been
+expanded. The quoting is therefore shell quoting, which is why this
+extends the bash lexer. What the bash lexer cannot do is mark the
+vocabulary: ``part`` is not a shell builtin, so the statement opening
+each line comes out as ordinary text, and so does every ``--option``.
+
+The statements and options below are taken from wic's parser,
+``ksparser.py``, rather than from the manual, so update them from there
+when wic gains one. ``partition`` is not a statement: it was an alias
+while wic bundled pykickstart, and the parser that replaced it in 2016
+kept only ``part``.
+"""
+from pygments.lexer import bygroups, inherit
+from pygments.lexers.shell import BashLexer
+from pygments.token import Comment, Keyword, Name, Text, Whitespace
+
+__version__ = '1.0'
+
+# The subparsers wic registers.
+STATEMENTS = ('part', 'bootloader', 'include')
+
+
+class WksLexer(BashLexer):
+    """wic kickstart."""
+
+    name = 'wic kickstart'
+    aliases = ['wks']
+    filenames = ['*.wks', '*.wks.in']
+    mimetypes = []
+
+    tokens = {
+        'root': [
+            # A statement is only a statement at the start of a line.
+            # Anchoring matters: "include" is also an ordinary word in
+            # "--include-path", and "part" appears inside several option
+            # names, so an unanchored keyword would mark both.
+            (r'^(\s*)(%s)(\b)' % '|'.join(STATEMENTS),
+             bygroups(Whitespace, Keyword, Text)),
+            # Long options carry the meaning on a wic line; bash leaves
+            # them as plain text because it has no notion of them.
+            (r'--[\w-]+', Name.Attribute),
+            # wic tests the first character of the stripped line, so a
+            # comment may be indented and is never trailing.
+            (r'^\s*#.*$', Comment.Single),
+            inherit,
+        ],
+    }
+
+
+def setup(app):
+    app.add_lexer('wks', WksLexer)
+    return {
+        'version': __version__,
+        'parallel_read_safe': True,
+        'parallel_write_safe': True,
+    }
-- 
2.50.0.173.g8b6f19ccfc3a

