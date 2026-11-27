Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14804.1795781133696280244
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2026 04:05:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=x69j69wD;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5430f70c827so94288411cf.2
        for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 04:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795781132; x=1796385932; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rOpBvgYt8hxrfkSF2eW5AX4lA5m/1wxfj/E9wNrUc1E=;
        b=x69j69wDtOj3potOesLbJpNuzBFKYi2P4qM7bUFCS4Umc2z31pZGDQieW2Kx+wAFQw
         jIsLxCewjJyBQi6qigzz6Jdhb0qEMA2RYNSvSTymtsJJZWNynQ/zkEGT43tHd4WvUKMv
         VYoMYX7d8n/+lOP0issVDAF1ZJie/ZnywpM/HxwJj+A8VyygUu/YKiSHUe+hBjVW3y6C
         u3Ovk6wm/6440ZQvWTxVUKfcCIGFpitKJauS9hvzE0KCCvzjWBrxiGTMwHOj5SU1yUED
         uFG7rnYwFembelGz4eu0G46MAocDqnPeG5T7bi0cD4vmMaXUPJklhmbo9SYjKFxUe9UT
         QvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781133; x=1796385933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rOpBvgYt8hxrfkSF2eW5AX4lA5m/1wxfj/E9wNrUc1E=;
        b=hgEm/6KZ5nKrDTSc55J8KFOIBoXlkWL/L8ZBCYcBoU8hiwOZCoxFjH1X/IdT11UB2N
         RC5rFrilyYW8mYB5B0K5UtiuTo+5G6gJLFYgV+ro0ajHNFotHCIcpY2jdnBuXDBWcqTG
         esfpaJOSrVeQiDa2Tg7prAOE8vu2+RVBWuFa0+hwfPsXSWWWIcuCmE5AGz5cazlwpiah
         iXFZhmhCut5mRfvBzOXsuQWSOnTsiADiEVW3Wj1p9D1GJWIIVQHjsSpLNdXYuAhECJhL
         iMg8ZgmcZWToeSJFf1Iyxnyv1JgdEf5itMX+ow9pA09YmxGw01BR/stM6yYi7ZtEXgCs
         nGqg==
X-Gm-Message-State: APuU4Z/bLcW0oahE54FLHZhb5+zej/ChURS2cm7x6ETUncdOiU66ttDP
	PoED/bTsGyec7oGa26fEMJGeRVRosv4o1w7HSB4mnqx4jBpLoyoBP3pJuEO3HQ==
X-Gm-Gg: AZFdTZdXKnkjjKz3gUPFFVC/fglwOu4dC5aetkLxukSEkFFuydERzzD2JQPKU67pJtJ
	FS7XPjqM9SRRWDD3aqlK/MjhCR2zcXodO94ZBTvnnys+4qW0LaTLmi2UTa3OCfAkbjwCyd98Hdg
	pAxGtjdP7ilRXgmRkczpXEPY6gJf70dDdG/4ybpCexlS6QYmOrBzly4b2xAEqVDA+j+uyGCjrUD
	WbvAKESpADGZYwavbZZfCWyJVhnpWooIIG5cljB4lrnr1xT5SpEh3fl3MUL64yIJ6Z6iL8ForRA
	3pZKYXjCUCTvk2yCLnDuqOUddOdSy+k7pPqs3ouVwubbLeKMaomjFXz2RPe/5SK3qDflwN/OQDm
	3YWYKvTFDJSeU71JMLSL6EJIwga13hqBUAJRAoE/ZYQK892BwBBDWqB4xEe4jisMABu6akhX6ed
	ndW5QwAS2rbvAhtI9dv8iO9/SUdLyH0d6YLR37/pPiolt+2WJHsiUPvnh43nYNC5WNk+u2ZWAe+
	/yQ94dmssVjxc5rfmustNnroxSxPm18a6EeU0fJip2Mr3DAVHc7KLVYxoGqbD7Oke/As7YsZLe3
	x1lvPqsZsFId/O451SPB/IoRSALYCNG1pz0+C93FIRL+07qEf61jmv747gE3MbmoXEtkwvu5Jqp
	79Mbgpg0oACLpDHwcn4pmSYU3Ydk1Q8I=
X-Received: by 2002:ac8:5a46:0:b0:55d:3764:8793 with SMTP id d75a77b69052e-55d76a4c2b7mr461399101cf.47.1795781132311;
        Fri, 27 Nov 2026 04:05:32 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7884b5e9sm208106041cf.18.2026.11.27.04.05.30
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:05:31 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3 1/4] sphinx: add a lexer for wic kickstart files
Date: Fri, 27 Nov 2026 07:05:25 -0500
Message-ID: <20261127120528.837051-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127120528.837051-1-twoerner@gmail.com>
References: <20261127120528.837051-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 12:05:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10854
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
changes in v3:
- no change

changes in v2:
- rebase on master, where conf.py no longer lists the dropped lexers
---
 documentation/conf.py             |  3 +-
 documentation/sphinx/wks-lexer.py | 60 +++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 documentation/sphinx/wks-lexer.py

diff --git a/documentation/conf.py b/documentation/conf.py
index d2252d5ab966..8992496f7569 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -51,7 +51,8 @@ extensions = [
     'sphinx.ext.intersphinx',
     'sphinx_copybutton',
     'sphinxcontrib.rsvgconverter',
-    'yocto-vars'
+    'yocto-vars',
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

