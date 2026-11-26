Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6921.1795732615755762706
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Nov 2026 14:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jpZcsD4M;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-9217fbf97fbso17895976d6.2
        for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2026 14:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795732615; x=1796337415; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QO4ScvIJJqjHwj4Nau2oY0xE0pWJ/+ZfXD1Ld+ZUcJk=;
        b=jpZcsD4M4lyK8qLbnkwbYyYfJ8vZLweVEzawhqleZP0tYwMfCW5xXIakYVPTFZiajM
         YDr9WqYWcBlcDwW47uQ5d923gqp3uxExSr/pZkVgKuPAK8koF51ZSPR7HfjIjKntfGvC
         uQGjhZxZC3cD91gQXxXq36pgGE8a08WPXRBMR2ByQBIJxoQaYv/RjLivwU2xFElY+KIT
         KkuNZW5Y5CIlc62pvrT5O9iXg+rKXNHshXFYyxYVNpdPNY/RLhYfCddbeznKvFPMAlnD
         m8QiCS9HBC+7k8p5HMOtkRd2QJ33ht2tUQFnxth4FJQjm2LnE0kTjmLDTKGBWIGmnJx0
         zM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795732615; x=1796337415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QO4ScvIJJqjHwj4Nau2oY0xE0pWJ/+ZfXD1Ld+ZUcJk=;
        b=gqS30vlyXqR597XHcshi4O1FqojKnGtpEE53MrpYc5PB5N0GSUdx8rqoVZUkGYtUl0
         OUzU4HyGM/DYeaSWc8sErDUNG8S75wkg6MsLv2uD30mNBNv6Lkg9jqrhOTpfKcPxtKgC
         C3sUnIHivw1SdhSpoazq9Hhy+xOahL1i6fw1ZuZePzA1RKExHH55fio0oy46i+O9h4+s
         XcH3UttZnj7jSQSbac9AR8G0OjukMZkS5n0KhTK4gDtXxG5zpUjhK20Ea1Dqv3hXg3vM
         o3bZTLbfK5dIYi9EUX0J88VPOJrdG+27EtUd/YOEhN+IJxW+YUFwhKTTRlLlC36GODNE
         9H+A==
X-Gm-Message-State: APuU4Z9CFNpVe6ZZPA6aol3cnih2NEhN0qKzpRxmXUSokexOkoNewCsT
	/r5TAn9lKDPqLR7tVqMg3hEHKBM6Fao1HE6YKNnIWWDUu2fS744NqSVt7iDaXQ==
X-Gm-Gg: AZFdTZeM5eCXZus+INxzYgKoX0ubBhRLNZCqXy5g+KtZUIfssSeeYfMzyP6IvV5E0nl
	XLVvW5+yM6WHao/vmpID+u8+SWLjmLHJU2rNyEM+G1oFC7UizZ9S04HP7oCW9FAlGvOCFFL3PxS
	7cWJoh3JbX1cTAp6E5RvOKbMpzn23/SCuSKd+ENt0mpQkyocbK7uDS8rkwTTROqO8k/CtHK2FWa
	4s1YFQVc8/y87ZZriLzgpaO3RnGwI9cLQ6kaevfltrIDZySweD4Si9ejZr8NMx3aLuPsCqxxGKv
	pIDaB9gAyzdr2hZ8wHZKmnusC+NTMqxzdqaXz5T+irURCy8Px5TEa1cuAewDryJDYlU0DA1KUEh
	07P/vnh4udIBd3BHXzxWxpTIBac1j2F4jQBMpYhda33byzeiRrwKZergc3VCeNhbTDX/ux8Pmd8
	8P8ErreV2XojotF2f3Q/vj8Zj4H1Ncd5RPhwhIWxba64QZel6igzJ/8ZWkMw+k/snfzHiAX2dd2
	CIPtANB9LqaoaGBA/aBZim2ZKtz3xcpN5U+qKCyrhL5dE9EaWWny8jkHG5iT6C+4uQU/EvVjZRr
	d0f0B7GiDHxwtZtXBsRIGRnqQXhBxo8vhaaWyEb81jC8uxh/Ze+ZpO0vgV3Nh8sdD3OGJH63MhR
	8EgF9j5fR9XDm00m6XFoSdMuZT1PWYf8=
X-Received: by 2002:a05:6214:4890:b0:921:7be2:a720 with SMTP id 6a1803df08f44-9217be2a9f4mr111873136d6.33.1795732614673;
        Thu, 26 Nov 2026 14:36:54 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349ec64csm201742136d6.28.2026.11.26.14.36.53
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:36:53 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 1/2] sphinx: add a lexer for wic kickstart files
Date: Thu, 26 Nov 2026 17:36:49 -0500
Message-ID: <20261126223650.3701672-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261126223650.3701672-1-twoerner@gmail.com>
References: <20261126223650.3701672-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2026 22:36:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10847
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

