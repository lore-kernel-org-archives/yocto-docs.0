Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44584.1795621544106644023
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 07:45:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=D26Z/dxR;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: twoerner@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c513a854320so106003166b.0
        for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 07:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621542; x=1796226342; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Fm5nINAbC3Tgnz6+RoJFnw6h7CDrH9VPBJx6b6JfDA=;
        b=D26Z/dxREodzSE+WSBpF95JRu26sQFMvLzakEDpgbZf4UA5rT5Xq48AQHOULA8f35u
         Mxqm7OZT3x0KxcP99dKmLAhYUuV802T31Cxrq/2tm6pcWOJikcCds7aiqHpUQiPryAZp
         mFJaHxwIsLRzqQakZc8W10prmTqCXxCkdRdPDV0Dl3FoPS3HMYhqk6ydCJxFPc9xQBPb
         hdiJ4z3AksyoEtPavna9207IO3a1x5A2blTLWp8IM1womDp/gkfZtF8Cl8V119NlYYbB
         HCMIhGZsWOoxjpRdIVAtCMqS9ksaWFUt/1mGbpyTNnRxb3GomfgTqNm2vfoj11mGN+HL
         6ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621542; x=1796226342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6Fm5nINAbC3Tgnz6+RoJFnw6h7CDrH9VPBJx6b6JfDA=;
        b=yGHQxbj7H5hXwrtzpO+Wz2W69Sdl8HTO0mcumJGwRfO+aFHWenOVgRFcJLkPaCxIOi
         +SyS8DeV4niZ6NWf6up9NdtTYIFILGCZq7LnuJfd2TZH/eIyCgpLqOnNUtphGXy8TGse
         ZpNzSYdqU05p0cCVULtutGJa8qoEovioMHcpaGxd7LaIOdlA3iuhLLpvhDV9zjqQOe/c
         r1R6g6fxJFahFjzc4IAjtPONBL7y/9Dz3vW+XeIuRnRS5lEkHYwagl/2m6ojSsafPcUW
         XpRpQylySwnGSHOfmApG8lk5d/Lvoh9Wzy0+XSBpsMgNNjQ7ryCC8CemlDsmMHsggCjz
         4Zcg==
X-Gm-Message-State: APuU4Z8O0BxHq+yavOBynd9IywAW0Tm4vGKP3uFs5POQy0bhqmBW+yOy
	R3w6JN43Q1Q/ZLLGF2GX2kYqVbRQDDOrHo4447YoK++oleeKKU1RejojUr5s7A==
X-Gm-Gg: AZFdTZeX64+jWn0RsPgLh9jUJiCRohOXKnc77N8zRanzKWE0khqDz+2tbLVE7EyFhaX
	/W3QffoRG7gnqmjoDrnsPoKkQbQ7FZqv3AWsBBodCgsChkI1ec0bgw+OtZ45hkq2pbnX8B/Vl14
	HLb93G7D5ZZ4c/z7SvMBBpV8kwvDQGmy6a9Wbu9ZNDfWGF2Mi4aF0eU1ddFDBKzLKwfpjcbSJt1
	BaWjsfZK+8Y2agTR07si4QF27AhPaaupOTlQKHSmjXfCQPLUH8LZMtIbx5Zi77RAGFGDGr4OJMM
	aSt7SAhdwg+z4P16YqynCrf59ivbnVy7S/NmL7pPtKcfXRnHGUqPOKj8LW2YM/Yzz70xydyxTzP
	LxWARXBJW0LVAQKHL8J5qevXWJvNs7pORHsBceKAySngVi3gcEkkJr7ZFTNHwyCzzx62l+Nk+/X
	LWjEyHWybql4aIB1KWOXo/GuKzPVhGtJ5fKeeAI0u/xrjZn1WupltKQHom+q0cE5QKml5nYs9Ck
	UBuR9hChaUhuk7Hvuo/Kf3T7952bqkihW12JpSdDi+Ii2NZuCSbGyNFSpwpDRAc2SDqrAelxkEp
	zvezg2wPvjFrD8lYFdHLM0jSn8SGlBu57u4QZw7MCd5K0Ua8w1UM/9yOmZgPnKMTYXgrlufEcP6
	Gg7c5uWNdE0JSyeph2E9fwsCJobk7Oi8=
X-Received: by 2002:a17:907:7f9f:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c513a274be7mr1655265966b.0.1795621541694;
        Wed, 25 Nov 2026 07:45:41 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm651892066b.51.2026.11.25.07.45.40
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:45:40 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/7] sphinx: carry a BitBake lexer as a local extension
Date: Wed, 25 Nov 2026 10:45:29 -0500
Message-ID: <20261125154535.3486104-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261125154535.3486104-1-twoerner@gmail.com>
References: <20261125154535.3486104-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2026 15:45:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10836
Content-Type: text/plain; charset="utf-8"

BitBake's syntax changes from release to release, and the manuals
describe each change as it lands. Pygments learns it only in its own
releases, which builders install later still, so the highlighting of the
manuals depends on whichever Pygments happens to be installed.

This adds a local Sphinx extension carrying a BitBake lexer built from
BitBake's own parser patterns, so the manuals are highlighted the same
way wherever they are built and can follow the language as it changes.
It performs tests at startup and registers itself only if no BitBake
lexer is found, or the one found fails its tests. Otherwise the
installed lexer is used.

AI-Generated: codex/claude-opus 5.5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/conf.py                 |   3 +-
 documentation/sphinx/bitbake-lexer.py | 432 ++++++++++++++++++++++++++
 2 files changed, 434 insertions(+), 1 deletion(-)
 create mode 100644 documentation/sphinx/bitbake-lexer.py

diff --git a/documentation/conf.py b/documentation/conf.py
index afa7f8d985f4..cdd554e30c0a 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -79,7 +79,8 @@ extensions = [
     'sphinx_copybutton',
     'sphinx_tags',
     'sphinxcontrib.rsvgconverter',
-    'yocto-vars'
+    'yocto-vars',
+    'bitbake-lexer'
 ]
 
 # current_version = "dev"
diff --git a/documentation/sphinx/bitbake-lexer.py b/documentation/sphinx/bitbake-lexer.py
new file mode 100644
index 000000000000..5a323ffb943d
--- /dev/null
+++ b/documentation/sphinx/bitbake-lexer.py
@@ -0,0 +1,432 @@
+"""BitBake lexer, carried with the manuals.
+
+BitBake's syntax changes from release to release, and the manuals describe
+it as it changes. Carrying the lexer here keeps their highlighting in step
+with the language, and the same wherever they are built, rather than
+dependent on which Pygments happens to be installed.
+
+The patterns are BitBake's own, taken from its parser. Everything from the
+imports to the end of the lexer class is identical to the lexer proposed
+to Pygments in https://github.com/pygments/pygments/pull/3284, so a fix
+belongs in both.
+
+setup() tests the installed lexer and registers this one only if no
+BitBake lexer is found, or the one found fails its tests. Otherwise the
+installed lexer is used.
+"""
+
+import re
+
+from pygments.lexer import RegexLexer, bygroups, include, using, words
+from pygments.lexers.python import PythonLexer
+from pygments.lexers.shell import BashLexer
+from pygments.token import Comment, Error, Keyword, Name, Operator, \
+    Punctuation, String, Text, Whitespace
+
+__version__ = '2.0'
+
+
+class _FragmentPythonLexer(PythonLexer):
+    """Lex a ``${@...}`` fragment without reporting its incompleteness.
+
+    An inline Python expression is handed over in pieces, split around any
+    ``${VAR}`` expansions embedded in it, so a piece routinely begins or ends
+    mid-string and is not valid Python on its own. The error would be an
+    artefact of the splitting rather than a defect in the metadata.
+
+    This is deliberately the only place errors are suppressed. Errors in
+    BitBake's own syntax, and in a complete shell or Python function body,
+    are reported.
+    """
+
+    def get_tokens_unprocessed(self, text, stack=('root',)):
+        for index, token, value in super().get_tokens_unprocessed(text, stack):
+            yield index, Text if token is Error else token, value
+
+
+# ---------------------------------------------------------------------------
+# Validity is decided by BitBake, never by this file.
+#
+# Each pattern is BitBake's own statement regex from ``bb.parse.parse_py``,
+# mechanically adapted, and used below only as a zero-width guard: a rule
+# fires when and only when BitBake's parser would accept the line. The token
+# spans are then chosen separately, which is the part a lexer is for.
+#
+# Three adaptations are applied, each because BitBake matches one
+# already-assembled logical line while a lexer sees raw file text:
+#
+#   \s   ->  [ \t]                 its \s can never meet a newline, because
+#                                  the file has already been split into lines
+#   .    ->  (?:[^\n]|\\[ \t]*\n)        continuations are joined before BitBake
+#                                  sees them, and inline here instead
+#   $    ->  [ \t]*$               the line is rstripped before matching, so
+#                                  the anchors tolerate trailing whitespace
+#
+# The last applies to every anchor including the ones inside the assignment
+# rule's negative lookaheads, which are what decide whether the quotes
+# balance. Do not hand-edit these; regenerate them and check that the
+# verdicts still agree with BitBake's on real metadata.
+_BB = {
+    'function start':
+        '^(?:(?:(?:python(?=(?:(?:[ \\t]|\\\\[ \\t]*\\n)|\\()))|(?:fakeroot(?=(?:[ \\t]|\\\\[ \\t]*\\n))))(?:[ \\t]|\\\\[ \\t]*\\n)*)*(?:[\\w\\.\\-\\+\\{\\}\\$:]+)?(?:[ \\t]|\\\\[ \\t]*\\n)*\\((?:[ \\t]|\\\\[ \\t]*\\n)*\\)(?:[ \\t]|\\\\[ \\t]*\\n)*\\{[ \\t]*$',
+    'def block':
+        '^def(?:[ \\t]|\\\\[ \\t]*\\n)+(?:\\w+)(?:[^\\n]|\\\\[ \\t]*\\n)*:',
+    'export':
+        '^export(?:[ \\t]|\\\\[ \\t]*\\n)+(?:[a-zA-Z0-9\\-_+.${}/~]+)[ \\t]*$',
+    'unset varflag':
+        '^unset(?:[ \\t]|\\\\[ \\t]*\\n)+(?:[a-zA-Z0-9\\-_+.${}/~]+)\\[(?:[a-zA-Z0-9\\-_+.][a-zA-Z0-9\\-_+.@]+)\\][ \\t]*$',
+    'unset':
+        '^unset(?:[ \\t]|\\\\[ \\t]*\\n)+(?:[a-zA-Z0-9\\-_+.${}/~]+)[ \\t]*$',
+    'addpylib':
+        '^addpylib(?:[ \\t]|\\\\[ \\t]*\\n)+(?:(?:[^\\n]|\\\\[ \\t]*\\n)+)(?:[ \\t]|\\\\[ \\t]*\\n)+(?:(?:[^\\n]|\\\\[ \\t]*\\n)+)',
+    'addfragments':
+        '^addfragments(?:[ \\t]|\\\\[ \\t]*\\n)+(?:(?:[^\\n]|\\\\[ \\t]*\\n)+)(?:[ \\t]|\\\\[ \\t]*\\n)+(?:(?:[^\\n]|\\\\[ \\t]*\\n)+)(?:[ \\t]|\\\\[ \\t]*\\n)+(?:(?:[^\\n]|\\\\[ \\t]*\\n)+)(?:[ \\t]|\\\\[ \\t]*\\n)+(?:(?:[^\\n]|\\\\[ \\t]*\\n)+)',
+    'inherit_defer':
+        '^inherit_defer(?:[ \\t]|\\\\[ \\t]*\\n)+(?:(?:[^\\n]|\\\\[ \\t]*\\n)+)',
+    'inherit':
+        '^inherit(?:[ \\t]|\\\\[ \\t]*\\n)+(?:(?:[^\\n]|\\\\[ \\t]*\\n)+)',
+    'include_all':
+        '^include_all(?:[ \\t]|\\\\[ \\t]*\\n)+(?:(?:[^\\n]|\\\\[ \\t]*\\n)+)',
+    'include':
+        '^include(?:[ \\t]|\\\\[ \\t]*\\n)+(?:(?:[^\\n]|\\\\[ \\t]*\\n)+)',
+    'require':
+        '^require(?:[ \\t]|\\\\[ \\t]*\\n)+(?:(?:[^\\n]|\\\\[ \\t]*\\n)+)',
+    'EXPORT_FUNCTIONS':
+        '^EXPORT_FUNCTIONS(?:[ \\t]|\\\\[ \\t]*\\n)+(?:(?:[^\\n]|\\\\[ \\t]*\\n)+)',
+    'addtask':
+        '^addtask(?:[ \\t]|\\\\[ \\t]*\\n)+(?:[^#\\n]+)(?:#(?:[^\\n]|\\\\[ \\t]*\\n)*|(?:[^\\n]|\\\\[ \\t]*\\n)*?)',
+    'deltask':
+        '^deltask(?:[ \\t]|\\\\[ \\t]*\\n)+(?:[^#\\n]+)(?:#(?:[^\\n]|\\\\[ \\t]*\\n)*|(?:[^\\n]|\\\\[ \\t]*\\n)*?)',
+    'addhandler':
+        '^addhandler(?:[ \\t]|\\\\[ \\t]*\\n)+(?:(?:[^\\n]|\\\\[ \\t]*\\n)+)',
+    'assignment':
+        '^(?:export(?:[ \\t]|\\\\[ \\t]*\\n)+)?(?:[a-zA-Z0-9\\-_+.${}/~:]*?)(?:\\[(?:[a-zA-Z0-9\\-_+.][a-zA-Z0-9\\-_+.@/]*)\\])?(?:(?:[ \\t]|\\\\[ \\t]*\\n)*)(?:(?::=)|(?:\\?\\?=)|(?:\\?=)|(?:\\+=)|(?:=\\+)|(?:=\\.)|(?:\\.=)|=)(?:(?:[ \\t]|\\\\[ \\t]*\\n)*)(?!\'[^\'\\n]*\'[^\'\\n]*\'[ \\t]*$)(?!\\"[^\\"\\n]*\\"[^\\"\\n]*\\"[ \\t]*$)(?:\'(?:(?:[^\\n]|\\\\[ \\t]*\\n)*)\'|"(?:(?:[^\\n]|\\\\[ \\t]*\\n)*)")[ \\t]*$',
+}
+
+
+def _guard(*names):
+    """A zero-width assertion that BitBake's parser would accept this line."""
+    # The anchor is hoisted out of the alternation rather than repeated in
+    # each branch, which regexlint flags as suspicious (W114).
+    return r'(?=^(?:%s))' % '|'.join(_BB[name].lstrip('^') for name in names)
+
+
+_G_FUNC = _guard('function start')
+_G_DEF = _guard('def block')
+_G_INCLUDE = _guard('inherit_defer', 'inherit', 'include_all', 'include',
+                    'require')
+_G_STATEMENT = _guard('addtask', 'deltask', 'addhandler', 'EXPORT_FUNCTIONS',
+                      'addpylib', 'addfragments')
+_G_ASSIGN = _guard('assignment')
+_G_VALUELESS = _guard('export', 'unset varflag', 'unset')
+
+# None of the guards capture, so they add nothing for ``bygroups`` to number.
+
+
+# A bare BitBake identifier (variable, function or flag name). Allows the
+# characters used by OE-Core variable names (digits, ``-``, ``.``, ``+``).
+_IDENT = r'[A-Za-z_][A-Za-z0-9_\-.+]*'
+
+# Optional OE override chain such as ``:append``, ``:remove``, ``:class-target``
+# or ``:${PN}-doc``. Anchored so it only consumes ``:foo`` runs and never
+# eats the leading ``:`` of the ``:=`` assignment operator.
+_OVERRIDE = r'(?::[A-Za-z0-9_\-.+/~${}]+)*'
+
+# All BitBake variable assignment operators, ordered so that the longer
+# operators win the regex alternation.
+_ASSIGN = r'(?:\?\?=|\?=|:=|\+=|=\+|\.=|=\.|=)'
+
+# A variable or function name, matching what BitBake's own parser accepts
+# (``[a-zA-Z0-9\-_+.${}/~:]`` for variables, ``[\w.\-+{}$:]`` for
+# functions). Names may begin with a digit, may contain ``/`` as in
+# ``PREFERRED_PROVIDER_virtual/kernel``, and may embed an expansion as in
+# ``PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc``. The ``:`` introducing
+# an override chain is excluded, since ``_OVERRIDE`` consumes that.
+_NAME = r':?(?:\$\{[^{}\s]+\}|[A-Za-z0-9_\-.+/~${}])+'
+
+# A varflag name, which may also begin with a digit, as in
+# ``ESW_BRANCH[2024.1]``.
+_FLAG = r'[A-Za-z0-9_\-.+][A-Za-z0-9_\-.+@/]*'
+
+
+class BitBakeLexer(RegexLexer):
+    """
+    Lexer for BitBake recipes, classes, includes and configuration files
+    used by the Yocto Project and OpenEmbedded build system.
+    """
+
+    name = 'BitBake'
+    url = 'https://docs.yoctoproject.org/bitbake/'
+    aliases = ['bitbake']
+    filenames = ['*.bbclass', '*.bbappend']
+    mimetypes = ['text/x-bitbake']
+    version_added = '2.21'
+
+    flags = re.MULTILINE
+
+    tokens = {
+        'root': [
+            (r'[ \t]+$', Whitespace),
+            (r'\n', Whitespace),
+
+            # ``handle`` tests for a comment at column zero only, and only
+            # after joining continuations, so an indented ``#`` is not a
+            # comment and a comment ending in ``\`` swallows the line below.
+            (r'^#(?:[^\n]|\\[ \t]*\n)*', Comment.Single),
+
+            # ``python [name]() { ... }`` blocks (also ``fakeroot python``).
+            # Must be tried before the generic shell function rule so the
+            # ``python`` keyword is not mistaken for a shell function name.
+            (_G_FUNC + r'(^(?:fakeroot[ \t]+)?)(python)((?:[ \t]+' + _NAME
+             + _OVERRIDE + r')?)'
+             r'([ \t]*\([ \t]*\)[ \t]*)(\{[ \t]*\n)'
+             r'((?:.*\n)*?)'
+             r'(^\}[ \t]*$)',
+             bygroups(Keyword.Type, Keyword, Name.Function, Text,
+                      Punctuation, using(PythonLexer), Punctuation)),
+
+            # Shell task bodies: ``[fakeroot ]name[:override]() { ... }``.
+            (_G_FUNC + r'(^(?:fakeroot[ \t]+)?)(' + _NAME + r')('
+             + _OVERRIDE + r')'
+             r'([ \t]*\([ \t]*\)[ \t]*)(\{[ \t]*\n)'
+             r'((?:.*\n)*?)'
+             r'(^\}[ \t]*$)',
+             bygroups(Keyword.Type, Name.Function, Name.Decorator, Text,
+                      Punctuation, using(BashLexer), Punctuation)),
+
+            # Top-level python ``def`` blocks; the body is any run of
+            # indented or blank lines following the signature.
+            # BitBake's rule is ``def\s+(\w+).*:``, which validates little
+            # and does not require a body, so neither may this. The guard
+            # has already decided the line is a def.
+            (_G_DEF + r'^def[ \t]+(?:[^\n]|\\[ \t]*\n)*:(?:[^\n]|\\[ \t]*\n)*(?:\n|$)'
+             r'(?:[ \t]+.*\n|\n)*',
+             using(PythonLexer)),
+
+            # ``inherit`` / ``inherit_defer`` / ``include`` / ``include_all`` /
+            # ``require`` directives. Longer keywords are listed first so the
+            # regex alternation does not match the shorter prefix.
+            (_G_INCLUDE
+             + r'^(inherit_defer|inherit|include_all|include|require)\b',
+             Keyword.Namespace, 'include-line'),
+
+            # ``addtask`` / ``deltask`` / ``addhandler`` / ``EXPORT_FUNCTIONS``
+            # / ``addpylib`` / ``addfragments``.
+            (_G_STATEMENT
+             + r'^(addtask|deltask|addhandler|EXPORT_FUNCTIONS|addpylib'
+             r'|addfragments)\b',
+             Keyword, 'statement'),
+
+            # ``VAR[flag] = "value"`` (varflag assignment). The variable may
+            # carry an override chain first, as in
+            # ``GOARM:arm:class-target[export] = "1"``.
+            (_G_ASSIGN + r'^(' + _NAME + r')(' + _OVERRIDE + r')(\[)('
+             + _FLAG + r')(\])'
+             r'([ \t]*)(' + _ASSIGN + r')',
+             bygroups(Name.Variable, Name.Decorator, Punctuation,
+                      Name.Attribute, Punctuation, Whitespace, Operator),
+             'value'),
+
+            # ``[export ]VAR[:override...] OP "value"`` assignments.
+            (_G_ASSIGN + r'^(export[ \t]+)?(' + _NAME + r')('
+             + _OVERRIDE + r')'
+             r'([ \t]*)(' + _ASSIGN + r')',
+             bygroups(Keyword.Type, Name.Variable, Name.Decorator,
+                      Whitespace, Operator),
+             'value'),
+
+            # ``export VAR`` and ``unset VAR`` / ``unset VAR[flag]``, which
+            # carry no value. These follow the assignment rules so that
+            # ``export VAR = "value"`` is still matched as an assignment.
+            (_G_VALUELESS + r'^(export|unset)([ \t]+)(' + _NAME + r')(\[)('
+             + _FLAG + r')'
+             r'(\])([ \t]*)$',
+             bygroups(Keyword, Whitespace, Name.Variable, Punctuation,
+                      Name.Attribute, Punctuation, Whitespace)),
+            (_G_VALUELESS + r'^(export|unset)([ \t]+)(' + _NAME
+             + r')([ \t]*)$',
+             bygroups(Keyword, Whitespace, Name.Variable, Whitespace)),
+
+            # Nothing above matched, so BitBake's parser would reject this
+            # line. Report it. A documentation block that is wrong on
+            # purpose carries ``:force:``, which skips Sphinx's filter for
+            # that block and leaves the marking visible.
+            (r'(?:[^\n]|\\[ \t]*\n)+', Error),
+        ],
+
+        'include-line': [
+            (r'[ \t]+', Whitespace),
+            (r'\\\n', Text),
+            (r'\n', Whitespace, '#pop'),
+            include('interp'),
+            (r'\$', String),
+            (r'[^\s$]+', String),
+            (r'[^\n]', String),
+        ],
+
+        'statement': [
+            (r'[ \t]+', Whitespace),
+            (r'\\\n', Text),
+            (r'\n', Whitespace, '#pop'),
+            (words(('after', 'before'), suffix=r'\b'), Keyword),
+            include('interp'),
+            (r'\$', Name),
+            (r'[^\s$\\]+', Name),
+            (r'[^\n]', Name),
+        ],
+
+        'value': [
+            (r'[ \t]+', Whitespace),
+            # A backslash is special to BitBake only as the last
+            # character of a line, where it continues the statement.
+            # There are no escape sequences in a value, so treating
+            # \\\\ as an escaped pair would swallow the backslash that
+            # forms the continuation.
+            (r'\\[ \t]*\n', String.Escape),
+            (r'\n', Whitespace, '#pop'),
+            (r'"', String.Double, 'string-double'),
+            (r"'", String.Single, 'string-single'),
+            include('interp'),
+            (r'\$', String),
+            (r'[^\s"\'$\\]+', String),
+            (r'[^\n]', String),
+        ],
+
+        'string-double': [
+            # A backslash is special to BitBake only as the last
+            # character of a line, where it continues the statement.
+            # There are no escape sequences in a value, so treating
+            # \\\\ as an escaped pair would swallow the backslash that
+            # forms the continuation.
+            (r'\\[ \t]*\n', String.Escape),
+            (r'"', String.Double, '#pop'),
+            include('interp'),
+            (r'\$', String.Double),
+            (r'[^"\\$\n]+', String.Double),
+            (r'[^\n]', String.Double),
+        ],
+
+        'string-single': [
+            # A backslash is special to BitBake only as the last
+            # character of a line, where it continues the statement.
+            # There are no escape sequences in a value, so treating
+            # \\\\ as an escaped pair would swallow the backslash that
+            # forms the continuation.
+            (r'\\[ \t]*\n', String.Escape),
+            (r"'", String.Single, '#pop'),
+            include('interp'),
+            (r'\$', String.Single),
+            (r"[^'\\$\n]+", String.Single),
+            (r'[^\n]', String.Single),
+        ],
+
+        'interp': [
+            # ``${@ python expression }`` evaluated by BitBake at parse time.
+            (r'\$\{@', String.Interpol, 'py-interp'),
+            # ``${VAR}`` variable expansion, which may itself contain further
+            # expansions such as ``${TUNE_ARCH:tune-${DEFAULTTUNE}}``.
+            (r'\$\{', String.Interpol, 'var-interp'),
+        ],
+
+        'var-interp': [
+            (r'\}', String.Interpol, '#pop'),
+            (r'\\[ \t]*\n', String.Escape),
+            (r'\$\{@', String.Interpol, 'py-interp'),
+            (r'\$\{', String.Interpol, '#push'),
+            (r'[^${}\n\\]+', Name.Variable),
+            (r'\$', Name.Variable),
+            (r'[^\n]', Name.Variable),
+        ],
+
+        'py-interp': [
+            (r'\}', String.Interpol, '#pop'),
+            (r'\\[ \t]*\n', String.Escape),
+            # ``${VAR}`` expansions embedded in the Python expression, as in
+            # ``${@bb.utils.contains('F', 'x', '${A}', '', d)}``.
+            (r'\$\{', String.Interpol, 'var-interp'),
+            # The backslash is excluded so that the continuation rule above
+            # gets the chance to match it. Swallowed here instead, the
+            # newline ends up matching nothing, the state stack unwinds
+            # mid-expression, and every following line of a multi-line
+            # ``${@...}`` is lexed at the top level and reported as invalid.
+            (r'[^${}\n\\]+', using(_FragmentPythonLexer)),
+            # A ``$`` that does not open an expansion belongs to the Python
+            # expression's own text, most often a regular-expression anchor
+            # inside a quoted string.
+            (r'\$', String),
+            (r'\{', using(_FragmentPythonLexer)),
+            (r'[^\n]', String),
+        ],
+    }
+
+# What the installed lexer must get right to be used instead of this one.
+# Testing beats a version check: it judges whatever lexer is installed by
+# what it does, and costs one lex of a few short lines.
+#
+# These assert that an Error IS reported. A lexer that accepts what BitBake
+# rejects is invisible to a check looking only for the absence of errors.
+_PROBES_MUST_ERROR = (
+    # an unquoted value is not an assignment; BitBake rejects the line
+    'PV = 0.8.16~rc1',
+    # neither is one carrying a trailing comment
+    'ARCHIVER_MODE[src] = "x"  # comment',
+)
+
+# Constructs that must lex cleanly, each paired with what the installed
+# lexer must make of one telling character. Asserting what the token IS
+# matters, rather than only that no Error was reported: a release could
+# suppress errors without fixing the lexing, and an error-only check would
+# then stand this extension down while blocks silently went back to being
+# mis-highlighted, with a zero exit code.
+_PROBES_MUST_BE_CLEAN = (
+    # the "$" anchoring a regex belongs to the string, not to an expansion
+    ('COMPATIBLE_MACHINE = "^mymachine$"', 32, String.Double),
+    # the inner "${" of a nested expansion is an expansion in its own right
+    ('TUNE_FEATURES ??= "${TUNE_FEATURES:tune-${DEFAULTTUNE}}"', 40,
+     String.Interpol),
+    # a statement carrying no value is still a statement
+    ('unset DATE', 0, Keyword),
+)
+
+
+def _installed_lexer_is_fixed():
+    """True only if the installed lexer demonstrably behaves.
+
+    Fails safe: anything unexpected - no bitbake lexer at all, an import
+    failure, a token type this does not recognise - is reported as not
+    fixed, so the carried lexer is used. Being wrong that way costs nothing;
+    being wrong the other way loses the highlighting silently.
+    """
+    try:
+        from pygments.lexers import get_lexer_by_name
+        lexer = get_lexer_by_name('bitbake')
+    except Exception:
+        return False
+    for text in _PROBES_MUST_ERROR:
+        try:
+            tokens = list(lexer.get_tokens_unprocessed(text))
+        except Exception:
+            return False
+        if not any(t is Error for _, t, _ in tokens):
+            return False
+    for text, offset, expected in _PROBES_MUST_BE_CLEAN:
+        try:
+            tokens = list(lexer.get_tokens_unprocessed(text))
+        except Exception:
+            return False
+        if any(t is Error for _, t, _ in tokens):
+            return False
+        at = [t for i, t, _ in tokens if i == offset]
+        if len(at) != 1 or at[0] is not expected:
+            return False
+    return True
+
+
+def setup(app):
+    if not _installed_lexer_is_fixed():
+        app.add_lexer('bitbake', BitBakeLexer)
+    return {
+        'version': __version__,
+        'parallel_read_safe': True,
+        'parallel_write_safe': True,
+    }
-- 
2.50.0.173.g8b6f19ccfc3a

