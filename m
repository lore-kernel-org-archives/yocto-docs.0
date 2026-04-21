Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93425F327D4
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 17:24:30 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40389.1776792267040610668
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 10:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LD/K/v8a;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: twoerner@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5675d609621so3393473e0c.2
        for <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 10:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776792265; x=1777397065; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdOy4DDpbClObxaDEnt/JHqmYkmxK5+PfsdyXNuvIC4=;
        b=LD/K/v8aaXVJot6guuYibFO+Qn+AluZrpX3h1tSlknbSgqTZtXVGKNqEtvjf9zUapd
         B7K9bN/b4ZOPXFuNuPzdaP7Sf9eww4Dqn4Js/IWGW7cQnHHOR5rBNtft1VvhbsbyBmhp
         jYR+7oGsoIySTzzbsiADGi6q22+B5L2pORcC5c5Eb5bYVN3OuFlF3Yolu45W6PNBa1tQ
         EUhucgdgq0HgK1Oo9ytUK+XBGYjmd6kBeDKv7pA+HuYzcaFcHjqWIQvPFliPwCn+aJLA
         ESBoD2YUHR2q/8SM+xgggvDGpU0SJh7o7BwXK9TpI6DzcHyB2pvcfCnaaM4Bpf/jmuUb
         Enwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792265; x=1777397065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NdOy4DDpbClObxaDEnt/JHqmYkmxK5+PfsdyXNuvIC4=;
        b=XgPu3UGRUSefVT2BieLyuX8L/FPt+edO+XF/B//j9CZh7/db/pf6uDg9LEEw8soMy8
         RgpF9kztFi+42bg7Y1jxCQYxN4Gj+nRXUrE9GkVr3bWn2m3fpYfcyeN2nCrL5PT5h+0W
         MTs03TflKuo+oG8Hr2QULOij3xgQ6Hgg8wCyZJqYwyJFyNF6Mxn9NA4VCXATUZmmP1fY
         DMZAn1JQJ0AeTdIJqq2/8pAsFRMxUmeSThJ0O+akpjrKTltzz+IhxP3jxWbUaiXUGX6d
         pO8a2Is+qsFUffHc2kxBEaIer24s3d7NEYV6EP9DMcIVWNsWFf9e5lalsNitm1Tkz/2r
         fcJg==
X-Gm-Message-State: AOJu0YxVRQ/bHD9jFW7whdVnuy2m8ADIS20xm3si9iSgB0xX9F6mST/t
	lhaGjXcQ3dz9JWfl7qzO6wOYQ83JAF9iZB3uN6QPo4kCOI0Xjel1Ps3/GF5CGQ==
X-Gm-Gg: AeBDietfZnPnpubte5qaXygMoVk95woIUpr2Rpmdt1traecDnE6fq4QT4CshpNXHh2F
	a2jFNI35ylA/TMon6sy9VXgWz9pPJDelpdqJanWt4tMy4VfkU4UQOWimzt6oRygxZPxQB4fDD+z
	MV7hlCgCQHTE+dl6hkkR+Q4ezarEao+l3LjuNnUN+aY0uv4H7OkyAVB43dF1DhMoJkftMU7yQr9
	VL8qgp8G/Wl//q3CREzZPARzn5Cikiib08ZgC7gHkPfgLW26z3btEJbjp5BWuiTK9EkQI18PPoA
	fTGL+jHFuw/6MtIxxPSnACU9XfR19fg988puMIzSVjJ4v54s2xz2N37/jdtnWw3JU4RvEMUlYDW
	mEFxm3KcPLZElBK1Av++UkF4mcjzB8YkO3pqlUYG46iYPubOVsh2OvrRhonKYnh2LAmwtjewum2
	b3BNxsWPNcNKLe8QiJiekmYRZ7Basd9DCFnnEqBPJ8P+m4cox2eul2moi/K3B1qPbZlhXA/UgHW
	SL3ivGQk/YV2+0=
X-Received: by 2002:a05:6102:3747:b0:613:e996:3014 with SMTP id ada2fe7eead31-616f70f91e8mr8705476137.20.1776792265117;
        Tue, 21 Apr 2026 10:24:25 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm109150036d6.2.2026.04.21.10.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:24:24 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Trevor Woerner <trevor.woerner@amd.com>
Subject: [RFC PATCH 1/2] add a "bitbake" pygments lexer
Date: Tue, 21 Apr 2026 13:24:15 -0400
Message-ID: <20260421172416.1801567-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421172416.1801567-1-twoerner@gmail.com>
References: <20260421172416.1801567-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 17:24:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9301

From: Trevor Woerner <trevor.woerner@amd.com>

Highlighting renders correctly across the BitBake constructs from
the upstream vim syntax:
  comments
  all assignment operators (=, ?=, +=, =+, :=, ??=, .=, =.)
  ${VAR} and ${@...} interpolation
  OE override chains (FILES:${PN}-doc, :append:class-target)
  varflags (do_install[depends])
  inherit/include/require
  addtask ... after ...  before ...
  EXPORT_FUNCTIONS
  shell function bodies (delegated to BashLexer)
  python/fakeroot python task bodies and top-level def blocks (delegated
    to PythonLexer).

Changes

  documentation/sphinx/bitbake.py is a new local Sphinx extension that
    defines BitbakeLexer (a Pygments RegexLexer) and registers it with
    Sphinx via sphinx.highlighting.lexers under the aliases bitbake and bb.
    Token rules mirror contrib/vim/syntax/bitbake.vim from the bitbake repo,
    and inner shell/python regions are dispatched to the existing BashLexer
    / PythonLexer using Pygments' using() helper.

  documentation/conf.py appends 'bitbake' to extensions so the lexer is
    loaded on every build.

Usage

  In any .rst file you can now write:

  .. code-block:: bitbake

     SUMMARY = "Hello"
     inherit autotools
     do_install:append() {
         install -d ${D}${bindir}
     }

  bb works as an alias if shorter is preferred, and the same applies to
  .. highlight:: bitbake.

AI-Generated: codex/claude-opus 4.7 (xhigh)
Signed-off-by: Trevor Woerner <trevor.woerner@amd.com>
---
 documentation/conf.py           |   3 +-
 documentation/sphinx/bitbake.py | 195 ++++++++++++++++++++++++++++++++
 2 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 documentation/sphinx/bitbake.py

diff --git a/documentation/conf.py b/documentation/conf.py
index e5e3a8a89abd..aa2ec8d45ed3 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -68,7 +68,8 @@ extensions = [
     'sphinx.ext.intersphinx',
     'sphinx_copybutton',
     'sphinxcontrib.rsvgconverter',
-    'yocto-vars'
+    'yocto-vars',
+    'bitbake',
 ]
 autosectionlabel_prefix_document = True
 
diff --git a/documentation/sphinx/bitbake.py b/documentation/sphinx/bitbake.py
new file mode 100644
index 000000000000..c521340c391f
--- /dev/null
+++ b/documentation/sphinx/bitbake.py
@@ -0,0 +1,195 @@
+#!/usr/bin/env python
+#
+# SPDX-License-Identifier: CC-BY-SA-2.0-UK
+#
+# Pygments lexer for BitBake metadata files (``.bb``, ``.bbclass``,
+# ``.bbappend``, ``.inc``, ``.conf``) and inline ``code-block:: bitbake``
+# snippets used throughout the Yocto Project documentation.
+#
+# Pygments does not ship a BitBake lexer, so this Sphinx extension provides
+# one. The token rules below mirror the upstream BitBake vim syntax shipped
+# in ``contrib/vim/syntax/bitbake.vim`` of the bitbake repository:
+# https://git.openembedded.org/bitbake/tree/contrib/vim/syntax/bitbake.vim
+#
+# Highlights:
+#   - comments, line continuations, varflags
+#   - ``${VAR}`` and ``${@python_expr}`` interpolations
+#   - assignment operators (``=``, ``:=``, ``+=``, ``=+``, ``.=``, ``=.``,
+#     ``?=``, ``??=``) with optional ``export`` prefix and OE override
+#     suffixes (``VAR:append``, ``FILES:${PN}-doc``...)
+#   - ``inherit``, ``include``, ``require`` directives
+#   - ``addtask`` / ``deltask`` / ``addhandler`` / ``EXPORT_FUNCTIONS``
+#     statements (with the ``after`` / ``before`` keywords)
+#   - shell task bodies (``do_install() { ... }``) delegated to ``BashLexer``
+#   - ``python``, ``fakeroot python``, anonymous ``python() { ... }`` task
+#     bodies and top-level ``def`` blocks delegated to ``PythonLexer``
+
+import re
+
+from pygments.lexer import RegexLexer, bygroups, include, using, words
+from pygments.lexers.python import PythonLexer
+from pygments.lexers.shell import BashLexer
+from pygments.token import (
+    Comment,
+    Keyword,
+    Name,
+    Operator,
+    Punctuation,
+    String,
+    Text,
+    Whitespace,
+)
+
+__version__ = '1.0'
+
+# A bare BitBake identifier (variable, function or flag name). Allows the
+# characters used by OE-Core variable names (digits, ``-``, ``.``, ``+``).
+_IDENT = r'[A-Za-z_][A-Za-z0-9_\-.+]*'
+
+# Optional OE override chain such as ``:append``, ``:remove``, ``:class-target``
+# or ``:${PN}-doc``. Anchored so it only consumes ``:foo`` runs and never
+# eats the leading ``:`` of the ``:=`` assignment operator.
+_OVERRIDE = r'(?::[A-Za-z0-9_\-.+${}]+)*'
+
+# All BitBake variable assignment operators, ordered so that the longer
+# operators win the regex alternation.
+_ASSIGN = r'(?:\?\?=|\?=|:=|\+=|=\+|\.=|=\.|=)'
+
+
+class BitbakeLexer(RegexLexer):
+    """Lexer for BitBake recipes, classes, includes and configuration."""
+
+    name = 'BitBake'
+    aliases = ['bitbake', 'bb']
+    filenames = ['*.bb', '*.bbclass', '*.bbappend', '*.inc', '*.conf']
+    mimetypes = ['text/x-bitbake']
+
+    flags = re.MULTILINE
+
+    tokens = {
+        'root': [
+            (r'[ \t]+', Whitespace),
+            (r'\n', Whitespace),
+            (r'#.*$', Comment.Single),
+
+            # ``python [name]() { ... }`` blocks (also ``fakeroot python``).
+            # Must be tried before the generic shell function rule so the
+            # ``python`` keyword is not mistaken for a shell function name.
+            (r'(^(?:fakeroot[ \t]+)?)(python)((?:[ \t]+' + _IDENT + r')?)'
+             r'([ \t]*\([ \t]*\)[ \t]*)(\{[ \t]*\n)'
+             r'((?:.*\n)*?)'
+             r'(^\}[ \t]*$)',
+             bygroups(Keyword.Type, Keyword, Name.Function, Text,
+                      Punctuation, using(PythonLexer), Punctuation)),
+
+            # Shell task bodies: ``[fakeroot ]name[:override]() { ... }``.
+            (r'(^(?:fakeroot[ \t]+)?)(' + _IDENT + r')(' + _OVERRIDE + r')'
+             r'([ \t]*\([ \t]*\)[ \t]*)(\{[ \t]*\n)'
+             r'((?:.*\n)*?)'
+             r'(^\}[ \t]*$)',
+             bygroups(Keyword.Type, Name.Function, Name.Decorator, Text,
+                      Punctuation, using(BashLexer), Punctuation)),
+
+            # Top-level python ``def`` blocks; the body is any run of
+            # indented or blank lines following the signature.
+            (r'^def[ \t]+' + _IDENT + r'[ \t]*\([^)]*\)[ \t]*:[ \t]*\n'
+             r'(?:[ \t]+.*\n|\n)+',
+             using(PythonLexer)),
+
+            # ``inherit`` / ``include`` / ``require`` directives.
+            (r'^(inherit|include|require)\b',
+             Keyword.Namespace, 'include-line'),
+
+            # ``addtask`` / ``deltask`` / ``addhandler`` / ``EXPORT_FUNCTIONS``.
+            (r'^(addtask|deltask|addhandler|EXPORT_FUNCTIONS)\b',
+             Keyword, 'statement'),
+
+            # ``VAR[flag] = "value"`` (varflag assignment).
+            (r'^(' + _IDENT + r')(\[)(' + _IDENT + r')(\])([ \t]*)('
+             + _ASSIGN + r')',
+             bygroups(Name.Variable, Punctuation, Name.Attribute,
+                      Punctuation, Whitespace, Operator),
+             'value'),
+
+            # ``[export ]VAR[:override...] OP "value"`` assignments.
+            (r'^(export[ \t]+)?(' + _IDENT + r')(' + _OVERRIDE + r')'
+             r'([ \t]*)(' + _ASSIGN + r')',
+             bygroups(Keyword.Type, Name.Variable, Name.Decorator,
+                      Whitespace, Operator),
+             'value'),
+
+            # Anything else: fall through one character at a time.
+            (r'.', Text),
+        ],
+
+        'include-line': [
+            (r'[ \t]+', Whitespace),
+            (r'\\\n', Text),
+            (r'\n', Whitespace, '#pop'),
+            include('interp'),
+            (r'[^\s$]+', String),
+        ],
+
+        'statement': [
+            (r'[ \t]+', Whitespace),
+            (r'\\\n', Text),
+            (r'\n', Whitespace, '#pop'),
+            (words(('after', 'before'), suffix=r'\b'), Keyword),
+            include('interp'),
+            (r'[^\s$\\]+', Name),
+        ],
+
+        'value': [
+            (r'[ \t]+', Whitespace),
+            (r'\\\n', String.Escape),
+            (r'\n', Whitespace, '#pop'),
+            (r'"', String.Double, 'string-double'),
+            (r"'", String.Single, 'string-single'),
+            include('interp'),
+            (r'[^\s"\'$\\]+', String),
+        ],
+
+        'string-double': [
+            (r'\\\n', String.Escape),
+            (r'\\.', String.Escape),
+            (r'"', String.Double, '#pop'),
+            include('interp'),
+            (r'[^"\\$]+', String.Double),
+        ],
+
+        'string-single': [
+            (r'\\\n', String.Escape),
+            (r'\\.', String.Escape),
+            (r"'", String.Single, '#pop'),
+            include('interp'),
+            (r"[^'\\$]+", String.Single),
+        ],
+
+        'interp': [
+            # ``${@ python expression }`` evaluated by BitBake at parse time.
+            (r'\$\{@', String.Interpol, 'py-interp'),
+            # ``${VAR}`` variable expansion.
+            (r'(\$\{)([A-Za-z0-9_\-:.+/]+)(\})',
+             bygroups(String.Interpol, Name.Variable, String.Interpol)),
+        ],
+
+        'py-interp': [
+            (r'\}', String.Interpol, '#pop'),
+            (r'[^}]+', using(PythonLexer)),
+        ],
+    }
+
+
+def setup(app):
+    """Register the BitBake lexer with Sphinx/Pygments."""
+    from sphinx.highlighting import lexers
+
+    bb_lexer = BitbakeLexer()
+    lexers['bitbake'] = bb_lexer
+    lexers['bb'] = bb_lexer
+
+    return {
+        'version': __version__,
+        'parallel_read_safe': True,
+        'parallel_write_safe': True,
+    }
-- 
2.50.0.173.g8b6f19ccfc3a


