Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44548.1795621545011636236
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 07:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TzK+g2qL;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: twoerner@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c51bf011392so16211066b.3
        for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 07:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621543; x=1796226343; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FEkC46lIva13+mFq2ZY5tdb5p6nmHdqLZVtuP1HBXnI=;
        b=TzK+g2qL5/OuXPsikjN1FC3RkhY70A93N11KgLiaitG+1YU3wxtUzAHLrN3OC52Gys
         tVgvCxAJPpkSYh687g++gCWxvYe6ebwW14wPw3+OivjbvNpNk2TGrC7nra3PJQkG+P+e
         4cwBJdTFBoLd0NfgPkdXA7pu00WO48mkQKaMLgIT08FVxY8oU1B8+6MY1dAKLcoB/Rju
         rbOCSFuclYR7N5k+3hEYsMwQps/9qT2ci9j+r1kIApCOcJRC4hD4QDSzSjr2e5as7+VJ
         VNFtWCzgESzLQad4v5wD0IVnijOAEv0hwdjka743+FsLqkF0jWdMiT1azlIkMxrtr8N3
         X9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621543; x=1796226343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FEkC46lIva13+mFq2ZY5tdb5p6nmHdqLZVtuP1HBXnI=;
        b=xxBhKkCwoqwSTdHTxONkH8NUrDIkHoh6g2WVQ2EtNXbtjmEFMvCWwpQ8GaOy5TwWX1
         jpYtmEWd/1jxN1HLI45O9tWyIkPuKbfGZfUYGnVY/xfNznbYY5tqlLv2qSFwpPhLye/l
         NROsu1Ho7oWIHozClSMdzuDWf5Rn6ghu9aihdQmIV6BrNG89wdKMfiBQ+bevXVCYm+cX
         BZNgeCgX5XEeaqGsOPyIEZcmf6SIHoQqT0vGbL/GHlZNCIxcIbhTlwsJXw29XaJ0OSQ/
         tozG+46PNYCt3BEN9tbQWyrSvG08o4/qO0i4Al9+pSoD7dljEyNc9Q6qPTjavQGNXHnM
         5Gig==
X-Gm-Message-State: APuU4Z9mQNA/WOGcqsRdBdFnuqktscYpAPy1PSOgfuVom8i6If5WtM+d
	wNFle13dtqMyIRP4MNjcAf8fUEhdjxrazHYP1vTvpzS7ge2XANdl9VBRv3tEdw==
X-Gm-Gg: AZFdTZeEz2gaj09j/uc/h5W0U6pc2saIc9zt/Huwg78aRrOIAuIdXXAd8Sx/29IrJNI
	uZO6GZgNLfI/+VMhJRB/xLYC+y12TV0kH4+3X3Pgc5R8a9kxkeddOntxbn3VYndNEgyDrl7KWw5
	CtoB4Rm798RuwdDdU+aocP+p+rP4gj4bvWBwDrOU1Dq2q+u7Dw+eoNzqEpLrnEjEuCNLoztyFeY
	v2w/BAvzAI0ZhTc8Fj0Ity7Zl4ZiHD1fCaPGIEduMZHkFBuFNYRrgx/yQYScc4LdhIY6jDf62QD
	zj0M86lAxS5JB3CpFRA7TzRMl+v8+RtxDkuEgjdfjalxITn9xSJNJZvH5gIUkVMhoc8937BsqFT
	L12ooYJBGmNXR/V4gLvB2fhGZXcu0IAzgdju6L7oY33XYGjjxtSzJ5+8elvAnvjrTJCMEeaOLk6
	hB53Xf9odi5uUiZAyKIQEQiSXogbaX8N8SyEGDIOKV3tfFT1xilnpwwjPgFkRMOXPAQatk51NPo
	P9ahdlil5Qhng7BY2Mt8mMrwXfsbS1I0ZG1wfxx4VdGuryJQY3PFlbNqT7auz1DcJDdZU4FKRkk
	mZLvbhVWtS3gGtuqR6WZPT1h7vg7tchJKe9aYhsRP9WxLrDSe2nvIQ6r4U1NCuJuV6d7ncdkqUP
	yLUc45RmJuEP+k2cmWeAQV57AZqPsLKc=
X-Received: by 2002:a17:907:934c:b0:c51:282b:5489 with SMTP id a640c23a62f3a-c513a4aea3bmr1465627866b.3.1795621542989;
        Wed, 25 Nov 2026 07:45:42 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm651892066b.51.2026.11.25.07.45.41
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:45:42 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/7] sphinx: add a lexer for BitBake with placeholders
Date: Wed, 25 Nov 2026 10:45:30 -0500
Message-ID: <20261125154535.3486104-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261125154535.3486104-1-twoerner@gmail.com>
References: <20261125154535.3486104-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 15:45:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10837
Content-Type: text/plain; charset="utf-8"

The manuals write <like this> for a value the reader has to replace, and
BitBake cannot express that. Inside a quoted value it renders as ordinary
string content, indistinguishable from text to type verbatim; in a
variable name it is not valid BitBake at all.

This adds a bitbake-placeholder lexer that accepts a placeholder where
BitBake's charsets do not and marks it wherever it appears. Everything
else is inherited from the BitBake lexer, so a block using it still
reports a genuine mistake.

AI-Generated: codex/claude-opus 5.5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/conf.py                         |   3 +-
 .../sphinx-static/theme_overrides.css         |  20 +++
 documentation/sphinx/bitbake-placeholder.py   | 145 ++++++++++++++++++
 3 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 documentation/sphinx/bitbake-placeholder.py

diff --git a/documentation/conf.py b/documentation/conf.py
index cdd554e30c0a..95bb24002544 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -80,7 +80,8 @@ extensions = [
     'sphinx_tags',
     'sphinxcontrib.rsvgconverter',
     'yocto-vars',
-    'bitbake-lexer'
+    'bitbake-lexer',
+    'bitbake-placeholder'
 ]
 
 # current_version = "dev"
diff --git a/documentation/sphinx-static/theme_overrides.css b/documentation/sphinx-static/theme_overrides.css
index 85f01eafbb94..2083ebb5baf4 100644
--- a/documentation/sphinx-static/theme_overrides.css
+++ b/documentation/sphinx-static/theme_overrides.css
@@ -252,3 +252,23 @@ a.sd-badge {
     }
 
 }
+
+/* A placeholder in a bitbake-placeholder block: something the reader is
+   meant to replace, such as <recipe> in SRCREV:pn-<recipe>.
+
+   The box is the point. A placeholder usually abuts real text it is not
+   part of - pn-<recipe>, <some.host>/<somepath> - and an outline is what
+   shows where one ends and the other begins. Colour alone does not.
+
+   Italic carries the same meaning without any colour at all, so the mark
+   survives a monochrome printout. The border is #5b8db9 rather than
+   something paler because it has to clear 3:1 against the code block to
+   count as a boundary: a lighter blue measured 2:1 and disappeared. */
+.rst-content .highlight-bitbake-placeholder .ge {
+    color: #144e8c;
+    font-style: italic;
+    font-weight: 600;
+    border: 1px solid #5b8db9;
+    border-radius: 3px;
+    padding: 0 2px;
+}
diff --git a/documentation/sphinx/bitbake-placeholder.py b/documentation/sphinx/bitbake-placeholder.py
new file mode 100644
index 000000000000..8141ac7b5687
--- /dev/null
+++ b/documentation/sphinx/bitbake-placeholder.py
@@ -0,0 +1,145 @@
+"""BitBake with documentation placeholders: the ``bitbake-placeholder`` dialect.
+
+The manuals write ``<like this>`` for "replace this with your own value".
+BitBake has no way to express that, so the convention behaves differently
+depending on where it lands: inside a quoted value it is legal BitBake and
+takes ordinary string colour, indistinguishable from a literal; in a
+variable name it is not BitBake at all, because ``<`` is not in BitBake's
+name charset.
+
+This lexer differs from plain BitBake in exactly two ways, and in no
+others:
+
+- it **accepts** a placeholder where BitBake's charsets do not, so
+  ``SRCREV:pn-<recipe> = "${AUTOREV}"`` lexes as the assignment it is
+  plainly meant to be
+- it **marks** a placeholder wherever it appears, so a reader can tell it
+  apart from text to be typed verbatim
+
+Everything else is inherited, so a block tagged ``bitbake-placeholder``
+still fails on a genuine mistake. That is the point of a dialect rather
+than a permissive lexer: it admits one convention, not all errors.
+
+``Generic.Emph`` carries the placeholder. ``Name.Placeholder`` would be
+the obvious choice and is a trap: it has no entry in Pygments'
+``STANDARD_TYPES``, so the HTML formatter walks up to ``Name`` and emits
+``class="n"``, which is indistinguishable from every other name.
+"""
+import importlib
+
+from pygments.lexer import bygroups, inherit, this, using
+from pygments.token import Generic, Keyword, Name, Operator, String, \
+    Whitespace
+
+__version__ = '1.0'
+
+
+def _base_lexer():
+    """The BitBake lexer this dialect extends.
+
+    Prefer the carried one, since it is the lexer the manuals are written
+    against, and fall back to the stock lexer if ``bitbake-lexer.py`` is
+    absent, so this file does not depend on it.
+
+    Resolving through ``get_lexer_by_name('bitbake')`` does not work here:
+    ``app.add_lexer`` registers with Sphinx rather than with Pygments, so
+    the lookup returns the stock lexer even when the carried one is
+    registered.
+    """
+    try:
+        return importlib.import_module('bitbake-lexer').BitBakeLexer
+    except Exception:
+        from pygments.lexers.bitbake import BitBakeLexer
+        return BitBakeLexer
+
+
+_PH = r'<[^<>\n]+>'
+
+# A variable name that may carry placeholders. Deliberately not derived
+# from the base lexer's own pattern: this file has to work against either
+# base, and a name is the one thing the two agree on.
+_NCHAR = r'(?:\$\{[^{}\s]+\}|[A-Za-z0-9_\-.+/~${}])'
+_PNAME = r':?(?:' + _NCHAR + r'|' + _PH + r')+'
+_POVERRIDE = r'(?::(?:' + _NCHAR + r'|' + _PH + r')+)*'
+_ASSIGN = r'(?:\?\?=|\?=|:=|\+=|=\+|\.=|=\.|=)'
+
+# Fire only where a placeholder is actually present in the name. Without
+# this the dialect would accept ``PV = 1.2.3``, which no BitBake accepts:
+# the rules below are unguarded, so anything they match bypasses the
+# inherited rules and their checks. A dialect has to admit one convention,
+# not all errors, and this is what holds it to that.
+_HAS_PH = (r'(?=(?:export[ \t]+)?(?:' + _NCHAR + r'|:)*' + _PH + r')')
+
+
+class BitBakePlaceholderLexer(_base_lexer()):
+    """BitBake, plus the manuals' ``<replace this>`` convention."""
+
+    name = 'BitBake with placeholders'
+    aliases = ['bitbake-placeholder']
+    filenames = []
+    mimetypes = []
+    url = 'https://docs.yoctoproject.org'
+
+    tokens = {
+        'root': [
+            # An assignment whose name or override chain carries a
+            # placeholder. This comes first because the inherited rules are
+            # guarded by BitBake's own regexes, which reject such a name
+            # outright, so the line would never reach them.
+            #
+            # A placeholder inside a varflag, ``FOO[<flag>] = "1"``, is not
+            # handled: the manuals contain none, and supporting a form
+            # nobody writes is a rule nobody can check.
+            (r'^' + _HAS_PH
+             + r'(export[ \t]+)?(' + _PNAME + r')(' + _POVERRIDE + r')'
+             r'([ \t]*)(' + _ASSIGN + r')',
+             bygroups(Keyword.Type, using(this, state='placeholder-name'),
+                      using(this, state='placeholder-name'), Whitespace,
+                      Operator),
+             'value'),
+            inherit,
+        ],
+
+        # Split a name into its placeholder and non-placeholder parts, so
+        # ``pn-<recipe>`` shows which half the reader has to replace.
+        'placeholder-name': [
+            (_PH, Generic.Emph),
+            (r':', Name.Decorator),
+            (r'[^<:\n]+', Name.Variable),
+            (r'[^\n]', Name.Variable),
+        ],
+
+        # Marking, as opposed to accepting. A placeholder inside a value is
+        # already valid BitBake; it just looks like a literal.
+        #
+        # The second rule in each state is what makes the first one work.
+        # The inherited states end in a greedy run of "anything that is not
+        # a quote, dollar or backslash", which swallows a whole value
+        # including its placeholders as one token, so the rule above never
+        # gets a position to match at. Stopping at the next "<" hands each
+        # placeholder back to it.
+        'value': [
+            (_PH, Generic.Emph),
+            (r'[^<\s"\'$\\]+', String),
+            inherit,
+        ],
+        'string-double': [
+            (_PH, Generic.Emph),
+            (r'[^<"\\$\n]+', String.Double),
+            inherit,
+        ],
+        'string-single': [
+            (_PH, Generic.Emph),
+            (r"[^<'\\$\n]+", String.Single),
+            inherit,
+        ],
+    }
+
+
+def setup(app):
+    app.add_lexer('bitbake-placeholder', BitBakePlaceholderLexer)
+    return {
+        'version': __version__,
+        'parallel_read_safe': True,
+        'parallel_write_safe': True,
+    }
-- 
2.50.0.173.g8b6f19ccfc3a

